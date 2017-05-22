%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/1]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

-define(CHILD(Id, Mod, Type, Args), {Id, {Mod, start_link, Args},
                                    transient, 5000, Type, [Mod]}).

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

start_child(Id) ->
    supervisor:start_child(?SERVER, ?CHILD(Id, group_srv, worker, [Id])).

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
    % {ok, {SupFlag, [ChildSpec]}}
    %% one for one
    %%      [ChildSpec] 会自动启动列表里的所有子进程
    %%      ChildSpec 格式 [{子进程的唯一标识(一个子进程一个), {M,F,A}, 重启策略, 停止策略, 监督者or工作者, [模块]}]
    %%      start_child 需要完成的 ChildSpec

    %% simple one for one
    %%      [ChildSpec] 列表里只有第一有作用,所以只需要写一个, 定义了了所有子进程的启动模块还函数, 启动参数由子进程补齐
    %%      start_child 的时候只需要提供补齐参数
    %%      ChildSpec 格式 [{子进程标识(所有子进程一个), {M,F,A}, 重启策略, 停止策略, 监督者or工作者, [模块]}]

    SupFlags = {one_for_one, 5, 10},
    ChildSpecs = [{group_master, {group_master_srv, start_link, []}, permanent, 10000, worker, [group_master_srv]}],
    {ok, {SupFlags, ChildSpecs}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
