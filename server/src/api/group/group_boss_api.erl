%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 帮会神树活动
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_boss_api).

% -include("cfg_record.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("common.hrl").

% -export([info/2, start/2, join/2, leave/2, battle/2, awake/2]).
% -export([tick/3, scene_name/1, afterwards/2]).

% %%%===================================================================
% %%% Client API
% %%%===================================================================

% info(#m__group_boss__info__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, role=Role} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == <<"0">> ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断是否开启

%         case lists:member(Boss#group_boss.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false ->
%                 build_group_boss_info(Boss, Sender),
%                 throw(return);
%             true -> ok
%         end,
%         case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         BossInfo = boss_srv:get_info(group, GroupId),
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

% start(#m__group_boss__start__c2s{boss_id=BossId, boss_level=BossLevel}, Sender) ->
%     F = fun() ->
%         #game_info{group_etc=GroupEtc, group_member=GroupMember} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,
%         group_api:post_check(GroupEtc#group_state.post, #group_post_cfg.start_boss, Sender),

%         Cfg = boss_cfg:get({BossId, BossLevel}),
%         if Cfg == false ->
%             throw({msg, ?BOSS_ID_FAIL, Sender});
%             true -> ok
%         end,
%         case lists:member(BossId, group_boss_cfg:get_all()) of                       %% boss_id 不对
%             false -> throw({msg, ?BOSS_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断今日是否干过了

%         if Boss#group_boss.state == ?BOSS_END -> 
%                 %throw({msg, ?BOSS_ALREADY_END, Sender});
%                 ok;
%             true -> ok
%         end,

%         MaxLevel = case lists:keyfind(BossId, 1, Boss#group_boss.info) of
%             false -> (group_boss_cfg:get(BossId))#group_boss_cfg.init_level;
%             {_, Level} -> Level
%         end,

%         if BossLevel > MaxLevel ->
%             throw({msg, ?BOSS_ID_FAIL, Sender});
%             true -> ok
%         end,

%         NewBoss = case lists:keyfind(BossId, 1, Boss#group_boss.info) of
%             false -> 
%                 Boss#group_boss{
%                     start_time=util:unixtime(), 
%                     state=?BOSS_WAIT_START, 
%                     info = Boss#group_boss.info++[{BossId, BossLevel}]
%                 };
%             _ -> 
%                 Boss#group_boss{
%                     start_time=util:unixtime(), 
%                     state=?BOSS_WAIT_START
%                 }
%         end,

%         group_master_srv:act_update(GroupId, #group_act_ets.boss, NewBoss),
%         boss_srv:start(group, GroupMember#group_member.group_id, BossId, BossLevel),
        
%         group_srv:srv_broadcast(GroupId, #m__system__notify__s2c{code = ?GROUP_BOSS_OPENED}),  % 通知帮众
%         Sender ! {send, #m__system__notify__s2c{code=?BOSS_START_SUCESS}}

%     end,
%     performer(F).

% join(#m__group_boss__join__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, role=Role} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断是否开启

%         case lists:member(Boss#group_boss.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             true -> ok
%         end,
%         case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         boss_srv:join(group, GroupId, Role#role.role_id, Role#role.role_name),
%         %% 更新挑战成就任务 帮会瑶池活动进入X次
%         challenge_api:update_task_process(?CHALLENGE_TYPE_GROUP_BOSS_NUM, 0, 1),
%         Sender ! {send, #m__system__notify__s2c{code=?BOSS_JOIN_SUCESS}}

%     end,
%     performer(F).

% leave(#m__group_boss__leave__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, role=Role} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断是否开启
%         case lists:member(Boss#group_boss.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             true -> ok
%         end,
%         case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         boss_srv:leave(group, GroupId, Role#role.role_id),
%         Sender ! {send, #m__system__notify__s2c{code=?BOSS_LEAVE_SUCESS}}

%     end,
%     performer(F).

% battle(#m__group_boss__battle__c2s{my_hp=MyHp, boss_lose_hp=BossLoseHp}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, role=Role} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断是否开启
%         case lists:member(Boss#group_boss.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             true -> ok
%         end,
%         case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         BossInfo = boss_srv:get_info(group, GroupId),
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

%         boss_srv:battle(group, GroupId, Role#role.role_id, MyHp, BossLoseHp)

%     end,
%     performer(F).

% awake(#m__group_boss__awake__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, role=Role} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 ->
%             throw({msg, ?GROUP_ID_FAIL, Sender});
%             true -> ok
%         end,

%         #group_act_ets{boss=Boss} = group_master_srv:act_info(GroupId),              %% 判断是否开启
%         case lists:member(Boss#group_boss.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             true -> ok
%         end,
%         case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of            %% 判断进程是否存活
%             false -> throw({msg, ?BOSS_NOT_OPEN, Sender});
%             _ -> ok
%         end,

%         BossInfo = boss_srv:get_info(group, GroupId),
%         case lists:keyfind(Role#role.role_id, #boss_member.role_id, BossInfo#boss_info.members) of
%             false -> throw({msg, ?BOSS_NOT_IN, Sender});
%             Member ->
%                 case Member#boss_member.state == ?BOSS_ME_IN of
%                     false -> throw({msg, ?BOSS_NOT_IN, Sender});
%                     true -> ok
%                 end,
%                 case Member#boss_member.life == ?BOSS_ME_DEAD of
%                     false -> throw({msg, ?BOSS_YOU_ARE_DEAD, Sender});
%                     true -> ok
%                 end
%         end,


%         case role_api:is_enough_coin(?BOSS_AWARK_COST_COIN) of
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,

%         role_api:pay_coin(?BOSS_AWARK_COST_COIN, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),

%         boss_srv:awake(group, GroupId, Role#role.role_id)

%     end,
%     performer(F).
% %%%===================================================================
% %%% Process API
% %%%===================================================================
% tick(Act, #groups{id=GroupId}=_Info, Now) ->
%     #group_act_ets{boss=Boss} = Act,
%     C1 = Boss#group_boss.state == ?BOSS_CLOSE,
%     C2 = Now - Boss#group_boss.last_tick_time < 1,

%     case C1 orelse C2 of
%         true -> {false, Act};
%         false ->
%             Boss1 =
%                 case goddess_misc:get_pid_by_name(group_mod:boss_name(GroupId)) of
%                     false ->
%                         {StartDay, _} = util:timestamp_to_datetime(Boss#group_boss.start_time),
%                         {NowDay, _} = erlang:localtime(),
%                         {DT, _} = calendar:time_difference({StartDay, {0, 0, 0}}, {NowDay, {0, 0, 0}}),
%                         Boss#group_boss{state=(if DT /=0 -> ?BOSS_CLOSE; true->Boss#group_boss.state end), last_tick_time=Now};
%                     _ ->
%                         Boss#group_boss{last_tick_time=Now}
%                 end,

%             Boss2 =
%                 case Now - Boss1#group_boss.last_save_time > 5*60 of
%                     true ->
%                         group_boss_db:save(Boss),
%                         Boss1#group_boss{last_save_time=Now};
%                     false ->
%                         Boss1
%                 end,
%             {true, Act#group_act_ets{boss=Boss2}}
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% scene_name(_) ->
%     #game_info{group_member=GroupMember} = role_api:get_user_data(),
%     GroupId = GroupMember#group_member.group_id,
%     BossInfo = boss_srv:get_info(group, GroupId),
%     BossId = BossInfo#boss_info.boss_id,
%     Master = BossInfo#boss_info.master,
%     util:to_atom(util:to_list(Master)++util:to_list(BossId)).


% afterwards(GroupBoss, BossInfo) ->
%     F = fun() ->
%         BossId = BossInfo#boss_info.boss_id,
%         BossLevel = BossInfo#boss_info.boss_level,
%         Cfg = boss_cfg:get({BossId, BossLevel}),

%         NewGroupBoss = GroupBoss#group_boss{state=?BOSS_END},
%         group_master_srv:act_update(NewGroupBoss#group_boss.group_id, #group_act_ets.boss, NewGroupBoss),

%         if
%             BossInfo#boss_info.boss_hurt < Cfg#boss_cfg.max_hp -> throw(return);
%             true -> ok
%         end,

%         send_group_boss_award(BossInfo),
%         NextCfg = boss_cfg:get({BossId, BossLevel+1}),
%         if
%             NextCfg == false -> throw(return);
%             true -> ok
%         end,
%         NewGroupBoss2 = case lists:keyfind(BossId, 1, NewGroupBoss#group_boss.info) of
%             false -> NewGroupBoss#group_boss{info=NewGroupBoss#group_boss.info++[{BossId, BossLevel+1}]};
%             _ -> NewGroupBoss#group_boss{info=lists:keyreplace(BossId, 1, NewGroupBoss#group_boss.info, {BossId, BossLevel+1})}
%         end,

%         group_master_srv:act_update(NewGroupBoss#group_boss.group_id, #group_act_ets.boss, NewGroupBoss2)
%     end,
%     performer(F).

% build_group_boss_info(Boss, Sender) ->
%     Info = [#p_group_boss_info{boss_id=BossId, max_level=Level} || {BossId, Level} <- Boss#group_boss.info],
%     Data = #m__group_boss__info__s2c{state=Boss#group_boss.state, info=Info},
%     Sender ! {send, Data}.

% send_group_boss_award(BossInfo) ->
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
%     SelectRank = lists:min([Id || {_, Id} <- lists:filter(fun({X, _}) -> X == BossId end, group_boss_award_cfg:get_all()), Id >= Rank]),
%     send_one_award(SelectRank, Member#boss_member.role_id, BossId, BossHP, Member#boss_member.hurt),
%     send_boss_award(BossId, BossHP, Rank+1, Members).

% send_one_award(Rank, RoleId, BossId, BossHP, Hurt) ->
%     F = fun(List) ->
%         [Key, Value] = string:tokens(util:to_list(List), "-"),
%         {util:to_integer(Key), util:to_integer(Value)}
%     end,
%     Cfg = group_boss_award_cfg:get({BossId, Rank}),
%     Coefficient = Hurt / BossHP,
%     BaseAward = [F(Item) || Item <- Cfg#group_boss_award_cfg.base_award, util:to_list(Item) /= []],
%     BaseValue = [F(Item) || Item <- Cfg#group_boss_award_cfg.base_value, util:to_list(Item) /= []],
%     MaxLimit = [F(Item) || Item <- Cfg#group_boss_award_cfg.max_limit, util:to_list(Item) /= []],

%     _Award = build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, BaseAward, Cfg#group_boss_award_cfg.special_type),
%     ReallyAward = [util:to_list(Key)++"-"++util:to_list(Value) || {Key, Value} <- _Award],

%     mail_srv:send_mail([RoleId], "system_award_group_boss", "system_award_group_boss", ?MAILING_TYPE_AWARD, string:join(ReallyAward, ",")).

% build_final_award(_, _, _, _, Award, []) -> Award;
% build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, [Type|Types]) ->
%     case lists:keyfind(Type, 1, BaseAward) of
%         false -> build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, Types);          % 在基础奖励列表中没这个值
%         {_, Num} ->
%             case lists:keyfind(Type, 1, BaseValue) of                                         % 及处理表中有的花看看基数有没有
%                 false -> build_final_award(Coefficient, BaseAward, BaseValue, MaxLimit, Award, Types);
%                 {_, BaseNum} ->                                                               % 都有的话计算算新的数量
%                     MaxValue = case lists:keyfind(Type, 1, MaxLimit) of
%                         false -> util:to_integer(Coefficient * BaseNum * Num);                   % 如果没有上限的话正常
%                         {_, Limit} -> erlang:min(util:to_integer(Coefficient * BaseNum * Num), Limit)        % 如果有上限的话，你看看
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
