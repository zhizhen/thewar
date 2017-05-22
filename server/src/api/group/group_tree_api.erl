%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 帮会神树活动
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_tree_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([info/2, water/2, shake/2]).
% -export([role_water/5, do_when_air_full/2, tick/3]).
% -export([handle_throw/1]).

% -define(GROUP_TREE_SHAKED,  1).     % 神树今日已摇

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 获取数据
% info(#m__group_tree__info__c2s{}, Sender) ->
%     #game_info{group_member=GroupMember, daily=Daily} = role_api:get_user_data(),
%     GroupId = GroupMember#group_member.group_id,
%     #group_act_ets{tree=Tree} = group_master_srv:act_info(GroupId),

%     Data = #m__group_tree__info__s2c{
%                         air = Tree#group_tree_info.air,
%                         rank = [{p_role_tree_air, RoleId, Air, LastRank} || {group_tree_member, RoleId, Air, LastRank, _} <- air_rank(Tree#group_tree_info.members)],
%                         logs = [{p_tree_log, RoleId, Time, Level, Type} || {group_tree_log, RoleId, Time, Level, Type} <- Tree#group_tree_info.logs],
%                         times = Daily#daily.group_tree_water,
%                         shake = Daily#daily.group_tree_shake
%                     },
%     Sender ! {send, Data}.


% water(#m__group_tree__water__c2s{type=Type}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, daily=Daily} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         #groups_ets{level=GroupLevel} = group_master_srv:get_info(GroupId),
%         Cfg = group_tree_cfg:get(GroupLevel),

%         if Daily#daily.group_tree_water >= Cfg#group_tree_cfg.watering_times ->
%             throw({msg, ?GROUP_TREE_TIMES_USE_UP, Sender});
%             true -> ok
%         end,

%         #group_act_ets{tree=Tree} = group_master_srv:act_info(GroupId),
%         if Tree#group_tree_info.air >= Cfg#group_tree_cfg.max_air ->
%             throw({msg, ?GROUP_TREE_FULL, Sender});
%             true -> ok
%         end,

%         WateringTypes = Cfg#group_tree_cfg.waterings,
%         Water = lists:keyfind(Type, #waterings.type, WateringTypes),
%         WaterConsume = Water#waterings.consume,
%         if Type =:= ?WATER_MONEY ->
%             case role_api:is_enough_gold(WaterConsume) of
%                 false -> throw({msg, ?NO_MONEY, Sender});
%                 true -> ok
%             end,
%             role_api:pay_gold(WaterConsume, Sender);
%             true -> 
%                 case role_api:is_enough_coin(WaterConsume) of
%                     false -> throw({msg, ?NO_MONEY, Sender});
%                     true -> ok
%                 end,
%                 role_api:pay_coin(WaterConsume, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender)
%         end,
%         RoleId = util:to_list(GroupMember#group_member.role_id),
%         case group_srv:water(GroupId, RoleId, Cfg, Type) of
%             true -> ok;
%             _ -> notify(?GROUP_TREE_FAIL, Sender)
%         end,

%         Times = Daily#daily.group_tree_water + 1,
%         game_info:update(Daily#daily{group_tree_water = Times}),
%         %% 更新挑战成就任务 帮会神树浇水X次
%         challenge_api:update_task_process(?CHALLENGE_TYPE_GROUP_TREE_NUM, 0, 1),

%         notify(?GROUP_TREE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% shake(#m__group_tree__shake__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, group_member=GroupMember, daily=Daily} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         RoleId = Role#role.role_id,
%         #group_act_ets{tree=Tree} = group_master_srv:act_info(GroupId),
%         #groups_ets{level=GroupLevel} = group_master_srv:get_info(GroupId),
%         Cfg = group_tree_cfg:get(GroupLevel),
        
%         if Tree#group_tree_info.air < Cfg#group_tree_cfg.max_air ->
%             throw({msg, ?GROUP_TREE_NOT_FULL, Sender});
%             true -> ok
%         end,
%         if Daily#daily.group_tree_shake =:= ?GROUP_TREE_SHAKED ->
%             throw({msg, ?GROUP_TREE_HAVE_SHAKED, Sender});
%             true -> ok
%         end,

%         %% TODO send group players award.
%         RankLv = case lists:keyfind(RoleId, #group_tree_member.role_id, Tree#group_tree_info.members) of 
%                     #group_tree_member{} = R -> R#group_tree_member.last_rank;
%                     _ -> 0
%                 end,

%         Award = case group_tree_award_cfg:get({GroupLevel, RankLv}) of 
%                     #group_tree_award_cfg{} = A -> A;
%                     _ -> group_tree_award_cfg:get({GroupLevel, 0})
%                 end,
%         role_api:get_award(Award#group_tree_award_cfg.awards, ?CURR_MODE_FUNC, Sender),

%         game_info:update(Daily#daily{group_tree_shake = ?GROUP_TREE_SHAKED}),
%         notify(?GROUP_TREE_SHAKE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% ------------------------------------------------------------------
% tick(Act, _Info, Now) ->
%     #group_act_ets{tree=Tree} = Act,
%     {TodayDate, _} = erlang:localtime(),
% %%     {LastDate, _} = util:timestamp_to_datetime(Tree#group_tree_info.last_save_time),

%     Z = util:datetime_to_timestamp({TodayDate, {0,0,0}}),

%     Memeber = lists:filter(fun(#group_tree_member{last_water=T1}) -> T1 >= Z end, Tree#group_tree_info.members),
%     Logs = lists:filter(fun(#group_tree_log{time=T1}) -> T1 >= Z end, Tree#group_tree_info.logs),

% %%     ?DEBUG_MSG("tree tick: -------------------------"),

%     case length(Memeber) /= length(Tree#group_tree_info.members) orelse length(Logs) /= length(Tree#group_tree_info.logs) of
%         true ->
%             {true, Act#group_act_ets{tree=Tree#group_tree_info{air=0, members=[], logs=[], last_save_time=Now}}};
%         false ->
%             {false, Act}
%     end.



% %%     {DT, _} = calendar:time_difference({LastDate, {0,0,0}}, {TodayDate, {0,0,0}}),
% %%
% %%     case DT of
% %%         0 ->
% %%             {false, Act};
% %%         _ ->
% %%             Act2 = Act#group_act_ets{tree=Tree#group_tree_info{air=0, members=[], logs=[], last_save_time=Now}},
% %%             {true, Act2}
% %%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% role_water(RoleId, Tree, Cfg, Type, Level) ->
%     Members = Tree#group_tree_info.members,
%     Water = lists:keyfind(Type, #waterings.type, Cfg#group_tree_cfg.waterings),
%     role_srv:send2role(RoleId, {group_api, add_value_callback, [Water#waterings.award, ?NOW]}),
%     Rank = air_rank(Members),
%     NewMembers = 
%         case lists:keyfind(RoleId, #group_tree_member.role_id, Members) of 
%             #group_tree_member{} = R -> 
%                 LastRank = get_last_rank(R#group_tree_member.role_id, Rank),
%                 Old = R#group_tree_member.air_devote,
%                 New = R#group_tree_member{air_devote = Old + Water#waterings.air_add, last_rank = LastRank, last_water=?NOW},
%                 lists:keyreplace(RoleId, #group_tree_member.role_id, Members, New);
%             _ ->
%                 NewOne = #group_tree_member{role_id=RoleId, air_devote=Water#waterings.air_add, last_rank=0, last_water=?NOW},
%                 Members ++ [NewOne]
%         end,

%     NewLogs = [#group_tree_log{role_id=RoleId, time=?NOW, group_level=Level, type=Type}|Tree#group_tree_info.logs],
%     {FrontLogs, _} = case length(NewLogs) > 20 of
%                         true -> lists:split(20, NewLogs);
%                         false -> {NewLogs, ok}
%                     end,

%     NewAir = Tree#group_tree_info.air + Water#waterings.air_add,
%     group_tree_db:save(Tree#group_tree_info{members=NewMembers, logs=FrontLogs, air=NewAir}),
%     Tree#group_tree_info{members=NewMembers, logs=FrontLogs, air=NewAir}.

% do_when_air_full(Info, Cfg) ->
%     NewInfo = Info#groups{exp = Info#groups.exp + Cfg#group_tree_cfg.full_air_add},
%     group_db:update(NewInfo),
%     group_master_srv:update(NewInfo),
%     NewInfo.

% get_last_rank(RoleId, L) ->
%     get_last_rank(length(L), RoleId, L).
% get_last_rank(0, _, _) ->
%     0;
% get_last_rank(N, RoleId, L) ->
%     Tmp = lists:nth(N, L),
%     if Tmp#group_tree_member.role_id =:= RoleId ->
%         N;
%         true -> get_last_rank(N - 1, RoleId, L)
%     end.

% air_rank(L) ->
%     L1 = lists:sort(
%         fun(A, B) ->
%             A#group_tree_member.air_devote > B#group_tree_member.air_devote orelse
%             A#group_tree_member.last_water > B#group_tree_member.last_water
%         end, L),
%     % {Need, _} = case length(L1) > 15 of
%     %                 true -> lists:split(15, L1);
%     %                 false -> {L1, null}
%     %             end,
%     L1.
    
% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
