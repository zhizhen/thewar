%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-7-31 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(warrior_srv).

-behaviour(gen_server).

-include("common.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").
-include("cfg_record.hrl").
-include("logger.hrl").

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-export([info/0]).
-export([rand_ws/1]).

-define(SERVER, ?MODULE).
-define(ETS, 'warrior_call_ets').

-record(state, {time=0, ids=[]}).



%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


%% rand() ->
%%     gen_server:call(?SERVER, rand).


info() ->
    case ets:lookup(?ETS, ids) of
        [{ids, T, [A, B, C]}] -> {ok, T, A, B, C}
    end.


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    Ws = rand_ws([]), % rands
    ets:new(?ETS, [named_table, {read_concurrency, true}]),
    Time = ?NOW,
    ets:insert(?ETS, {ids, Time, Ws}),
    erlang:send_after(3000, ?SERVER, check),
    {ok, #state{time=Time, ids=Ws}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call(rand, _From, #state{ids=Ids} = State) ->
    Ws = rand_ws(Ids),
    Time = ?NOW,
    ets:insert(?ETS, {ids, Time, Ws}),
    ets:foldl(
        fun(#role_conn{role_pid=Pid}, _) ->
            role_srv:send2role(Pid, {warrior_api, update_rand, [Ws, Time]}),
            ok
        end, 0, role_conn),
%%     broadcast_api:server(#m__warrior__rand__s2c{ids=Ws}),
    {reply, {ok, Ws}, State#state{time=Time, ids=Ws}};
handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(check,  #state{ids=Ids, time=T} = State) ->
    Time = ?NOW,
    erlang:send_after(3000, ?SERVER, check),

    case Time - T > 3600 * 3 of
        true ->
            Ws = rand_ws(Ids), % rand
            ets:insert(?ETS, {ids, Time, Ws}),
            ets:foldl(
                fun(#role_conn{role_pid=Pid}, _) ->
                    role_srv:send2role(Pid, {warrior_api, update_rand, [Ws, Time]}),
                    ok
                end, 0, role_conn),
            {noreply, State#state{ids=Ws, time=Time}};
        false ->
            {noreply, State}
    end;
handle_info(_Info, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

rand_ws([]) ->
    [find(9, []), find(10, []), find(11, [])];
rand_ws([A, B, C]) ->
    [find(9, [A]), find(10, [B]), find(11, [C])].

find(FId, Ids) ->
    Cfg = warrior_api:rand_cfg(FId, [0, 0]),
    Ws = Cfg#warrior_chance_cfg.ws -- Ids,
    case length(Ws) of
        0 -> find(FId, Ids);
        Len ->
            Pos = rand_srv:random(Len),
            lists:nth(Pos, Ws)
    end.

%% find(All) ->
%%     Sum = lists:sum([V || {_Id, V} <- All]),
%%     R = rand_srv:random(Sum),
%%     F = fun
%%         (_, {find, Id}) -> {find, Id};
%%         ({Id, V}, Acc) ->
%%             Acc2 = Acc + V,
%%             case R =< Acc2 of
%%                 true ->
%%                     {find, Id};
%%                 false -> Acc2
%%             end
%%         end,
%%
%%     lists:foldl(F, 0, All).

