%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 1014-10-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(contest_api).

% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([
%     info/2,
%     fight/2,
%     finish/2,
%     award/2,
%     award2/2
% ]).

% -export([handle_throw/1]).

% -define(CONTEST_ENEMY_STATE_FREE, 0).
% -define(CONTEST_ENEMY_STATE_IN_BATTLE, 1).
% -define(CONTEST_ENEMY_STATE_WIN, 2).
% -define(CONTEST_ENEMY_STATE_LOST, 3).

% -define(CONTEST_MAX_FIGHT_TIMES, 10).

% -define(CONTEST_AWARD_TYPE_HONOR, 1).
% -define(CONTEST_AWARD_TYPE_FIGHT, 2).
% -define(CONTEST_MAX_FIGHT_TIME, 180). % 前端战斗时间为2min   后端暂定3min
% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__contest__info__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, contest = Contest} = role_api:get_user_data(),
%         {Enemys, FightTimes, GiftState, LastReset} = 
%             case Contest#contest.last_reset + 2*3600 > ?NOW of
%                 true -> {Contest#contest.enemy, Contest#contest.fight_times, Contest#contest.gift_state, Contest#contest.last_reset};
%                 false -> 
%                     NewEnemys = refresh_new_enemys(Role#role.level, Role#role.role_id),
%                     game_info:update(Contest#contest{enemy = NewEnemys, fight_times = 0, gift_state = 0, last_reset = ?NOW}),
%                     {NewEnemys, 0, 0, ?NOW}
%             end,

%         Data = #m__contest__info__s2c{
%             enemys = Enemys,
%             fight_times = FightTimes,
%             honor_point = Contest#contest.honor_point,
%             fight_point = Contest#contest.fight_point,
%             gift_state = GiftState,
%             last_reset = LastReset,
%             honor_gtimes = Contest#contest.honor_gtimes,
%             fight_gtimes = Contest#contest.fight_gtimes
%         },
%         Sender ! {send, Data}
%     end,
%     ?PERFORM(F).

% fight(#m__contest__fight__c2s{role_id = RoleId}, Sender) -> 
%     F = fun() ->
%         #game_info{contest = Contest} = role_api:get_user_data(),
%         if Contest#contest.fight_times >= ?CONTEST_MAX_FIGHT_TIMES ->
%             throw({msg, ?CONTEST_FIGHT_TIMES_DONE, Sender});
%             true -> ok
%         end,

%         Enemys = Contest#contest.enemy,
%         case lists:keyfind(RoleId, #p_contest_enemy.role_id, Enemys) of
%             false -> throw({msg, ?CONTEST_ENEMY_NOT_EXIST, Sender});
%             #p_contest_enemy{state = State} when State =:= ?CONTEST_ENEMY_STATE_WIN ->
%                 throw({msg, ?CONTEST_ENEMY_HAS_BATTLED, Sender});
%             #p_contest_enemy{} = Enemy ->
%                 % 判断对手的状态是否在战斗中，如果在，则判断玩家最长战斗时间，超了也是可以重新挑战的
%                 case Enemy#p_contest_enemy.state =:= ?CONTEST_ENEMY_STATE_IN_BATTLE 
%                     andalso Contest#contest.last_fight + ?CONTEST_MAX_FIGHT_TIME > ?NOW of
%                     true -> throw({msg, ?CONTEST_ENEMY_HAS_BATTLED, Sender});
%                     false -> ok
%                 end,
%                 NewEnemys = lists:keyreplace(RoleId, #p_contest_enemy.role_id, Enemys, Enemy#p_contest_enemy{state = ?CONTEST_ENEMY_STATE_IN_BATTLE}),
%                 game_info:update(Contest#contest{enemy = NewEnemys, last_fight = ?NOW}),
%                 Sender ! {send, #m__system__notify__s2c{code = ?CONTEST_START_BATTLE_SUCCESS}}
%         end
%     end,
%     ?PERFORM(F).

% finish(#m__contest__finish__c2s{role_id = RoleId, success = Success}, Sender) -> 
%     F = fun() ->
%         #game_info{contest = Contest} = role_api:get_user_data(),
%         Enemys = Contest#contest.enemy,
%         case lists:keyfind(RoleId, #p_contest_enemy.role_id, Enemys) of
%             false -> throw({msg, ?CONTEST_ENEMY_NOT_EXIST, Sender});
%             #p_contest_enemy{state = State} when State =/= ?CONTEST_ENEMY_STATE_IN_BATTLE -> 
%                 throw({msg, ?CONTEST_ENEMY_NOT_IN_BATTLED, Sender});
%             #p_contest_enemy{} = Enemy ->
%                 NewState =
%                     case Success of 
%                         ?NO -> ?CONTEST_ENEMY_STATE_LOST;
%                         ?YES -> ?CONTEST_ENEMY_STATE_WIN;
%                         _ -> throw({msg, ?PARAMS_ERROR, Sender})
%                     end,
%                 NewEnemys = lists:keyreplace(RoleId, #p_contest_enemy.role_id, Enemys, Enemy#p_contest_enemy{state = NewState}),
%                 game_info:update(Contest#contest{enemy = NewEnemys, fight_times = Contest#contest.fight_times + 1, last_fight = 0}),
%                 Sender ! {send, #m__system__notify__s2c{code = ?CONTEST_FINISH_BATTLE_SUCCESS}}
%         end
%     end,
%     ?PERFORM(F).

% award(#m__contest__award__c2s{gift_id = GiftId}, Sender) -> 
%     F = fun() ->
%         #game_info{contest = Contest} = role_api:get_user_data(),
%         GiftState = Contest#contest.gift_state,
%         case util:bit_test(GiftState, GiftId) of 
%             ?YES -> throw({msg, ?CONTEST_GIFT_HAS_RECEIVED, Sender});
%             ?NO -> ok
%         end,
%         Enemys = Contest#contest.enemy,
%         WinTimes = lists:foldl(fun(X, Sum) -> if X#p_contest_enemy.state =:= ?CONTEST_ENEMY_STATE_WIN -> Sum + 1;true -> Sum end end, 0, Enemys),
%         Cfg = contest_win_gift_cfg:get(GiftId),
%         case Cfg of
%             false -> throw({msg, ?CONTEST_CFG_ERROR, Sender});
%             _ -> ok
%         end,

%         if WinTimes < Cfg#contest_win_gift_cfg.win_times ->
%             throw({msg, ?CONTEST_GIFT_CONDITION_NOT_ENOUGH, Sender});
%             true -> ok
%         end,
%         role_api:get_award(Cfg#contest_win_gift_cfg.items, ?CURR_MODE_FUNC, Sender),

%         NewGiftState = util:bit_set(GiftState, GiftId),
%         NewHonor = Contest#contest.honor_point + Cfg#contest_win_gift_cfg.honor_point,
%         NewFight = Contest#contest.fight_point + Cfg#contest_win_gift_cfg.fight_point,

%         game_info:update(Contest#contest{gift_state = NewGiftState, honor_point = NewHonor, fight_point = NewFight}),
%         Sender ! {send, #m__system__notify__s2c{code = ?CONTEST_RECEIVE_GIFT_SUCCESS}}
%     end,
%     ?PERFORM(F).

% award2(#m__contest__award2__c2s{gift_type = GiftType}, Sender) -> 
%     F = fun() ->
%         #game_info{contest = Contest} = role_api:get_user_data(),
%         #contest{honor_gtimes=Htimes, fight_gtimes=Ftimes} = Contest,
%         {OwnPoint, Gtimes} = 
%             case GiftType of
%                 ?CONTEST_AWARD_TYPE_HONOR ->
%                     {Contest#contest.honor_point, Htimes};
%                 ?CONTEST_AWARD_TYPE_FIGHT ->
%                     {Contest#contest.fight_point, Ftimes}
%             end,
%         FixGtimes = 
%             case Gtimes of
%                 0 -> 1;
%                 _ -> 2
%             end,
%         Cfg = contest_award_cfg:get({GiftType, FixGtimes}),
%         case Cfg of
%             false -> throw({msg, ?CONTEST_CFG_ERROR, Sender});
%             _ -> ok
%         end,
%         #contest_award_cfg{items=Awards, consume_point=Consume} = Cfg,
%         if OwnPoint < Consume ->
%             throw({msg, ?CONTEST_POINT_NOT_ENOUGH, Sender});
%             true -> ok
%         end,

%         role_api:get_award(Awards, ?CURR_MODE_FUNC, Sender),

%         NewContest = 
%             case GiftType of
%                 ?CONTEST_AWARD_TYPE_HONOR ->
%                     Contest#contest{honor_point=OwnPoint-Consume, honor_gtimes=Htimes+1};
%                 ?CONTEST_AWARD_TYPE_FIGHT ->
%                     Contest#contest{fight_point=OwnPoint-Consume, fight_gtimes=Ftimes+1}
%             end,

%         game_info:update(NewContest),
%         Sender ! {send, #m__system__notify__s2c{code = ?CONTEST_RECEIVE_GIFT_SUCCESS}}
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal Functions
% %%%===================================================================
% refresh_new_enemys(Level, RoleId) -> 
%     Cfg = contest_robot_cfg:get(Level),
%     Roles = lists:keydelete(util:to_list(RoleId), #p_contest_enemy.role_id, contest_db:get_enemy_roles(Level)),
%     RolesNum = length(Roles),
%     EnemyIdxs = rand_srv:random_list(9, lists:seq(1, RolesNum) ++ lists:seq(RolesNum+1, RolesNum+Cfg#contest_robot_cfg.robot_num)),
%     Roles1 = [lists:nth(X, Roles) || X <- EnemyIdxs, X =< RolesNum],              % 真实玩家
%     Robots = build_robots_enemys(Level, EnemyIdxs, RolesNum),
%     Roles1 ++ Robots.

% build_robots_enemys(Level, EnemyIdxs, RolesNum) ->
%     F = fun(Idx) -> 
%             {Job, _} = rand_srv:random_list(arena_virtual_role_cfg:get_all()),
%             #p_contest_enemy{
%                 role_id = "robot_" ++ util:to_list(Idx),
%                 role_name = arena_mod:random_role_name(),
%                 job = Job,
%                 level = rand_srv:random_list(lists:seq(erlang:max(1, Level - 2), erlang:min(Level+2, 100))),
%                 fight = 0,
%                 armor = 0,
%                 weapon = 0,
%                 type = ?ARENA_COMPUTER,
%                 state = 0
%             }
%         end,
%     [F(X) || X <- EnemyIdxs, X > RolesNum].

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.

    
