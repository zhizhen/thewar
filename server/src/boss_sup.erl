%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(boss_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/5]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

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
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_child(group, PidName, BossId, Level, Master) ->
    supervisor:start_child(?SERVER, {PidName, {boss_srv, start_link, [group, PidName, BossId, Level, Master]}, temporary, 5000, worker, [boss_srv]});

start_child(world, PidName, BossId, Level, Master) ->
    supervisor:start_child(?SERVER, {PidName, {boss_srv, start_link, [world, PidName, BossId, Level, Master]}, temporary, 5000, worker, [boss_srv]}).

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
init([]) ->
    {ok, {{one_for_one, 5, 10},[]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
