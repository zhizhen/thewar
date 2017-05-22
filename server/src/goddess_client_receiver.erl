%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_client_receiver).

-behaviour(gen_server).

-include("common.hrl").
-include("logger.hrl").
-include("game_pb.hrl").

%% API
-export([
    start_link/1
]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {
    ip,
    port,
    sock,
    role_id,                          % 玩家角色ID
    role_pid,                         % 玩家角色PID
    sender_pid,                       % 发送的
    reciver_pid,                      % 接收的
    account_id                        % 玩家账号
}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(Sock) ->
    gen_server:start_link(?MODULE, [Sock], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([Sock]) ->
    process_flag(trap_exit, true),
    case inet:peername(Sock) of
        {ok, {Ip, Port}} ->
            {ok, #state{ip=Ip, port=Port, sock=Sock}};
        {error, Reason} ->
            {error, Reason}
    end.

handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_receiver handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_receiver handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.


handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("goddess_client_receiver handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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

do_call({role_login, RoleId}, _From, #state{sock = Sock}=State) ->
    {ok, ClientSender} = goddess_client_sender:start_link(RoleId, Sock),
    {ok, RolePid} = role_srv:start_link(RoleId, self(), ClientSender, Sock),
    gen_server:call(RolePid, login),
    {reply, ok, State#state{role_id = RoleId, role_pid = RolePid, sender_pid = ClientSender}};

do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

do_info(start_client, #state{sock=Sock}=State) ->
    {ok, ReceiverPid} = goddess_receiver:start_link(self()),
    ReceiverPid ! {go, Sock},
    {noreply, State#state{reciver_pid=ReceiverPid}};

do_info(role_logout, #state{role_pid=RolePid, sender_pid=SenderPid}=State) ->
    erlang:exit(RolePid, role_logout),
    erlang:exit(SenderPid, role_logout),

    {noreply, State#state{sender_pid=undefined, role_id=undefined}};

do_info({'EXIT', _From, role_logout}, State) ->
    ?DEBUG_MSG("Role Logout~n"),
    {noreply, State};
do_info({'EXIT', _From, _Reason}, #state{role_pid=RolePid, sender_pid=SenderPid, reciver_pid=ReceiverPid, sock=Sock, account_id = _AccountId}=State) ->
    case _Reason of
        repeat_login ->
            inet:setopts(Sock, [{send_timeout, 5000}]),
            goddess_net:send(Sock, #m__system__notify__s2c{code=1000});
        _ -> ok
    end,

    if
        RolePid /= undefined -> erlang:exit(RolePid, normal);
        true -> ok
    end,
    if
        SenderPid /= undefined -> erlang:exit(SenderPid, normal);
        true -> ok
    end,
    if
        ReceiverPid /= undefined -> erlang:exit(ReceiverPid, normal);
        true -> ok
    end,


    account_api:leave(Sock),


    gen_tcp:close(Sock),
    {stop, kill, State};

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.
