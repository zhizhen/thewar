%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 帮会神树活动
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(world_boss_api).

% -include("cfg_record.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("common.hrl").

% -export([info/2, join/2, leave/2, battle/2, awake/2]).
% -export([scene_name/1, afterwards/1, world_boss_process_name/1, build_final_award/6]).

% %%%===================================================================
% %%% Client API
% %%%===================================================================
% info(#m__world_boss__info__c2s{boss_id=BossId}, Sender) ->
%     F = fun() ->
%         case goddess_misc:get_pid_by_name(world_boss_api:world_boss_process_name(BossId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         #game_info{role = Role} = role_api:get_user_data(),

%         BossInfo = boss_srv:get_info(world, BossId),
%         MyInfo = case lists:keyfind(Role#role.role_id, #boss_member.role_id, BossInfo#boss_info.members) of
%             false -> #boss_member{};
%             _Info -> _Info
%         end,

%         Info = #m__boss__info__s2c{
%             start_time = BossInfo#boss_info.start_time,
%             boss_id = BossInfo#boss_info.boss_id,
%             boss_hurt = BossInfo#boss_info.boss_hurt,
%             boss_level = BossInfo#boss_info.boss_level,
%             hurt_by_me = MyInfo#boss_member.hurt,
%             life = MyInfo#boss_member.life,
%             dead_time = MyInfo#boss_member.dead_time,
%             hp = MyInfo#boss_member.hp,
%             rank = boss_mod:build_boss_rank(BossInfo#boss_info.members)
%         },
%         Sender ! {send, Info}
%     end,
%     performer(F).

% join(#m__world_boss__join__c2s{boss_id=BossId}, Sender) ->
%     F = fun() ->
%         AllWorldBossIds = world_boss_cfg:get_all(),
%         case lists:member(BossId, AllWorldBossIds) of
%             false -> throw({msg, ?PARAMS_ERROR, Sender});
%             true -> ok
%         end,

%         case goddess_misc:get_pid_by_name(world_boss_api:world_boss_process_name(BossId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         #game_info{role = Role, role_etc = RoleEtc} = role_api:get_user_data(),
%         game_info:update(RoleEtc#role_etc{boss_id=BossId}),

%         boss_srv:join(world, BossId, Role#role.role_id, Role#role.role_name),
%         living_api:worldboss_join(Sender),

%         %% 更新挑战成就任务 与世界BOSS战斗X次
%         challenge_api:update_task_process(?CHALLENGE_TYPE_WORLD_BOSS_NUM, 0, 1), 
        
%         Sender ! {send, #m__system__notify__s2c{code=?BOSS_JOIN_SUCESS}}

%     end,
%     performer(F).

% leave(#m__world_boss__leave__c2s{boss_id = BossId}, Sender) ->
%     F = fun() ->
%         case goddess_misc:get_pid_by_name(world_boss_api:world_boss_process_name(BossId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         #game_info{role=Role, role_etc=RoleEtc} = role_api:get_user_data(),

%         boss_srv:leave(world, BossId, Role#role.role_id),
%         game_info:update(RoleEtc#role_etc{boss_id = 0}),
%         Sender ! {send, #m__system__notify__s2c{code=?BOSS_LEAVE_SUCESS}}

%     end,
%     performer(F).

% battle(#m__world_boss__battle__c2s{boss_id=BossId, my_hp=MyHp, boss_lose_hp=BossLoseHp}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role} = role_api:get_user_data(),

%         case goddess_misc:get_pid_by_name(world_boss_api:world_boss_process_name(BossId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         BossInfo = boss_srv:get_info(world, BossId),
%         case lists:keyfind(Role#role.role_id, #boss_member.role_id, BossInfo#boss_info.members) of
%             false -> throw({msg, ?BOSS_NOT_IN, Sender});
%             Member ->
%                 case Member#boss_member.state == ?BOSS_ME_IN of
%                     false -> throw({msg, ?BOSS_NOT_IN, Sender});
%                     true -> ok
%                 end,
%                 case Member#boss_member.life == ?BOSS_ME_DEAD of
%                     true -> throw({msg, ?BOSS_YOU_ARE_DEAD, Sender});
%                     false -> ok
%                 end
%         end,

%         boss_srv:battle(world, BossId, Role#role.role_id, MyHp, BossLoseHp)

%     end,
%     performer(F).

% awake(#m__world_boss__awake__c2s{boss_id=BossId}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role} = role_api:get_user_data(),
%         case role_api:is_enough_coin(?BOSS_AWARK_COST_COIN) of
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,

%         case goddess_misc:get_pid_by_name(world_boss_api:world_boss_process_name(BossId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         BossInfo = boss_srv:get_info(world, BossId),
%         case lists:keyfind(Role#role.role_id, #boss_member.role_id, BossInfo#boss_info.members) of
%             false -> throw({msg, ?BOSS_NOT_IN, Sender});
%             Member ->
%                 case Member#boss_member.state == ?BOSS_ME_IN of
%                     false -> throw({msg, ?BOSS_NOT_IN, Sender});
%                     true -> ok
%                 end,
%                 case Member#boss_member.life /= ?BOSS_ME_DEAD of
%                     true -> throw({msg, ?BOSS_YOU_ARE_NOT_DEAD, Sender});
%                     false -> ok
%                 end
%         end,

%         role_api:pay_coin(?BOSS_AWARK_COST_COIN, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),

%         boss_srv:awake(world, BossId, Role#role.role_id)

%     end,
%     performer(F).

% %%%===================================================================
% %%% Process API
% %%%===================================================================


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% world_boss_process_name(BossId) ->
%     erlang:list_to_atom("world_boss_name_" ++ util:to_list(BossId)).

% scene_name(_) ->
%     #game_info{role_etc = RoleEtc} = role_api:get_user_data(),
%     util:to_atom(util:to_list(world_boss_srv)++util:to_list(RoleEtc#role_etc.boss_id)).

% afterwards(BossInfo) ->
%     F = fun() ->
%         BossId = BossInfo#boss_info.boss_id,
%         _BossLevel = BossInfo#boss_info.boss_level,
% %%         Cfg = boss_cfg:get({BossId, BossLevel}),

%         world_boss_srv:change_state(BossId, ?WORLD_BOSS_STATE_READY),

% %%         if
% %%             BossInfo#boss_info.boss_hurt < Cfg#boss_cfg.max_hp -> throw(return);        % 没有打死
% %%             true -> ok
% %%         end,

%         % todo 升级逻辑

%         send_world_boss_award(BossInfo)

%     end,
%     performer(F).

% send_world_boss_award(BossInfo) ->
%     BossId = BossInfo#boss_info.boss_id,
%     BossLevel = BossInfo#boss_info.boss_level,
%     BossCfg = boss_cfg:get({BossId, BossLevel}),
%     BossHP = BossCfg#boss_cfg.max_hp,

%     KillRoleId = BossInfo#boss_info.kill_role_id,
%     case lists:member(util:to_list(KillRoleId), ["", []]) of
%         true -> ok;
%         false -> send_one_award(0, KillRoleId, BossId, BossHP, BossHP)
%     end,

%     SortFun = fun(#boss_member{hurt=X}, #boss_member{hurt=Y}) -> if X > Y -> true; true -> false end end,
%     Members = lists:sort(SortFun, BossInfo#boss_info.members),
%     send_boss_award(BossId, BossHP, 1, Members).

% send_boss_award(_, _, _, []) -> ok;
% send_boss_award(BossId, BossHP, Rank, [Member|Members]) ->
%     SelectRank = lists:min([Id || {_, Id} <- lists:filter(fun({X, _}) -> X == BossId end, world_boss_award_cfg:get_all()), Id >= Rank]),
%     send_one_award(SelectRank, Member#boss_member.role_id, BossId, BossHP, Member#boss_member.hurt),
%     send_boss_award(BossId, BossHP, Rank+1, Members).

% send_one_award(Rank, RoleId, BossId, BossHP, Hurt) ->
%     F = fun(List) ->
%         [Key, Value] = string:tokens(util:to_list(List), "-"),
%         {util:to_integer(Key), util:to_integer(Value)}
%     end,
%     Cfg = world_boss_award_cfg:get({BossId, Rank}),
%     Coefficient = Hurt / BossHP,
%     BaseAward = [F(Item) || Item <- Cfg#world_boss_award_cfg.base_award, util:to_list(Item) /= []],
%     BaseValue = [F(Item) || Item <- Cfg#world_boss_award_cfg.base_value, util:to_list(Item) /= []],
%     MaxLimit = [F(Item) || Item <- Cfg#world_boss_award_cfg.max_limit, util:to_list(Item) /= []],

%     _Award = build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, BaseAward, Cfg#world_boss_award_cfg.special_type),
%     ReallyAward = [util:to_list(Key)++"-"++util:to_list(Value) || {Key, Value} <- _Award],

%     mail_srv:send_mail([RoleId], "system_award_world_boss", "system_award_world_boss", ?MAILING_TYPE_AWARD, string:join(ReallyAward, ",")).

% build_final_award(_, _, _, _, Award, []) -> Award;
% build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, [Type|Types]) ->
%     case lists:keyfind(Type, 1, BaseAward) of
%         false -> build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, Types);          % 在基础奖励列表中没这个值
%         {_, Num} ->
%             case lists:keyfind(Type, 1, BaseValue) of                                         % 及处理表中有的花看看基数有没有
%                 false -> build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, Types);
%                 {_, BaseNum} ->                                                               % 都有的话计算算新的数量
%                     MaxValue = case lists:keyfind(Type, 1, MaxLimit) of
%                         false -> util:to_integer(Coefficient * BaseNum + Num);                   % 如果没有上限的话正常
%                         {_, Limit} -> erlang:min(util:to_integer(Coefficient * BaseNum + Num), Limit)        % 如果有上限的话，你看看
%                     end,

%                     NewItem = {Type, MaxValue},
%                     NewAward = lists:keyreplace(Type, 1, Award, NewItem),
%                     build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, NewAward, Types)
%             end
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
% handle_throw({return, State}) ->
%     State;
% handle_throw(return) ->
%     return;
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
