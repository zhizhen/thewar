%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%% 天财地宝
%%% @end
%%% Created : 2014-6-20 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(treasure_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([info/2, explore/2, loot/2, loot_result/2, guard/2, guard_change/2, 
%         guard_retreat/2, ask_help/2, help_guard/2, log/2]).
% -export([owner_award/2]).
% -export([handle_throw/1, open_function/1]).
% -define(PERCENT,    70).
% -define(DISAPPREAR_TIME, 10 * 60).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 获取系统信息
% info(#m__treasure__info__c2s{}, Sender) ->
%     #game_info{role = Role, daily = Daily} = role_api:get_user_data(),
%     Count = Daily#daily.treasure_explore,
%     Now = util:unixtime(),
%     Treasure = 
%     if  Role#role.treasure =:= undefined -> false; 
%         Now - Role#role.treasure#treasure.explore_time >= ?DISAPPREAR_TIME -> false;
%         true -> Role#role.treasure 
%     end,
%     Treasures = treasure_srv:get_treasures(Role#role.role_id),
%     Info = #m__treasure__info__s2c{
%         count = Count,
%         explore = treasure_mod:build_p_treasure(Treasure),
%         treasures = treasure_mod:build_p_treasures(Treasures)
%     },

%     % ?INFO_MSG("treasure info s2c:~p~n", [Info]),
%     Sender ! {send, Info}.

% %% @doc 玩家探索
% explore(#m__treasure__explore__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{daily = Daily, role = Role} = role_api:get_user_data(),

%         VipCfg = viprelate_cfg:get(Role#role.vip),
%         common_guard(VipCfg, ?TREASURE_EXPLORE_FAILED, "cfg not found!\n", Sender),

%         Treasures = treasure_srv:get_treasures(Role#role.role_id),
%         ?DEBUG_MSG("treasures:~p~n", [Treasures]),
%         Length = erlang:length(Treasures) < 3,
%         common_guard(Length, ?TREASURE_EXPLORE_FAILED, "own too much!\n", Sender),

%         AlreadyCount = Daily#daily.treasure_explore,
%         Limit = AlreadyCount < VipCfg#viprelate_cfg.treasure_explore,
%         common_guard(Limit, ?TREASURE_EXPLORE_FAILED, "limit!\n", Sender),

%         CostCfg = treasure_count_cfg:get(AlreadyCount + 1),
%         common_guard(CostCfg, ?TREASURE_EXPLORE_FAILED, "cost!", Sender),

%         Gold = CostCfg#treasure_count_cfg.gold,
%         EnoughCheck = role_api:is_enough_gold(Gold),
%         common_guard(EnoughCheck, ?TREASURE_EXPLORE_FAILED, "", Sender),

%         role_api:pay_gold(Gold, Sender),
%         game_info:update(Daily#daily{treasure_explore = AlreadyCount + 1}),

%         R = rand_srv:random(100),
%         ?DEBUG_MSG("treasure ramdom percent:~p~n", [R]),
%         if  R < ?PERCENT -> explore_role(Role, Sender);
%             true -> explore_monster(Role, Sender)
%         end
%     end,
%     ?PERFORM(F).

% %% @doc 请求掠夺
% loot(#m__treasure__loot__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role} = role_api:get_user_data(),
%         Treasure = Role#role.treasure,
%         ExploreTime = Treasure#treasure.explore_time,
%         Now = util:unixtime(),

%         CanLoot = Role#role.is_loot =:= 0 andalso Now - ExploreTime < ?DISAPPREAR_TIME,
%         common_guard(CanLoot, ?TREASURE_CANNOT_LOOT, "can't loot!\n", Sender),

%         Cfg = treasure_cfg:get(Treasure#treasure.treasure_id),
%         game_info:update(Role#role{is_loot = 1}),
        
%         role_api:minus_power(Cfg#treasure_cfg.power, Sender),
%         notify(?TREASURE_CAN_LOOT, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 掠夺结果
% loot_result(#m__treasure__loot_result__c2s{result = Result}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role} = role_api:get_user_data(),

%         CanLoot = Role#role.is_loot =:= 1,
%         common_guard(CanLoot, ?TREASURE_LOOT_COMMIT_FAILED, "can't loot!\n", Sender),

%         Treasure = Role#role.treasure,
        
%         if  Treasure#treasure.id =:= 0 -> skip;
%             true ->
%                 GuardTime = lists:min([X#treasure_guarder.start || X <- Treasure#treasure.guarders]),
%                 LootLog = #loot_log{
%                     belooter = Treasure#treasure.role_id,
%                     time = util:unixtime(),
%                     start_time = GuardTime,
%                     treasure_id = Treasure#treasure.treasure_id,
%                     looter_name = Role#role.role_name,
%                     result = Result
%                 },
%                 treasure_db:insert_loot_log(LootLog),
%                 if  Result =:= 0 -> skip;
%                     true ->
%                         Cfg = treasure_cfg:get(Treasure#treasure.treasure_id),

%                         treasure_srv:delete_treasure(Treasure#treasure.id),
%                         [treasure_srv:free_warrior(Y) || Y <- Treasure#treasure.guarders],
%                         owner_award(Treasure, 100 - Cfg#treasure_cfg.loot_per),
%                         loot_award(Treasure, Role#role.role_id, Cfg#treasure_cfg.loot_per)
%                 end
%         end,

%         {IsLoot, NewTreasure} = case Result of 
%             0 -> 
%                 {0, Treasure}; 
%             1 -> 
%                 {2, Treasure#treasure{role_id = Role#role.role_id, helper_id = "", guarders = []}}
%         end,

%         game_info:update(Role#role{is_loot = IsLoot, treasure = NewTreasure}),
%         notify(?TREASURE_LOOT_COMMIT_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 开始守护
% guard(#m__treasure__guard__c2s{idx = Idx}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, warrior = Warrior} = role_api:get_user_data(),
%         Treasure = Role#role.treasure,
%         Id = Treasure#treasure.id,

%         Canguard =  Role#role.is_loot =:= 2,
%         common_guard(Canguard, ?TREASURE_GUARD_FAILED, "can't guard!\n", Sender),
%         R = case warrior_api:get_warrior([Idx], Warrior) of
%             [] -> false;
%             [W] -> W
%         end,
%         common_guard(R, ?TREASURE_GUARD_FAILED, "warrior!\n", Sender),

%         S = R#warrior.state =/= ?OTHER,
%         common_guard(S, ?TREASURE_GUARD_FAILED, "w state!\n", Sender),

%         C = true =:= warrior_api:change_warrior(Idx, ?OTHER),
%         common_guard(C, ?TREASURE_GUARD_FAILED, "", Sender),
%         ?DEBUG_MSG("change warrior:~p~n", [{Id, Idx}]),

%         Guarder = #treasure_guarder{
%             role_id = Role#role.role_id,
%             role_name = Role#role.role_name,
%             level = Role#role.level,
%             idx = Idx,
%             start = util:unixtime()
%         },
%         game_info:update(Role#role{is_loot = 0, treasure = undefined}),
%         NewId = if Id /= 0 -> Id; true -> id_srv:gen_treasure_id() end,

%         NewTreasure = Treasure#treasure{
%             id = NewId,
%             role_id = role_api:get_role_id(),
%             guarders = [Guarder]
%         },
%         treasure_srv:replace_treasure(NewTreasure),
%         Sender ! {send, #m__treasure__guard__s2c{
%                 treasure = treasure_mod:build_p_treasure(NewTreasure)
%             }}
%     end,
%     ?PERFORM(F).

% %% @doc 更换武将
% guard_change(#m__treasure__guard_change__c2s{id = Idstr, idx = Idx}, Sender) ->
%     F = fun() ->
%         Id = util:to_binary(Idstr),
%         #game_info{role = Role, warrior = Warrior} = role_api:get_user_data(),
%         RoleId = Role#role.role_id,
%         Treasure = treasure_srv:get_treasure(Id),
%         common_guard(Treasure, ?TREASURE_CHANGE_FAILED, "treasure!\n", Sender),
        
%         Owner = Treasure#treasure.role_id =:= RoleId orelse 
%         Treasure#treasure.helper_id =:= RoleId,
%         common_guard(Owner, ?TREASURE_CHANGE_FAILED, "owner!\n", Sender),

%         R = case warrior_api:get_warrior([Idx], Warrior) of
%             [] -> false;
%             [W] -> W
%         end,
%         common_guard(R, ?TREASURE_CHANGE_FAILED, "warrior!\n", Sender),

%         S = R#warrior.state =/= ?OTHER,
%         common_guard(S, ?TREASURE_GUARD_FAILED, "w state!\n", Sender),


%         MyGuarder =
%         if  RoleId =:= Treasure#treasure.role_id ->
%                 [G|_] = Treasure#treasure.guarders,
%                 G;
%             true ->
%                 HasHelper = erlang:length(Treasure#treasure.guarders) =:= 2,
%                 common_guard(HasHelper, ?TREASURE_CHANGE_FAILED, "has no helper\n", Sender),
%                 [_, G] = Treasure#treasure.guarders,
%                 G
%         end,
%         warrior_api:release_warrior(MyGuarder#treasure_guarder.idx),
%         warrior_api:change_warrior(Idx, ?OTHER),
%         ?DEBUG_MSG("replace warrior idx:~p~n", [{MyGuarder, Idx}]),

%         Guarder = #treasure_guarder{
%             role_id = RoleId,
%             role_name = Role#role.role_name,
%             level = Role#role.level,
%             idx = Idx,
%             start = MyGuarder#treasure_guarder.start
%         },
       
%         NewTreasure = Treasure#treasure{
%             guarders = lists:keyreplace(RoleId, #treasure_guarder.role_id, 
%                 Treasure#treasure.guarders, Guarder)
%         },
%         treasure_srv:replace_treasure(NewTreasure),
%         notify(?TREASURE_CHANGE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 撤退武将
% guard_retreat(#m__treasure__guard_retreat__c2s{id = Idstr}, Sender) ->
%     F = fun() ->
%         Id = util:to_binary(Idstr),
%         #game_info{role = Role} = role_api:get_user_data(),
%         Treasure = treasure_srv:get_treasure(Id),
%         common_guard(Treasure, ?TREASURE_RETREAT_FAILED, "treasure!\n", Sender),
        
%         Owner = Treasure#treasure.role_id =:= Role#role.role_id,
%         common_guard(Owner, ?TREASURE_RETREAT_FAILED, "owner!\n", Sender),

%         HasGuarder = Treasure#treasure.guarders =/= [],
%         common_guard(HasGuarder, ?TREASURE_RETREAT_FAILED, "has!\n", Sender),

%         [MyGuarder|R] = Treasure#treasure.guarders,
%         warrior_api:release_warrior(MyGuarder#treasure_guarder.idx),
%         case R of
%             [] -> ok;
%             [G] -> 
%                 case goddess_misc:get_role_pid(G#treasure_guarder.role_id) of
%                     false -> 
%                         warrior_db:release_warrior(G#treasure_guarder.role_id, G#treasure_guarder.idx);
%                     Pid ->
%                         Pid ! {process, warrior_api, release_warrior, [G#treasure_guarder.idx]}
%                 end

%         end,

%         owner_award(Treasure, 100),
%         treasure_srv:delete_treasure(Id),
%         notify(?TREASURE_RETREAT_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 邀请别人协助驻守
% ask_help(#m__treasure__ask_help__c2s{id = Idstr}, Sender) ->
%     F = fun() ->
%         Id = util:to_binary(Idstr),
%         Treasure = treasure_srv:get_treasure(Id),
%         TreasureId = Treasure#treasure.treasure_id,
%         #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         RoleId = Role#role.role_id,
%         RoleName = Role#role.role_name,
    
%         Cfg = treasure_cfg:get(Treasure#treasure.treasure_id),
%         Type = Cfg#treasure_cfg.guard_type =:= 2,
%         common_guard(Type, ?TREASURE_ASK_FAILED, "type!\n", Sender),

%         [MyGuarder] = Treasure#treasure.guarders,
%         G = MyGuarder#treasure_guarder.role_id =:= RoleId,
%         common_guard(G, ?TREASURE_ASK_FAILED, "guard!\n", Sender),

%         group_srv:srv_broadcast(GroupId, {treasure, RoleId, RoleName, Id, TreasureId}),
%         notify(?TREASURE_ASK_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% help_guard(#m__treasure__help_guard__c2s{id = Idstr, idx = Idx}, Sender) ->
%     F = fun() ->
%         Id = util:to_binary(Idstr),
%         #game_info{role = Role, warrior = Warrior} = role_api:get_user_data(),
%         RoleId = Role#role.role_id,
%         Treasure = treasure_srv:get_treasure(Id),
%         common_guard(Treasure, ?TREASURE_HELP_FAILED, "", Sender),

%         Treasures = treasure_srv:get_treasures(RoleId),
%         ?DEBUG_MSG("treasures:~p~n", [Treasures]),
%         Length = erlang:length(Treasures) < 3,
%         common_guard(Length, ?TREASURE_HELP_FAILED, "own too much!\n", Sender),

%         R = case warrior_api:get_warrior([Idx], Warrior) of
%             [] -> false;
%             [W] -> W
%         end,
%         common_guard(R, ?TREASURE_HELP_FAILED, "warrior!\n", Sender),

%         [SelfGuarder|Rest] = Treasure#treasure.guarders,
%         S = SelfGuarder#treasure_guarder.role_id =/= RoleId andalso Rest =:= [],
%         common_guard(S, ?TREASURE_HELP_FAILED, "", Sender),

%         C = true =:= warrior_api:change_warrior(Idx, ?OTHER),
%         common_guard(C, ?TREASURE_HELP_FAILED, "", Sender),

%         Guarder = #treasure_guarder{
%             role_id = RoleId,
%             role_name = Role#role.role_name,
%             level = Role#role.level,
%             idx = Idx,
%             start = util:unixtime()
%         },

%         NewTreasure = Treasure#treasure{
%             helper_id = RoleId,
%             guarders = [SelfGuarder, Guarder]
%         },
%         treasure_srv:replace_treasure(NewTreasure),

%         notify(?TREASURE_HELP_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% log(#m__treasure__log__c2s{}, Sender) ->
%     RoleId = role_api:get_role_id(),
%     Logs = treasure_db:get_loot_log(RoleId),
%     PLogs = [treasure_mod:build_p_log(X) || X <- Logs],
%     ?DEBUG_MSG("info s2c:~p~n", [PLogs]),
%     Sender ! {send, #m__treasure__log__s2c{logs = PLogs}}.
% %%%===================================================================
% %% PROCESS API
% explore_monster(Role, Sender) ->
%     Cfg = treasure_mod:random_treasure(),
%     TreasureId = Cfg#treasure_cfg.treasure_id,
%     Now = util:unixtime(),
%     Treasure = #treasure{
%         id = 0,
%         role_id = 0,
%         treasure_id = TreasureId,
%         explore_time = Now,
%         guarders = []
%     },
%     game_info:update(Role#role{is_loot = 0, treasure = Treasure}),
%     S2c = #m__treasure__explore__s2c{
%         treasure = treasure_mod:build_p_treasure(Treasure)
%     },
%     Sender ! {send, S2c}.

% explore_role(Role, Sender) ->
%     Treasure = treasure_srv:random_treasure(Role#role.role_id),
%     ?DEBUG_MSG("explored role treasure:~p~n", [Treasure]),
%     if  Treasure =:= false -> explore_monster(Role, Sender);
%         true ->
%             game_info:update(Role#role{is_loot = 0, treasure = Treasure}),
%             S2c = #m__treasure__explore__s2c{
%                 treasure = treasure_mod:build_p_treasure(Treasure)
%             },
%             Sender ! {send, S2c}
%     end.

% owner_award(#treasure{treasure_id=TreasureId, guarders = Guarders}, Per) when Per =< 100 ->
%     F = fun(Guarder) ->
%             RoleId = Guarder#treasure_guarder.role_id,
%             Cfg = treasure_cfg:get(TreasureId),
%             Now = util:unixtime(),
%             GuardTime = Guarder#treasure_guarder.start,

%             Hour = erlang:max(1, (Now - GuardTime) div 3600),
%             Num = Hour * Cfg#treasure_cfg.num,
%             RealNum = util:floor(Num * Per / 100),

%             Attachment = io_lib:format("~p-~p", [Cfg#treasure_cfg.treasure_type, RealNum]),
%             mail_srv:send_mail([RoleId], "system_award_treasure", "system_award_treasure", 
%                 ?MAILING_TYPE_AWARD, Attachment)
%     end,
%     [F(X) || X <- Guarders].

% loot_award(#treasure{treasure_id=TreasureId, guarders=Guarders}, 
%     RoleId, Per) when Per =< 100 ->
%     Cfg = treasure_cfg:get(TreasureId),
%     Now = util:unixtime(),
%     GuardTime = lists:min([X#treasure_guarder.start || X <- Guarders]),
%     Hour = (Now - GuardTime) div 3600,
%     Num = Hour * Cfg#treasure_cfg.num,
%     RealNum = util:floor(Num * Per / 100),
    
%     Attachment = io_lib:format("~p-~p", [Cfg#treasure_cfg.treasure_type, RealNum]),
%     mail_srv:send_mail([RoleId], "system_award_treasure", "system_award_treasure", 
%         ?MAILING_TYPE_AWARD, Attachment).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% open_function(_FuncId) ->
%     ok.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({treasure_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({treasure_guard_error, Reason}) ->
%     ?ERROR_MSG("guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     error_logger:info_msg("~ts ~n", [Reason]),
%     ?ERROR_MSG("guard_error, reason:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
