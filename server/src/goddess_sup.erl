%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_sup).

-behaviour(supervisor).

%% API
-export([start_link/0, start_child/1, start_child/2, start_child/3,
         start_supervisor_child/1, start_supervisor_child/2,
         start_supervisor_child/3, stop_child/1]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).
-define(MAX_WAIT, 16#ffffffff).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% 启动goddess_sup监督进程API
%% @end
%%--------------------------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%--------------------------------------------------------------------
%% @doc
%% 在goddess_sup监督树下启动一个子进程
%% @end
%%--------------------------------------------------------------------
start_child(Mod) ->
    start_child(Mod, []).

start_child(Mod, Args) ->
    start_child(Mod, Mod, Args).

start_child(ChildId, Mod, Args) ->
    child_reply(supervisor:start_child(
                  ?SERVER,
                  {ChildId, {Mod, start_link, Args},
                   transient, ?MAX_WAIT, worker, [Mod]})).

%%--------------------------------------------------------------------
%% @doc
%% 在goddess_sup监督树下启动一个子监督进程
%% @end
%%--------------------------------------------------------------------
start_supervisor_child(Mod) ->
    start_supervisor_child(Mod, []).

start_supervisor_child(Mod, Args) ->
    start_supervisor_child(Mod, Mod, Args).

start_supervisor_child(ChildId, Mod, Args) ->
    child_reply(supervisor:start_child(
                  ?SERVER,
                  {ChildId, {Mod, start_link, Args},
                   transient, infinity, supervisor, [Mod]})).

%%--------------------------------------------------------------------
%% @doc
%% 关闭在goddess_sup监督树下的一个子进程
%% @end
%%--------------------------------------------------------------------
stop_child(ChildId) ->
    case supervisor:terminate_child(?SERVER, ChildId) of
        ok     -> supervisor:delete_child(?SERVER, ChildId);
        Error  -> Error
    end.

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% 启动goddess_sup监督进程
%% @end
%%--------------------------------------------------------------------
init([]) ->
    {ok, {{one_for_one, 5, 10}, []}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
child_reply({ok, _}) -> ok;
child_reply(X)       -> X.
