%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_ctl).
-include("goddess.hrl").

%% API
-export([
        start/0, 
        process/1,
        fprof_start/1,
        fprof_stop/0,
        eprof_start/1,
        eprof_stop/0,
        processes/0
    ]).

-define(STATUS_SUCCESS, 0).
-define(STATUS_ERROR, 1).
-define(STATUS_USAGE, 2).
-define(STATUS_BADRPC, 3).

%%%===================================================================
%%% API
%%%===================================================================
start() ->
    case init:get_plain_arguments() of
    [SNode | Args]->
        SNode1 = case string:tokens(SNode, "@") of
        [_Node, _Server] ->
            SNode;
        _ ->
            case net_kernel:longnames() of
             true ->
                 SNode ++ "@" ++ inet_db:gethostname() ++
                      "." ++ inet_db:res_option(domain);
             false ->
                 SNode ++ "@" ++ inet_db:gethostname();
             _ ->
                 SNode
             end
        end,
        Node = list_to_atom(SNode1),
        Status = case rpc:call(Node, ?MODULE, process, [Args]) of
             {badrpc, _Reason} ->
                 ?STATUS_BADRPC;
            {log, Log} ->
                io:format("~p ~n", [Log]),
                ?STATUS_SUCCESS;
             S ->
                 S
             end,
        halt(Status);
    _ ->
        halt(?STATUS_USAGE)
    end.

process(["status"]) ->
    {InternalStatus, ProvidedStatus} = init:get_status(),
    case lists:keysearch(goddess, 1, application:which_applications()) of
        {value, _Version} when InternalStatus =:= started, ProvidedStatus =:= started ->
            ?STATUS_SUCCESS;
        _ ->
            ?STATUS_ERROR
    end;
process(["stop"]) ->
    goddess_app:stop(),
    init:stop(),
    ?STATUS_SUCCESS;
process(["restart"]) ->
    init:restart(),
    ?STATUS_SUCCESS;
process(["usage"]) ->
    ?STATUS_SUCCESS;
process(["reload"]) ->
    reload2:reload();
process([_|_]) ->
    ?STATUS_USAGE.

-spec fprof_start( list() ) -> ok.
fprof_start(Procs) ->
    fprof:trace([start, {file, "./logs/fprof.trace"}, {procs, Procs}]).

fprof_stop() ->
    ok = fprof:trace(stop),
    ok = fprof:profile({file, "./logs/fprof.trace"}),
    {{Y, M,    D},{H, I, S}} =    erlang:localtime(),
    Analyse = lists:concat(["fprof-", Y, M,    D, H, I, S, ".analysis"]),
    ok = fprof:analyse([{dest, Analyse}, {details, true}, {totals, true}, {sort, acc}]),
    io:format("fprof complete, result:~s\n", [Analyse]),
    ok.

eprof_start(PidList)->  
     {ok, Epid}=eprof:start(),  %启动  
     io:format("eprof pid ~p ~n",[Epid]),
     eprof:start_profiling(PidList). %启动  

eprof_stop() ->
    eprof:stop_profiling(),
    eprof:log("procs.profile"),
    eprof:analyze(procs,[{sort, calls}]),
    eprof:log("total.profile"),
    eprof:analyze(total,[{sort, calls}]),
    eprof:stop(). %停止  

%% @doc 查看每一类进程的数量，排查进程泄漏时候有用
processes() ->
    [{init, InitProcesses}] = ets:lookup(?ETS_PROCESSES, init),         
    CurrentProcesses = erlang:processes(),                             
    DiffProcesses = lists:subtract(CurrentProcesses, InitProcesses),   
    get_info(DiffProcesses, dict:new()).                               

get_info([], Dict) ->                                                  
    io:fwrite("Dict: ~p~n", [Dict]);                                   
get_info([P|L], Dict) ->                                               
    case erlang:process_info(P, dictionary) of                         
        {dictionary, Info} ->                                          
            Initial_call = proplists:get_value('$initial_call', Info),            
            Ancestor = proplists:get_value('$ancestors', Info),                   
            case dict:find({Initial_call, Ancestor}, Dict) of          
                {ok, Nb} ->                                            
                    IncrNb = Nb + 1;                                   
                error ->                                               
                    IncrNb = 1                                         
            end,                                                       
            Dict2 = dict:store({Initial_call, Ancestor}, IncrNb, Dict),
            get_info(L, Dict2);                                        
        undefined ->                                                   
            case dict:find(undefined, Dict) of                         
                {ok, Nb} ->                                            
                    IncrNb = Nb + 1;                                   
                error ->                                               
                    IncrNb = 1                                         
            end,                                                       
            Dict2 = dict:store(undefined, IncrNb, Dict),               
            get_info(L, Dict2)                                         
    end.
%%%===================================================================
%%% Internal functions
%%%===================================================================
