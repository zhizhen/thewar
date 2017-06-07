%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(arena_api).

-include("common.hrl").
-include("msg_code.hrl").
-include("logger.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("game_pb.hrl").

-compile(export_all).


% %%%===================================================================
% %%% API
% %%%===================================================================
match(#m__arena__match__c2s{}, Sender) ->
	#game_info{role=Role} = role_api:get_user_data(),
	arena_srv:add_match(Role),
	ok.

enter_battle_scene(SceneUid, SceneCid, ScenePid, Sender) ->
	?INFO_MSG("process enter battle scene"),
	#game_info{role=Role} = role_api:get_user_data(),
	SrvName = util:to_atom("arena_"++util:to_list(SceneUid)),
	ets:insert(SrvName, {Role#role.role_id, self()}),
	ok.
	
% info(#m__arena__info__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, equip = Equip, daily=Daily, arena=Arena} = role_api:get_user_data(),
%         MyInfo = arena_srv:get_info_by_role_id(Role#role.role_id),
%         case MyInfo of
%             false -> 
%                 throw({msg, ?ARENA_PARAMS_ERROR1, Sender});
%             #sys_arena_rank{rank=Rank} ->
%                 Challengers = arena_srv:get_challenger(Rank),
%                 Armor = case item_api:get_info_by_id(Equip#equip.armor, [?ITEM_USE]) of
%                     false -> 0;
%                     #item{item_id = ItemId} -> ItemId
%                 end,

%                 Data = #m__arena__info__s2c{                                             % 确保自己的数据是同步的,所以取自身的数据
%                     info = #p_arena_info{
%                         rank = Rank,
%                         role_id = Role#role.role_id,
%                         role_name = Role#role.role_name,
%                         job = Role#role.job,
%                         armor = Armor,
%                         level = Role#role.level,
%                         type = MyInfo#sys_arena_rank.type,
%                         total_gold = MyInfo#sys_arena_rank.total_gold,
%                         total_honor = MyInfo#sys_arena_rank.total_honor,
%                         total_exp = MyInfo#sys_arena_rank.total_exp,
%                         daily_times = Daily#daily.arena_challenge,
%                         add_times = Daily#daily.arena_add_times,
%                         fight = Role#role.fight
%                     },
%                     logs = arena_mod:build_logs(Arena#arena.pk_logs),
%                     challenger = arena_mod:build_challengers(Challengers)         %确保取别人的数据没有性能问题的
%                 },
%                 Sender ! {send, Data}
%         end
%     end,
%     ?PERFORM(F).

% award(#m__arena__award__c2s{}, Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     case arena_srv:award(Role#role.role_id) of
%         false -> Sender ! {send, #m__system__notify__s2c{code=?ARENA_AWARD_FAIL}};
%         {AddGold, AddHonor, AddExp} ->
%             role_api:add_gold(AddGold, Sender),
%             role_api:add_honor(AddHonor, Sender),
%             role_api:add_exp(AddExp, Sender),
%             Sender ! {send, #m__system__notify__s2c{code=?ARENA_AWARD_SUCCESS}}
%     end.

% start_challenge(#m__arena__start_challenge__c2s{rival_rank=RivalRank}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, daily=Daily} = role_api:get_user_data(),
%         if Daily#daily.arena_challenge >= (?ARENA_DAILY_PK_TIMES + Daily#daily.arena_add_times) ->
%             throw({msg, ?ARENA_PARAMS_ERROR1, Sender});
%             true -> ok
%         end,

%         Tag = arena_srv:start_challenge(Role#role.role_id, RivalRank),
%         if Tag == false ->
%             throw({msg, ?ARENA_IN_BATTLE, Sender});
%             true -> ok
%         end,
%         Sender ! {send, #m__system__notify__s2c{code=?ARENA_START_BATTLE_SUCCESS}}
%     end,
%     performer(F).

% challenge(#m__arena__challenge__c2s{rival_rank=RivalRank, success=Sucess, start_time=_StartTime, end_time=_EndTime, multi_kill=_MultiKill, hp=_HP, lose_hp=_LoseHP}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, daily=Daily, arena=Arena} = role_api:get_user_data(),
%         RankInfo = arena_srv:get_info_by_role_id(Role#role.role_id),
%         RivalInfo = arena_srv:get_info_by_rank(RivalRank),
%         case lists:member(false, [RivalInfo, RankInfo]) of
%             true -> throw({msg, ?ARENA_PARAMS_ERROR2, Sender});
%             false -> ok
%         end,

%         RivalInBattle = arena_srv:get_challenger_state(RivalRank),
%         MeInBattle = arena_srv:get_challenger_state(RankInfo#sys_arena_rank.rank),
%         if
%             RivalInBattle == false ->
%                 throw({msg, ?ARENA_PARAMS_ERROR3, Sender});
%             MeInBattle == false ->
%                 throw({msg, ?ARENA_PARAMS_ERROR4, Sender});
%             true -> ok
%         end,

%         {MeRankId, MyChallengerRankId, _} = MeInBattle,     % 我自己和我的对手
%         {RivalRankId, RivalChallengerRankId, _} = RivalInBattle,     % 对手的 和对手的对手 就是我自己的
%         if
%             MeRankId /= RivalChallengerRankId ->                              % 如果我的对手不是他
%                 throw({msg, ?ARENA_PARAMS_ERROR5, Sender});
%             MyChallengerRankId /= RivalRankId ->                              % 如果他的对手不是我
%                 throw({msg, ?ARENA_PARAMS_ERROR6, Sender});
%             true -> ok
%         end,

%         BattleSwap =
%         case Sucess of
%             ?BATTLE_LOSE ->
%                 send_pk_award(?BATTLE_LOSE, Role#role.level, Sender),
%                 false;
%             ?BATTLE_WIN ->
%                 Tag = arena_srv:swap(RankInfo#sys_arena_rank.rank, RivalRank),
%                 if Tag == false ->
%                     throw({msg, ?ARENA_PARAMS_ERROR7, Sender});
%                     true -> ok
%                 end,
%                 send_pk_award(?BATTLE_WIN, Role#role.level, Sender),
%                 Tag
%         end,

%         arena_srv:clear_lock(RankInfo#sys_arena_rank.rank, RivalInfo#sys_arena_rank.rank),     % 清理

%         MyLog = #arena_log{                                     % 开始记录日志
%             type = ?ARENA_HOME_LOG,
%             success = Sucess,
%             pk_time = util:unixtime(),
%             my_rank = RankInfo#sys_arena_rank.rank,
%             my_level = RankInfo#sys_arena_rank.level,
%             rival_role_id = RivalInfo#sys_arena_rank.role_id,
%             rival_role_name = RivalInfo#sys_arena_rank.role_name,
%             rival_rank = RivalInfo#sys_arena_rank.rank,
%             rival_job = RankInfo#sys_arena_rank.job
%         },
%         NewLogs = lists:keysort(#arena_log.pk_time, Arena#arena.pk_logs ++ [MyLog]),
%         NewLogs2 = case erlang:length(NewLogs) > ?ARENA_LOGS_MAX_NUM of
%             false -> NewLogs;
%             true ->
%                 lists:nthtail(erlang:length(NewLogs)-?ARENA_LOGS_MAX_NUM, NewLogs)
%         end,

%         game_info:update(Arena#arena{pk_logs=NewLogs2}),
%         game_info:update(Daily#daily{arena_challenge=Daily#daily.arena_challenge+1}),
        
%         living_api:arena_challenge(Sender),
%         case BattleSwap of
%             {ok, Win, Lost} ->
%                case Win#sys_arena_rank.rank of
%                    1 ->
%                        Notice = #chat_content{
%                            role=#chat_role{role_name=Win#sys_arena_rank.role_name, role_id=Win#sys_arena_rank.role_id},
%                            role2=#chat_role{role_name=Lost#sys_arena_rank.role_name, role_id=Lost#sys_arena_rank.role_id}
%                        },
%                        Msg = chat_mod:make_msg(?CHAT_WORLD, 18, [], Notice),
%                        broadcast_api:server(Msg);
%                    _ -> ok
%                end;
%             _ -> ok
%         end,
%         info(#m__arena__info__c2s{}, Sender),
%         %------------------给对手记录日志-------------------------------------------
%         if RivalInfo#sys_arena_rank.type == ?ARENA_COMPUTER ->
%             throw(return);
%             true -> ok
%         end,

%         RivalLog = #arena_log{
%             type = ?ARENA_AWAY_LOG,
%             success = Sucess,
%             pk_time = util:unixtime(),
%             my_rank = RivalInfo#sys_arena_rank.rank,
%             my_level = RivalInfo#sys_arena_rank.level,
%             rival_role_id = RankInfo#sys_arena_rank.role_id,
%             rival_role_name = RankInfo#sys_arena_rank.role_name,
%             rival_rank = RankInfo#sys_arena_rank.rank,
%             rival_job = RankInfo#sys_arena_rank.job
%         },
%         RolePid = goddess_misc:get_role_pid(RivalInfo#sys_arena_rank.role_id),

%         case RolePid of
%             false ->
%                 RivalArena = arena_db:get(RivalInfo#sys_arena_rank.role_id),
%                 NewRivalLogs = lists:keysort(#arena_log.pk_time, RivalArena#arena.pk_logs ++ [RivalLog]),
%                 NewRivalLogs2 = case erlang:length(NewRivalLogs) > ?ARENA_LOGS_MAX_NUM of
%                     false -> NewRivalLogs;
%                     true ->
%                         lists:nthtail(erlang:length(NewRivalLogs)-?ARENA_LOGS_MAX_NUM, NewRivalLogs)
%                 end,
%                 arena_db:save(RivalArena#arena{pk_logs=NewRivalLogs2});

%             _ ->
%                 RolePid ! {process, arena_api, add_pk_logs, [RivalLog]}
%         end
%      end,
%      performer(F).

% rank(#m__arena__rank__c2s{ranks=Ranks}, Sender) ->
%     F = fun() ->
%         if erlang:length(Ranks) > 20 ->
%             throw({msg, ?ARENA_PARAMS_ERROR8, Sender});
%             true -> ok
%         end,

%         RankList = arena_srv:get_info_by_rank_list(Ranks),
%         MaxRank = id_srv:get_max_arena_rank(),

%         Info = #m__arena__rank__s2c{
%             last_rank = MaxRank,
%             info = arena_mod:build_challengers(RankList)         % 确保取别人的数据没有性能问题的
%         },
%         Sender ! {send, Info}
%     end,
%     performer(F).

% add_times(#m__arena__add_times__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, daily=Daily} = role_api:get_user_data(),
%         TimesAddLimitCfg = viprelate_cfg:get(Role#role.vip),
%         if Daily#daily.arena_add_times >= TimesAddLimitCfg#viprelate_cfg.areana_times ->
%             throw({msg, ?VIP_LEVEL_TOO_LOW, Sender});
%             true -> ok
%         end,
%         Times = Daily#daily.arena_add_times + 1,
%         Cfg = arena_add_times_cfg:get(Times),
%         if Cfg == false ->
%             throw({msg, ?ARENA_ADD_TIMES_FAIL, Sender});
%             true -> ok
%         end,
%         case role_api:is_enough_gold(Cfg#arena_add_times_cfg.gold) of
%             false -> throw({msg, ?ARENA_ADD_TIMES_FAIL, Sender});
%             true -> ok
%         end,
%         case role_api:is_enough_coin(Cfg#arena_add_times_cfg.coin)  of
%             false -> throw({msg, ?ARENA_ADD_TIMES_FAIL, Sender});
%             true -> ok
%         end,
%         role_api:pay_coin(Cfg#arena_add_times_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         role_api:pay_gold(Cfg#arena_add_times_cfg.gold, Sender),
%         NewDaily = Daily#daily{arena_add_times=Daily#daily.arena_add_times+1},

%         game_info:update(NewDaily),

%         Sender ! {send, #m__system__notify__s2c{code=?ARENA_ADD_TIMES_SUCCESS}}

%     end,
%     performer(F).

% %%%============================================================================
% %%% Process API
% %%%============================================================================
% send_pk_award(Success, Level, ClientSender) ->
%     AllIds = arena_award_cfg:get_all(),
%     CfgId = lists:max([Id || Id <- AllIds, Id =< Level]),
%     Cfg = arena_award_cfg:get(CfgId),
%     case Success of
%         ?BATTLE_WIN ->
%             role_api:add_gold(Cfg#arena_award_cfg.win_gold, ClientSender, quiet),
%             role_api:add_honor(Cfg#arena_award_cfg.win_honor, ClientSender, quiet),
%             role_api:add_exp(Cfg#arena_award_cfg.win_exp, ClientSender, quiet);
%         ?BATTLE_LOSE ->
%             role_api:add_gold(Cfg#arena_award_cfg.lose_gold, ClientSender, quiet),
%             role_api:add_honor(Cfg#arena_award_cfg.lose_honor, ClientSender, quiet),
%             role_api:add_exp(Cfg#arena_award_cfg.lose_exp, ClientSender, quiet)
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% send_rank_award(AwardTimes, Rank) ->
%     NewRank = arena_mod:add_awards(Rank, AwardTimes),
%     NewRank.

% % process msg
% add_pk_logs(Log, _Sender) ->
%     #game_info{arena=Arena} = role_api:get_user_data(),
%     NewLogs = lists:keysort(#arena_log.pk_time, Arena#arena.pk_logs ++ [Log]),
%     NewLogs2 = case erlang:length(NewLogs) > ?ARENA_LOGS_MAX_NUM of
%         false -> NewLogs;
%         true ->
%            lists:nthtail(erlang:length(NewLogs)-?ARENA_LOGS_MAX_NUM, NewLogs)
%     end,
%     game_info:update(Arena#arena{pk_logs=NewLogs2}).

% open_function(_FuncId) ->
%     #game_info{role=Role, equip=Equip} = role_api:get_user_data(),
%     RankInfo = arena_srv:get_info_by_role_id(Role#role.role_id),               % 过滤重复开启
%     case RankInfo of
%         false ->
%             Armor = case item_api:get_info_by_id(Equip#equip.armor, [?ITEM_USE]) of
%                 false -> 0;
%                 #item{item_id = ItemId} -> ItemId
%             end,

%             ArenaRank = #sys_arena_rank{
%                 rank = id_srv:gen_arena_rank(),
%                 role_id = Role#role.role_id,
%                 role_name = Role#role.role_name,
%                 job = Role#role.job,
%                 armor = Armor,
%                 level = Role#role.level,
%                 fight = Role#role.fight,
%                 type = ?ARENA_PEOPLE,
%                 total_gold = 0,
%                 total_honor = 0,
%                 total_exp = 0
%             },
%             arena_srv:enter(ArenaRank),
%             case ArenaRank#sys_arena_rank.rank > 0 of
%                 false -> ok;
%                 true ->
%                     Computer1 = arena_mod:build_computer(),
%                     arena_srv:enter(Computer1),
%                     Computer2 = arena_mod:build_computer(),
%                     arena_srv:enter(Computer2),
%                     ok
%             end;
%         _ ->
%             ok
%     end.

% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(return) ->
%     return;
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
