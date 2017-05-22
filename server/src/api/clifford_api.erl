%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 祈福(抽奖)系统
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(clifford_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([info/2, clifford/2]).
% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 获取数据
% info(#m__clifford__info__c2s{}, ClientSender) ->
%     GameInfo = role_api:get_user_data(),
%     DailyInfo = GameInfo#game_info.daily,
%     Data = #m__clifford__info__s2c{
%             clifford_free = DailyInfo#daily.clifford_free, 
%             clifford_count = DailyInfo#daily.clifford_count, 
%             clifford = [{p_clifford_item, Item_id, Num} || {Item_id, Num} <- DailyInfo#daily.clifford]
%             },

%     ClientSender ! {send, Data}.

% %% @doc 祈福
% clifford(#m__clifford__clifford__c2s{type=Type}, ClientSender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),

%         RoleInfo = GameInfo#game_info.role,
%         DailyInfo = GameInfo#game_info.daily,

%         if RoleInfo#role.level < ?CLIFFORD_REQUEST_LEVEL ->
%             throw({msg, ?REQUIRE_LEVEL, ClientSender});
%             true -> ok
%         end,

%         TimesCfg = viprelate_cfg:get(RoleInfo#role.vip),
%         Count = DailyInfo#daily.clifford_count,
%         {Times, NewType} = case Type of
%             ?CLIFFORD_ONE -> 
%                 FreeTimes = DailyInfo#daily.clifford_free,
%                 if FreeTimes >= TimesCfg#viprelate_cfg.clifford_free ->
%                     if DailyInfo#daily.clifford_count >= TimesCfg#viprelate_cfg.clifford_pay ->
%                         throw({msg, ?CLIFFORD_MAX_ERROR, ClientSender});
%                         true -> {Count, ?CLIFFORD_ONE_TYPE}
%                     end;
%                     true -> {FreeTimes, Type}
%                 end;
%             _ -> 
%                 if Count >= TimesCfg#viprelate_cfg.clifford_pay ->
%                     throw({msg, ?CLIFFORD_MAX_ERROR, ClientSender});
%                     true -> ok
%                 end,
%                 {Count, Type}
%         end,

%         Cfg = clifford_cfg:get(NewType),
%         case Cfg of
%             false -> throw({msg, ?CLIFFORD_NO_LEGAL1, ClientSender});
%             _ -> ok
%         end,

%         Consume = Cfg#clifford_cfg.discount * Cfg#clifford_cfg.consume / 100,
%         case role_api:is_enough_coin(Consume) of
%             false -> throw({msg, ?NO_MONEY, ClientSender});
%             true -> ok
%         end,

%         ChanceSum = lists:sum([Y#item_chance.chance || Y <- Cfg#clifford_cfg.item_chances]),
%         RoleEtc = GameInfo#game_info.role_etc,
%         {Items, LastId, Ids2, _NoticeItems} = case NewType of
%             ?CLIFFORD_BATCH -> get_items(ChanceSum, Cfg, RoleEtc#role_etc.clifford, RoleInfo);
%             _ -> get_item(ChanceSum, Cfg#clifford_cfg.item_chances, ?CLIFFORD_ONCE, [], RoleEtc#role_etc.clifford, [], RoleInfo, [])
%         end,

%         {NewItems, Money, Coin, Exp} = arrange_items(Items),
%         OverlayItems = overlay_items(NewItems, []),
%         AddItems2 = [#item{role_id=RoleInfo#role.role_id, item_id=ItemId, num=Num} || {clifford_item, ItemId, Num} <- OverlayItems],


%         % jira说免费能获得全部物品
%         {AddItems, Ids} =
%         case NewType of
%             ?CLIFFORD_BATCH -> {AddItems2, Ids2};
%             _ -> {[lists:nth(1, AddItems2)], [lists:nth(1, Ids2)]}
%         end,

%         case NewType of
%             ?CLIFFORD_BATCH ->
%                 case item_api:add_items(AddItems, ClientSender, quiet) of
%                     false -> throw({msg, ?SLOT_NOT_ENOUGH, ClientSender});
%                     _ -> ok
%                 end;
%             _ ->
%                 case item_api:add_items(AddItems, ClientSender) of
%                     false -> throw({msg, ?SLOT_NOT_ENOUGH, ClientSender});
%                     _ -> ok
%                 end
%         end,

%         CliffordToday = build_daily_clifford(DailyInfo#daily.clifford, Items),
%         NewDaily = DailyInfo#daily{clifford=CliffordToday},

%         % 先注释掉，以后可能会用到。
%         % send_system_notice(RoleInfo, NoticeItems),
%         role_api:pay_coin(Consume, #coin_cost{desc = ?CURR_MODE_FUNC}, ClientSender),
%         role_api:add_gold(Money, ClientSender),
%         role_api:add_coin(Coin, ?CURR_MODE_FUNC, ClientSender),
%         role_api:add_exp(Exp, ClientSender),
        
%         game_info:update(NewDaily),
%         game_info:update(RoleEtc#role_etc{clifford=LastId}),

%         case NewType of 
%             ?CLIFFORD_ONE ->
%                 game_info:update(NewDaily#daily{clifford_free=Times + 1});
%             ?CLIFFORD_BATCH ->
%                 game_info:update(NewDaily#daily{clifford_count=Times + ?CLIFFORD_BATCH_TIMES});
%             _ ->
%                 game_info:update(NewDaily#daily{clifford_count=Times + 1})
%         end,

%         %% 更新挑战成就任务 祈福X次
%         challenge_api:update_task_process(?CHALLENGE_TYPE_CLIFFORD_NUM, 0, 1),

%         living_api:clifford(ClientSender),
%         Data = #m__clifford__clifford__s2c{clifford_ids = Ids},
%         ClientSender ! {send, Data}
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% %%
% % send_system_notice(_, []) -> ok;
% % send_system_notice(RoleInfo, [ItemId|T]) -> 
% %     Notice = #chat_content{
% %                 role=#chat_role{role_name=RoleInfo#role.role_name, role_id=RoleInfo#role.role_id},
% %                 item=#chat_item{item_id=ItemId, id=0},
% %                 num=1
% %             },
% %     Msg = chat_mod:make_msg(?CHAT_WORLD, 15, [], Notice),
% %     broadcast_api:server(Msg),
% %     send_system_notice(RoleInfo, T).

% %% 刷新玩家每日祈福获得的奖品
% build_daily_clifford(DailyClifford, []) ->
%     DailyClifford;
% build_daily_clifford(DailyClifford, [{clifford_item, ItemId, Num}|Items]) ->
%     case lists:keyfind(ItemId, #clifford_item.item_id, DailyClifford) of 
%         #clifford_item{}=CliffordItem -> 
%             NewNum = CliffordItem#clifford_item.num + Num,
%             New = CliffordItem#clifford_item{num = NewNum},
%             NewDailyClifford = lists:keyreplace(ItemId, #clifford_item.item_id, DailyClifford, New),
%             build_daily_clifford(NewDailyClifford, Items);
%         _ -> 
%             build_daily_clifford(DailyClifford ++ [{ItemId, Num}], Items)
%     end.

% %% 生成多次祈福奖品
% get_items(ChanceSum, Cfg, LastItem, RoleInfo) ->
%     ItemChances = Cfg#clifford_cfg.item_chances,
%     get_item(ChanceSum, ItemChances, ?CLIFFORD_BATCH_TIMES, [], LastItem, [], RoleInfo, []).

% %% 通过随机数求取获得物品
% get_item(_, _, 0, Items, LastId, Ids, _, NoticeItems) ->
%     {Items, LastId, Ids, NoticeItems}; 
% get_item(ChanceSum, ItemChances, Count, Items, LastId, Ids, RoleInfo, NoticeItems) ->
%     Random = rand_srv:random(1, ChanceSum),
%     {Item, Id} = loop(Random, 0, ItemChances, 0),
%     ItemId = Item#item_chance.item_id,
%     if LastId =:= Id ->
%         get_item(ChanceSum, ItemChances, Count, Items, Id, Ids, RoleInfo, NoticeItems);
%         true ->
%             Num = Item#item_chance.num,
%             %% 如果祈福得到高等级物品，发世界公告信息
%             case lists:member(ItemId, notice_item_cfg:get_all()) of 
%                 true -> get_item(ChanceSum, ItemChances, Count-1, Items ++ [{clifford_item, ItemId, Num}], Id, Ids++[Id], RoleInfo, NoticeItems++[ItemId]);
%                 false -> get_item(ChanceSum, ItemChances, Count-1, Items ++ [{clifford_item, ItemId, Num}], Id, Ids++[Id], RoleInfo, NoticeItems)
%             end
%     end.
    

% loop(_, Sum, [], _) ->
%     Sum;
% loop(Random, Sum, [D|ItemChances], Count) ->
%     case Sum+D#item_chance.chance >= Random of
%         false -> loop(Random, Sum+D#item_chance.chance, ItemChances, Count+1);
%         true -> {D, Count+1}
%     end.

% overlay_items([], AddItems) -> 
%     AddItems;
% overlay_items([D|Items], AddItems) -> 
%     Cfg = item_cfg:get(D#clifford_item.item_id),
%     case lists:keyfind(D#clifford_item.item_id, #clifford_item.item_id, Items) of 
%         #clifford_item{}=Item -> 
%             NewNum = Item#clifford_item.num + D#clifford_item.num,
%             if NewNum > Cfg#item_cfg.stack_num ->
%                 overlay_items(Items, AddItems++[D]);
%                 true ->
%                     NewItem = Item#clifford_item{num=NewNum},
%                     NewItems = lists:keyreplace(Item#clifford_item.item_id, #clifford_item.item_id, Items, NewItem), 
%                     overlay_items(NewItems, AddItems)
%             end;
%         _ -> 
%             overlay_items(Items, AddItems++[D])
%     end.

% arrange_items(Items) -> 
%     Moneys = lists:filter(fun(A) -> A#clifford_item.item_id =:= ?CLIFFORD_MONEY end, Items),
%     TotalMoney = lists:sum([X#clifford_item.num || X <- Moneys]),
%     NewItems1 = Items -- Moneys,
%     Coins = lists:filter(fun(B) -> B#clifford_item.item_id =:= ?CLIFFORD_COIN end, NewItems1),
%     TotalCoin = lists:sum([Y#clifford_item.num || Y <- Coins]),
%     NewItems2 = NewItems1 -- Coins,
%     Exps = lists:filter(fun(C) -> C#clifford_item.item_id =:= ?CLIFFORD_EXP end, NewItems2),
%     TotalExp = lists:sum([Z#clifford_item.num || Z <- Exps]),
%     NewItems = NewItems2 -- Exps,
%     {NewItems, TotalMoney, TotalCoin, TotalExp}.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.
