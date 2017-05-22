%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(shop_mod).
% -include("logger.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% %% API
% -export([refresh/2, build_p_shop_item/1]).
% -export([get_cfg/1]).
% %%%===================================================================
% %%% API
% %%%===================================================================

% refresh(#game_info{role = #role{level = Level}, shop = Shop}, LastPoint) ->
%     ShopCfg = get_cfg(Level),
%     Items = random_items(ShopCfg, 10),
%     Shop#shop{latest_point = LastPoint, shop_items = Items}.

% build_p_shop_item(Item) ->
%     #p_shop_item{
%         item_id = Item#shop_item.item_id,
%         num = Item#shop_item.num,
%         state = Item#shop_item.state
%     }.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% get_cfg(Level) ->
%     All = shop_cfg:get_all(),
%     S = [ X ||X<-All, X=<Level],
%     [P|_]= lists:reverse(S),
%     shop_cfg:get(P).

% random_items(#shop_cfg{all_cfg = Items}, Num) ->
%     F = fun(N, Acc0) ->
%             SItems = [X || X <- Items, X#shop_item_cfg.slot =:= N orelse X#shop_item_cfg.slot =:= 0],
%             case random_item(SItems, Acc0) of
%                 false ->
%                     ?ERROR_MSG("shop cfg error: ~p~n", [{slot, N, SItems}]),
%                     Acc0;
%                 Item ->
%                     [Item|Acc0]
%             end
%     end,
%     Result = lists:foldl(F, [], lists:seq(1, Num)),
%     Result.

% random_item([], _) -> false;
% random_item(SItems, Acc0) ->
%     T = lists:sum([ R || #shop_item_cfg{rate = R} <- SItems]),
%     R = rand_srv:random(T),
%     Item = find_out(R, SItems, 0),
%     ShopItem = #shop_item{
%         item_id = Item#shop_item_cfg.item_id,
%         num = Item#shop_item_cfg.num,
%         state = 0
%     },
%     MaxBuy = Item#shop_item_cfg.max_buy,
%     AlreadyBuy = shop_api:get_buy_num(Item#shop_item_cfg.item_id),
%     if  MaxBuy =:= 0 -> ShopItem;
%         AlreadyBuy < MaxBuy ->
%             case lists:keyfind(ShopItem#shop_item.item_id, #shop_item.item_id, Acc0) of
%                 false ->
%                     ShopItem;
%                 _ ->
%                     random_item(lists:keydelete(ShopItem#shop_item.item_id, #shop_item_cfg.item_id, SItems), Acc0)
%             end;
%         true ->
%             random_item(lists:keydelete(Item#shop_item_cfg.item_id, #shop_item_cfg.item_id, SItems), Acc0)
%     end.

% find_out(R, [#shop_item_cfg{rate=Rate} = Item|_Rest], T) when R >= T, R =< T + Rate -> 
%     Item;
% find_out(R, [#shop_item_cfg{rate=Rate}|Rest], T) -> 
%     find_out(R, Rest, T + Rate).

