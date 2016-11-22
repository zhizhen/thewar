-module(reader).
-behaviour(gen_server).
-behaviour(ranch_protocol).

%% API
-export([start_link/4]).
-include("gate.hrl").
-include("game_pb.hrl").

%% gen_server
-export([
         init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3
        ]).

-define(TIMEOUT, 5000).

-record(state, {
          ref,
          socket,
          transport,
          opt,
          ip,
          port,
          socket_cache,
          role
         }).

%% API
start_link(Ref, Socket, Transport, Opts) ->
    gen_server:start_link(?MODULE, [Ref, Socket, Transport, Opts], []).

%% gen_server
init([Ref, Socket, Transport, Opts]) ->
    lager:info("init socket connect."),
    global:register_name(?MODULE, self()),
    ok = proc_lib:init_ack({ok, self()}),
    ok = ranch:accept_ack(Ref),
    ok = Transport:setopts(Socket, [{active, once}]),
    {ok, {Ip, Port}} = inet:peername(Socket),
    lager:debug("connect:~p~n", [{Ip, Port}]),
    State = #state{
        ref = Ref, 
        socket = Socket,
        transport = Transport,
        opt = Opts,
        ip = Ip,
        port = Port,
        socket_cache = netsake:net_packet_init()
    },
    gen_server:enter_loop(?MODULE, [], State, ?TIMEOUT).

handle_call(_Req, _From, State) ->
    {reply, ok, State}.

handle_info({tcp, Socket, <<Bin/binary>>}, #state{transport = Transport} = State) ->
    Transport:setopts(Socket, [{active, once}]),
    State1 = proc_tcp(Bin, State),
    {noreply, State1, ?TIMEOUT};
handle_info({send, Bin}, #state{socket = Socket, transport = Transport} = State) ->
    Transport:send(Socket, Bin),
    {noreply, State};
handle_info(Info, State) ->
    lager:error("unhandled into : ~p~n", [Info]),
    {noreply, State}.

handle_cast(Msg, State) ->
    lager:error("unhandled msg : ~p~n", [Msg]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

proc_tcp(Bin,#state{socket_cache=Cache} =  State) ->
    {Cache2, DataBin} = netsake:net_packet(Bin, Cache),
    case DataBin of
        false ->
            State;
        _ ->
            %% route DataBin
            {ok, Proto} = game_pb:decode(DataBin),
            handle_proto(Proto),
            proc_tcp([], State#state{socket_cache=Cache2})
    end.

handle_proto(#m__system__heartbeat__c2s{}) -> ok;
handle_proto(#m__role__login__c2s{}) ->
    {ok, DefaultGameSrv} = application:get_env(gate, default_game),
    lager:info("rpc call: ~p~n", [{DefaultGameSrv}]),
    rpc:call(DefaultGameSrv, role_manager, create, [self()]),
    receive
        {role_login, {pid, Pid}, {id, Id}} ->
            Proto = #m__role__login__s2c{},
            {ok, Bin} = game_pb:encode(Proto),
            Len = erlang:byte_size(Bin) + 1,
            Iszip = 0,
            Final = <<Len:32, Iszip:8, Bin/binary>>,
            self() ! {send, Final},
            ok;
        Error ->
            lager:error("start role error : ~p~n", [{Error}])
    after 10000 ->
            lager:error("start role timeout : ~p~n", [{}])
    end,
    ok;
handle_proto(Proto) ->
    lager:info("unhandled proto: ~p~n", [Proto]),
    RoleMgr = global:whereis_name(role_manager),
    RoleMgr ! {proto, Proto}.
