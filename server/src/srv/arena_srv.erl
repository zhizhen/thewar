%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 竞技场
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(arena_srv).

-behaviour(gen_server).

-include("logger.hrl").
-include("common.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").

-compile(export_all).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(TICK_TIME, 10000).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

add_match(Role) ->
    gen_server:cast(?SERVER, {add_match, Role}).

% %% @doc 入围竞技场
% enter(#sys_arena_rank{}=ArenaRank) ->
%     gen_server:cast(?SERVER, {enter, ArenaRank}).

% change_level(RoleId, Level) ->
%     gen_server:cast(?SERVER, {change_level, util:to_binary(RoleId), Level}).

% change_armor(RoleId, Armor) ->
%     gen_server:cast(?SERVER, {change_armor, util:to_binary(RoleId), Armor}).

% change_fight(RoleId, Fight) ->
%     gen_server:cast(?SERVER, {change_fight, util:to_binary(RoleId), Fight}).

% swap(WinRankId, LoseRankId) ->
%     gen_server:call(?SERVER, {swap, WinRankId, LoseRankId}).

% clear_lock(Rank, RivalRank) ->
%     gen_server:call(?SERVER, {clear_lock, Rank, RivalRank}).

% award(RoleId) ->
%     gen_server:call(?SERVER, {award, util:to_binary(RoleId)}).

% get_challenger(Rank) ->
%     gen_server:call(?SERVER, {get_challenger, Rank}).

% get_info_by_role_id(RoleId) ->
%     gen_server:call(?SERVER, {get_info_by_role_id, util:to_binary(RoleId)}).

% get_info_by_rank(Rank) ->
%     gen_server:call(?SERVER, {get_info_by_rank, Rank}).

% get_info_by_rank_list(RankList) ->
%     gen_server:call(?SERVER, {get_info_by_rank_list, RankList}).

% start_challenge(RoleId, RivalRank) ->
%     gen_server:call(?SERVER, {start_challenge, util:to_binary(RoleId), RivalRank}).

% get_challenger_state(Rank) ->
%     gen_server:call(?SERVER, {get_challenger_state, Rank}).


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    % ArenaInfo = sys_arena_db:get(),
    erlang:send_after(?TICK_TIME, self(), tick),
    {ok, #{match_list => [], start_list => []}}.

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("arena_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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

            ?ERROR_MSG("arena_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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
            ?ERROR_MSG("arena_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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

% do_call({get_info_by_role_id, RoleId}, _From, State) ->
%     ArenaInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     {reply, ArenaInfo, State};

% do_call({get_info_by_rank, Rank}, _From, State) ->
%     ArenaInfo = lists:keyfind(Rank, #sys_arena_rank.rank, State#sys_arena.rank),
%     {reply, ArenaInfo, State};

% do_call({get_info_by_rank_list, RankList}, _From, State) ->
%     BaseInfos = [lists:keyfind(RankId, #sys_arena_rank.rank, State#sys_arena.rank) || RankId <- RankList],
%     Infos = [Info || Info <- BaseInfos, Info /= false],
%     {reply, Infos, State};

% do_call({get_challenger, Rank}, _From, State) ->
%     BaseChallengers = [lists:keyfind(RankId, #sys_arena_rank.rank, State#sys_arena.rank) || RankId <- arena_mod:random_arena_challenger(Rank)],
%     Challengers = [Challenger || Challenger <- BaseChallengers, Challenger /= false],
%     {reply, Challengers, State};

% do_call({swap, WinRankId, LoseRankId}, _From, State) ->
%     AllRank = State#sys_arena.rank,
%     WinRankInfo = lists:keyfind(WinRankId, #sys_arena_rank.rank, AllRank),
%     LoseRankInfo = lists:keyfind(LoseRankId, #sys_arena_rank.rank, AllRank),
%     case lists:member(false, [WinRankInfo, LoseRankInfo]) of
%         true -> {reply, false, State};
%         false ->
%             case WinRankInfo#sys_arena_rank.rank =< LoseRankInfo#sys_arena_rank.rank of           % 如果胜利者的等级高于失败者，还交换个J8毛啊
%                 true -> {reply, ok, State};
%                 false ->
%                     NewLoseLevel = if
%                         LoseRankInfo#sys_arena_rank.type == ?ARENA_PEOPLE -> LoseRankInfo#sys_arena_rank.level;
%                         LoseRankInfo#sys_arena_rank.level + 5 < WinRankInfo#sys_arena_rank.level -> WinRankInfo#sys_arena_rank.level - 5;
%                         true -> LoseRankInfo#sys_arena_rank.level
%                     end,
%                     case NewLoseLevel of
%                         false -> {reply, false, State};
%                         _ ->
%                             NewWinRankInfo = WinRankInfo#sys_arena_rank{
%                                 role_id = LoseRankInfo#sys_arena_rank.role_id,
%                                 role_name = LoseRankInfo#sys_arena_rank.role_name,
%                                 job = LoseRankInfo#sys_arena_rank.job,
%                                 armor = LoseRankInfo#sys_arena_rank.armor,
%                                 level = NewLoseLevel,
%                                 type = LoseRankInfo#sys_arena_rank.type,
%                                 total_gold = LoseRankInfo#sys_arena_rank.total_gold,
%                                 total_honor = LoseRankInfo#sys_arena_rank.total_honor,
%                                 total_exp = LoseRankInfo#sys_arena_rank.total_exp
%                             },
%                             NewLoseRankInfo = LoseRankInfo#sys_arena_rank{
%                                 role_id = WinRankInfo#sys_arena_rank.role_id,
%                                 role_name = WinRankInfo#sys_arena_rank.role_name,
%                                 job = WinRankInfo#sys_arena_rank.job,
%                                 armor = WinRankInfo#sys_arena_rank.armor,
%                                 level = WinRankInfo#sys_arena_rank.level,
%                                 type = WinRankInfo#sys_arena_rank.type,
%                                 total_gold = WinRankInfo#sys_arena_rank.total_gold,
%                                 total_honor = WinRankInfo#sys_arena_rank.total_honor,
%                                 total_exp = WinRankInfo#sys_arena_rank.total_exp
%                             },
%                             NewAllRank1 = lists:keyreplace(WinRankInfo#sys_arena_rank.rank, #sys_arena_rank.rank, AllRank, NewWinRankInfo),
%                             NewAllRank2 = lists:keyreplace(LoseRankInfo#sys_arena_rank.rank, #sys_arena_rank.rank, NewAllRank1, NewLoseRankInfo),
%                             sys_arena_db:save(NewWinRankInfo),
%                             sys_arena_db:save(NewLoseRankInfo),
%                             {reply, {ok, NewWinRankInfo, NewLoseRankInfo}, State#sys_arena{rank=NewAllRank2}}
%                     end             % end NewLoseLevel数据异常判断
%             end                     % end rank大小判断
%     end;

% do_call({clear_lock, Rank, RivalRank}, _From, State) ->
%     ?DEBUG_MSG("arena srv clear lock:~p~n", [{Rank, RivalRank}]),
%     NewInBattle1 = lists:keydelete(Rank, 1, State#sys_arena.in_battle),
%     NewInBattle2 = lists:keydelete(RivalRank, 1, NewInBattle1),
%     {reply, ok, State#sys_arena{in_battle=NewInBattle2}};

% do_call({award, RoleId}, _From, State) ->
%     RankInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     case RankInfo of
%         false -> {reply, false, State};
%         #sys_arena_rank{} ->
%             NewRankInfo = RankInfo#sys_arena_rank{total_gold=0, total_honor=0, total_exp=0},
%             AllRank = lists:keyreplace(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank, NewRankInfo),
%             sys_arena_db:save(NewRankInfo),

%             AddGold = RankInfo#sys_arena_rank.total_gold,
%             AddHonor = RankInfo#sys_arena_rank.total_honor,
%             AddExp = RankInfo#sys_arena_rank.total_exp,

%             {reply, {AddGold, AddHonor, AddExp}, State#sys_arena{rank=AllRank}}
%     end;

% do_call({start_challenge, RoleId, RivalRank}, _From, State) ->
%     RankInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     RivalInfo = lists:keyfind(RivalRank, #sys_arena_rank.rank, State#sys_arena.rank),
%     case lists:member(false, [RankInfo, RivalInfo]) of
%         true -> {reply, false, State};
%         false ->
%             case RankInfo#sys_arena_rank.rank == RivalInfo#sys_arena_rank.rank of          % 这就是自己挑战自己，丫逼的找死啊
%                 true -> {reply, false, State};
%                 false ->
%                     Now = util:unixtime(),
%                     IsMeInBattle = case lists:keyfind(RankInfo#sys_arena_rank.rank, 1, State#sys_arena.in_battle) of
%                         false -> false;
%                         {_, _, TimeStamp1} -> (Now - TimeStamp1) < ?CLEAR_LOCK_TIME
%                     end,
%                     IsRivalInBattle = case lists:keyfind(RivalInfo#sys_arena_rank.rank, 1, State#sys_arena.in_battle) of
%                         false -> false;
%                         {_, _, TimeStamp2} -> (Now - TimeStamp2) < ?CLEAR_LOCK_TIME
%                     end,
%                     case lists:member(true, [IsMeInBattle, IsRivalInBattle]) of
%                         true -> {reply, false, State};
%                         false ->
%                             NewInBattle1 = lists:keydelete(RankInfo#sys_arena_rank.rank, 1, State#sys_arena.in_battle),            % 去掉老的加入新的
%                             NewInBattle2 = lists:keydelete(RivalInfo#sys_arena_rank.rank, 1, NewInBattle1),

%                             TagTime = util:unixtime(),
%                             Tag1 = {RankInfo#sys_arena_rank.rank, RivalInfo#sys_arena_rank.rank, TagTime},
%                             Tag2 = {RivalInfo#sys_arena_rank.rank, RankInfo#sys_arena_rank.rank, TagTime},
%                             NewState = State#sys_arena{in_battle=NewInBattle2 ++ [Tag1, Tag2]},
%                             {reply, ok, NewState}
%                     end
%             end                 % end  判断是不是自己干自己
%     end;

% do_call({get_challenger_state, Rank}, _From, State) ->
%     case lists:keyfind(Rank, 1, State#sys_arena.in_battle) of
%         false ->
%             {reply, false, State};
%         Data ->
%             {_,_,Time} = Data,
%             ?DEBUG_MSG("arena srv in battle state check~p~n", 
%                 [{ util:unixtime() - Time > ?CLEAR_LOCK_TIME,  util:unixtime() - Time, ?CLEAR_LOCK_TIME}]),
%             case util:unixtime() - Time > ?CLEAR_LOCK_TIME of
%                 true -> {reply, false, State};
%                 false -> {reply, Data, State}
%             end
%     end;

do_call(_Request, _From, State) ->
    {reply, ok, State}.

do_cast({add_match, Role}, #{match_list := MatchList} = State) ->
    ?INFO_MSG("add match! : ~p~n", [{Role}]),
    case lists:keyfind(Role#role.role_id, #role.role_id, MatchList) of
        false ->
            {noreply, State#{match_list := [Role|MatchList]}};
        _ ->
            {noreply, State}
    end;

% do_cast({enter, #sys_arena_rank{}=ArenaRank}, State) ->
%     NewRank = State#sys_arena.rank ++ [ArenaRank],
%     sys_arena_db:save(ArenaRank),
%     {noreply, State#sys_arena{rank=NewRank}};

% do_cast({change_level, RoleId, Level}, State) ->
%     RankInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     case RankInfo of
%         false -> {noreply, State};
%         #sys_arena_rank{} ->
%             NewRankInfo = RankInfo#sys_arena_rank{level=Level},
%             AllRank = lists:keyreplace(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank, NewRankInfo),
%             sys_arena_db:save(NewRankInfo),
%             {noreply, State#sys_arena{rank=AllRank}}
%     end;

% do_cast({change_armor, RoleId, Armor}, State) ->
%     RankInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     case RankInfo of
%         false -> {noreply, State};
%         #sys_arena_rank{} ->
%             NewRankInfo = RankInfo#sys_arena_rank{armor=Armor},
%             AllRank = lists:keyreplace(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank, NewRankInfo),
%             sys_arena_db:save(NewRankInfo),
%             {noreply, State#sys_arena{rank=AllRank}}
%     end;

% do_cast({change_fight, RoleId, Fight}, State) ->
%     RankInfo = lists:keyfind(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank),
%     case RankInfo of
%         false -> {noreply, State};
%         #sys_arena_rank{} ->
%             NewRankInfo = RankInfo#sys_arena_rank{fight=Fight},
%             AllRank = lists:keyreplace(RoleId, #sys_arena_rank.role_id, State#sys_arena.rank, NewRankInfo),
%             sys_arena_db:save(NewRankInfo),
%             {noreply, State#sys_arena{rank=AllRank}}
%     end;

do_cast(_Msg, State) ->
    {noreply, State}.

do_info(tick, #{match_list := MatchList, start_list := StartList} = State) ->
    {MatchList1, StartList1} = 
    case MatchList of
        [R1, R2 | Rest] ->
            SceneUid = id_srv:gen_scene_id(),
            SrvName = util:to_atom("arena_"++util:to_list(SceneUid)),
            {ok, Pid} = scene_srv:start_link(SrvName, Cfg#boss_cfg.scene_id),
            todo;
        _ ->
            {MatchList, StartList}
    end,

    erlang:send_after(?TICK_TIME, self(), tick),
    {noreply, State#{}};

do_info(_Info, State) ->
    {noreply, State}.
