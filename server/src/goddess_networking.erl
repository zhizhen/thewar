%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_networking).

-include("logger.hrl").

%% API
-export([start/3, start_tcp_listener/4, stop_tcp_listener/1,
        tcp_listener_started/2, tcp_listener_stopped/2, start_tcp_client/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% 启动网络服务
%% @end
%%--------------------------------------------------------------------
start(Listener, AcceptorNum, SocketOpts) ->
    ok = start_tcp_client_sup(),
    ok = start_tcp_listener(Listener, AcceptorNum, SocketOpts, {?MODULE, start_tcp_client, []}).

%%--------------------------------------------------------------------
%% @doc
%% 启动tcp client监督树
%% @end
%%--------------------------------------------------------------------
start_tcp_client_sup() ->
    case goddess_sup:start_supervisor_child(
            tcp_client_sup, tcp_client_sup, [{goddess_client_receiver, start_link, []}]) of
        ok                     -> ok;
        {error, {shutdown, _}} -> exit(cannot_start_tcp_client_sup)
    end.

%%--------------------------------------------------------------------
%% @doc
%% 启动tcp listener监督树
%% @end
%%--------------------------------------------------------------------
start_tcp_listener(Listener, AcceptorNum, SocketOpts, OnConnect) ->
    {IPAddress, Port, Family} = tcp_listener_addresses(Listener),
    Name = goddess_misc:tcp_name(tcp_listener_sup, IPAddress, Port),

    Args = [IPAddress, Port, [Family | SocketOpts], 
                {?MODULE, tcp_listener_started, []}, 
                {?MODULE, tcp_listener_stopped, []}, 
            OnConnect, AcceptorNum, "TCP Listener"],
    
    case goddess_sup:start_supervisor_child(Name, tcp_listener_sup, Args) of
        ok                     -> ok;
        {error, {shutdown, _}} -> exit({cannot_start_tcp_listener_sup,
                                    {goddess_misc:ntoa(IPAddress), Port}})
    end.

%%--------------------------------------------------------------------
%% @doc
%% 停止tcp listener监督树
%% @end
%%--------------------------------------------------------------------
stop_tcp_listener(Listener) ->
    {IPAddress, Port, _Family} = tcp_listener_addresses(Listener),
    Name = goddess_misc:tcp_name(tcp_listener_sup, IPAddress, Port),
    goddess_sup:stop_child(Name).

%%--------------------------------------------------------------------
%% @doc
%% tcp listener监听到连接后回调
%% @end
%%--------------------------------------------------------------------
tcp_listener_started(_IPAddress, _Port) ->
    ignore.

%%--------------------------------------------------------------------
%% @doc
%% tcp listener退出时回调
%% @end
%%--------------------------------------------------------------------
tcp_listener_stopped(_IPAddress, _Port) ->
    ignore.

%%--------------------------------------------------------------------
%% @doc
%% 启动tcp client，执行业务处理
%% @end
%%--------------------------------------------------------------------
start_tcp_client(Sock) ->
    {ok, Pid} = supervisor:start_child(tcp_client_sup, [Sock]),
    Pid ! start_client.

%%%===================================================================
%%% Internal functions
%%%===================================================================
tcp_listener_addresses(Port)
    when is_integer(Port) andalso (Port >= 0) andalso (Port =< 65535) ->
        {{0, 0, 0, 0}, Port, inet}.
