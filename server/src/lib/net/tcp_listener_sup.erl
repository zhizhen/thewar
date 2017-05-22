%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(tcp_listener_sup).

-behaviour(supervisor).

%% API
-export([start_link/8]).

%% Supervisor callbacks
-export([init/1]).

-define(MAX_WAIT, 16#ffffffff).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link(IPAddress, Port, SocketOpts, OnStartup, OnShutdown,
        AcceptCallback, ConcurrentAcceptorCount, Label) ->
    supervisor:start_link(
        ?MODULE, {IPAddress, Port, SocketOpts, OnStartup, OnShutdown,
            AcceptCallback, ConcurrentAcceptorCount, Label}).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init({IPAddress, Port, SocketOpts, OnStartup, OnShutdown,
      AcceptCallback, ConcurrentAcceptorCount, Label}) ->
    Name = goddess_misc:tcp_name(tcp_acceptor_sup, IPAddress, Port),

    {ok, {{one_for_all, 10, 10},
          [{tcp_acceptor_sup, {tcp_acceptor_sup, start_link,
                               [Name, AcceptCallback]},
            transient, infinity, supervisor, [tcp_acceptor_sup]},
           {tcp_listener, {tcp_listener, start_link,
                           [IPAddress, Port, SocketOpts,
                            ConcurrentAcceptorCount, Name,
                            OnStartup, OnShutdown, Label]},
            transient, ?MAX_WAIT, worker, [tcp_listener]}]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================