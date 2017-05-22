%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-19 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(item_api).

% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% Process API
% -export([
%     get_info_by_id/1,
%     get_info_by_id/2,
%     get_info_by_id/3,
%     get_info_by_ids/1]).

% -export([
%     get_info_by_slot/1,
%     get_info_by_slot/2,
%     get_info_by_slots/1]).

% -export([
%     get_info_by_item_id/1,
%     get_info_by_item_id/2,
%     get_num_by_item_id/1
% ]).

% -export([
%     add_items/1,
%     add_items/2,
%     add_items/3,
%     add_items/4,
%     update_item/1,

%     remove_by_slot/2,
%     remove_by_id/2,
%     remove_by_item_id/2,
%     remove_list/1,

%     save_to_db/1
% ]).

% -export([
%     search_items/2,
%     complete_item/2
% ]).

% -export([is_item_enough/3]).
% -export([use/1, revert/1, revert_to_pack/1, revert_to_slot/2]).

% %%%============================================================================
% %%% Process API
% %%%============================================================================

% get_info_by_slot(Slot) ->
%     get_info_by_slot(Slot, [?ITEM_AVAILABLE]).

% get_info_by_slot(Slot, State) when erlang:is_list(State) ->
%     item_key_find(Slot, #item.slot, State);
% get_info_by_slot(_Slot, _State) -> false.

% get_info_by_id(Id) ->
%     get_info_by_id(util:to_binary(Id), [?ITEM_AVAILABLE]).

% get_info_by_id(Id, State) when erlang:is_list(State) ->
%     item_key_find(util:to_binary(Id), #item.id, State);
% get_info_by_id(_, _) -> false.

% get_info_by_id(ItemInfo, Id, State) when erlang:is_list(State) ->
%     item_key_find(ItemInfo, Id, #item.id, State);
% get_info_by_id(_, _, _) -> false.

% %% @private
% item_key_find(Key, N, State) ->
%     GameInfo = role_api:get_user_data(),
%     ItemInfo = GameInfo#game_info.item,
%     item_key_find(ItemInfo, Key, N, State).
% item_key_find(ItemInfo, Key, N, State) ->
%     Items = ItemInfo#items.all,
%     Target = lists:keyfind(Key, N, [X||X<-Items, lists:member(X#item.state, State)]),
%     Target.

% get_info_by_item_id(ItemId) ->
%     get_info_by_item_id(ItemId, [?ITEM_AVAILABLE]).

% get_info_by_item_id(ItemId, State) ->
%     #game_info{item=Items} = role_api:get_user_data(),
%     [X || X <- Items#items.all, X#item.item_id == ItemId, lists:member(X#item.state, State)].

% get_info_by_slots(Slots) ->
%     get_slots([], Slots).

% get_info_by_ids(Ids) ->
%     get_ids([], Ids).

% get_num_by_item_id(ItemId) ->
%     GameInfo = role_api:get_user_data(),
%     Package = GameInfo#game_info.package,
%     OpenSlots = Package#package.slots,

%     Items = get_info_by_slots(OpenSlots),
%     lists:sum([X#item.num || X <- Items, X#item.item_id =:= ItemId, X#item.state == ?ITEM_AVAILABLE]).

% add_items(AddItems) ->
%     add_items(AddItems, self(), normal, notify).

% add_items(AddItems, Sender) ->
%     add_items(AddItems, Sender, normal, notify).

% add_items(AddItems, Sender, Tag) ->
%     add_items(AddItems, Sender, Tag, notify).

% add_items(AddItems, Sender, Tag, NeedNotify) ->
%     GameInfo = role_api:get_user_data(),
%     Package = GameInfo#game_info.package,
%     Items = GameInfo#game_info.item,
%     Role = GameInfo#game_info.role,

%     F = fun(Item, Acc0) ->
%             Cfg = item_cfg:get(Item#item.item_id),
%             IsEquip = lists:member(Cfg#item_cfg.sub_type, [1,2,3,4,5,6]),

%             if IsEquip ->
%                     case lists:member(Cfg#item_cfg.item_id, notice_item_cfg:get_all()) of
%                         true -> send_system_notice(Role, Cfg#item_cfg.item_id, 17);
%                         false -> ok
%                     end,
%                     case lists:keyfind(Item#item.item_id, #item.item_id, Items#items.all) of
%                         false ->
%                             quest_api:add_quest_process(?QUEST_EVENT_TYPE_GET_ITEM, Item#item.item_id, Item#item.num),     % 更新任务进度
%                             [{add, complete_item(Item, 0)}|Acc0];
%                         _ ->
%                             Acc0
%                     end;
%                 true -> [Item|Acc0]
%             end
%     end,
%     AddItems2 = lists:foldl(F, [], AddItems),
%     {AddItems3, Added1} =
%     lists:foldl(
%         fun(ok, Acc) -> Acc;
%             ({add, Add}, {A1, A2}) -> {A1, [Add|A2]};
%             (I, {A1, A2}) -> {[I|A1], A2}
%         end, {[], []}, AddItems2
%     ),

%     All = Items#items.all ++ Added1,
%     Slots = package_mod:get_empty_slots(Package),

%     case add_item(All, Slots, AddItems3, [], [], Role) of
%         false ->
%             false;
%         {ItemList, Added, _AddFinalList} ->
%             NewItems = #items{all = ItemList},
%             game_info:update(NewItems),

%             Channel = if Tag == quiet -> ?ATTR_CHANNEL_QUIET; true -> ?ATTR_CHANNEL_NORMAL end,
%             Info = #m__package__add__s2c{channel=Channel, items=[item_mod:build_p_item(X) || X <- Added++Added1]},
%             case NeedNotify of
%                 notify ->
%                     Sender ! {send, Info},
%                     ok;
%                 _ -> {msg, Info}
%             end
%     end.

% update_item(#item{id=Id}=Item) ->
%     GameInfo = role_api:get_user_data(),
%     ItemInfo = GameInfo#game_info.item,
%     All = lists:keyreplace(Id, #item.id, ItemInfo#items.all, Item),
%     NewItemInfo = ItemInfo#items{all=All},
%     game_info:update(NewItemInfo).

% remove_by_slot(0, _) -> false;
% remove_by_slot(Slot, RNum) ->
%     Item = item_api:get_info_by_slot(Slot),
%     remove_item(Item, RNum).

% remove_by_id(Id, RNum) ->
%     GenId = util:to_binary(Id),
%     Item = item_api:get_info_by_id(GenId),
%     remove_item(Item, RNum).

% remove_by_item_id(ItemId, RNum) ->
%     case search_items(ItemId, RNum) of
%         false -> false;
%         RemoveList ->
%             remove_list(RemoveList),
%             RemoveList
%     end.

% remove_list(RemoveList) ->
%     [remove_by_id(Id, Num) || {Id, Num} <- RemoveList].

% %% @doc
% %% @private
% remove_item(_, RNum) when RNum =< 0 -> false;
% remove_item(#item{num=Num}, RNum) when Num < RNum -> false;
% remove_item(#item{id=Id, num=Num}=Item, RNum) ->
%     GameInfo = role_api:get_user_data(),
%     if  RNum == all orelse Num == RNum ->
%             NewItem = Item#item{state=?ITEM_DELETE, slot=0};
%         true ->
%             NewItem =  Item#item{num=Num-RNum}
%     end,
%     ?ITEM_MSG(Item#item.role_id, Id, Item#item.item_id, RNum, ?USED),
%     Items = GameInfo#game_info.item,
%     NewItems = Items#items{all=lists:keyreplace(Id, #item.id, Items#items.all, NewItem)},
%     game_info:update(NewItems),
%     {Item, NewItem};
% remove_item(_, _) -> false.

% use(Id) ->
%     GenId = util:to_binary(Id),
%     GameInfo = role_api:get_user_data(),
%     Item = item_api:get_info_by_id(GenId),
%     NewItem =Item#item{state=?ITEM_USE, slot=0},
%     Items = GameInfo#game_info.item,
%     NewItems = #items{all=lists:keyreplace(GenId, #item.id, Items#items.all, NewItem)},
%     game_info:update(NewItems).

% revert(Id) ->
%     revert_to_slot(Id, 0).

% revert_to_pack(Id) ->
%     GameInfo = role_api:get_user_data(),
%     Package = GameInfo#game_info.package,
%     EmptySlots = package_mod:get_empty_slots(Package),
%     [Slot|_] = EmptySlots,
%     revert_to_slot(Id, Slot).

% revert_to_slot(Id, Slot) ->
%     GenId = util:to_binary(Id),
%     GameInfo = role_api:get_user_data(),
%     Items = GameInfo#game_info.item,

%     case item_api:get_info_by_id(GenId, [?ITEM_USE]) of
%          #item{} = Item ->
%              NewItem = Item#item{slot=Slot, state=?ITEM_AVAILABLE},
%              NewItems = #items{all=lists:keyreplace(GenId, #item.id, Items#items.all, NewItem)},
%              game_info:update(NewItems),
%              NewItem;
%         _ ->
%             false
%     end.

% save_to_db([]) -> ok;
% save_to_db([Item|Items]) ->
%     item_db:update(Item),
%     save_to_db(Items).

% search_items(ItemId, Num) ->
%     ItemList = get_info_by_item_id(ItemId),
%     search_items(Num, [], ItemList).

% search_items(0, Result, _)  -> Result;
% search_items(_, _, []) -> false;
% search_items(Num, Result, [Item|Items]) ->
%     #item{id=Id, num=UNum} = Item,
%     Cost = if UNum >= Num -> Num; true -> UNum end,
%     search_items(Num-Cost, [{Id, Cost}|Result], Items).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% add_item(Items, _, [], Added, AddFinalList, _) ->
%     {Items, Added, AddFinalList};
% add_item(Items, Slots, [AddItem|AddItems], Added, AddFinalList, Role) ->
%     case add_item_one(Items, Slots, AddItem, Role) of
%         false ->
%             false;
%         [NewItems, RestSlots, NewAdd, NewAddFinal] ->
%             ?ITEM_MSG(NewAdd#item.role_id, NewAdd#item.id, NewAdd#item.item_id, AddItem#item.num, ?GET),
%             add_item(NewItems, RestSlots, AddItems, Added++[NewAdd], AddFinalList++[NewAddFinal], Role)
%     end.
% add_item_one(_Items, _Slots, #item{num = Num}, _) when Num =< 0 -> false;
% add_item_one(Items, Slots, AddItem, Role) ->
%     Cfg = item_cfg:get(AddItem#item.item_id),

%     case lists:member(Cfg#item_cfg.item_id, notice_item_cfg:get_all()) of 
%         true -> send_system_notice(Role, Cfg#item_cfg.item_id, 13);
%         false -> ok
%     end,

%     quest_api:add_quest_process(?QUEST_EVENT_TYPE_GET_ITEM, AddItem#item.item_id, AddItem#item.num),     % 更新任务进度

%     case item_api:get_info_by_item_id(AddItem#item.item_id) of
%         [] -> add_item_new(Items, Slots, AddItem);
%         Result ->
%             Item = lists:keyfind(lists:min([X#item.num || X <- Result]), #item.num, Result),
%             NewNum = Item#item.num + AddItem#item.num,
%             case NewNum > Cfg#item_cfg.stack_num of
%                 true -> add_item_new(Items, Slots, AddItem);
%                 false -> add_item_stack(Items, Slots, Item#item{num = NewNum}, AddItem#item.num)
%             end
%     end.

% add_item_new(_Items, [], _AddItem) -> false;
% add_item_new(Items, [Slot|RestSlots], AddItem) ->
%     NewItem = complete_item(AddItem, Slot),
%     [Items ++ [NewItem], RestSlots, NewItem, NewItem].
% add_item_stack(Items, Slots, Item, AddNum) ->
%     NewItems = lists:keyreplace(Item#item.id, #item.id, Items, Item),
%     [NewItems, Slots, Item#item{num = AddNum}, Item].

% complete_item(Item, Slot) ->
%     {Id, Now} = case Item#item.id of
%         <<"0">> -> {id_srv:gen_item_id(), util:unixtime()};
%         _ -> {Item#item.id, Item#item.created_at}
%     end,
%     Slots = case erlang:is_list(Item#item.slots) of
%         false -> ?NEWSLOTS;
%         true -> item_db:fix_slot(Item#item.slots, 5)
%     end,
%     Item#item{id=Id, slot=Slot, created_at=Now, slots = Slots, state=?ITEM_AVAILABLE}.

% get_slots(Info, []) -> Info;
% get_slots(Info, [Slot|Slots]) ->
%     NewInfo = Info ++ [get_info_by_slot(Slot)],
%     get_slots(NewInfo, Slots).

% get_ids(Info, []) -> Info;
% get_ids(Info, [Id|Ids]) ->
%     NewInfo = Info ++ [get_info_by_id(util:to_binary(Id))],
%     get_ids(NewInfo, Ids).

% is_item_enough(id, Id, Num) ->
%     case get_info_by_id(util:to_binary(Id)) of
%         #item{item_id=ItemId, num=UNum} ->
%             is_item_enough2(ItemId, Num, UNum);
%         _ -> false
%     end;
% is_item_enough(slot, Slot, Num) ->
%     case get_info_by_slot(Slot) of
%         #item{item_id=ItemId, num=UNmu} ->
%             is_item_enough2(ItemId, Num, UNmu);
%         _ -> false
%     end;
% is_item_enough(itemid, ItemId, Num) ->
%     UNum = get_num_by_item_id(ItemId),
%     is_item_enough2(ItemId, Num, UNum);
% is_item_enough(_, _, _) -> false.

% is_item_enough2(_, _, 0) -> false;
% is_item_enough2(_, all, _) -> true;
% is_item_enough2(_, Num, UNum) when UNum < Num -> false;
% is_item_enough2(_, _, _) -> true.

% send_system_notice(RoleInfo, ItemId, ChatTemp) -> 
%     Notice = #chat_content{
%                 role=#chat_role{role_name=RoleInfo#role.role_name, role_id=RoleInfo#role.role_id},
%                 item=#chat_item{item_id=ItemId, id=0},
%                 num=1
%             },
%     Msg = chat_mod:make_msg(?CHAT_WORLD, ChatTemp, [], Notice),
%     broadcast_api:server(Msg).
