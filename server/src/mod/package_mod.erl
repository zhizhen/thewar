%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(package_mod).

% -include("common.hrl").
% -include("logger.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([check_need/3, build_p_package/3, get_empty_slots/1, sort_package/2]).

% %%%============================================================================
% %%% API
% %%%============================================================================

% check_open_time([]) -> {0, 0, []};
% check_open_time([Slot|Slots]) ->
%     OLTime = role_api:get_all_ol_time(),
%     Cfg = package_cfg:get(Slot),
%     case OLTime >= Cfg#package_cfg.need_time of
%         true ->
%             check_open_time(Slots);
%         false ->
%             {need_time, Cfg#package_cfg.need_time - OLTime}
%     end.

% check_open_gold(Gold, []) -> Gold;
% check_open_gold(Gold, [Slot|Slots]) ->
%     #package_cfg{need_gold=NeedGold} = package_cfg:get(Slot),
%     if  NeedGold =:= 0 -> false;
%         true -> check_open_gold(Gold + NeedGold, Slots)
%     end.

% check_open_coin(Coin, []) -> Coin;
% check_open_coin(Coin, [Slot|Slots]) ->
%     #package_cfg{need_coin=NeedCoin} = package_cfg:get(Slot),
%     if  NeedCoin =:= 0 -> false;
%         true -> check_open_coin(Coin + NeedCoin, Slots)
%     end.


% %% @doc 检测时间
% check_need(1, _, Slots) ->
%     check_open_time(Slots);

% %% @doc 检测金币
% check_need(2, GameInfo, Slots) ->
%     NeedGold = check_open_gold(0, Slots),
%     Role = GameInfo#game_info.role,
%     if  NeedGold =:= false -> {false, "open gold cfg error"};
%         Role#role.gold < NeedGold -> {false, "open gold not enough"};
%         true -> {NeedGold, 0, []}
%     end;

% %% @doc 检测代币
% check_need(3, GameInfo, Slots) ->
%     NeedCoin = check_open_coin(0, Slots),
% %%     Account = GameInfo#game_info.account,
%     Role = GameInfo#game_info.role,
%     if  NeedCoin =:= false -> {false, "open coin cfg error"};
%         Role#role.coin < NeedCoin -> {false, "open coin not enough"};
%         true -> {0, NeedCoin, []}
%     end;

% %% @doc 检测物品 目前策划无此功能扩展用
% check_need(4, _, _) ->
%     {false, "open item function not open"}.


% %% @doc 将背包结构转换为给客户端发送的协议结构
% build_p_package(all, Package, Item) ->
%     Slots = Package#package.slots,
%     Items = Item#items.all,
%     PItems = [item_mod:build_p_item(X) || X <- Items, X#item.state /= ?ITEM_DELETE],
%     #p_package{slots=Slots, items=PItems};

% build_p_package(sample, Package, Item) ->
%     Slots = Package#package.slots,
%     Items = Item#items.all,
%     PItems = [item_mod:build_p_item(X) || X <- Items, X#item.state == ?ITEM_USE],
%     #p_package{slots=Slots, items=PItems}.

% get_empty_slots(Package) ->
%     OpenSlot = Package#package.slots,
%     [X || X <- OpenSlot, item_api:get_info_by_slot(X) =:= false].

% sort_package(#package{slots=Slots}, #items{all=ItemsAll}) ->
%     {Special, Items} =
%     lists:foldl(
%     fun(X, {A, B}) ->
%         case X#item.slot == 0 orelse X#item.state /= ?ITEM_AVAILABLE of
%             true -> {[X|A], B};
%             _ -> {A, [X|B]}
%         end
%     end, {[], []}, ItemsAll
%     ),
%     D2Items = item_mod:merge_items(Items),

% %%     D1Items = [ X || X <- Items, X#item.state == ?ITEM_AVAILABLE],
% %%     % 第一步，合并 or 堆叠
% %%     MItems = item_mod:merge_items(D1Items),
% %%     D2Items = [ X || X <- MItems, X#item.state == ?ITEM_AVAILABLE],

%     % 第二步， 排序
%     SItems = item_mod:sort_items(D2Items),
%     % 第三步，安排格子
%     AItems = item_mod:array_items(SItems, Slots),

% %%     Special = [ X || X <- Items, X#item.state =/= ?ITEM_AVAILABLE],
%     #items{all=AItems++Special}.



