%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(spirit_mod).
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("logger.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([
%         build_p_spiritinfo/1, 
%         gen_new_spirit/2,
%         build_new_spirit_2c/1,
%         build_new_npcs/2,
%         get_empty_slots/2,
%         spirit_key_find/4,
%         update_spirits/2,
%         find_final_spirit/1,
%         build_spirits_by_id/3,
%         eat_other_spirits/2,
%         update_spiritinfo_after_eat/4,
%         update_spiritinfo_after_drageat/4
%         ]).

% -define(SPIRIT_EMPTY_SLOT_ID, "0").

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% 构建神格信息,返回给客户端
% build_p_spiritinfo(SpiritInfo) ->
%     #spiritinfo{spirits=Spirits, spiritslots=SpiritSlots, spiritnpc=SpiritNpc} = SpiritInfo,
%     #p_spiritinfo{
%       slots = build_p_spirit_slot(SpiritSlots),
%       all = build_p_all_spirit(Spirits),
%       npcs = SpiritNpc#spirit_npc.npcs
%     }.

% %% 生成猎取的新神格
% gen_new_spirit(NpcCfg, RoleId) ->
%     SpiritChances = NpcCfg#spirit_npc_cfg.spirit_chances,
%     Sum = lists:sum([Y#spirit_chance.chance || Y <- SpiritChances]),
%     RandomNum = rand_srv:random(1, Sum),
%     Tem = get_spirit_tem(SpiritChances, RandomNum),
%     SpiritTem = spirit_cfg:get(Tem#spirit_chance.spirit_id),
%     Id = id_srv:gen_spirit_id(),
%     #spirit{
%         id = Id,
%         role_id = RoleId,
%         spirit_id = SpiritTem#spirit_cfg.spirit_id,
%         exp = SpiritTem#spirit_cfg.exp,
%         slot_id = 0,
%         state = ?SPIRIT_AVAILABLE
%     }.

% %% 返回客户端所需的新神格信息
% build_new_spirit_2c(New) ->
%     #p_spirit{
%         id = New#spirit.id,
%         spirit_id = New#spirit.spirit_id,
%         slot_id = New#spirit.slot_id,
%         exp = New#spirit.exp,
%         state = New#spirit.state
%     }.

% %% 玩家点击女神之后，更新已激活的女神状态
% build_new_npcs(NpcId, ActiveNpcs) ->
%     case NpcId =:= ?SPIRIT_LAST_NPC of
%         false -> NextNpcId = NpcId + 1;
%         true -> NextNpcId = ?SPIRIT_FIRST_NPC
%     end,
%     NPC = spirit_npc_cfg:get({NextNpcId, 1}),
%     RandomNum1 = rand_srv:random(1, 100),
%     case RandomNum1 =< NPC#spirit_npc_cfg.chance of
%         false ->
%             NewNpcs = ActiveNpcs-(1 bsl (NpcId-1));
%         true -> 
%             NextNpcState = util:get_state_by_binary(ActiveNpcs, NextNpcId, ?SPIRIT_NPC_NUM),
%             if NextNpcState =:= ?SPIRIT_NPC_ACTIVE ->
%                     NewNpcs = ActiveNpcs-(1 bsl (NpcId-1));
%                 true ->
%                     NewNpcs = ActiveNpcs-(1 bsl (NpcId-1))+(1 bsl (NextNpcId-1))
%             end
%     end,
%     Npcs = case abs(NewNpcs) rem 2 of
%                 0 -> NewNpcs + 1;
%                 _ -> abs(NewNpcs)
%            end,
%     Npcs.

% %% 取得神格背包空闲状态的格子
% get_empty_slots(Slots, Spirits) ->
%     [X || X <- Slots, spirit_key_find(Spirits, X, #spirit.slot_id, [?SPIRIT_AVAILABLE]) == false].

% %% 按条件查找神格
% spirit_key_find(Spirits, Key, N, State) ->
%     lists:keyfind(Key, N, [X||X<-Spirits, lists:member(X#spirit.state, State)]).

% %% 更新玩家拾取的神格信息
% update_spirits(Spirits, []) ->
%     Spirits;
% update_spirits(Spirits, [SpiritCol|SpiritCols]) ->
%     Old = spirit_key_find(Spirits, SpiritCol#p_spirit_col.id, #spirit.id, [?SPIRIT_AVAILABLE]),
%     New = Old#spirit{slot_id=SpiritCol#p_spirit_col.slot_id},
%     update_spirits(lists:keyreplace(SpiritCol#p_spirit_col.id, #spirit.id, Spirits, New), SpiritCols).

% %% @doc 根据Id构造完整的神格结构体
% build_spirits_by_id(Spirits, [Id|Ids], EatSpirits) ->
%     build_spirits_by_id(Spirits, Ids, EatSpirits++[lists:keyfind(Id, #spirit.id, Spirits)]);
% build_spirits_by_id(_, [], EatSpirits) ->
%     EatSpirits.

% %% @doc 找到最终剩下的神格
% find_final_spirit(Spirits) ->
%     AllTems = [spirit_cfg:get(X)||X <- [X#spirit.spirit_id||X <- Spirits]],    % 所有吞噬神格的原始配置模板
%     Quality = lists:max([X#spirit_cfg.quality || X <- AllTems]),               % 最高品质
%     BestQualityTmp = [X#spirit_cfg.spirit_id||X <- AllTems, X#spirit_cfg.quality =:= Quality],     % 最高品质所属的模块
%     BestQualitySpirits = [X||X <- Spirits, lists:member(X#spirit.spirit_id, BestQualityTmp)],     % 最高品质的神格
%     HighestExp = lists:max([X#spirit.exp||X <- BestQualitySpirits]),               % 最高经验
%     FinalSpirits = [X||X <- Spirits, X#spirit.exp =:= HighestExp],
%     [FinalSpirit|_] = lists:reverse(FinalSpirits),
%     FinalSpirit.

% %% @doc 
% eat_other_spirits(FinalSpirit, EatSpirits) ->
%     [First|_] = EatSpirits,
%     NewExp = lists:sum([X#spirit.exp||X <- EatSpirits]),
%     FinalSpirit#spirit{exp=NewExp, slot_id=First#spirit.slot_id}.

% update_spiritinfo_after_eat(Spirit, Ids, SpiritInfo, Role) ->
%     FinalId = Spirit#spirit.id,
%     Spirits = SpiritInfo#spiritinfo.spirits,
%     F = fun(Id, Spirits1) when Id =/= FinalId -> 
%                 DeletedSpirit = lists:keyfind(Id, #spirit.id, Spirits1),
%                 ?SPIRIT_MSG(Role#role.account_id, Role#role.role_id, DeletedSpirit#spirit.id, ?USED),
%                 lists:keyreplace(Id, #spirit.id, Spirits1, DeletedSpirit#spirit{state=?SPIRIT_NOT_AVAILABLE});
%             (_, Spirits1) -> lists:keyreplace(FinalId, #spirit.id, Spirits1, Spirit)
%     end,
%     NewSpirits = lists:foldl(F, Spirits, Ids),
%     SpiritInfo#spiritinfo{spirits = NewSpirits}.

% %% 情况很多 1.背包里吞背包里的 2.背包里吞装备上的 3.装备上吞背包里的 4.装备上吞装备上的
% update_spiritinfo_after_drageat(Spirited, Spirit, SpiritInfo, Role) ->
%     Id = Spirit#spirit.id,
%     Id1 = Spirited#spirit.id,
%     Spirits = SpiritInfo#spiritinfo.spirits,
%     Slots = SpiritInfo#spiritinfo.spiritslots,
    
%     NewSpiritInfo = 
%         case lists:keyfind(Id1, #spirit_slot.id, Slots) of
%             false -> % 被吞的在背包里，生成后的精魄在背包里，原因有两个:1.背包里吞背包里的 2.装备上的吞背包里的
%                 case lists:keyfind(Id, #spirit_slot.id, Slots) of
%                     false -> 
%                         % 两者都在背包里，重新赋值格子位置即可。
%                         New = Spirit#spirit{slot_id = Spirited#spirit.slot_id},
%                         Delete = Spirited#spirit{state = ?SPIRIT_NOT_AVAILABLE},

%                         L = lists:keyreplace(Id, #spirit.id, Spirits, New),
%                         L1 = lists:keyreplace(Id1, #spirit.id, L, Delete),
                        
%                         SpiritInfo#spiritinfo{spirits = L1};
%                     #spirit_slot{} = S ->  % 装备槽里吞背包里的，生成的精魄更改状态并且重新赋值格子id
%                         New = Spirit#spirit{slot_id = Spirited#spirit.slot_id, state = ?SPIRIT_AVAILABLE},
%                         Delete = Spirited#spirit{state = ?SPIRIT_NOT_AVAILABLE},

%                         L = lists:keyreplace(Id, #spirit.id, Spirits, New),
%                         L1 = lists:keyreplace(Id1, #spirit.id, L, Delete),

%                         NewSlots = lists:keyreplace(Id, #spirit_slot.id, Slots, S#spirit_slot{id = ?SPIRIT_EMPTY_SLOT_ID}),
%                         SpiritInfo#spiritinfo{spirits = L1, spiritslots = NewSlots}
%                 end;
%             #spirit_slot{} = S1 -> % 被吞的在装备槽里，生成后的精魄在装备槽里，原因有两个:1.装备槽里吞装备槽里的 2.背包里的吞装备槽里的
%                 case lists:keyfind(Id, #spirit_slot.id, Slots) of
%                     false -> % 背包里吞装备槽里的，更改自身状态，更改装备槽状态
%                         New = Spirit#spirit{state = ?SPIRIT_EQUIPED},
%                         Delete = Spirited#spirit{state = ?SPIRIT_NOT_AVAILABLE},

%                         L = lists:keyreplace(Id, #spirit.id, Spirits, New),
%                         L1 = lists:keyreplace(Id1, #spirit.id, L, Delete),

%                         NewSlots = lists:keyreplace(Id1, #spirit_slot.id, Slots, S1#spirit_slot{id = Id}),
%                         SpiritInfo#spiritinfo{spirits = L1, spiritslots = NewSlots};
%                     #spirit_slot{} = S ->  % 装备槽里吞装备槽里的，相应装备槽状态改变
%                         Delete = Spirited#spirit{state = ?SPIRIT_NOT_AVAILABLE},

%                         NewS1 = S1#spirit_slot{id = Id},
%                         NewS = S#spirit_slot{id = ?SPIRIT_EMPTY_SLOT_ID},

%                         L = lists:keyreplace(Id, #spirit.id, Spirits, Spirit),
%                         L1 = lists:keyreplace(Id1, #spirit.id, L, Delete),

%                         SlotsL = lists:keyreplace(Id, #spirit_slot.id, Slots, NewS),
%                         SlotsL1 = lists:keyreplace(Id1, #spirit_slot.id, SlotsL, NewS1),

%                         SpiritInfo#spiritinfo{spirits = L1, spiritslots = SlotsL1}
%                 end
%         end,

%     ?SPIRIT_MSG(Role#role.account_id, Role#role.role_id, Delete#spirit.id, ?USED),
%     NewSpiritInfo.

% %%%===================================================================
% %%% internal API
% %%%===================================================================
% %% 构建已装备的神格信息
% build_p_spirit_slot(SpiritSlots) ->
%     [#p_spirit_slot{
%         slot_id = X#spirit_slot.slot_id,
%         id = X#spirit_slot.id
%     } || X <- SpiritSlots].

% %% %% 构建玩家拥有的所有神格信息,返回给客户端
% build_p_all_spirit(Spirits) ->
%     [#p_spirit{
%         id = X#spirit.id,
%         spirit_id = X#spirit.spirit_id,
%         slot_id = X#spirit.slot_id,
%         exp = X#spirit.exp,
%         state = X#spirit.state
%     } || X <- Spirits, X#spirit.state =:= ?SPIRIT_AVAILABLE orelse X#spirit.state =:= ?SPIRIT_EQUIPED].

% %% 通过随机数求取神格模板ID
% get_spirit_tem(Data, Num) ->
%     loop(Num, 0, Data).

% loop(Num, Sum, [D|Data]) ->
%     X = D#spirit_chance.chance, 
%     case Sum+X >= Num andalso Num >= Sum of
%         false -> loop(Num, Sum+X, Data);
%         true -> D
%     end.