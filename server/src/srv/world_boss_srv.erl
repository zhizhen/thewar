%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(world_boss_srv).

-behaviour(gen_server).

-include("cfg_record.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([
    start_link/0,
    change_state/2
]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(world_boss_info, {boss_id=0, state=0, start_time=0}).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 启动ID生成服务
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

change_state(BossId, NewState) ->
    gen_server:cast(?SERVER, {change_state, BossId, NewState}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
%% @doc 初始化ID生成服务
init([]) ->
    AllWorldBoss = world_boss_cfg:get_all(),
    State = init_state([], AllWorldBoss),
    erlang:send_after(1000, self(), tick),
    {ok, State}.

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("world_boss_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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
            ?ERROR_MSG("world_boss_srv handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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
            ?ERROR_MSG("world_boss_srv handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
terminate(_Reason, _State) ->
    ok.

%% @private
%% @doc Convert process state when code is changed
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
do_call({change_state, BossId, NewState}, _, State) ->
    Info = lists:keyfind(BossId, #world_boss_info.boss_id, State),
    NewInfo = Info#world_boss_info{state=NewState},
    State2 = lists:keyreplace(BossId, #world_boss_info.boss_id, State, NewInfo),
    {reply, ok, State2};


do_call({afterwards, BossInfo}, _From, State) ->
    world_boss_api:afterwards(BossInfo),
    {reply, ok, State};

do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

do_cast({change_state, BossId, NewState}, State) ->
    Info = lists:keyfind(BossId, #world_boss_info.boss_id, State),
    NewInfo = Info#world_boss_info{state=NewState},
    State2 = lists:keyreplace(BossId, #world_boss_info.boss_id, State, NewInfo),
    {noreply, State2};

do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

do_info(tick, State) ->
    {H, M, S} =  erlang:time(),
    Now = H * 3600 + M * 60 + S,
    AllWorldBoss = world_boss_cfg:get_all(),
    NewState = open_world_boss(Now, State, AllWorldBoss),
    erlang:send_after(1000, self(), tick),
    {noreply, NewState};

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.

%%%----------------------------------------------------
init_state(State, []) -> State;
init_state(State, [BossId|AllWorldBoss]) ->
    BossData = #world_boss_info{
        boss_id = BossId,
        state = ?WORLD_BOSS_STATE_READY
    },
    init_state(State ++ [BossData], AllWorldBoss).

%% init_state(State, [BossId|AllWorldBoss]) ->
%%     Info = world_boss_db:get(BossId),
%%     Cfg = world_boss_cfg:get(BossId),
%%     BossData = case Info of
%%         null ->
%%             world_boss_db:create(BossId, Cfg#world_boss_cfg.init_level),
%%             #world_boss_info{
%%                 boss_id = BossId,
%%                 level = Cfg#world_boss_cfg.init_level,
%%                 state = ?WORLD_BOSS_STATE_READY
%%             };
%%         #world_boss{boss_id = BossId, level = Level} ->
%%             #world_boss_info{
%%                 boss_id = BossId,
%%                 level = Level,
%%                 state = ?WORLD_BOSS_STATE_READY
%%             }
%%     end,
%%     init_state(State ++ [BossData], AllWorldBoss).

start_world_boss(BossId, State) ->
    Info = lists:keyfind(BossId, #world_boss_info.boss_id, State),
    NewInfo = case Info#world_boss_info.state == ?WORLD_BOSS_STATE_READY andalso util:unixtime() - Info#world_boss_info.start_time > ?BOSS_ALL_TIME of
        false -> Info;
        true ->
            BossLevel = case rank_api:get(?RANK_TYPE_LEVEL, 10, 1) of
                [] -> 1;                                                         % 1 level
                [Rank] -> Rank#rank.level
            end,
            boss_srv:start(world, BossId, BossLevel),
            Info#world_boss_info{state = ?WORLD_BOSS_STATE_RUN, start_time = util:unixtime()}
    end,
    lists:keyreplace(BossId, #world_boss_info.boss_id, State, NewInfo).

open_world_boss(_, State, []) -> State;
open_world_boss(Now, State, [BossId|BossIds]) ->
    Cfg = world_boss_cfg:get(BossId),
    NewState = case Now >= Cfg#world_boss_cfg.daily_open_time andalso Now =< Cfg#world_boss_cfg.daily_open_time + ?BOSS_ALL_TIME of
        false -> State;
        true -> start_world_boss(BossId, State)
    end,
    open_world_boss(Now, NewState, BossIds).
