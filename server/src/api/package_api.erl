%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 玩家背包
%%% @end
%%% Created : 2013-4-19 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(package_api).

% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% Client API
% -export([info/2 ,sort/2, unlock/2, iteminfo/2, use/2 ,move/2, sale/2, throw/2]).

% %% Process API
% -export([check_slots_enough/1, check_slots_enough/2, handle_throw/1, open_function/1]).

% %%%============================================================================
% %%% Client API
% %%%============================================================================
% info(#m__package__info__c2s{}, ClientSender) ->
%     #game_info{package = Package, item=Items} = role_api:get_user_data(),
%     PackInfo = package_mod:build_p_package(all, Package, Items),
%     Data = #m__package__info__s2c{package_info = PackInfo},
%     ClientSender ! {send, Data}.

% sort(#m__package__sort__c2s{}, ClientSender) ->
%     #game_info{package = Package, item=Items} = role_api:get_user_data(),
%     NewItems = package_mod:sort_package(Package, Items),
%     % item_api:save_to_db(NewItems#items.all),
%     game_info:update(NewItems),
%     info(#m__package__info__c2s{}, ClientSender).

% unlock(#m__package__unlock__c2s{type = Type, slots = Slots}, ClientSender) ->
%     GameInfo = role_api:get_user_data(),
%     Package = GameInfo#game_info.package,
%     OpenSlots = Package#package.slots,

%     Cfgs = [package_cfg:get(Id) || Id <- Slots],
%     CheckSlots = lists:member(false, Cfgs),
%     CheckType = lists:member(Type, [1,2,3,4]),
%     CheckOpen = sets:size(sets:intersection(sets:from_list(Slots), sets:from_list(OpenSlots))),     % 已经开启的和传来的取交集后的数量
%     Successive = lists:max(OpenSlots) + erlang:length(Slots) == lists:max(Slots),    % 如果是连续的 应该相等

%     if
%         CheckSlots == true ->
%             notify(?SLOT_UNLOCK_FAILED, ClientSender);
%         CheckType == false ->
%             notify(?SLOT_UNLOCK_FAILED, ClientSender);
%         CheckOpen /= 0 ->
%             notify(?SLOT_UNLOCK_FAILED, ClientSender);
%         Successive == false ->
%             notify(?SLOT_UNLOCK_FAILED, ClientSender);
%         true ->
%             Need = package_mod:check_need(Type, GameInfo, Slots),     % 检测需要扣除的东西够不够 够就返回数量 不够返回false
%             case Need of
%                 {need_time, Time} ->
%                     ClientSender ! {send, #m__package__unlock__s2c{time = Time}};
%                 {false, _} ->
%                     notify(?SLOT_UNLOCK_FAILED, ClientSender);
%                 {Gold, Coin, []} ->     % []表示扣除的物品，扩展用
%                     role_api:pay_gold(Gold, ClientSender),
%                     role_api:pay_coin(Coin, #coin_cost{desc = ?CURR_MODE_FUNC}, ClientSender),
%                     NewPackage = Package#package{slots = lists:append(OpenSlots, Slots)},
%                     game_info:update(NewPackage), % 调用game_info接口update保证扣钱不被覆盖
%                     notify(?SLOT_UNLOCK_SUCCESS, ClientSender)
%             end
%     end.

% iteminfo(#m__package__iteminfo__c2s{id = Id}, Sender) ->
%     case item_db:get_by_id(Id) of
%         false -> notify(?ITEM_NOT_EXIST, Sender);
%         Item -> 
%             PItem = item_mod:build_p_item(Item),
%             Data = #m__package__iteminfo__s2c{item = PItem},
%             Sender ! {send, Data}
%     end.

% move(#m__package__move__c2s{origin_slot=FromSlot, target_slot=ToSlot}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Package = GameInfo#game_info.package,
%         OpenSlots = Package#package.slots,

%         FromItem = item_api:get_info_by_slot(FromSlot),
%         Msg1 = io_lib:format("item in slot: ~p not found!~n", [FromSlot]),
%         common_guard(FromItem, ?ITEM_NOT_EXIST, Msg1, Sender),
        
%         HasOpenTo = not lists:member(ToSlot, OpenSlots),
%         Msg2 = io_lib:format("move to slot: ~p not in opened slots:~p~n", [ToSlot, OpenSlots]),
%         common_guard(HasOpenTo, ?ITEM_MOVE_FAILED, Msg2, Sender),
        
%         NewTo = 
%         case item_api:get_info_by_slot(ToSlot) of
%             false ->
%                 FromItem#item{slot = ToSlot};
%             ToItem ->
%                 NewItem = item_mod:merger(FromItem, ToItem),
%                 Msg3 = "num > to item's bigest stackable num !",
%                 common_guard(NewItem, ?ITEM_MOVE_FAILED, Msg3, Sender),

%                 item_api:remove_by_slot(FromSlot, all),
%                 NewItem
%         end,

%         item_api:update_item(NewTo),
%         notify(?ITEM_MOVE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 使用物品
% use(#m__package__use__c2s{slot_id = Slot, num = UseNum}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role} = role_api:get_user_data(),

%         Item = item_api:get_info_by_slot(Slot),
%         common_guard(Item, ?PACKAGE_PARAMS_ERROR1, "item not found!\n", Sender),
%         Cfg = item_cfg:get(Item#item.item_id),
%         common_guard(Cfg, ?PACKAGE_PARAMS_ERROR2, "cfg not found!\n", Sender),

%         CheckLevel = Role#role.level >= Cfg#item_cfg.needlevel,
%         common_guard(CheckLevel, ?PACKAGE_PARAMS_ERROR3, "level limit\n", Sender),

%         CheckCan = Cfg#item_cfg.useable == 1,
%         common_guard(CheckCan, ?PACKAGE_PARAMS_ERROR4, "can't use, cfg limit\n", Sender),

%         CheckNum = item_api:is_item_enough(slot, Slot, UseNum),
%         common_guard(CheckNum, ?PACKAGE_PARAMS_ERROR5, "can't use\n", Sender),

%         CheckJob = Role#role.job == Cfg#item_cfg.needjob orelse Cfg#item_cfg.needjob == 0,
%         common_guard(CheckJob, ?PACKAGE_PARAMS_ERROR6, "job can't use\n", Sender),

%         CheckEffect = effect(Cfg, UseNum, Sender),
%         common_guard(CheckEffect, ?ITEM_USE_FAILED, "no effect\n", Sender),

%         CheckRm = item_api:remove_by_slot(Slot, UseNum),
%         common_guard(CheckRm, ?ITEM_USE_FAILED, "can't remove\n", Sender),

%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_USE_ITEM, Item#item.item_id, UseNum),
%         notify(?ITEM_USE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% sale(#m__package__sale__c2s{slot = Slot, num = SaleNum}, Sender) ->
%     F = fun() ->
%         %% todo sellable check
%         Result = item_api:remove_by_slot(Slot, SaleNum),
%         Msg1 = io_lib:format("remove ~p of slot ~p item failed !", [SaleNum, Slot]),
%         common_guard(Result, ?ITEM_DELETE_FAILED, Msg1, Sender),
%         {Item, _} = Result,
%         Cfg = item_cfg:get(Item#item.item_id),
%         role_api:add_gold(Cfg#item_cfg.sellprice*SaleNum, Sender),

%         NewThrow = case cache:find_other(self(), throw_item) of 
%             false -> #throw_item{items = [Item]}; 
%             #throw_item{items = Items} -> #throw_item{items = [Item|Items]}
%         end,
%         cache:insert_other(self(), NewThrow),

%         notify(?ITEM_DELETE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 删除物品
% throw(#m__package__throw__c2s{slot = Slot}, Sender) ->
%     F = fun() ->
%         %% todo reuseable check
%         Result = item_api:remove_by_slot(Slot, all),
%         Msg1 = io_lib:format("remove slot ~p item failed !", [Slot]),
%         common_guard(Result, ?ITEM_DELETE_FAILED, Msg1, Sender),
%         notify(?ITEM_DELETE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %%%============================================================================
% %%% Process API
% %%%============================================================================
% check_slots_enough(Num) ->
%     #game_info{package = Package} = role_api:get_user_data(),
%     EmptySlots = package_mod:get_empty_slots(Package),
%     case erlang:length(EmptySlots) >= Num of
%         true -> true;
%         false -> false
%     end.

% check_slots_enough(Num, ItemId) ->
%     case item_cfg:get(ItemId) of
%         false -> false;
%         ItemCfg ->
%             StackNum = ItemCfg#item_cfg.stack_num,
%             D = Num div StackNum,
%             R = Num rem StackNum,
%             Slots = if R =:= 0 -> D; true -> D + 1 end,
%             check_slots_enough(Slots)
%     end.

% effect(#item_cfg{type = ?ITEM_TYPE_GIFT} = Cfg, 1, Sender) ->
%     GiftCfg = gift_cfg:get(Cfg#item_cfg.item_id),
%     common_guard(GiftCfg, ?ITEM_USE_FAILED, "", Sender),
%     role_api:get_award(GiftCfg#gift_cfg.items, ?CURR_MODE_FUNC, Sender, quiet);

% effect(#item_cfg{type = ?ITEM_TYPE_BOX} = Cfg, UseNum, Sender) ->
%     BoxCfg = box_cfg:get(Cfg#item_cfg.item_id),
%     BoxItems = random_items(BoxCfg#box_cfg.items, BoxCfg#box_cfg.count),
%     Things = [util:to_list(ItemId)++"-"++util:to_list(Num*UseNum) || #box_item{item_id = ItemId, num = Num} <- BoxItems],
%     role_api:get_award(Things, ?CURR_MODE_FUNC, Sender);

% effect(#item_cfg{type = ?ITEM_TYPE_CARD} = Cfg, 1, Sender) ->
%     skill_api:add(Cfg#item_cfg.skill_id, Sender);

% effect(#item_cfg{type = ?ITEM_TYPE_WARRIOR} = Cfg, 1, Sender) ->
%     warrior_api:add_warrior(util:to_integer(Cfg#item_cfg.script), Sender);

% effect(_, _, _) -> false.


% open_function(_FuncId) ->
%     ok.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% random_items(Items, Count) ->
%     F = fun(_, {AItems, Acc0}) ->
%             T = lists:sum([ R || #box_item{rate = R} <- AItems]),
%             R = rand_srv:random(T),
%             Item = find_out(R, AItems, 0),
%             NewItems = lists:keydelete(Item#box_item.item_id, 
%                 #box_item.item_id, AItems),
%             {NewItems, [Item|Acc0]}
%     end,
%     {_, Result} = lists:foldl(F, {Items, []}, lists:seq(1, Count)),
%     Result.

% find_out(R, [#box_item{rate=Rate} = Item|_Rest], T) when R >= T, R =< T + Rate -> Item;
% find_out(R, [#box_item{rate=Rate}|Rest], T) -> find_out(R, Rest, T + Rate).





% common_guard(false, Code, Reason, Sender) ->
%     notify(Code, Sender),
%     throw({package_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({package_guard_error, Reason}) ->
%     ?ERROR_MSG("package_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
