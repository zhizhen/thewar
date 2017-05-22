%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_client_sender).
-behaviour(gen_server).

-include("logger.hrl").


-export([start_link/2]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

-define(SERVER, ?MODULE).


-record(state, {
    ip,
    port,
    sock,
    role_id
}).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 启动goddess_client_sender进程API
start_link(RoleId, Sock) ->
    SenderProcessName = goddess_misc:client_sender_process_name(RoleId),
    gen_server:start_link({local, SenderProcessName}, ?MODULE, {RoleId, Sock}, []).

%%%===================================================================
%%% callbacks
%%%===================================================================

%% @doc 启动goddess_client_sender进程
init({RoleId, Sock}) ->
    process_flag(trap_exit, true),
    {ok, {Ip, Port}} = inet:peername(Sock),
    {ok, #state{ip=Ip, port=Port, sock=Sock, role_id=RoleId}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_sender handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

%% @private
%% @doc Handling cast messages
handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_sender handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc Handling all non call/cast messages
handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_sender handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

do_call({send, Data}, _From, #state{sock = Sock, role_id = RoleId}=State) ->
    ?DEBUG_MSG("Send Log RoleId: ~p, Data: ~p~n", [RoleId, Data]),
    goddess_net:send(Sock, Data),
    {reply, ok, State};
do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

do_cast({send, Data}, #state{sock = Sock, role_id = RoleId}=State) ->
    ?DEBUG_MSG("Send Log RoleId: ~p, Data: ~p~n", [RoleId, Data]),
    goddess_net:send(Sock, Data),
    {noreply, State};
do_cast({send_list, Data}, #state{sock = Sock, role_id = RoleId}=State) ->
    ?DEBUG_MSG("Send Log RoleId: ~p, Data: ~p~n", [RoleId, Data]),
    goddess_net:send_list(Sock, Data),
    {noreply, State};
do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

do_info({'EXIT', _From, role_logout}, State) ->
    ?DEBUG_MSG("Role Logout: client_sender~n"),
    {stop, role_logout, State};
do_info({'EXIT', _From, Reason}, State) ->
    {stop, {Reason, exit}, State};

do_info({send, Data}, #state{sock = Sock, role_id = RoleId}=State) ->
    ?DEBUG_MSG("Send Log RoleId: ~p, Data: ~p~n", [RoleId, Data]),
    goddess_net:send(Sock, Data),
    {noreply, State};

do_info({send_list, Data}, #state{sock = Sock, role_id = RoleId}=State) ->
    ?DEBUG_MSG("Send Log RoleId: ~p, Data: ~p~n", [RoleId, Data]),
    goddess_net:send_list(Sock, Data),
    {noreply, State};

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.



