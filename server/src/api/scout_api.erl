%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 巡哨，有点类似大富翁的玩法
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(scout_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").

% -export([info/2, random/2, h_info/2, help/2, award/2, buy/2]).
% -export([add_scout/2, go_ahead/2, nothing/2, quest/2]).
% -export([help_scout/3, help_success_reply/2,help_reply/2]).
% -export([handle_throw/1, open_function/1]).
% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__scout__info__c2s{}, Sender) ->
%     #game_info{daily = Daily, role = Role} = role_api:get_user_data(),
%     VipCfg = viprelate_cfg:get(Role#role.vip),

%     Limit = VipCfg#viprelate_cfg.scout_count,
%     Cicle = Daily#daily.scout_cicle,
%     Step = Daily#daily.scout_step,
%     Count = Daily#daily.scout_count,
%     ACount = Daily#daily.scout_a_count,
%     BNum = Daily#daily.scout_buy_count,
%     HCount = Daily#daily.scout_h_count,
%     Award = Daily#daily.scout_award,
%     BuyCount = Daily#daily.scout_buy,
%     Sender ! {send, #m__scout__info__s2c{cicle=Cicle, step=Step, count=Limit+ACount+BNum-Count, hcount=HCount, award=Award, buy_count = BuyCount}}.

% random(#m__scout__random__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, daily = Daily, quest = Quest} = role_api:get_user_data(),
%         Cicle = Daily#daily.scout_cicle,
%         Step = Daily#daily.scout_step,
%         Count = Daily#daily.scout_count,
%         ACount = Daily#daily.scout_a_count,
%         BNum = Daily#daily.scout_buy_count,
%         VipCfg = viprelate_cfg:get(Role#role.vip),

%         QuestCheck = Quest#quests.daily#daily_quest.state == ?QUEST_CAN_ACCEPTED,
%         common_guard(QuestCheck, ?SCOUT_QUEST_NOT_FINISH, "quest hasn't finished!\n", Sender),

%         LimitCheck = Count < VipCfg#viprelate_cfg.scout_count + ACount + BNum,
%         common_guard(LimitCheck, ?SCOUT_PARAMS_ERROR1, "scout count limit!\n", Sender),

%         MaxNum = lists:max(scout_event_cfg:get_all()),

%         R = if Count == 0 -> 2;
%             true -> rand_srv:random(1, 6)
%         end,
%         {NewCicle, NewStep} = 
%         if (Step + R) rem MaxNum =:= 0 -> {Cicle, MaxNum};
%             true -> {Cicle + (Step + R) div MaxNum, (Step + R) rem MaxNum}
%         end,

%         ScoutEventCfg = scout_event_cfg:get(NewStep),
%         common_guard(ScoutEventCfg, ?SCOUT_PARAMS_ERROR3, "scout event cfg none !\n", Sender),

%         NewDaily = Daily#daily{scout_cicle = NewCicle, scout_step = NewStep, scout_count = Count + 1},
%         game_info:update(NewDaily),
%         %daily_db:save(NewDaily),
%         {M, F, _} = ScoutEventCfg#scout_event_cfg.event,
%         RandomItem = 
%         if Count == 0 -> find_out(1, filter_open(ScoutEventCfg#scout_event_cfg.randoms), 0);
%             true -> random_item(ScoutEventCfg#scout_event_cfg.randoms, F)
%         end,
%         ?DEBUG_MSG("result random item:~n~p~n", [{RandomItem, NewStep}]),
        
%         erlang:apply(M, F, [[RandomItem#scout_item_cfg.award], Sender]),

%         AddScout = if F =:= 'add_scout' -> util:to_integer(RandomItem#scout_item_cfg.award); true -> 0 end,
%         AddStep = if F =:= 'go_ahead' -> util:to_integer(RandomItem#scout_item_cfg.award); true -> 0 end,
%         QuestId = if F =:= 'quest' -> util:to_integer(RandomItem#scout_item_cfg.award); true -> 0 end,

%         living_api:scout_random(Sender),

%         Sender ! {send, #m__scout__random__s2c{
%                 random_num = R, 
%                 random_index = RandomItem#scout_item_cfg.index,
%                 random_count = AddScout,
%                 random_step = AddStep,
%                 random_quest = QuestId
%             }}
%     end,
%     ?PERFORM(F).

% h_info(#m__scout__h_info__c2s{}, Sender) ->
%     #game_info{role = Role, daily = Daily, group_member = GroupMember} = role_api:get_user_data(),
%     BCount = Daily#daily.scout_b_count,
%     Groups = group_srv:members(GroupMember#group_member.group_id),
%     WithOutMe = lists:keydelete(Role#role.role_id, #group_member_ets.role_id, Groups),
%     Lists = daily_db:get_groups(WithOutMe),
%     Fun = fun({RoleId, ScoutBCount})->
%             Member = lists:keyfind(RoleId, #group_member_ets.role_id, Groups),
%             IsIn = case lists:member(util:to_list(RoleId), Daily#daily.scout_help_log) of true -> 1; false -> 0 end,
%             IsHelped = case lists:member(util:to_list(RoleId), Daily#daily.scout_me_help_log) of true -> 1; false -> 0 end,
%             #p_scout_list{
%                 role_id = RoleId,
%                 role_name = Member#group_member_ets.role_name,
%                 level = Member#group_member_ets.level,
%                 bcount = ScoutBCount,
%                 color = IsIn,
%                 helped = IsHelped
%             } 
%     end,
%     ScoutLists = [Fun(X) || X <- Lists],
%     Sender ! {send, #m__scout__h_info__s2c{bcount = BCount, list = ScoutLists}}.

% help(#m__scout__help__c2s{role_id = OtherId}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, daily = Daily} = role_api:get_user_data(),
%         HCount = Daily#daily.scout_h_count,
    
%         common_guard(Role#role.role_id /= OtherId, ?SCOUT_PARAMS_ERROR4, "cannot help self!\n", Sender),

%         VipCfg = viprelate_cfg:get(Role#role.vip),
%         LimitCheck = HCount < VipCfg#viprelate_cfg.scout_h_count,
%         ?DEBUG_MSG("help limit:~p, ~p~n", [HCount, VipCfg#viprelate_cfg.scout_h_count]),
%         common_guard(LimitCheck, ?SCOUT_PARAMS_ERROR5, "scout h count limit!\n", Sender),

%         case goddess_misc:get_role_pid(OtherId) of
%             false -> 
%                 OtherDaily = daily_db:get(OtherId),
%                 OtherACount = OtherDaily#daily.scout_a_count,
%                 OtherBCount = OtherDaily#daily.scout_b_count,
%                 Helplog = OtherDaily#daily.scout_help_log,
%                 MeHelplog = Daily#daily.scout_me_help_log,
%                 % 这里很蛋疼，先假设每个玩家次数都相同吧
%                 OtherVipCfg = viprelate_cfg:get(0),
%                 OtherLimitBCount = OtherVipCfg#viprelate_cfg.scout_b_count,
%                 case OtherBCount < OtherLimitBCount of 
%                         true -> 
%                             case lists:member(util:to_list(Role#role.role_id), Helplog) of
%                                 true -> notify(?SCOUT_HELP_FAILED_ERROR1,Sender);

%                                 false ->
%                                     game_info:update(Daily#daily{scout_h_count = HCount + 1, scout_me_help_log = [OtherId|MeHelplog]}),
%                                     daily_db:save(OtherDaily#daily{
%                                             scout_a_count = OtherACount + 1,
%                                             scout_b_count = OtherBCount + 1,
%                                             scout_help_log = [Role#role.role_id|Helplog]
%                                         }),
%                                     notify(?SCOUT_HELP_SUCCESS, Sender)
%                             end;
                            
%                         false -> notify(?SCOUT_HELP_FAILED_ERROR2,Sender)
%                 end;
%             Pid -> Pid ! {process, scout_api, help_scout, [Role#role.role_id, self()]}
%         end
%     end,
%     ?PERFORM(F).

% award(#m__scout__award__c2s{index=Index}, Sender) ->
%     F = fun() ->    
%         #game_info{daily = Daily} = role_api:get_user_data(),

%         Cfg = scout_cfg:get(Index),

%         case Cfg of
%             false -> throw({msg, ?SCOUT_PARAMS_ERROR6, Sender});
%             _ -> ok
%         end,
%         case Index > Daily#daily.scout_cicle of
%             true -> throw({msg, ?SCOUT_PARAMS_ERROR7, Sender});
%             false -> ok
%         end,
%         case util:get_state_by_binary(Daily#daily.scout_award, Index, 5) of
%             1 -> throw({msg, ?SCOUT_PARAMS_ERROR8, Sender});
%             0 -> ok
%         end,

%         case role_api:get_award(Cfg#scout_cfg.awards, ?CURR_MODE_FUNC, Sender) of
%             false -> throw({msg, ?SCOUT_PARAMS_ERROR9, Sender});
%             _ -> ok
%         end,
%         New = Daily#daily.scout_award bor (1 bsl (Index - 1)),
%         game_info:update(Daily#daily{scout_award= New}),

%         Sender ! {send, #m__system__notify__s2c{code=?SCOUT_AWARD_SUCCESS}}

%     end,
%     ?PERFORM(F).

% buy(#m__scout__buy__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{daily = Daily, role = Role} = role_api:get_user_data(),
%         ScoutBuy = Daily#daily.scout_buy,
%         BNum = Daily#daily.scout_buy_count,
%         VipCfg = viprelate_cfg:get(Role#role.vip),
%         LimitCheck = ScoutBuy < VipCfg#viprelate_cfg.scout_buy,
%         common_guard(LimitCheck, ?SCOUT_BUY_FAILED, "scout buy limit!\n", Sender),
%         BuyCfg = scout_buy_cfg:get(ScoutBuy + 1),
%         Coin = BuyCfg#scout_buy_cfg.coin,
%         C = role_api:is_enough_coin(Coin),
%         common_guard(C, ?SCOUT_BUY_FAILED, "coin not enough\n", Sender),
%         role_api:pay_coin(Coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         NewDaily = Daily#daily{
%             scout_buy = ScoutBuy + 1, 
%             scout_buy_count = BNum + 5
%         },
%         game_info:update(NewDaily),
%         notify(?SCOUT_BUY_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).
% %%%===================================================================
% %%% PROCESS API 
% %%%===================================================================
% %% 事件触发加巡哨次数
% add_scout([N], _Sender)->
%     Num = util:to_integer(N),
%     #game_info{daily = Daily} = role_api:get_user_data(),
%     Count = Daily#daily.scout_count,
%     NewDaily = Daily#daily{scout_count = Count - Num},
%     game_info:update(NewDaily),
%     daily_db:save(NewDaily).

% %% 事件触发往前行进格数
% go_ahead([S], _Sender) ->
%     R = util:to_integer(S),
%     #game_info{daily = Daily} = role_api:get_user_data(),
%     Cicle = Daily#daily.scout_cicle,
%     Step = Daily#daily.scout_step,

%     MaxNum = lists:max(scout_event_cfg:get_all()),

%     {NewCicle, NewStep} = 
%         if (Step + R) rem MaxNum =:= 0 -> {Cicle, MaxNum};
%             true -> {Cicle + (Step + R) div MaxNum, (Step + R) rem MaxNum}
%         end,

%     NewDaily = Daily#daily{scout_cicle = NewCicle, scout_step = NewStep},
%     game_info:update(NewDaily),
%     daily_db:save(NewDaily).

% %% 事件触发不干任何事情
% nothing(_, _) -> ok.

% %% 时间触发接受任务
% quest([[]], _Sender) -> 
%     ok;
% quest([S], _Sender) ->
%     QuestId = util:to_integer(S),
%     ?DEBUG_MSG("scout activate quest:~p~n", [QuestId]),

%     quest_api:receive_daily_quest(QuestId),
%     ok.

% %% 在线玩家被协助,注意，这里是被协助玩家执行
% help_scout(OtherId, OtherPid, _Sender)->
%     #game_info{role = Role, daily = Daily} = role_api:get_user_data(),
%     VipCfg = viprelate_cfg:get(Role#role.vip),
%     BCount = Daily#daily.scout_b_count,
%     Helplog = Daily#daily.scout_help_log,
%     case BCount < VipCfg#viprelate_cfg.scout_b_count of
%         false -> OtherPid ! {process, scout_api, help_reply, [limit]};
%         true ->
%             case lists:member(util:to_list(OtherId), Helplog) of
%                 true -> OtherPid ! {process, scout_api, help_reply, [helped]};
%                 false ->
%                     NewDaily = Daily#daily{
%                             scout_a_count=Daily#daily.scout_a_count+1, 
%                             scout_b_count=BCount+1, 
%                             scout_help_log=[util:to_list(OtherId)|Helplog]
%                             },
%                     game_info:update(NewDaily),
%                     % daily_db:save(NewDaily),
%                     OtherPid ! {process, scout_api, help_success_reply, [Role#role.role_id]}
%             end
            
%     end.

% % 收到协助在线玩家返回之后处理函数
% help_reply(helped,Sender)->
%     notify(?SCOUT_HELP_FAILED_ERROR1,Sender);

% help_reply(limit, Sender) ->
%     notify(?SCOUT_HELP_FAILED_ERROR2,Sender).

% help_success_reply(RoleId, Sender) ->
%     #game_info{daily = Daily} = role_api:get_user_data(),
%     HCount = Daily#daily.scout_h_count,
%     MeHelplog = Daily#daily.scout_me_help_log,
%     game_info:update(Daily#daily{scout_h_count = HCount + 1, scout_me_help_log = [RoleId|MeHelplog]}),
%     notify(?SCOUT_HELP_SUCCESS, Sender).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({scout_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({scout_guard_error, Reason}) ->
%     ?ERROR_MSG("scout_guard_error, reason:~p~n", [Reason]);

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

% filter_open(Items) ->
%     F = fun(X) ->
%             QuestId = util:to_integer(X#scout_item_cfg.award),
%             Cfg = daily_quest_cfg:get(QuestId),
%             case role_api:is_func_open(Cfg#daily_quest_cfg.func_id) of
%                 false -> false;
%                 true -> true
%             end
%     end,
%     lists:filter(F, Items).

% random_item([], _) -> 
%     ?ERROR_MSG("scout config error!"),
%     #scout_item_cfg{index = 0, award = []};
% random_item(Items, 'quest') -> random_item(filter_open(Items));
% random_item(Items, _) -> random_item(Items).

% random_item([]) -> 
%     ?ERROR_MSG("scout config filterd error!"),
%     #scout_item_cfg{index = 0, award = []};
% random_item(Items) ->
%     T = lists:sum([ R || #scout_item_cfg{rate = R} <- Items]),
%     R = rand_srv:random(T),
%     find_out(R, Items, 0).


% find_out(R, [#scout_item_cfg{rate=Rate} = Item|_Rest], T) when R >= T, R =< T + Rate -> Item;
% find_out(R, [#scout_item_cfg{rate=Rate}|Rest], T) -> 
%     find_out(R, Rest, T + Rate).

