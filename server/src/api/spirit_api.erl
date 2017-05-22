%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 女神系统
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(spirit_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([info/2, rape/2, collect/2, equip/2, off/2, eat/2, drageat/2, move/2]).    
% -export([get_cfg_by_exp/2]).
% -export([open_slot/3, handle_throw/1]).

% -define(SPIRIT_EMPTY_SLOT_ID, "0").
% -define(SPIRIT_PACK_OPENED_SLOTS, lists:seq(1, 20)).
% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 获取数据
% info(#m__spirit__info__c2s{}, ClientSender) ->
%     GameInfo = role_api:get_user_data(),
%     SpiritInfo = GameInfo#game_info.spiritinfo,

%     Slots = SpiritInfo#spiritinfo.spiritslots,
%     Level = GameInfo#game_info.role#role.level,
%     Ids = spirit_slot_cfg:get_all(),

%     SlotsInfo = open_slot(Ids, Level, Slots),

%     game_info:update(SpiritInfo#spiritinfo{spiritslots=SlotsInfo}),
%     Data = #m__spirit__info__s2c{slot_ids = ?SPIRIT_PACK_OPENED_SLOTS, opened_slots=[X#spirit_slot.slot_id||X <- SlotsInfo, X#spirit_slot.state =:= ?SPIRIT_SLOT_OPENED]},
%     ClientSender ! {send, Data}.

% %% @doc XX女神,获得神格
% rape(#m__spirit__rape__c2s{npc_id=NpcId, type=Type}, ClientSender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         #game_info{daily=Daily, spiritinfo=SpiritInfo, role=Role} = GameInfo,

%         %% 强行征服青龙女神和一键征服时检测VIP等级是否合要求
%         if Type =:= ?SPIRIT_KEY_RAPE orelse NpcId =:= ?SPIRIT_FORCE_RAPE ->
%             VipCfg = viprelate_cfg:get(Role#role.vip),
%             case VipCfg#viprelate_cfg.force_rape of
%                 ?VIP_FUNCTION_NOT_OPEN -> throw({msg, ?VIP_LEVEL_TOO_LOW, ClientSender});
%                 _ -> ok
%             end;
%             true -> ok
%         end,

%         %% 检测临时商店里存在的精魄数量
%         InStoreNum = length([X || X <- SpiritInfo#spiritinfo.spirits, X#spirit.slot_id =:= ?SPIRIT_INSHOP andalso X#spirit.state =:= ?SPIRIT_AVAILABLE]),
%         if InStoreNum >= ?SPIRIT_MAX_INSTORE_NUM ->
%             throw({msg, ?SPIRIT_NO_LEGAL1, ClientSender});
%             true -> ok
%         end,

%         GroupCfg = spirit_group_cfg:get(lists:max([X || X <- spirit_group_cfg:get_all(), X =< Daily#daily.spirit_gold])),
%         ActiveNpcs = SpiritInfo#spiritinfo.spiritnpc#spirit_npc.npcs,

%         NpcCfg = 
%             case NpcId == ?SPIRIT_FORCE_RAPE of
%                 true -> spirit_npc_cfg:get({NpcId, ?SPIRIT_GROUP_SP});
%                 false -> spirit_npc_cfg:get({NpcId, GroupCfg#spirit_group_cfg.group_id})
%             end,

%         case NpcId /= ?SPIRIT_FORCE_RAPE andalso util:bit_test(ActiveNpcs, NpcId) == ?SPIRIT_NPC_NO_ACTIVE of
%             true -> throw({msg, ?SPIRIT_NPC_NOT_ACTIVE, ClientSender});
%             false -> ok
%         end,

%         NeedGold = NpcCfg#spirit_npc_cfg.gold,
%         NeedCoin = NpcCfg#spirit_npc_cfg.coin,

%         case role_api:is_enough_gold(NeedGold) andalso role_api:is_enough_coin(NeedCoin) of
%             false -> throw({msg, ?NO_MONEY, ClientSender});
%             true -> ok
%         end,

%         New = spirit_mod:gen_new_spirit(NpcCfg, Role#role.role_id),
%         New2c = spirit_mod:build_new_spirit_2c(New),
%         case New#spirit.spirit_id of
%             ?KISS_ID -> 
%                 KissCfg = spirit_cfg:get(New#spirit.spirit_id),
%                 role_api:add_gold(KissCfg#spirit_cfg.gold, ClientSender);
%             _ -> 
%                 NewSpirits = SpiritInfo#spiritinfo.spirits ++ [New],
%                 game_info:update(SpiritInfo#spiritinfo{spirits=NewSpirits}),
%                 ?SPIRIT_MSG(Role#role.account_id, Role#role.role_id, New#spirit.id, ?GET)     % 存入统计日志库        
%         end,

%         role_api:pay_gold(NeedGold, ClientSender),
%         role_api:pay_coin(NeedCoin, #coin_cost{desc = ?CURR_MODE_FUNC}, ClientSender),

%         NewGold = Daily#daily.spirit_gold + NeedGold,
%         game_info:update(Daily#daily{spirit_gold=NewGold}),

%         if NpcId =/= ?SPIRIT_FORCE_RAPE ->
%             NewNpc = spirit_mod:build_new_npcs(NpcId, ActiveNpcs);
%             true -> 
%                 NewNpc = case util:get_state_by_binary(ActiveNpcs, ?SPIRIT_FOURTH_NPC, ?SPIRIT_NPC_NUM) of
%                     ?SPIRIT_NPC_NO_ACTIVE -> spirit_mod:build_new_npcs(?SPIRIT_FOURTH_NPC, ActiveNpcs+(1 bsl (?SPIRIT_FOURTH_NPC-1)));
%                     _ -> spirit_mod:build_new_npcs(?SPIRIT_FOURTH_NPC, ActiveNpcs)
%                 end
%         end,

%         OldNpcs = SpiritInfo#spiritinfo.spiritnpc,
%         NewNpcs = OldNpcs#spirit_npc{npcs = NewNpc},

%         #game_info{spiritinfo=SpiritInfo1} = role_api:get_user_data(),
%         game_info:update(SpiritInfo1#spiritinfo{spiritnpc=NewNpcs}),
%         Msg = #m__spirit__rape__s2c{spirit=New2c, npcs=NewNpc},

%         %% 更新挑战成就任务状态
%         update_quest_challenge1(New),

%         % 如果品质最高，发世界公告
%         NewCfg = spirit_cfg:get(New#spirit.spirit_id),
%         if NewCfg#spirit_cfg.quality >= ?SPIRIT_BEST_QUALITY ->
%             Notice = #chat_content{
%                     role=#chat_role{role_name=Role#role.role_name, role_id=Role#role.role_id}, 
%                     spirit_id=New#spirit.spirit_id
%                 },
%             NoticeMsg = chat_mod:make_msg(?CHAT_WORLD, 6, [], Notice),
%             broadcast_api:server(NoticeMsg);
%             true -> ok
%         end,

%         living_api:spirit_get(ClientSender),

%         ClientSender ! {send, Msg}
%     end,
%     ?PERFORM(F).

% %% @doc 拾取
% collect(#m__spirit__collect__c2s{spirit_cols=SpiritCols}, ClientSender) ->
%     F = fun() ->
%         case check_legal(SpiritCols) of
%             false -> throw({msg, ?SPIRIT_ARG_ILLEGAL, ClientSender});
%             true -> ok
%         end,

%         #game_info{spiritinfo=SpiritInfo} = role_api:get_user_data(),
%         Spirits = SpiritInfo#spiritinfo.spirits,

%         case check_spirit(SpiritCols, Spirits, [?SPIRIT_AVAILABLE]) of
%             false -> throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             true -> ok
%         end,

%         case check_collect_again(SpiritCols, Spirits) of
%             false -> throw({msg, ?SPIRIT_ALREADY_COLLECT, ClientSender});
%             true -> ok
%         end,
%         EmptySlots = spirit_mod:get_empty_slots(?SPIRIT_PACK_OPENED_SLOTS, Spirits),
%         case check_pack_slot_empty(SpiritCols, EmptySlots) of
%             false -> throw({msg, ?SPIRIT_SLOT_NOT_AVAILABLE, ClientSender});
%             _ -> ok
%         end,

%         New = spirit_mod:update_spirits(Spirits, SpiritCols),
%         game_info:update(SpiritInfo#spiritinfo{spirits=New}),
%         notify(?SPIRIT_COLLECT_SUCC, ClientSender)
%     end,
%     ?PERFORM(F).

% %% @doc 装备神格
% equip(#m__spirit__equip__c2s{id=Id, slot_id=SlotId}, ClientSender) ->
%     F = fun() ->
%         #game_info{spiritinfo=SpiritInfo} = role_api:get_user_data(),
%         Spirits = SpiritInfo#spiritinfo.spirits,

%         Spirit = spirit_mod:spirit_key_find(Spirits, Id, #spirit.id, [?SPIRIT_AVAILABLE,?SPIRIT_EQUIPED]),
%         if Spirit == false ->
%             throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             true -> ok
%         end,

%         case check_spirit_legal([Id], Spirits) of
%             false -> throw({msg, ?SPIRIT_NOT_IN_PACK, ClientSender});
%             true -> ok
%         end,

%         Slots = SpiritInfo#spiritinfo.spiritslots,
%         Slot = lists:keyfind(SlotId, #spirit_slot.slot_id, Slots),

%         case Slot of
%             false -> throw({msg, ?SPIRIT_SLOT_NOT_EXIST, ClientSender});
%             #spirit_slot{} when Slot#spirit_slot.id =/= "0" -> 
%                 throw({msg, ?SPIRIT_SLOT_NOT_AVAILABLE, ClientSender});
%             #spirit_slot{} when Slot#spirit_slot.state =/= ?SPIRIT_SLOT_OPEN ->
%                 throw({msg, ?SPIRIT_SLOT_NOT_OPENED, ClientSender});
%             _ -> ok
%         end,

%         EquipedSpirits = [X||X <- Spirits, X#spirit.state == ?SPIRIT_EQUIPED],
%         case check_same_type(Spirit, EquipedSpirits) of
%             false -> throw({msg, ?SPIRIT_SAME_TYPE, ClientSender});
%             true -> ok
%         end,

%         NewSlots = case lists:keyfind(Id, #spirit_slot.id, Slots) of
%             false -> Slots;
%             #spirit_slot{} = Old ->
%                 lists:keyreplace(Id, #spirit_slot.id, Slots, Old#spirit_slot{id=?SPIRIT_EMPTY_SLOT_ID})
%         end,
        
%         NewSlots1 = lists:keyreplace(SlotId, #spirit_slot.slot_id, NewSlots, Slot#spirit_slot{id=Id}),
%         NewSpirits = lists:keyreplace(Id, #spirit.id, Spirits, Spirit#spirit{state=?SPIRIT_EQUIPED}),

%         game_info:update(SpiritInfo#spiritinfo{spirits=NewSpirits, spiritslots=NewSlots1}),
%         notify(?SPIRIT_EQUIP_SUCC, ClientSender)
%     end,
%     ?PERFORM(F).

% %% @doc 脱下神格
% off(#m__spirit__off__c2s{id=Id, slot_id=PackSlotId}, ClientSender) ->
%     F = fun() ->
%         #game_info{spiritinfo=SpiritInfo} = role_api:get_user_data(),

%         Spirits = SpiritInfo#spiritinfo.spirits,
%         Spirit = spirit_mod:spirit_key_find(Spirits, Id, #spirit.id, [?SPIRIT_EQUIPED]),
%         if Spirit == false ->
%             throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             true -> ok
%         end,

%         EmptySlots = spirit_mod:get_empty_slots(?SPIRIT_PACK_OPENED_SLOTS, Spirits),
%         case lists:member(PackSlotId, EmptySlots) of
%             false -> throw({msg, ?SPIRIT_SLOT_NOT_AVAILABLE, ClientSender});
%             true -> ok
%         end,

%         Slots = SpiritInfo#spiritinfo.spiritslots,
%         Slot = lists:keyfind(Id, #spirit_slot.id, Slots),
%         NewSlot = Slot#spirit_slot{id = ?SPIRIT_EMPTY_SLOT_ID},
%         NewSlots = lists:keyreplace(Id, #spirit_slot.id, Slots, NewSlot),

%         NewSpirit = Spirit#spirit{slot_id=PackSlotId, state=?SPIRIT_AVAILABLE},
%         NewSpirits = lists:keyreplace(Id, #spirit.id, Spirits, NewSpirit),
%         game_info:update(SpiritInfo#spiritinfo{spirits=NewSpirits, spiritslots=NewSlots}),
%         notify(?SPIRIT_OFF_SUCC, ClientSender)
%     end,
%     ?PERFORM(F).

% %% @doc 一键吞噬
% eat(#m__spirit__eat__c2s{ids=Ids}, ClientSender) ->
%     F = fun() ->
%         if length(Ids) < 2 ->
%             throw({msg, ?SPIRIT_ARG_ILLEGAL, ClientSender});
%             true -> ok
%         end,

%         #game_info{spiritinfo=SpiritInfo, role=Role} = role_api:get_user_data(),
%         Spirits = SpiritInfo#spiritinfo.spirits,
%         case check_spirit(Ids, Spirits, [?SPIRIT_AVAILABLE, ?SPIRIT_EQUIPED]) of
%             false -> throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             true -> ok
%         end,

%         EatSpirits = spirit_mod:build_spirits_by_id(Spirits, Ids, []),
%         FinalSpirit = spirit_mod:find_final_spirit(EatSpirits),
        
%         NewFinalSpirit = spirit_mod:eat_other_spirits(FinalSpirit, EatSpirits),

%         NewSpiritInfo = spirit_mod:update_spiritinfo_after_eat(NewFinalSpirit, Ids, SpiritInfo, Role),
%         game_info:update(NewSpiritInfo),

%         Final = lists:keyfind(NewFinalSpirit#spirit.id, #spirit.id, NewSpiritInfo#spiritinfo.spirits),
%         FinalSpirit2C = #p_spirit{
%                                 id = Final#spirit.id, 
%                                 spirit_id = Final#spirit.spirit_id, 
%                                 slot_id = Final#spirit.slot_id, 
%                                 exp = Final#spirit.exp,
%                                 state = Final#spirit.state
%                             },

%         %% 更新挑战成就任务状态
%         update_quest_challenge2(Final),

%         Data = #m__spirit__eat__s2c{final_spirit=FinalSpirit2C},
%         ClientSender ! {send, Data}
%     end,
%     ?PERFORM(F).

% %% @doc 拖拽吞噬
% drageat(#m__spirit__drageat__c2s{spirit_id=SpiritId, spirited_id=SpiritedId}, ClientSender) ->
%     F = fun() ->
%         #game_info{spiritinfo=SpiritInfo, role=Role} = role_api:get_user_data(),
%         Spirits = SpiritInfo#spiritinfo.spirits,
%         case check_spirit([SpiritId, SpiritedId], Spirits, [?SPIRIT_AVAILABLE, ?SPIRIT_EQUIPED]) of
%             false -> throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             true -> ok
%         end,

%         Spirit = lists:keyfind(SpiritId, #spirit.id, Spirits), % 吞噬的
%         Spirited = lists:keyfind(SpiritedId, #spirit.id, Spirits), % 被吞噬的
%         EquipedSpirits = [X||X <- Spirits, X#spirit.state == ?SPIRIT_EQUIPED],
        
%         if Spirit#spirit.state =:= ?SPIRIT_AVAILABLE andalso Spirited#spirit.state =:= ?SPIRIT_EQUIPED ->
%             case check_same_type(Spirit, lists:delete(Spirited, EquipedSpirits)) of
%                 false -> throw({msg, ?SPIRIT_SAME_TYPE, ClientSender});
%                 true -> ok
%             end;
%             true ->ok
%         end,

%         NewSpirit = spirit_mod:eat_other_spirits(Spirit, [Spirited, Spirit]),
%         NewSpiritInfo = spirit_mod:update_spiritinfo_after_drageat(Spirited, NewSpirit, SpiritInfo, Role),
%         game_info:update(NewSpiritInfo),

%         Final = lists:keyfind(SpiritId, #spirit.id, NewSpiritInfo#spiritinfo.spirits),
%         FinalSpirit2C = #p_spirit{
%                             id = Final#spirit.id, 
%                             spirit_id = Final#spirit.spirit_id, 
%                             slot_id = Final#spirit.slot_id, 
%                             exp = Final#spirit.exp, 
%                             state = Final#spirit.state
%                         },

%         %% 更新挑战成就任务状态
%         update_quest_challenge2(Final),

%         Data = #m__spirit__eat__s2c{final_spirit=FinalSpirit2C},
%         ClientSender ! {send, Data}
%     end,
%     ?PERFORM(F).

% %% @doc 移动
% move(#m__spirit__move__c2s{id=Id, slot_id=SlotId}, ClientSender) ->
%     F = fun() ->
%         #game_info{spiritinfo=SpiritInfo} = role_api:get_user_data(),
%         Spirits = SpiritInfo#spiritinfo.spirits,
%         Old = spirit_mod:spirit_key_find(Spirits, Id, #spirit.id, [?SPIRIT_AVAILABLE]),
%         case Old of
%             false -> throw({msg, ?SPIRIT_NOT_EXIST, ClientSender});
%             _ -> ok
%         end,

%         EmptySlots = spirit_mod:get_empty_slots(?SPIRIT_PACK_OPENED_SLOTS, Spirits),
%         case lists:member(SlotId, EmptySlots) of
%             false -> throw({msg, ?SPIRIT_SLOT_NOT_AVAILABLE, ClientSender});
%             _ -> ok
%         end,    

%         New = Old#spirit{slot_id=SlotId},
%         NewSpirits = lists:keyreplace(Id, #spirit.id, Spirits, New),
%         game_info:update(SpiritInfo#spiritinfo{spirits=NewSpirits}),
%         notify(?SPIRIT_MOVE_SUCC, ClientSender)
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% %% 检测从客户端传来的神格Id和格子Id不重复
% check_legal(SpiritCols) ->
%     SpiritIds = lists:foldl(fun(X, Ids) -> 
%                     case lists:member(X#p_spirit_col.id, Ids) of 
%                         true -> [false|Ids];
%                         false -> [X#p_spirit_col.id|Ids]
%                     end
%                 end, [], SpiritCols),

%     SlotIds = lists:foldl(fun(X, Ids1) -> 
%                     case lists:member(X#p_spirit_col.slot_id, Ids1) of 
%                         true -> [false|Ids1];
%                         false -> [X#p_spirit_col.slot_id|Ids1]
%                     end
%                 end, [], SpiritCols),

%     not lists:member(false, SpiritIds) andalso not lists:member(false, SlotIds).

% %% 检测客户端传来的神格Id是否存在
% check_spirit([], _, _) -> 
%     true;
% check_spirit([D|DataList], Spirits, States) ->
%     X = case D of
%         #p_spirit_col{} -> D#p_spirit_col.id;
%         _ -> D
%     end,
%     case spirit_mod:spirit_key_find(Spirits, X, #spirit.id, States) of
%         false -> false;
%         _ -> check_spirit(DataList, Spirits, States)
%     end.

% %%
% check_collect_again([], _) ->
%     true;
% check_collect_again([S|SpiritCols], Spirits) ->
%     Spirit = spirit_mod:spirit_key_find(Spirits, S#p_spirit_col.id, #spirit.id, [?SPIRIT_AVAILABLE]),
%     case Spirit#spirit.slot_id of
%         0 -> check_collect_again(SpiritCols, Spirits);
%         _ -> false
%     end.

% check_pack_slot_empty([], _) -> 
%     true;
% check_pack_slot_empty([D|DataList], EmptySlots) ->
%     case is_integer(D) of
%         false -> SlotId = D#p_spirit_col.slot_id;
%         true -> SlotId = D
%     end,
%     case lists:member(SlotId, EmptySlots) of
%         false -> false;
%         true -> check_pack_slot_empty(DataList, EmptySlots)
%     end.

% %%
% check_same_type(_, []) ->
%     true;
% check_same_type(Spirit, [Spirit2|EquipedSpirits]) ->
%     SpiritCfg = spirit_cfg:get(Spirit#spirit.spirit_id),
%     Type = SpiritCfg#spirit_cfg.type,
%     SpiritCfg2 = spirit_cfg:get(Spirit2#spirit.spirit_id),
%     Type2 = SpiritCfg2#spirit_cfg.type,
%     if Type2 =:= Type ->
%         if Spirit#spirit.state =:= ?SPIRIT_EQUIPED ->
%             check_same_type(Spirit, EquipedSpirits);
%             true -> false
%         end;
%         true -> check_same_type(Spirit, EquipedSpirits)
%     end.

% %%
% open_slot([], _, Slots) ->
%     Slots;
% open_slot([Id|Ids], Level, Slots) ->
%     SlotCfg = spirit_slot_cfg:get(Id),
%     NewSlots = case Level >= SlotCfg#spirit_slot_cfg.level of 
%         true ->
%             Slot = lists:keyfind(Id, #spirit_slot.slot_id, Slots),
%             NewSlot = Slot#spirit_slot{state=?SPIRIT_SLOT_OPENED},
%             lists:keyreplace(Id, #spirit_slot.slot_id, Slots, NewSlot);
%         false -> Slots
%     end,
%     open_slot(Ids, Level, NewSlots).

% %%
% check_spirit_legal([], _) ->
%     true;
% check_spirit_legal([Id|Ids], Spirits) ->
%     Spirit = lists:keyfind(Id, #spirit.id, Spirits),
%     case Spirit#spirit.slot_id of
%         ?SPIRIT_INSHOP -> false;
%         _ -> check_spirit_legal(Ids, Spirits)
%     end.

% update_quest_challenge1(#spirit{} = Spirit) ->
%     challenge_api:update_task_process(?CHALLENGE_TYPE_SPIRIT_NUM, 0, 1),
%     case spirit_cfg:get(Spirit#spirit.spirit_id) of
%         #spirit_cfg{} = SpCfg ->
%             challenge_api:update_task_process(?CHALLENGE_TYPE_SPIRIT_QUALITY, SpCfg#spirit_cfg.quality, 1),
%             challenge_api:update_task_process(?CHALLENGE_TYPE_SPIRIT_ID, SpCfg#spirit_cfg.spirit_id, 1);
%         Other -> 
%             ?ERROR_MSG("case error:~p~n", [Other]),
%             false
%     end;
% update_quest_challenge1(_) -> false.

% update_quest_challenge2(Spirit) ->
%     Cfg = spirit_cfg:get(Spirit#spirit.spirit_id),
%     LCfg = get_spirit_cfg([{X, Y} || {X, Y} <- spirit_level_cfg:get_all(), X =:= Cfg#spirit_cfg.quality], Spirit#spirit.exp),
%     Level = 
%     case LCfg of
%         false -> 1;
%         _ -> LCfg#spirit_level_cfg.level
%     end,
%     challenge_api:update_task_process(?CHALLENGE_TYPE_SPIRIT_LEVEL, Level, 1).

% get_cfg_by_exp(Quality, Exp) ->
%     get_spirit_cfg([{X, Y} || {X, Y} <- spirit_level_cfg:get_all(), X =:= Quality], Exp).

% get_spirit_cfg([], _Exp) -> false;
% get_spirit_cfg([H|T], Exp) -> 
%     if H >= Exp -> 
%         Cfg = spirit_level_cfg:get(H),
%         Cfg;
%         true -> get_spirit_cfg(T, Exp)
%     end.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.
