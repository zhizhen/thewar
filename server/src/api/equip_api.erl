%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-5-8 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(equip_api).

% -include("game_pb.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("common.hrl").

% -export([open_function/1]).

% %% API
% -export([intensify/2, quality/2, punch/2,
%          inlay/2, synthesis/2, synthesis_stone/2,
%          dress/2, undress/2, unlock/2, gem_remove/2]).

% -export([handle_throw/1]).

% -define(STONE_NOTICE_QUALITY,  5). %% 播世界公告的宝石等级限制
% -define(EQUIP_NOTICE_QUALITY,  4). %% 播世界公告的装备等级限制
% -define(ITEM_SLOT_NO_GEM,      1). 
% -define(ITEM_SLOT_NOT_OPEN,    0).

% % maybe future
% %% -export([rune_engrave/2]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% open_function(_FuncId) -> ok.

% %% @doc 强化 √
% intensify(#m__equip__intensify__c2s{id=Id}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         RoleLevel = GameInfo#game_info.role#role.level,
%         RoleVip = GameInfo#game_info.role#role.vip,

%         Item = item_api:get_info_by_id(Id, [?ITEM_USE]),
%         item_guard(Item, Sender),

%         #item{item_id=ItemId, level=Level, star=Star} = Item,
%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender, {item_cfg, ItemId}),
%         if
%             ItemCfg#item_cfg.can_intensify == ?NO  ->
%                 throw({msg, ?EQUIP_NO_LEGAL1, Sender});
%             true -> ok
%         end,

%         Quality = ItemCfg#item_cfg.quality,

%         QualityCfg = quality_cfg:get({ItemCfg#item_cfg.sub_type, Star}),

%         cfg_guard(QualityCfg, Sender, {quality_cfg, ItemCfg#item_cfg.sub_type, Quality}),
%         MaxIntensify = QualityCfg#quality_cfg.max_instensify,
%         if
%             Level >= MaxIntensify ->
%                 throw({msg, ?EQUIP_NO_LEGAL2, Sender});
%             Level >= RoleLevel ->
%                 throw({msg, ?EQUIP_NO_LEGAL3, Sender});
%             true -> ok
%         end,

%         IntensifyCfg = intensify_cfg:get({ItemCfg#item_cfg.sub_type, Level}),
%         cfg_guard(IntensifyCfg, Sender, {intensify_cfg, ItemCfg#item_cfg.sub_type, Level}),
%         if
%             IntensifyCfg#intensify_cfg.require_level > RoleLevel ->
%                 throw({msg, ?REQUIRE_LEVEL, Sender});
%             true -> ok
%         end,

%         Gold = case Quality of
%             1 -> IntensifyCfg#intensify_cfg.gold1;
%             2 -> IntensifyCfg#intensify_cfg.gold2;
%             3 -> IntensifyCfg#intensify_cfg.gold3;
%             4 -> IntensifyCfg#intensify_cfg.gold4;
%             5 -> IntensifyCfg#intensify_cfg.gold5;
%             6 -> IntensifyCfg#intensify_cfg.gold6;
%             7 -> IntensifyCfg#intensify_cfg.gold7
%         end,

%         IntensifyCriticalCfg = intensify_critical_cfg:get(RoleVip),
%         cfg_guard(IntensifyCriticalCfg, Sender, {intensify_critical_cfg, RoleVip}),

%         #intensify_critical_cfg{chance=Chance, min=Min, max=Max} = IntensifyCriticalCfg,

%         Upgrade = case rand_srv:random(100) =< Chance * 100 of
%             false -> 1;
%             true -> rand_srv:random(Min, Max)
%         end,

%         if
%             MaxIntensify =< Level+Upgrade ->
%                 NewItem = Item#item{level=MaxIntensify};
%             RoleLevel < Level + Upgrade ->
%                 NewItem = Item#item{level = RoleLevel};
%             true ->
%                 NewItem = Item#item{level=Level+Upgrade}
%         end,

%         pay(#consume{gold=Gold, coin=0}, Sender, ?CURR_MODE_FUNC),
%         item_api:update_item(NewItem),

%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_EQUIP, ItemId, 1),     % 更新任务进度
%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_ALL_EQUIP, 0, 1),     % 更新任务进度

%         Msg = #m__equip__intensify__s2c{id=Id, level=NewItem#item.level},
%         Sender ! {send, Msg}
%     end,
%     ?PERFORM(F).

% %% @doc 升阶 √
% quality(#m__equip__quality__c2s{id=Id, type=Type}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         VipCfg = viprelate_cfg:get(Role#role.vip),
%         case VipCfg#viprelate_cfg.quality_coin == ?VIP_FUNCTION_NOT_OPEN andalso Type == ?EQUIP_QUALITY_USE_COIN of
%             true -> throw({msg, ?VIP_LEVEL_TOO_LOW, Sender});
%             _ -> ok
%         end,

%         Item = item_api:get_info_by_id(Id, [?ITEM_USE]),
%         item_guard(Item, Sender),

%         #item{item_id=ItemId, level=Level, star=Star} = Item,
%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender, {item_cfg, get, ItemId}),
%         if
%             ItemCfg#item_cfg.can_quality == ?NO ->
%                 throw({msg, ?EQUIP_NO_LEGAL4, Sender});
%             true ->
%                 ok
%         end,

%         Quality = ItemCfg#item_cfg.quality,
%         QualityCfg = quality_cfg:get({ItemCfg#item_cfg.sub_type, Star}),
%         cfg_guard(QualityCfg, Sender, {quality_cfg, get, {ItemCfg#item_cfg.sub_type, Quality}}),
%         % 下一星级配置
%         cfg_guard(quality_cfg:get({ItemCfg#item_cfg.sub_type, Star+1}), Sender, {quality_cfg, get, {ItemCfg#item_cfg.sub_type, Star+1}}),

%         MaxIntensify = QualityCfg#quality_cfg.max_instensify,
%         if
%             Level < MaxIntensify ->
%                 throw({msg, ?EQUIP_NO_LEGAL5, Sender});
%             true ->
%                 ok
%         end,

%         NeedItems = QualityCfg#quality_cfg.need_item,

%         %% {item_id, consume_num, lack_num}
%         ConsumeItems =
%         case Type of
%             ?EQUIP_QUALITY_USE_COIN ->
%                 [begin
%                     Have = item_api:get_num_by_item_id(NItemId),
%                     case Have < NeedNum of
%                         false ->
%                             {NItemId, NeedNum, 0};
%                         true ->
%                             {NItemId, Have, NeedNum-Have}
%                     end
%                 end || #quality_need_item{item_id=NItemId, num=NeedNum} <- NeedItems];
%             _ ->
%                 [begin
%                     use_guard(itemid, NItemId, NeedNum, Sender),
%                    {NItemId, NeedNum, 0}
%                 end || #quality_need_item{item_id=NItemId, num=NeedNum} <- NeedItems]
%         end,


%         ConsumeCoin = count_coin_consume2(ConsumeItems, Sender),

%         case role_api:is_enough_coin(ConsumeCoin) of
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end, 

% %%         Next = ItemCfg#item_cfg.next,
%         RemoveList = lists:concat([begin
%             List1 = item_api:remove_by_item_id(NId, Num),
%             [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- List1]
%             end || {NId, Num, _} <- ConsumeItems]),

%         role_api:pay_coin(ConsumeCoin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
% %%         LevelReduce = QualityCfg#quality_cfg.level_reduce,

% %%         item_api:update_item(Item#item{item_id=Next, level=Level-LevelReduce}),
%         item_api:update_item(Item#item{star=Star+1}),

% %%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_EQUIP, ItemId, 1),     % 更新任务进度
%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_ALL_EQUIP, 0, 1),     % 更新任务进度

%         Msg = #m__package__consume__s2c{items=RemoveList},
%         Sender ! {send, Msg},

%         notify(?EQUIP_QUALITY_SUCC, Sender)

% %%         NextItemCfg = item_cfg:get(Next),
% %%         case NextItemCfg#item_cfg.quality >= 3 of
% %%             true ->
% %%                 Notice = #chat_content{
% %%                     role=#chat_role{role_name=Role#role.role_name, role_id=Role#role.role_id},
% %%                     item=#chat_item{item_id=Next, id=0}
% %%                 },
% %%
% %%                 Chat = chat_mod:make_msg(?CHAT_WORLD, 17, [], Notice),
% %%                 broadcast_api:server(Chat);
% %%             false -> ok
% %%         end,

%     end,
%     ?PERFORM(F).


% %% @doc 打孔 √
% punch(#m__equip__punch__c2s{id=Id}, Sender) ->
%     F = fun() ->
%         Item = item_api:get_info_by_id(Id, [?ITEM_USE]),
%         item_guard(Item, Sender),
%         #item{item_id=ItemId, slots=Slots} = Item,
%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender),
%         if ItemCfg#item_cfg.can_inlay == ?NO ->
%             throw({msg, ?EQUIP_NO_LEGAL6, Sender});
%             true -> ok
%         end,

%         InlayCfg = inlay_cfg:get(ItemCfg#item_cfg.sub_type),
%         cfg_guard(InlayCfg, Sender),

%         Index = index(Slots, ?NO),
%         if Index == ?NO ->
%             throw({msg, ?EQUIP_NO_LEGAL7, Sender});
%             true -> ok
%         end,
%         Consume = lists:nth(Index, InlayCfg#inlay_cfg.punch_consume),
%         pay(Consume, Sender, ?CURR_MODE_FUNC),
%         NewSlots = set_value(Index, Slots, ?YES),
%         NewItem = Item#item{slots= NewSlots},
%         item_api:update_item(NewItem),
%         notify(?EQUIP_PUNCH_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 镶嵌 √
% inlay(#m__equip__inlay__c2s{id=Id, index=Index, slot_id=GemSLotId}, Sender) ->
%     F = fun() ->
%         use_guard(slot, GemSLotId, 1, Sender),
%         Item = item_api:get_info_by_id(Id, [?ITEM_USE]),
%         item_guard(Item, Sender),
%         Gem = item_api:get_info_by_slot(GemSLotId, [?ITEM_AVAILABLE]),
%         item_guard(Gem, Sender),

%         #item{item_id=ItemId, slots=Slots} = Item,
%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender),

%         if Index > erlang:length(Slots) ->
%             throw({msg, ?EQUIP_NO_LEGAL8, Sender});
%             true -> ok
%         end,

%         if ItemCfg#item_cfg.can_inlay == ?NO ->
%             throw({msg, ?EQUIP_NO_LEGAL9, Sender});
%             true -> ok
%         end,

%         #item{item_id=GemId} = Gem,
%         GemCfg = item_cfg:get(GemId),
%         cfg_guard(GemCfg, Sender),

%         % 覆盖操作检测
%         OldGemItemId = lists:nth(Index, Slots),
%         if
%             OldGemItemId /= ?YES andalso OldGemItemId /= ?NO ->
%                 OldGemCfg = item_cfg:get(OldGemItemId),
%                 cfg_guard(OldGemCfg, Sender),
%                 if GemCfg#item_cfg.level-1 /= OldGemCfg#item_cfg.level ->
%                     throw({msg, ?EQUIP_NO_LEGAL10, Sender});
%                     true -> ok
%                 end;
%             true -> ok
%         end,

%         InlayCfg = inlay_cfg:get(ItemCfg#item_cfg.sub_type),
%         cfg_guard(InlayCfg, Sender),

%         % 宝石类型限制
%         case Index of
%             1 -> GemType = InlayCfg#inlay_cfg.gem_type1;
%             2 -> GemType = InlayCfg#inlay_cfg.gem_type2;
%             3 -> GemType = InlayCfg#inlay_cfg.gem_type3;
%             4 -> GemType = InlayCfg#inlay_cfg.gem_type4;
%             5 -> GemType = InlayCfg#inlay_cfg.gem_type5
%         end,

%         if GemCfg#item_cfg.sub_type /= GemType ->
%             throw({msg, ?EQUIP_NO_LEGAL11, Sender});
%             true -> ok
%         end,

% %%         Consume = lists:nth(GemCfg#item_cfg.level+1, InlayCfg#inlay_cfg.inlay_consume),
%         ?DEBUG_MSG("~p ", [{GemCfg#item_cfg.level, InlayCfg#inlay_cfg.inlay_consume}]),
%         Consume = lists:nth(GemCfg#item_cfg.level, InlayCfg#inlay_cfg.inlay_consume),
%         pay(Consume, Sender, ?CURR_MODE_FUNC),

%         NewSlots = set_value(Index, Slots, GemId),
%         NewItem = Item#item{slots=NewSlots},
%         item_api:remove_by_slot(GemSLotId, 1),
%         item_api:update_item(NewItem),
%         notify(?EQUIP_INLAY_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% 砍掉了!
% %% %% @doc 逆
% %% inlay_off(#m__equip__inlay_off__c2s{id=Id, slot_idx=0}, Sender) ->
% %%     F = fun() ->
% %%         GameInfo = role_api:get_user_data(),
% %%         RoleId = GameInfo#game_info.role#role.role_id,
% %%         Item = item_api:get_info_by_id(Id),
% %%         item_guard(Item, Sender),
% %%         #item{item_id=ItemId, slots=Slots} = Item,
% %%
% %%         ItemCfg = item_cfg:get(ItemId),
% %%         cfg_guard(ItemCfg, Sender),
% %%
% %%         Items = [begin #item{role_id=RoleId, item_id=SItemId, num=1, slots=?NEWSLOTS} end || SItemId <- Slots, SItemId /= ?NO, SItemId /= ?YES],
% %%
% %%         case package_api:check_slots_enough(erlang:length(Items)) of
% %%             false ->
% %%                 throw({msg, ?EQUIP_INLAYOFF_FAIL, Sender});
% %%             true -> ok
% %%         end,
% %%
% %%         item_api:add_items(Items),
% %%
% %%         NewSLots = [inlayoff(SItemId) || SItemId <- Slots],
% %%         NewItem = Item#item{slots = NewSLots},
% %%         item_api:update_item(NewItem),
% %%         notify(?EQUIP_INLAYOFF_SUCC, Sender)
% %%     end,
% %%     ?PERFORM(F);
% %%
% %% inlay_off(#m__equip__inlay_off__c2s{id=Id, slot_idx=SlotIdx}, Sender) ->
% %%     F = fun() ->
% %%         GameInfo = role_api:get_user_data(),
% %%         RoleId = GameInfo#game_info.role#role.role_id,
% %%
% %%         Item = item_api:get_info_by_id(Id),
% %%         item_guard(Item, Sender),
% %%
% %%         #item{item_id=ItemId, slots=Slots} = Item,
% %%         ItemCfg = item_cfg:get(ItemId),
% %%
% %%         cfg_guard(ItemCfg, Sender),
% %%         InlayCfg = inlay_cfg:get(ItemCfg#item_cfg.sub_type),
% %%         cfg_guard(InlayCfg, Sender),
% %%
% %%         MaxPunch = InlayCfg#inlay_cfg.max_punch,
% %%         if SlotIdx > MaxPunch ->
% %%             throw({msg, ?NO_LEGAL, Sender});
% %%             true -> ok
% %%         end,
% %%
% %%         SItemId = lists:nth(SlotIdx, Slots),
% %%
% %%         if SItemId == ?YES orelse SItemId == ?NO ->
% %%             throw({msg, ?NO_LEGAL, Sender});
% %%             true -> ok
% %%         end,
% %%
% %%         Slots2 = set_value(SlotIdx, Slots, ?YES),
% %%         NewItem = Item#item{slots=Slots2},
% %%
% %%         case package_api:check_slots_enough(1) of
% %%             false ->
% %%                 throw({msg, ?EQUIP_INLAYOFF_FAIL, Sender});
% %%             true -> ok
% %%         end,
% %%
% %%         item_api:add_items([#item{role_id=RoleId, item_id=SItemId, num=1, slots=?NEWSLOTS}]),
% %%         item_api:update_item(NewItem),
% %%         notify(?EQUIP_INLAYOFF_SUCC, Sender)
% %%     end,
% %%     ?PERFORM(F).


% %% @doc 合成 卷轴 物品 宝石 √
% synthesis(#m__equip__synthesis__c2s{item_id=ItemId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         RoleId = GameInfo#game_info.role#role.role_id,
%         % RoleName = GameInfo#game_info.role#role.role_name,

%         SynthesisCfg = synthesis_cfg:get(ItemId),
%         cfg_guard(SynthesisCfg, Sender),
%         NeedGold = SynthesisCfg#synthesis_cfg.gold,
%         GameInfo = role_api:get_user_data(),
%         Gold = GameInfo#game_info.role#role.gold,
%         if
%             NeedGold > Gold ->
%                 throw({msg, ?NO_MONEY, Sender});
%             true ->
%                 ok
%         end,

%         case package_api:check_slots_enough(1) of
%             false ->
%                 throw({msg, ?EQUIP_INLAYOFF_FAIL, Sender});
%             true -> ok
%         end,

%         [begin
%             SynItemId = SItem#synthesis_need_item.item_id,
%             Num = SItem#synthesis_need_item.num,
%             use_guard(itemid, SynItemId, Num, Sender)
%         end || SItem <- SynthesisCfg#synthesis_cfg.need_item],

%         [begin
%             SynItemId = SItem#synthesis_need_item.item_id,
%             Num = SItem#synthesis_need_item.num,
%             item_api:remove_by_item_id(SynItemId, Num)
%         end || SItem <- SynthesisCfg#synthesis_cfg.need_item],

%         case random:uniform(100) =< SynthesisCfg#synthesis_cfg.chance * 100 of
%             true ->
%                 item_api:add_items([#item{role_id=RoleId, item_id=ItemId, num=1, slots=?NEWSLOTS}]),
%                 notify(?EQUIP_SYNTHESIS_SUCC, Sender);

%                 % Notice = #chat_content{
%                 %     role=#chat_role{role_name=RoleName, role_id=RoleId},
%                 %     item=#chat_item{item_id=ItemId, id=0}
%                 % },
%                 % Msg = chat_mod:make_msg(?CHAT_WORLD, 16, [], Notice),
%                 % broadcast_api:server(Msg);

%             false ->
%                 notify(?EQUIP_SYNTHESIS_FAIL, Sender)
%         end
%     end,
%     ?PERFORM(F).


% synthesis_stone(#m__equip__synthesis_stone__c2s{item_id=ItemId, bonus_id=BonusId}, Sender) ->
%     F = fun() ->
%         Cfg = synthesis_stone_cfg:get(ItemId),
%         cfg_guard(Cfg, Sender, {synthesis_stone_cfg, ItemId}),

%         #synthesis_stone_cfg{need_item_id=NeedItemId, need_num=NeedNum} = Cfg,

%         use_guard(itemid, NeedItemId, NeedNum, Sender),
%         Removes = item_api:search_items(NeedItemId, NeedNum),

%         if
%             BonusId /= "0" andalso BonusId / Cfg#synthesis_stone_cfg.bonus_item ->
%                 ChanceAdd = 0,   % useless
%                 throw({msg, ?EQUIP_NO_LEGAL12, Sender});
%             BonusId /= "0" ->
%                 BonusItem = item_api:get_info_by_id(BonusId),
%                 item_guard(BonusItem, Sender),
%                 ChanceAdd = Cfg#synthesis_stone_cfg.chance_add;
%             true ->
%                 ChanceAdd = 0
%         end,

%         slots_enough_guard(1, Sender),

%         pay_guard(#consume{gold=Cfg#synthesis_stone_cfg.gold, coin=0}, Sender),

%         GameInfo = role_api:get_user_data(),
%         RoleId = GameInfo#game_info.role#role.role_id,

%         case rand_srv:random(100) =< (Cfg#synthesis_stone_cfg.chance+ChanceAdd) * 100 of
%             true ->
% %%                 item_api:remove_by_item_id(NeedItemId, NeedNum),
%                 item_api:remove_list(Removes),
%                 if BonusId /= "0" -> item_api:remove_by_id(BonusId, 1); true -> ok end,
%                 item_api:add_items([#item{role_id=RoleId, item_id=ItemId, num=1}], Sender),
%                 %% 发公告
%                 Cfg1 = item_cfg:get(ItemId),
%                 if Cfg1#item_cfg.quality >= ?STONE_NOTICE_QUALITY ->
%                     Notice1 = #chat_content{
%                         role=#chat_role{role_name=GameInfo#game_info.role#role.role_name, role_id=RoleId},
%                         item=#chat_item{item_id=ItemId, id=0}
%                     },
%                     Msg1 = chat_mod:make_msg(?CHAT_WORLD, 16, [], Notice1),
%                     broadcast_api:server(Msg1);
%                     true -> ok
%                 end,
%                 %% 成就任务检测
%                 challenge_api:update_task_process(?CHALLENGE_TYPE_GEM_ID, ItemId, 1),
%                 case item_cfg:get(ItemId) of
%                     false -> false;
%                     #item_cfg{} = ItemCfg -> 
%                         challenge_api:update_task_process(?CHALLENGE_TYPE_GEM_LEVEL, ItemCfg#item_cfg.level, 1)
%                 end,
                
%                 Notice = ?EQUIP_SYNTHESIS_STONE_SUCC;
%             false ->
%                 item_api:remove_by_item_id(NeedItemId, NeedNum),
%                 #synthesis_stone_cfg{fail_item_id=FI, fail_item_num=FN} = Cfg,
%                 if
%                     NeedItemId == FI andalso NeedNum == FN ->
%                         ok;
%                     true ->
% %%                         item_api:remove_by_item_id(NeedItemId, NeedNum),
%                         item_api:remove_list(Removes),
%                         item_api:add_items([#item{role_id=RoleId, item_id=FI, num=FN}], Sender)
%                 end,
%                 Notice = ?EQUIP_SYNTHESIS_STONE_FAIL
%         end,
%         pay(#consume{gold=Cfg#synthesis_stone_cfg.gold, coin=0}, Sender, ?CURR_MODE_FUNC),
%         Removes2 = [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- Removes],
%         Msg = #m__package__consume__s2c{items=Removes2},
%         Sender ! {send, Msg},
%         notify(Notice, Sender)
%     end,
%     ?PERFORM(F).


% %% @doc 符文 √ 暂时不用
% %% rune_engrave(#m__equip__rune_engrave__c2s{id=Id, slot_id=SlotId}, Sender) ->
% %%     F = fun() ->
% %%         Item = item_api:get_info_by_id(Id),
% %%         item_guard(Item, Sender),
% %%
% %%         Rune = item_api:get_info_by_slot(SlotId),
% %%         item_guard(Rune, Sender),
% %%
% %%         ItemId = Rune#item.item_id,
% %%         ItemCfg = item_cfg:get(ItemId),
% %%         cfg_guard(ItemCfg, Sender),
% %%
% %%         if ItemCfg#item_cfg.sub_type /= 13 ->
% %%             throw({msg, ?NO_LEGAL, Sender});
% %%             true -> ok
% %%         end,
% %%         case Item#item.rune of
% %%             0 ->
% %%                 item_api:remove_by_slot(SlotId, 1),
% %%                 NewItem = Item#item{rune=ItemId},
% %%                 item_api:update_item(NewItem);
% %%             _ -> false
% %%         end
% %%     end,
% %%     ?PERFORM(F).

% %% @doc 穿 √
% dress(#m__equip__dress__c2s{item_id=ItemId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         Equip = GameInfo#game_info.equip,

%         #item{id=Id} =
%         case item_api:get_info_by_item_id(ItemId, [?ITEM_AVAILABLE]) of
%             [] ->
%                 case equip_cfg:get({ItemId, Role#role.job}) of
%                     Cfg when Cfg#equip_cfg.vip =< Role#role.vip ->
%                         item_api:add_items([#item{role_id=Role#role.role_id, item_id=ItemId, num=1, slots=?NEWSLOTS}], Sender, normal, false),
%                         [H] = item_api:get_info_by_item_id(ItemId),
%                         H;
%                     _Cfg ->
%                         throw({msg, ?NO_LEGAL, Sender})
%                 end;
%             [H|_] -> H
%         end,

%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender),
%         Type = ItemCfg#item_cfg.sub_type,

%         NeedLevel = ItemCfg#item_cfg.needlevel,
%         NeedJob = ItemCfg#item_cfg.needjob,
%         case NeedJob /= Role#role.job orelse NeedLevel > Role#role.level of
%             true -> throw({msg, ?EQUIP_NO_LEGAL13, Sender});
%             false -> ok
%         end,

%         {OldId, NewEquip} = case Type of
%             ?ITEM_SUB_TYPE_WEAPON ->
%                 {Equip#equip.weapon, Equip#equip{weapon=Id}};
%             ?ITEM_SUB_TYPE_HELM ->
%                 {Equip#equip.helm, Equip#equip{helm=Id}};
%             ?ITEM_SUB_TYPE_ARMOR ->
%                 {Equip#equip.armor, Equip#equip{armor=Id}};
%             ?ITEM_SUB_TYPE_BOOTS ->
%                 {Equip#equip.boots, Equip#equip{boots=Id}};
%             ?ITEM_SUB_TYPE_RING ->
%                 {Equip#equip.ring, Equip#equip{ring=Id}};
%             ?ITEM_SUB_TYPE_NECKLACE ->
%                 {Equip#equip.necklace, Equip#equip{necklace=Id}};
%             _ ->
%                 throw({msg, ?EQUIP_NO_LEGAL14,  Sender})
%         end,

%         common_guard(item_api:use(Id), Sender),
%         if OldId /= Id andalso OldId /= <<"0">> ->
%             common_guard(item_api:revert(OldId), Sender);
%             true -> ok
%         end,

%         if  Type =:= ?ITEM_SUB_TYPE_ARMOR -> arena_srv:change_armor(Role#role.role_id, ItemId); true -> skip end,

%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_USE_EQUIP, ItemId, 1),     % 更新任务进度
%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_USE_ALL_EQUIP, 0, 1),     % 更新任务进度

%         game_info:update(NewEquip),

%         Sender ! {send, #m__equip__dress__s2c{id=Id}}
%     end,
%     ?PERFORM(F).

% %% @doc 脱 √
% undress(#m__equip__undress__c2s{equip_pos=PEquipPos}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Equip = GameInfo#game_info.equip,
%         EquipPos = util:to_integer(PEquipPos),
%         {Id, NewEquip} = case EquipPos of
%             ?ITEM_SUB_TYPE_WEAPON ->
%                 {Equip#equip.weapon, Equip#equip{weapon = <<"0">>}};
%             ?ITEM_SUB_TYPE_HELM ->
%                 {Equip#equip.helm, Equip#equip{helm = <<"0">>}};
%             ?ITEM_SUB_TYPE_ARMOR ->
%                 {Equip#equip.armor, Equip#equip{armor = <<"0">>}};
%             ?ITEM_SUB_TYPE_BOOTS ->
%                 {Equip#equip.boots, Equip#equip{boots = <<"0">>}};
%             ?ITEM_SUB_TYPE_RING ->
%                 {Equip#equip.ring, Equip#equip{ring = <<"0">>}};
%             ?ITEM_SUB_TYPE_NECKLACE ->
%                 {Equip#equip.necklace, Equip#equip{necklace = <<"0">>}};
%             _ ->
%                 throw({msg, ?EQUIP_NO_LEGAL15, Sender})
%         end,
%         common_guard(item_api:revert(Id), Sender),
%         game_info:update(NewEquip),
%         notify(?EQUIP_UNDRESS_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% % 解锁武器
% unlock(#m__equip__unlock__c2s{item_id=ItemId}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     #game_info{role=Role, role_warrior=RoleWarrior} = GameInfo,

%     F = fun() ->
%         case equip_cfg:get({ItemId, Role#role.job}) of
%             false ->
%                 notify(?EQUIP_UNLOCK_FAIL, Sender);
%             Cfg ->
%                 case Role#role.level < Cfg#equip_cfg.level of
%                     true -> throw({msg, ?EQUIP_UNLOCK_FAIL, Sender});
%                     false -> ok
%                 end,

%                 #role_warrior{soul1=S1, soul2=S2} = RoleWarrior,
%                 case S1 < Cfg#equip_cfg.soul1 orelse S2 < Cfg#equip_cfg.soul2 of
%                     true -> throw({msg, ?NO_MONEY, Sender});
%                     false -> ok
%                 end,

%                 case item_api:get_info_by_item_id(ItemId, [?ITEM_AVAILABLE, ?ITEM_USE]) of
%                     [] ->  ok;
%                     _ -> throw({msg, ?EQUIP_UNLOCK_FAIL, Sender})
%                 end,

%                 Consum =
%                     [begin
%                          use_guard(itemid, NItemId, NeedNum, Sender),
%                          {NItemId, NeedNum, 0}
%                      end || #equip_need_item{item_id=NItemId, num=NeedNum} <- Cfg#equip_cfg.consume],

%                 case role_api:is_enough_coin(Cfg#equip_cfg.coin) andalso role_api:is_enough_gold(Cfg#equip_cfg.gold) of
%                     false -> throw({msg, ?NO_MONEY, Sender});
%                     true -> ok
%                 end,

%                 Msg2 = #m__role__update_attr__s2c{attr_type=?WARRIOR_SOUL2, value=S2-Cfg#equip_cfg.soul2, channel=?ATTR_CHANNEL_QUIET},
%                 case item_api:add_items([#item{role_id=Role#role.role_id, item_id=ItemId, num=1, slots=?NEWSLOTS}], Sender, quiet, false) of
%                     {msg, Msg1} ->
%                         Sender ! {send_list, [Msg2, Msg1, #m__system__notify__s2c{code = ?EQUIP_UNLOCK_SUCC}]};
%                     _ ->
%                         notify(?EQUIP_UNLOCK_SUCC, Sender)
%                 end,

%                 %% 发公告 
%                 Cfg1 = item_cfg:get(ItemId),
%                 if Cfg1#item_cfg.quality >= ?EQUIP_NOTICE_QUALITY ->
%                     Notice = #chat_content{
%                         role=#chat_role{role_name=Role#role.role_name, role_id=Role#role.role_id},
%                         item=#chat_item{item_id=ItemId, id=0}
%                     },
%                     NoticeMsg = chat_mod:make_msg(?CHAT_WORLD, 17, [], Notice),
%                     broadcast_api:server(NoticeMsg);
%                     true -> ok
%                 end,
                
%                 % pay
%                 role_api:pay_coin(Cfg#equip_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%                 role_api:pay_gold(Cfg#equip_cfg.gold, Sender),
%                 game_info:update(RoleWarrior#role_warrior{soul1=S1-Cfg#equip_cfg.soul1, soul2=S2-Cfg#equip_cfg.soul2}),
%                 RemoveList = lists:concat([begin
%                                                List1 = item_api:remove_by_item_id(NId, Num),
%                                                [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- List1]
%                                            end || {NId, Num, _} <- Consum]),
                
%                 Msg = #m__package__consume__s2c{items=RemoveList},
%                 Sender ! {send, Msg}
%         end
%     end,
%     ?PERFORM(F).

% gem_remove(#m__equip__gem_remove__c2s{id=Id, index=SlotIdx}, Sender) ->
%      F = fun() ->
%         #game_info{role = Role} = role_api:get_user_data(),
%         RoleId = Role#role.role_id,
%         Item = item_api:get_info_by_id(Id, [?ITEM_USE]),
%         item_guard(Item, Sender),
%         #item{item_id = ItemId, slots=Slots} = Item,
%         GemItemId = 
%             case SlotIdx > erlang:length(Slots) orelse SlotIdx < 0 of
%                 true -> throw({msg, ?NO_LEGAL, Sender});
%                 false -> 
%                     GemItemId1 = lists:nth(SlotIdx, Slots),
%                     case lists:member(GemItemId1, [?ITEM_SLOT_NO_GEM, ?ITEM_SLOT_NOT_OPEN]) of 
%                         true -> throw({msg, ?NO_LEGAL, Sender});
%                         false -> GemItemId1
%                     end
%             end,
        

%         GemCfg = item_cfg:get(GemItemId),
%         cfg_guard(GemCfg, Sender),
%         LastGemItemId = 
%             if GemCfg#item_cfg.level =:= 1 -> 1;
%                 true -> 
%                     SynthesisCfg = synthesis_stone_cfg:get(GemItemId),
%                     SynthesisCfg#synthesis_stone_cfg.need_item_id
%         end,

%         Slots2 = set_value(SlotIdx, Slots, LastGemItemId),
%         NewItem = Item#item{slots=Slots2},
%         ItemCfg = item_cfg:get(ItemId),
%         cfg_guard(ItemCfg, Sender),

%         InlayCfg = inlay_cfg:get(ItemCfg#item_cfg.sub_type),
%         cfg_guard(InlayCfg, Sender),

%         Consume = lists:nth(GemCfg#item_cfg.level, InlayCfg#inlay_cfg.gem_remove_cost),
%         pay(Consume, Sender, ?CURR_MODE_FUNC),
%         item_api:update_item(NewItem),

%         MsgList = 
%             case item_api:add_items([#item{role_id=RoleId, item_id=GemItemId, num=1, slots=?NEWSLOTS}], Sender, normal, quiet) of
%                 {msg, Msg1} -> [Msg1, #m__system__notify__s2c{code = ?GEM_REMOVE_SUCCESS}];
%                 _ -> [#m__system__notify__s2c{code = ?GEM_REMOVE_SUCCESS}]
%             end,
%         Sender ! {send_list, MsgList}
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% common_guard(false, Sender) -> throw({msg, ?EQUIP_NO_LEGAL16, Sender});
% common_guard(_, _) -> ok.

% cfg_guard(false, Sender) -> throw({msg, ?ITEM_NOT_EXIST, Sender});
% cfg_guard(_, _) -> ok.

% cfg_guard(false, Sender, _DebugInfo) ->
%     throw({msg, ?ITEM_NOT_EXIST, Sender});
% cfg_guard(_, _, _) -> ok.

% item_guard(false, Sender) -> throw({msg, ?ITEM_NOT_EXIST, Sender});
% item_guard(_, _) -> ok.

% use_guard(T, Tv, Num, Sender) ->
%     case item_api:is_item_enough(T, Tv, Num) of
%         true -> ok;
%         false ->
%             throw({msg, ?ITEM_USE_FAILED, Sender})
%     end.


% pay_guard(Consume, Sender) ->
%     C1 = role_api:is_enough_gold(Consume#consume.gold),
%     C2 = role_api:is_enough_coin(Consume#consume.coin),

%     if not C1 orelse not C2 ->
%         throw({msg, ?NO_MONEY, Sender});
%         true -> ok
%     end.

% pay(Consume, Sender, F) ->
%     pay_guard(Consume, Sender),
%     role_api:pay_gold(Consume#consume.gold, Sender),
%     role_api:pay_coin(Consume#consume.coin, #coin_cost{desc = F}, Sender).
% slots_enough_guard(Num, Sender) ->
%     case package_api:check_slots_enough(Num) of
%         false ->
%             throw({msg, ?SLOT_NOT_ENOUGH, Sender});
%         true -> ok
%     end.

% set_value(I, L, V) ->
%     T = list_to_tuple(L),
%     T2 = erlang:setelement(I, T, V),
%     tuple_to_list(T2).

% count_coin_consume2(ItemList, Sender) ->
%     lists:foldl(fun({_,_,0}, Acc) -> Acc;
%                    ({ItemId, _, Num}, Acc) ->
%                         case quality_item_price_cfg:get(ItemId) of
%                         false ->
%                             throw({msg, ?ITEM_NOT_EXIST, Sender});
%                         Cfg ->
%                             Cfg#quality_item_price_cfg.coin * Num + Acc
%                         end
%                 end, 0, ItemList).


% index(L, V) -> index(L, V, 1).
% index([], _, _) -> ?NO;
% index([H|_T], V, N) when H == V -> N;
% index([_H|T], V, N) -> index(T, V, N+1).


% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
