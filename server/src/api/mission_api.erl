%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mission_api).

% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("game_pb.hrl").
% -define(REMARK_START, [6,5,4,3,2,1]).
% %% API
% -export([all_info/2,enter/2,leave/2,battle/2,open_box/2, reset/2, random_mission_box/1, notown_info/2]).

% %% Process API
% -export([
%     open_function/1,
%     check_mission_active/1
% ]).


% %%%===================================================================
% %%% API
% %%%===================================================================

% all_info(#m__mission__all_info__c2s{scene_id=SceneId}, ClientSender) ->
%     case scene_cfg:get(SceneId) of
%         false ->
%             error;
%         _ ->
%             GameInfo = role_api:get_user_data(),
%             Role = GameInfo#game_info.role,
%             OpenScene = Role#role.open_scene,
%             case lists:member(SceneId, OpenScene) of
%                 false ->
%                     error;
%                 true ->
%                     Info = mission_mod:build_mission_info(SceneId, GameInfo#game_info.mission, GameInfo#game_info.daily),
%                     ClientSender ! {send, Info}
%             end
%     end.

% enter(#m__mission__enter__c2s{mission_id=MissionId}, ClientSender) ->
%     F = fun() ->
%         Cfg = mission_cfg:get(MissionId),
%         if Cfg == false ->
%             throw({msg, ?MISSION_PARAMS_ERROR1, ClientSender});
%             true -> ok
%         end,
%         #game_info{role=Role, package=Package, role_etc=RoleEtc, mission=Mission, daily=Daily} = role_api:get_user_data(),

%         if RoleEtc#role_etc.mission_process /= ?MISSION_OUT ->
%             throw({msg, ?MISSION_PARAMS_ERROR2, ClientSender});
%             true -> ok
%         end,

%         % TODO add act missions check
%         case act_mission_limit_check(MissionId) of
%             false -> throw({msg, ?MISSION_PARAMS_ERROR11, ClientSender});
%             true -> ok
%         end,

%         if Cfg#mission_cfg.need_level > Role#role.level ->
%             throw({msg, ?MISSION_PARAMS_ERROR3, ClientSender});
%             true -> ok
%         end,

%         ComplateMission = [X#mission.mission_id || X <- Mission#missions.all, X#mission.state==?MISSION_COMPLATED],
%         case lists:member(Cfg#mission_cfg.need_mission, ComplateMission++[0]) of
%             false ->throw({msg, ?MISSION_PARAMS_ERROR4, ClientSender});
%             _ -> ok
%         end,

%         case Cfg#mission_cfg.need_power > Role#role.power of
%             true -> throw({msg, ?MISSION_PARAMS_ERROR5, ClientSender});
%             _ -> ok
%         end,

%         case erlang:length(package_mod:get_empty_slots(Package)) == 0 of
%             true -> throw({msg, ?MISSION_PARAMS_ERROR6, ClientSender});
%             _ -> ok
%         end,

%         MissionDaily = lists:keyfind(MissionId, 1, Daily#daily.mission),
%         case MissionDaily of
%             {_, Num, _} ->
%                 if
%                     Cfg#mission_cfg.daily_times == 0 -> ok;
%                     Cfg#mission_cfg.daily_times =< Num -> throw({msg, ?MISSION_PARAMS_ERROR7, ClientSender});
%                     true -> ok
%                 end;
%             false -> ok
%         end,

% %%         scene_api:enter(#m__scene__enter__c2s{scene_id=MissionId}, ClientSender),        % 自动进入副本

%         MissionList = [X#mission.mission_id || X <- Mission#missions.all],
%         case lists:member(MissionId, MissionList) of
%             true -> true;
%             false ->
%                 NewMissionList = Mission#missions.all++[#mission{role_id=Role#role.role_id, mission_id=MissionId, state=?MISSION_OPEN}],
%                 NewMission = Mission#missions{all=NewMissionList},
%                 game_info:update(NewMission)
%                 %mission_db:create(Role#role.role_id, MissionId)
%         end,
%         NewRoleEtc = RoleEtc#role_etc{mission_id=MissionId, mission_process=?MISSION_IN},
%         game_info:update(NewRoleEtc),
%         ClientSender ! {send, #m__system__notify__s2c{code=?ENTER_MISSION}}
%     end,
%     performer(F).

% battle(#m__mission__battle__c2s{mission_id=MissionId, success=Sucess, start_time=StartTime, end_time=EndTime,
%     multi_kill=MultiKill, hp=HP, lose_hp=LoseHp, score=Score, super_kill=SuperKill, monsters=Monsters, skills=Skills,
%     is_by_hand=IsByHand, is_alone=IsAlone}, ClientSender) ->
%     F = fun() ->
%         #game_info{role_etc=RoleEtc, mission=Missions, daily=Daily} = role_api:get_user_data(),
%         if Sucess == ?BATTLE_LOSE ->
%             throw({msg, ?MISSION_BATTLE_SUCCESS, ClientSender});
%             true -> ok
%         end,
%         if Score < 0 ->
%             throw({msg, ?MISSION_PARAMS_ERROR8, ClientSender});
%             true -> ok
%         end,
%         if RoleEtc#role_etc.mission_id /= MissionId ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,
%         if RoleEtc#role_etc.mission_process /= ?MISSION_IN ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,

%         Mission = lists:keyfind(MissionId, #mission.mission_id, Missions#missions.all),
%         if Mission == false ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,

%         Cfg = mission_cfg:get(MissionId),
%         Star = ?BUILD_BATTLE_STAR(Score),
%         Awards = case Star of
%             1 -> Cfg#mission_cfg.awards_f;
%             2 -> Cfg#mission_cfg.awards_e;
%             3 -> Cfg#mission_cfg.awards_d;
%             4 -> Cfg#mission_cfg.awards_c;
%             5 -> Cfg#mission_cfg.awards_b;
%             6 -> Cfg#mission_cfg.awards_a
%         end,
%         true = role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender, quiet),

%         NewMission = Mission#mission{state=?MISSION_COMPLATED, score=Score},
%         NewMissions = Missions#missions{all=lists:keyreplace(MissionId, #mission.mission_id, Missions#missions.all, NewMission)},
%         NewDaily = mission_mod:add_mission_times(MissionId, Daily),

%         role_api:minus_power(Cfg#mission_cfg.need_power, ClientSender),

%         game_info:update(NewDaily),
%         game_info:update(RoleEtc#role_etc{mission_process=?MISSION_SUCESS}),
%         game_info:update(NewMissions),
%         %mission_db:save(NewMission),

%         warrior_api:add_exp1(Cfg#mission_cfg.warrior_exp, ClientSender),
%         %% todo title trigger
%         check_mission_active(ClientSender),
%         update_quest_challenge(MissionId, Cfg, SuperKill, MultiKill, Star, EndTime - StartTime, HP / (LoseHp + HP), IsByHand, IsAlone),

%         TaskMonster = fun(Monster) ->
%             quest_api:add_quest_process(?QUEST_EVENT_TYPE_ENEMY, Monster#p_battle_monster.monster_id, Monster#p_battle_monster.num)      % 击杀怪物任务
%         end,
%         [TaskMonster(X) || X <- Monsters],

%         TaskSkill = fun(Skill) ->
%             quest_api:add_quest_process(?QUEST_EVENT_TYPE_ENEMY, Skill#p_battle_skill.skill_id, 1)                             % 技能释放任务
%         end,
%         [TaskSkill(X) || X <- Skills],

%         role_api:check_open_function(),                                             % 检测开启功能

%         case Cfg#mission_cfg.type of
%             ?MISSION_SUPER -> living_api:mission_super(ClientSender);
%             ?MISSION_BIG_SUPER -> living_api:mission_big_super(ClientSender);
%             _ -> ok
%         end,
%         ClientSender ! {send, #m__system__notify__s2c{code=?MISSION_BATTLE_SUCCESS}}

%     end,
%     performer(F).

% open_box(#m__mission__open_box__c2s{}, ClientSender) ->
%     F = fun() ->
%         #game_info{role_etc=RoleEtc, mission=Missions} = role_api:get_user_data(),

%         if RoleEtc#role_etc.mission_id == 0 ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,
%         if RoleEtc#role_etc.mission_process /= ?MISSION_SUCESS ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,
%         Mission = lists:keyfind(RoleEtc#role_etc.mission_id, #mission.mission_id, Missions#missions.all),
%         if Mission == false ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,

%         Star = ?BUILD_BATTLE_STAR(Mission#mission.score),
%         Cfg = mission_box_cfg:get({RoleEtc#role_etc.mission_id, lists:nth(Star, ?REMARK_START)}),
%         if Cfg == false ->
%             throw({msg, ?MISSION_PARAMS_ERROR9, ClientSender});
%             true -> ok
%         end,

%         %case erlang:length(package_mod:get_empty_slots(Package)) == 0 of
%         %    true -> throw({msg, ?MISSION_PARAMS_ERROR10, ClientSender});
%         %    _ -> ok
%         %end,

%         %% 这里去掉验证，因为翻牌不发物品
%         Item = random_mission_box(Cfg#mission_box_cfg.groups),
%         role_api:get_award(Item#mission_box_item.awards, ?CURR_MODE_FUNC, ClientSender, quiet),

%         game_info:update(RoleEtc#role_etc{mission_process=?MISSION_GOT_BOX}),

%         AwardFunc = fun(Award) ->
%             [Type, Num] = string:tokens(Award, "-"),
%             #p_award{id=util:to_integer(Type), num=util:to_integer(Num)}
%         end,
%         ClientSender ! {send, #m__mission__award__s2c{awards=[AwardFunc(X) || X <- Item#mission_box_item.awards]}}
%     end,
%     performer(F).

% leave(#m__mission__leave__c2s{}, ClientSender) ->
%     F = fun() ->
%         #game_info{role_etc=RoleEtc, mission=Missions} = role_api:get_user_data(),
%         MissionId = RoleEtc#role_etc.mission_id,

%         if MissionId == 0 ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,
%         Mission = lists:keyfind(MissionId, #mission.mission_id, Missions#missions.all),
%         if Mission == false ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,

% %%         scene_api:enter(#m__scene__enter__c2s{scene_id=Role#role.scene_id}, ClientSender),

%         game_info:update(RoleEtc#role_etc{mission_id=0, mission_process=?MISSION_OUT}),
%         ClientSender ! {send, #m__system__notify__s2c{code=?LEAVE_MISSION}}
%     end,
%     performer(F).

% reset(#m__mission__reset__c2s{mission_id = MissionId}, Sender) ->
%     F = fun() ->
%             #game_info{
%                 role = Role, 
%                 role_etc = RoleEtc,
%                 daily = Daily} = role_api:get_user_data(),

%         Cfg = mission_cfg:get(MissionId),
%         if Cfg == false ->
%             throw({msg, ?MISSION_PARAMS_ERROR1, Sender});
%             true -> ok
%         end,

%         if RoleEtc#role_etc.mission_process /= ?MISSION_OUT ->
%             throw({msg, ?PARAMS_ERROR, Sender});
%             true -> ok
%         end,

%         VipCfg = viprelate_cfg:get(Role#role.vip),
%         LimitNum = case Cfg#mission_cfg.type of
%             ?MISSION_SUPER -> VipCfg#viprelate_cfg.super_mission_reset;
%             ?MISSION_BIG_SUPER -> VipCfg#viprelate_cfg.master_mission_reset;
%             ?MISSION_ACT1 -> VipCfg#viprelate_cfg.act1_mission_reset;
%             ?MISSION_ACT2 -> VipCfg#viprelate_cfg.act2_mission_reset;
%             ?MISSION_ACT3 -> VipCfg#viprelate_cfg.act3_mission_reset;
%             ?MISSION_ACT4 -> VipCfg#viprelate_cfg.act4_mission_reset;
%             _ -> throw({msg, ?PARAMS_ERROR, Sender})
%         end,

%         MissionDaily = lists:keyfind(MissionId, 1, Daily#daily.mission),
%         ResetNum = 
%         case MissionDaily of
%             {_, _, RNum} ->
%                 if  RNum >= LimitNum -> throw({msg, ?PARAMS_ERROR, Sender});
%                     true -> RNum
%                 end;
%             false -> 0
%         end,

%         ResetCfg = mission_reset_cfg:get({Cfg#mission_cfg.type, ResetNum + 1}),

%         case role_api:is_enough_coin(ResetCfg#mission_reset_cfg.cost) of
%             false -> throw({msg, ?PARAMS_ERROR, Sender});
%             true -> ok
%         end,

%         role_api:pay_coin(ResetCfg#mission_reset_cfg.cost, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),

%         NewDaily = mission_mod:reset_mission_times(MissionId, Daily),
%         game_info:update(NewDaily),

%         notify(?MISSION_RESET_SUCC, Sender)
%     end,
%     performer(F).

% notown_info(#m__mission__notown_info__c2s{}, ClientSender) ->
%     GameInfo = role_api:get_user_data(),
%     Info = mission_mod:build_notown_miss_info(GameInfo#game_info.mission, GameInfo#game_info.daily),
%     ClientSender ! {send, Info}.
% %%%============================================================================
% %%% Process API
% %%%============================================================================

% open_function(_FuncId) ->
%     ok.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% update_quest_challenge(MissionId, Cfg, SuperKill, MultiKill, Star, UseTime, LeftHpRate, IsByHand, IsAlone) ->
%     quest_api:add_quest_process(?QUEST_EVENT_TYPE_MISSION, MissionId, 1),              % 副本任务按id算
%     quest_api:add_quest_process(?QUEST_EVENT_TYPE_ALL_MISSION, Cfg#mission_cfg.type, 1),              % 副本任务按类型算
%     quest_api:add_quest_process(?QUEST_EVENT_TYPE_SUPER_KILL, 0, SuperKill),              % 五星大绝杀
%     quest_api:add_quest_process(?QUEST_EVENT_TYPE_MULTI_KILL, 0, MultiKill),                             % 连击数任务

%     challenge_api:update_task_process(?CHALLENGE_TYPE_MISSION_LIFE, LeftHpRate * 100, 0),    % 生命值挑战任务
%     challenge_api:update_task_process(?CHALLENGE_TYPE_MISSION_TIME, 60 / UseTime * 60, 0),                  % 通关时间挑战任务
%     challenge_api:update_task_process(?CHALLENGE_TYPE_MISSION_SCORE, Star, 0),               % 通关评分挑战任务
%     if Star =:= 6 ->
%         challenge_api:update_task_process(?CHALLENGE_TYPE_MISSION_SCORE_SSS, MissionId, Star);                 % 通关评分sss挑战任务
%         true -> ok
%     end,
%     if IsByHand =:= 1 ->
%         quest_api:add_quest_process(?CHALLENGE_TYPE_MISSION_WAY, 0, 1);                             % 手动通关挑战任务
%         true -> ok
%     end,
%     if IsAlone =:= 1 ->
%         quest_api:add_quest_process(?CHALLENGE_TYPE_MISSION_ALONE, 0, 1);                             % 独自通关挑战任务
%         true -> ok
%     end.
    
% random_mission_box(ItemList) ->
%     ChanceSum = lists:sum([Item#mission_box_item.chance || Item <- ItemList]),
%     RandNum = rand_srv:random(ChanceSum),
%     [First|_] = ItemList,
%     Target = select_item(RandNum, First#mission_box_item.chance, ItemList),
%     ?INFO_MSG("=============ChanceSum:~p,RandNum:~p,Target:~p",[ChanceSum, RandNum, Target]),
%     Target.

% select_item(RandNum, Sum, []) -> 
%     ?INFO_MSG("=============False:~p > ~p",[RandNum, Sum]);
% select_item(RandNum, Sum, [Item|ItemList]) ->
%     case RandNum =< Sum of
%         true -> Item;
%         false -> select_item(RandNum, Sum+Item#mission_box_item.chance, ItemList)
%     end.

% act_mission_limit_check(Id) -> 
%     case mission_cfg:get(Id) of 
%         false -> false;
%         #mission_cfg{open_week_day=[WeekDays]} when WeekDays == [] -> true;
%         #mission_cfg{open_week_day=WeekDays, start_time=Start, end_time=End} ->
%             {Date, Time} = calendar:local_time(),
%             case lists:member(calendar:day_of_the_week(Date), WeekDays) of
%                 false -> false;
%                 true when Start == "" andalso End == "" -> true;
%                 true -> check_is_expired(Start, End, Time)
%             end
%     end.

% check_is_expired(Start, End, {NH, NM, _}) -> 
%     [SH, SM] = [util:to_integer(X) || X <- string:tokens(Start, ":")],
%     [EH, EM] = [util:to_integer(X) || X <- string:tokens(End, ":")],
%     (SH*100 + SM =< NH*100 + NM) andalso (NH*100 + NM < EH*100 + EM).

% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw(ignore) ->
%     ok;
% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

% check_mission_active(Sender) ->
%     TitleIds = title_cfg:get_all(),
%     MissionTitleIds = lists:map(fun(Id) -> Cfg = title_cfg:get(Id), if Cfg#title_cfg.type =:= 3 -> Id; true -> ok end end, TitleIds),
%     Ids = [X|| X <- MissionTitleIds, X =/= ok],
%     lists:map(
%         fun(Id) -> 
%             TitleCfg = title_cfg:get(Id),
%             CheckScript = TitleCfg#title_cfg.check_script,
%             case CheckScript() of
%                 false -> title_api:add(Id,Sender);
%                 true -> ok
%             end
%         end,
%     Ids).