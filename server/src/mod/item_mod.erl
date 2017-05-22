%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(item_mod).

% -include("common.hrl").
% -include("logger.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([merger/2, sort_items/1, merge_items/1, array_items/2, build_p_item/1, build_item/3]).
% -define(ITEM_SORT_RULE, [
%         {1, ?ITEM_TYPE_GIFT}, 
%         {2, ?ITEM_TYPE_EQUIP}, 
%         {3, ?ITEM_TYPE_BOX}, 
%         {4, ?ITEM_TYPE_GEM}, 
%         {5, ?ITEM_TYPE_COIN}, 
%         {6, ?ITEM_TYPE_CARD}, 
%         {7, ?ITEM_TYPE_MATERIAL}, 
%         {8, ?ITEM_TYPE_QUEST}, 
%         {9, ?ITEM_TYPE_OTHER}
%     ]).
% -define(IF_LESS_OR_EQUAL(A, B), if A =< B -> true; A > B -> false end).
% -define(IF_LARGER_OR_EQUAL(A, B), if A =< B -> false; A > B -> true end).
% %%%============================================================================
% %%% API 针对背包的操作
% %%%============================================================================

% %% @doc 合并 
% merger(FromItem, ToItem) ->
% ToCfg = item_cfg:get(ToItem#item.item_id),
% if
%     FromItem#item.item_id =/= ToItem#item.item_id ->
%         false;
%     ToCfg#item_cfg.stack_num =< 1 ->
%         false;
%     true->
%         Num = FromItem#item.num + ToItem#item.num,
%         case Num > ToCfg#item_cfg.stack_num of
%             true -> false;
%             false ->
%                 ToItem#item{num=Num}
%         end
% end.


% %% @doc 背包整理中的排序
% sort_items(Items) ->
%     S = fun(#item{item_id = TidA}, #item{item_id = TidB}) ->
%             #item_cfg{type = TA, quality = QA, needlevel = LA} = item_cfg:get(TidA),
%             #item_cfg{type = TB, quality = QB, needlevel = LB} = item_cfg:get(TidB),
%             SA = lists:keyfind(TA, 2, ?ITEM_SORT_RULE),
%             SB = lists:keyfind(TB, 2, ?ITEM_SORT_RULE),
%             if  SA =:= false -> false;
%                 SB =:= false -> true;
%                 true ->
%                     {ANum, _} = SA,
%                     {BNum, _} = SB,
%                     if  ANum < BNum -> true;
%                         ANum > BNum -> false;
%                         true -> 
%                             if  QA > QB -> true;
%                                 QA < QB -> false;
%                                 true -> 
%                                     ?IF_LARGER_OR_EQUAL(LA, LB)
%                             end
%                     end
%             end
%     end,
%     lists:sort(S, Items).

% %% @doc 背包整理中的合并 or 堆叠
% merge_items(Items) ->
%     M = fun(A, []) -> [A];
%            (B, Acc0) ->
%            insert_item(B, Acc0, [])
%     end,
%     lists:foldl(M, [], Items).

% insert_item(B, [], Out) ->
%     lists:reverse([B|Out]);
% insert_item(#item{item_id = Tid} = B, [#item{item_id = Tid} = A | Rest], Out) ->
%     Cfg = item_cfg:get(Tid),
%     if  Cfg#item_cfg.stack_num > 1 ->
%             TNum = B#item.num + A#item.num,
%             if TNum =< Cfg#item_cfg.stack_num ->
%                     lists:reverse(Out) ++ [A#item{num = TNum}, B#item{state = ?ITEM_DELETE}] ++ Rest;
%                 true ->
%                     insert_item(B#item{num = TNum - Cfg#item_cfg.stack_num}, Rest, [A#item{num = Cfg#item_cfg.stack_num}|Out])
%             end;
%         true ->
%             lists:reverse(Out) ++ [A, B] ++ Rest
%     end;
% insert_item(B, [A | Rest], Out) ->
%     insert_item(B, Rest, [A|Out]).

% %% @doc 背包整理后重新分配格子
% array_items(Items, Slots) ->
%     Fun = fun(X, {Data, [Slot|SlotList]}) ->
%         {[X#item{slot = Slot}|Data], SlotList}
%     end,
%     {ItemList, _} = lists:foldr(Fun, {[], Slots}, lists:reverse(Items)),
%     ItemList.


% build_p_item(X) ->
%     #p_item{
%         id = X#item.id,
%         role_id = X#item.role_id,
%         item_id = X#item.item_id,
%         level = X#item.level,
%         num = X#item.num,
%         slot_id = X#item.slot,
%         create_at = X#item.created_at,
%         state = X#item.state,
%         quality = X#item.quality,
%         slots = X#item.slots,
%         rune = X#item.rune,
%         star = X#item.star,
%         wing_rate = X#item.wing_rate
%     }.

% build_item(ItemId, Num, Level) ->
%     #item{item_id = ItemId, num = Num, level = Level}.
