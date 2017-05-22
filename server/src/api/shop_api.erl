%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 玩家随身商店
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(shop_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([info/2,refresh/2,buy/2,retrieve/2]).
% -export([get_buy_num/1]).
% -export([handle_throw/1, open_function/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__shop__info__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     #game_info{shop = Shop} = GameInfo,
%     Now = util:unixtime(),
%     Stamp = Now - Shop#shop.latest_point,
%     Step = Stamp div (?SHOP_REFRESH_TIME),
%     LastPoint = Shop#shop.latest_point + Step * ?SHOP_REFRESH_TIME,
%     % 判断是否需要刷新随身商店
%     NewShop = 
%     case Stamp >= ?SHOP_REFRESH_TIME of
%         false -> Shop;
%         true -> shop_mod:refresh(GameInfo, LastPoint)
%     end,
%     game_info:update(NewShop),
%     Data = build_info(NewShop, Now),
%     Sender ! {send, Data}.

% refresh(#m__shop__refresh__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     #game_info{role = #role{level = Level, gold = Gold}, account=_Account, shop = Shop} = GameInfo,

%     Now = util:unixtime(),
%     ShopCfg = shop_mod:get_cfg(Level),

%     % 这里需要使用元宝coin
%     NewShop =
%     case check_enough(ShopCfg#shop_cfg.gold, Gold) of
%         false ->
%             Succ = false,
%             Shop;
%         true ->
%             % 扣钱
%             Succ = true,
%             role_api:pay_gold(ShopCfg#shop_cfg.gold, Sender),
% %%             role_api:pay_coin(ShopCfg#shop_cfg.gold, m__shop__refresh__c2s, Sender),
%             shop_mod:refresh(GameInfo, Now)
%     end,
%     game_info:update(NewShop),
%     Data = build_info(NewShop, Now),
%     % living_api
%     if Succ -> living_api:shop_refresh(Sender); true -> ok end,
%     Sender ! {send, Data}.

% buy(#m__shop__buy__c2s{item_id = ItemId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         #game_info{shop = Shop, daily = Daily, role = Role, account = _Account} = GameInfo,
%         ItemCfg = item_cfg:get(ItemId),
%         Msg1 = io_lib:format("item_id ~p 's cfg not found !~n", [ItemId]),
%         common_guard(ItemCfg, ?SHOP_BUY_FAILED, Msg1, Sender),
    
%         ShopItem = lists:keyfind(ItemId, #shop_item.item_id, Shop#shop.shop_items),
%         Msg2 = io_lib:format("item_id :~p not in shops :~p~n", [ItemId, Shop#shop.shop_items]),
%         common_guard(ShopItem, ?SHOP_BUY_FAILED, Msg2, Sender),
   
%         StateCheck = ShopItem#shop_item.state =:= ?SHOP_ITEM_CAN_BUY,
%         Msg3 = "buy state check error!~n",
%         common_guard(StateCheck, ?SHOP_BUY_FAILED, Msg3, Sender),

%         CheckEnough = check_enough(ItemCfg#item_cfg.gold * ShopItem#shop_item.num, Role#role.gold) 
%         andalso check_enough(ItemCfg#item_cfg.coin * ShopItem#shop_item.num, Role#role.coin),
%         Msg4 = "consume not enough !",
%         common_guard(CheckEnough, ?SHOP_BUY_FAILED, Msg4, Sender),
    
%         CheckSlots = package_api:check_slots_enough(1),
%         Msg5 = "null slots not enough !",
%         common_guard(CheckSlots, ?SHOP_BUY_FAILED, Msg5, Sender),
    
%         % 扣钱添加物品
%         role_api:pay_gold(ItemCfg#item_cfg.gold * ShopItem#shop_item.num, Sender),
%         role_api:pay_coin(ItemCfg#item_cfg.coin * ShopItem#shop_item.num, #coin_cost{item_id = ItemId, num = ShopItem#shop_item.num, desc = ?CURR_MODE_FUNC}, Sender),
%         Item = #item{
%             role_id = Role#role.role_id,
%             item_id = ItemId,
%             num = ShopItem#shop_item.num
%         },
%         item_api:add_items([Item]),
%         NewItems = lists:keyreplace(ItemId, #shop_item.item_id, Shop#shop.shop_items, ShopItem#shop_item{state = ?SHOP_ITEM_CAN_NOT_BUY}),
%         game_info:update(Shop#shop{shop_items = NewItems}),
%         ShopBuy = add_item_aready_buy(Daily#daily.shop_buy, ItemId, 1),
%         game_info:update(Daily#daily{shop_buy = ShopBuy}),

%         notify(?SHOP_BUY_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% retrieve(#m__shop__retrieve__c2s{id = Idstr}, Sender) ->
%     F = fun() ->
%         Id = util:to_binary(Idstr),
%         #game_info{role = Role} = role_api:get_user_data(),
%         ThrowItem = cache:find_other(self(), throw_item),
%         Msg0 = io_lib:format("throw item ~p not exist !~n", [Id]),
%         common_guard(ThrowItem, ?SHOP_RETRIEVE_FAILED, Msg0, Sender),

%         Item = lists:keyfind(Id, #item.id, ThrowItem#throw_item.items),
%         Msg1 = io_lib:format("item ~p not exist !~n", [Id]),
%         common_guard(Item, ?SHOP_RETRIEVE_FAILED, Msg1, Sender),
    
%         ItemCfg = item_cfg:get(Item#item.item_id),
%         Msg2 = io_lib:format("item_id ~p 's cfg not found !~n", [Item#item.item_id]),
%         common_guard(ItemCfg, ?SHOP_RETRIEVE_FAILED, Msg2, Sender),
    
%         CheckEnough = check_enough(ItemCfg#item_cfg.sellprice * Item#item.num, Role#role.gold),
%         Msg3 = "consume not enough !",
%         common_guard(CheckEnough, ?SHOP_RETRIEVE_FAILED, Msg3, Sender),
    
%         % 扣钱添加物品
%         NewThrow = #throw_item{items = lists:keydelete(Id, #item.id, ThrowItem#throw_item.items)},
%         cache:insert_other(self(), NewThrow),

%         role_api:pay_gold(ItemCfg#item_cfg.sellprice * Item#item.num, Sender),

%         Result = item_api:retrieve(Id),
%         Msg4 = "retrieve delete failed!",
%         common_guard(Result, ?SHOP_RETRIEVE_FAILED, Msg4, Sender),
   
%         NewItem = item_api:get_info_by_id(Id, [?ITEM_AVAILABLE]),
%         PItems = [item_mod:build_p_item(NewItem)],
%         Sender ! {send, #m__package__add__s2c{channel=?ATTR_CHANNEL_NORMAL, items = PItems}},
    
%         notify(?SHOP_RETRIEVE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% get_buy_num(ItemId) ->
%     GameInfo = role_api:get_user_data(),
%     get_item_aready_buy(GameInfo#game_info.daily#daily.shop_buy, ItemId).

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({shop_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({shop_guard_error, Reason}) ->
%     ?ERROR_MSG("shop_guard_error, reason:~ts~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~ts~n", [Reason]).

% check_enough(NeedCoin, Coin) when Coin >= NeedCoin -> true;
% check_enough(_NeedCoin, _Coin) -> false.

% get_item_aready_buy(L, ItemId) ->
%     case lists:keyfind(ItemId, 1, L) of
%         false -> 0;
%         {_, Num} -> Num
%     end.

% add_item_aready_buy(L, ItemId, Num) ->
%     case lists:keyfind(ItemId, 1, L) of
%         false -> [{ItemId, Num} | L];
%         {I, N} -> lists:keyreplace(ItemId, 1, L, {I, N + Num})
%     end.

% build_info(Shop, Now) ->
%     LeftTime = Shop#shop.latest_point + ?SHOP_REFRESH_TIME - Now,
%     Items = [ shop_mod:build_p_shop_item(X) || X <- Shop#shop.shop_items],
%     #m__shop__info__s2c{time = LeftTime, items = Items}.

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
