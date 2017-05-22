%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2015, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2015-1-5 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(fight_mod).
% -include("logger.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([fight/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %%--------------------------------------------------------------------
% %% @doc 计算战斗力
% %% @spec
% %% @end
% %%--------------------------------------------------------------------
% % fighting ability
% fight(GameInfo) ->
%     V = role_value(GameInfo),
%     A = V('A'),
%     B = V('B'),
%     C = V('C'),
%     D = V('D'),
%     E = V('E'),
%     F = V('F'),
%     G = V('G'),
%     H = V('H'),
%     I = V('I'),
%     J = V('J'),
%     M = V('M'),
%     N = V('N'),
%     O = V('O'),
%     P = V('P'),
%     Q = V('Q'),
%     R = V('R'),

%     A1 = V(a),
%     B1 = V(b),
%     C1 = V(c),
%     D1 = V(d),
%     E1 = V(e),
%     F1 = V(f),
%     H1 = V(h),
%     G1 = V(g),
%     K1 = V(k),
%     L1 = V(l),
%     % O1 = V(o),
%     % P1 = V(p),
%     M1 = V(m),

%     % ?DEBUG_MSG("fight: ~p ~n", [{{a, A}, {b, B}, {c, C}, {d, D}, 
%     %             {e, E}, {f, F}, {g, G}, {h, H}, {i, I}, {j, J}, 
%     %             {m, M}, {o, O}, {p, P}, {q, Q}, {r, R}}]),

%     X = (B+C*B1)*(1+H*F1)*(1+I*G1)*(1+F*H1) * K1,


%     Y = (A*A1)*(1+D*F1)*(1+E*F1)*(1+G*H1)*(1+J*G1)* L1,
%     Z = ((N+C1)/C1)*((M+D1)/D1)*E1,

%     Fight = erlang:trunc((X+Y+M1*O+M1*P+F1*Q+F1*R)*Z),
%     ?DEBUG_MSG("fight final: ~p ~n", [Fight]),
%     Fight.


% %% A=生命
% %% B=物理攻击
% %% C=技能攻击
% %% D=物理防御率=物理防御/(物理防御*1.12+100+等级*150)(参考属性计算公式)
% %% E=技能防御率=技能防御/(技能防御*1.12+100+等级*150)(参考属性计算公式)
% %% F=伤害率
% %% G=免伤率
% %% H=穿透率
% %% I=暴击率
% %% J=抗暴率
% %% M=技能等级和(战斗技能等级求和)
% %% O=破甲伤害
% %% P=减免伤害
% %% Q=物理防御
% %% R=技能防御


% %% a=生命系数=0.1
% %% b=技能攻击系数=2
% %% c=等级相关数值=400
% %% d=技能等级相关数值=500
% %% e=战斗力修正系数=1
% %% f=防御率、穿透率系数=0.4
% %% h=伤害率、免伤率系数=0.4
% %% g=暴击率、抗暴率系数=0.3
% %% k=伤害属性修正系数=1
% %% l=防御属性修正系数=1
% %% m=破甲伤害、减免伤害修正系数=5

% %% X = (B+C*b)*(1+H*f)*(1+I*g)*(1+F*h)*k
% %% Y = (A*a)*(1+D*f)*(1+E*f)*(1+G*h)*(1+J*g)*l
% %% Z = ((N+c)/c)*((M+d)/d)*e
% %% fight = (X+Y+m*O+m*P)*Z
% %% fight =（X+Y+m*O+m*P+f*Q+f*R）*Z

% %% 武力=1智力=2物理攻击=3技能攻击=4物理防御=5技能防御=6生命=7生命率=8伤害率=9物理伤害率=10
% %% 技能伤害率=11伤害等级=12物理伤害等级=13技能伤害等级=14免伤率=15物理免伤率=16技能免伤率=17免伤等级=18物理免伤等级=19技能免伤等级=20
% %% 穿透率=21物理穿透率=22技能穿透率=23暴击率=24物理暴击率=25技能暴击率=26暴击等级=27物理暴击等级=28技能暴击等级=29抗暴率=30
% %% 物理抗暴率=31技能抗暴率=32抗暴等级=33物理抗暴等级=34技能抗暴等级=35命中率=36物理命中率=37技能命中率=38命中等级=39物理命中等级=40
% %% 技能命中等级=41闪避率=42物理闪避率=43技能闪避率=44闪避等级=45物理闪避等级=46技能闪避等级=47穿透等级=48物理穿透等级=49技能穿透等级=50
% %% 暴击伤害=51暴击伤害等级=52瞬发伤害=53持续伤害=54吸收伤害=55晕迷=56冰冻=57沉默=58改变移动速度=59隐身=60治疗=61破甲伤害=62减免伤害=63
% % A = 7
% % B = 3
% % C = 4
% % D = 5
% % E = 6

% % F = 9
% % G = 15
% % H = 21
% % I = 24
% % J = 30
% % O = 62
% % P = 63

% %% bonus
% % √ cultivate
% % √ universe
% % √ equip
% % √ spirit

% v(a) -> 0.1;
% v(b) -> 2;
% v(c) -> 400;
% v(d) -> 500;
% v(e) -> 1;
% v(f) -> 0.4;
% v(h) -> 0.4;
% v(g) -> 0.3;
% v(k) -> 1;
% v(l) -> 1;
% v(m) -> 5.

% role_value(GameInfo) ->
%     Role = GameInfo#game_info.role,
%     Job = Role#role.job,
%     Lev = Role#role.level,

%     RoleCfg = role_cfg:get({Job, Lev}),
%     CharacterCfg = main_character_cfg:get(Job),

%     A = RoleCfg#role_cfg.base_life,
%     B = RoleCfg#role_cfg.base_attack,
%     C = RoleCfg#role_cfg.base_magic_attack,
%     D = RoleCfg#role_cfg.base_defense,
%     E = RoleCfg#role_cfg.base_magic_defense,
    
%     F = CharacterCfg#main_character_cfg.base_attack_chance,
%     G = CharacterCfg#main_character_cfg.base_resist_chance,
%     H = CharacterCfg#main_character_cfg.base_penetration_chance,
%     I = CharacterCfg#main_character_cfg.base_critical_attack_chance,
%     J = CharacterCfg#main_character_cfg.base_critical_defense_chance,

%     Skills = GameInfo#game_info.skills,
%     M = lists:sum([ Spell#spell.level || Spell <- lists:concat([X#skill.skills || X <- Skills#skills.all])]),
%     N = Lev,

%     O = 0,
%     P = 0,

%     {A1, B1, C1, D1, E1, F1, G1, H1, I1, J1, O1, P1, Force1, Intelligence1} = bonus(
%         {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, all_plus(GameInfo)),
%     % ?DEBUG_MSG("base life:~p~nAdd life:", [A, A1]),

%     Force = RoleCfg#role_cfg.base_force + Force1,
%     Intelligence = RoleCfg#role_cfg.base_intelligence + Intelligence1, 

%     Pdf = CharacterCfg#main_character_cfg.physic_defence_factor,
%     Sdf = CharacterCfg#main_character_cfg.skill_defence_factor,
%     Paf = CharacterCfg#main_character_cfg.physic_attack_factor,
%     Saf = CharacterCfg#main_character_cfg.skill_attack_factor,

%     Q = D + (2+N*0.07) * Pdf * Force + D1,
%     R = E + (1+N*0.05) * Sdf * Intelligence +E1,



%     fun
%         ('A') -> A+A1;
%         ('B') -> B + (2+N*0.1) * Paf * Force  + B1;
%         ('C') -> C + (1+N*0.05) * Saf * Intelligence + C1;
%         ('D') -> Q / (Q * 1.12 + 100 + Lev * 150);
%         ('E') -> R / (R * 1.12 + 100 + Lev * 150);
%         ('F') -> F+F1;
%         ('G') -> G+G1;
%         ('H') -> H+H1;
%         ('I') -> I+I1;
%         ('J') -> J+J1;
%         ('M') -> M;
%         ('N') -> N;
%         ('O') -> O+O1;
%         ('P') -> P+P1;
%         ('Q') -> Q;
%         ('R') -> R;
%          (Z) -> v(Z)
%     end.


% %% 所有属性加成
% all_plus(GameInfo) ->
%     #game_info{role=Role} = GameInfo,
%     Cultivate = GameInfo#game_info.cultivate,
%     CultivatePlus = [
%         %#plus_attr{type=3, value=Cultivate#cultivate.attack},
%         % 生命改破甲
%         #plus_attr{type=62, value=Cultivate#cultivate.life},
%         #plus_attr{type=6, value=Cultivate#cultivate.skill_defense},
%         #plus_attr{type=4, value=Cultivate#cultivate.skill_attack},
%         #plus_attr{type=5, value=Cultivate#cultivate.defense}],


%     Universe = GameInfo#game_info.universe,
%     UniversePlus = universe(Universe),

%     ItemInfo = GameInfo#game_info.item,
%     Equip = GameInfo#game_info.equip,
%     EquipPlus = equip(Role#role.job, ItemInfo, Equip),

%     SpiritInfo = GameInfo#game_info.spiritinfo,
%     SpiritPlus = spirit(SpiritInfo),

%     Boudoir = GameInfo#game_info.boudoir,
%     BoudoirPlus = boudoir(Boudoir),

%     WarriorPlus = warrior(GameInfo),

%     GroupTrain = group_train(GameInfo),

%     WingPlus = wing(Role#role.wing, ItemInfo),

%     TitlePlus = title(Role#role.title_id),

%     ?DEBUG_MSG("all plus:~p ~n", [{{cultivate, dump(CultivatePlus)}, {universe, dump(UniversePlus)}, {equip, dump(EquipPlus)},
%         {spirt, dump(SpiritPlus)}, {boudoir,dump(BoudoirPlus)}, {warrior, dump(WarriorPlus)}, {grouptrain, dump(GroupTrain)},
%         {wing, dump(WingPlus)},{title, dump(TitlePlus)}
%     }]),

%     CultivatePlus ++ EquipPlus ++ UniversePlus ++ SpiritPlus ++ BoudoirPlus ++ WarriorPlus ++ GroupTrain ++ WingPlus ++ TitlePlus.


% dump(L) ->
%     dump(7, L).

% dump(T, L) ->
%     lists:sum([V || #plus_attr{type=T1, value=V} <- L, T1 == T]).

% group_train(#game_info{group_member=GroupMember}) ->
%     [ begin
%         Cfg = group_training_cfg:get({K, V}),
%         #plus_attr{type=K, value=Cfg#group_training_cfg.num}
%       end || #p_kv{k=K, v=V} <-  GroupMember#group_member.attr_list].



% % 装备 + 镶嵌宝石

% %% 强化后装备属性=原始属性*（1+IntensifyConfig属性系数）+属性数值
% equip(JobId, ItemInfo, Equip) ->
%     L = [Equip#equip.weapon, Equip#equip.armor, Equip#equip.boots,
%         Equip#equip.helm, Equip#equip.necklace, Equip#equip.ring],


%     L2 = [begin
%         case item_api:get_info_by_id(ItemInfo, Id, [?ITEM_USE]) of
%             #item{item_id=ItemId, slots=Slots, level=Level} ->
%                 % gem
%                 Slots2 = [ S || S <- Slots, S /= 0, S /=1],
%                 Cfg = item_cfg:get(ItemId),
%                 case Cfg#item_cfg.can_intensify == ?YES of
%                     true ->
%                         IntensifyCfg = intensify_cfg:get({Cfg#item_cfg.sub_type, Level}),

%                         Id1 = IntensifyCfg#intensify_cfg.attr1idx,
%                         Id2 = IntensifyCfg#intensify_cfg.attr2idx,

%                         F = fun(#plus_attr{type=T, value=V}=R) ->
%                             case T of
%                                 Id1 ->
%                                     NewValue = erlang:trunc(V*(1+IntensifyCfg#intensify_cfg.attr1ratio) + IntensifyCfg#intensify_cfg.attr1num),
%                                     #plus_attr{type=T, value=NewValue};
%                                 Id2 ->
%                                     NewValue = erlang:trunc(V*(1+IntensifyCfg#intensify_cfg.attr2ratio) + IntensifyCfg#intensify_cfg.attr2num),
%                                     #plus_attr{type=T, value=NewValue};
%                                 _ -> R
%                             end
%                         end,
%                         [F(Attr) ||  Attr <- Cfg#item_cfg.plus_attr ] ++ [ (item_cfg:get(GemItemId))#item_cfg.plus_attr || GemItemId <- Slots2];
%                     false ->
%                         Cfg#item_cfg.plus_attr ++
%                         [ (item_cfg:get(GemItemId))#item_cfg.plus_attr || GemItemId <- Slots2]
%                 end;
%             _ -> []
%         end
%      end || Id <- L, Id /= 0],
%     L3 = [(item_api:get_info_by_id(ItemInfo, Id, [?ITEM_USE]))#item.item_id || Id <- L],
%     SuitPlus = get_suit_add(L3, JobId),
%     % ?DEBUG_MSG("suit plus attr for fight:~p~n", [SuitPlus]),
%     lists:flatten(L2) ++ SuitPlus.

% % 四象
% universe(#universe{id=Id}) -> 
%     Cfg = universe_cfg:get(Id),
% %%     Cfg#universe_cfg.plus_attr ++  艹
%     [#plus_attr{type=3, value=Cfg#universe_cfg.attack},
%     #plus_attr{type=4, value=Cfg#universe_cfg.skill_attack},
%     #plus_attr{type=5, value=Cfg#universe_cfg.defence},
%     #plus_attr{type=6, value=Cfg#universe_cfg.skill_defence},
%     #plus_attr{type=7, value=Cfg#universe_cfg.health}
%     ].

% % 女神
% spirit(SpiritInfo) ->
%     Slots = SpiritInfo#spiritinfo.spiritslots,
%     All = SpiritInfo#spiritinfo.spirits,
%     lists:flatten(
%         [begin
%             case lists:keyfind(Id, #spirit.id, All) of
%                 false -> [];
%                 #spirit{spirit_id=SpiritId, exp = Exp} ->
%                     Cfg = spirit_cfg:get(SpiritId),
%                     Id1 = Cfg#spirit_cfg.attr1idx,
%                     V1 = Cfg#spirit_cfg.attr1num,
%                     Id2 = Cfg#spirit_cfg.attr2idx,
%                     V2 = Cfg#spirit_cfg.attr2num,
%                     case spirit_api:get_cfg_by_exp(Cfg#spirit_cfg.quality, Exp) of
%                         false -> 
%                             ?ERROR_MSG("can't get spirit cfg:~p~n", [{Cfg, Exp}]),
%                             [];
%                         ICfg ->
%                             Value1 = erlang:trunc(V1*(1+ICfg#spirit_level_cfg.attr1ratio) + ICfg#spirit_level_cfg.attr1num),
%                             Value2 = erlang:trunc(V2*(1+ICfg#spirit_level_cfg.attr2ratio) + ICfg#spirit_level_cfg.attr2num),
%                             [
%                                 #plus_attr{type = Id1, value = Value1},
%                                 #plus_attr{type = Id2, value = Value2}
%                             ]
%                     end
%                 end
%             end || #spirit_slot{slot_id=_Sid, id=Id} <- Slots]).

% %% 神女阁
% boudoir(Boudoir) ->
%     Floor = Boudoir#boudoir.floor,
%     OpenedSeals = Boudoir#boudoir.opened_seals,
%     PlusAttrA = [[(boudoir_cfg:get({X, Y}))#boudoir_cfg.plus_attr || Y <- lists:seq(0, 6)] || X <- lists:seq(1, Floor - 1)],

%     PlusAttrB = lists:flatten([
%         begin
%             case util:get_state_by_binary(OpenedSeals, X, ?BOUDOIR_SEAL_NUM) of
%                 1 -> (boudoir_cfg:get({Floor, X}))#boudoir_cfg.plus_attr;
%                 0 -> []
%             end
%         end || X <- lists:seq(1, 6)]

%     ),

%     case OpenedSeals of
%         ?BOUDOIR_ALL_OPENED ->
%             lists:flatten(PlusAttrA ++ PlusAttrB ++ (boudoir_cfg:get(Floor, 0))#boudoir_cfg.plus_attr);
%         _ ->
%             lists:flatten(PlusAttrA ++ PlusAttrB)
%     end.

% warrior(#game_info{warrior=Ws, role_warrior=Rw}) ->
%     #role_warrior{strength=S, warrior_attach_id=Id} = Rw,
%     case warrior_api:get_warrior([Id], Ws) of
%         false -> [];
%         [W] ->
%             Cfg1 = warrior_cfg:get(W#warrior.warrior_id),
%             L1 = warrior_api:get_level(W),
%             L2 = case  L1 > Cfg1#warrior_cfg.wlevel of
%                 true -> Cfg1#warrior_cfg.wlevel;
%                 false -> L1
%             end,
%             Cfg2 = warrior_base_cfg:get({Cfg1#warrior_cfg.type, L2}),
%             Factor = Cfg1#warrior_cfg.attach_factor / 100,

%             %% 强化
%             SCfgs = [warrior_strengthen_cfg:get({K, V}) || #kv{k=K, v=V} <- S],
%             SAttrs = lists:foldl(
%                 fun(#warrior_strengthen_cfg{attr_id1=Id1,attr_v1=V1,attr_id2=Id2,attr_v2=V2}, Acc0) -> 
%                     Acc0 ++ [#kv{k=Id1,v=V1}, #kv{k=Id2,v=V2}];
%                     (false, Acc0) -> Acc0
%                 end, [], SCfgs),

%             %% 天赋
%             GAttrs = lists:concat([
%                 W#warrior.attr1,
%                 W#warrior.attr2,
%                 W#warrior.attr3,
%                 W#warrior.attr4,
%                 W#warrior.attr5,
%                 W#warrior.attr6
%             ]),

%             Values = SAttrs ++ GAttrs,

%             Attack = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 3]),
%             MagicAttack = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 4]),
%             Defense = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 5]),
%             MagicDefense = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 6]),
%             Life = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 7]),
%             Intelligence = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 2]),
%             Penetrate = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 62]),
%             Reduce = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 63]),
%             Force = lists:sum([V || #kv{k=K,v=V} <- Values, K =:= 1]),

%             L = [ 
%                 #plus_attr{type=3,  value=Factor * (Cfg2#warrior_base_cfg.attack * Cfg1#warrior_cfg.attack_factor + 
%                         Attack + Cfg2#warrior_base_cfg.force * Cfg1#warrior_cfg.force_factor * (2 + L2*0.1))},
%                 #plus_attr{type=4,  value=Factor * (Cfg2#warrior_base_cfg.magic_attack * Cfg1#warrior_cfg.magic_attack_factor + 
%                         MagicAttack + Cfg2#warrior_base_cfg.intelligence * Cfg1#warrior_cfg.intelligence_factor * (1 + L2*0.05))},
%                 #plus_attr{type=5,  value=Factor * (Cfg2#warrior_base_cfg.defense * Cfg1#warrior_cfg.defense_factor + 
%                         Defense + Cfg2#warrior_base_cfg.force * Cfg1#warrior_cfg.force_factor * (2 + L2*0.07))},
%                 #plus_attr{type=6,  value=Factor * (Cfg2#warrior_base_cfg.magic_defense * Cfg1#warrior_cfg.magic_defense_factor + 
%                         MagicDefense + Cfg2#warrior_base_cfg.intelligence * Cfg1#warrior_cfg.intelligence_factor * (1 + L2*0.06))},
%                 #plus_attr{type=7,  value=Factor * (Cfg2#warrior_base_cfg.life * Cfg1#warrior_cfg.life_factor + Life)},
%                 #plus_attr{type=2,  value=Factor * (Cfg2#warrior_base_cfg.intelligence * Cfg1#warrior_cfg.intelligence_factor + Intelligence)},
%                 #plus_attr{type=62, value=Factor * (Cfg2#warrior_base_cfg.penetrate * Cfg1#warrior_cfg.penetrate_factor + Penetrate)},
%                 #plus_attr{type=63, value=Factor * (Cfg2#warrior_base_cfg.reduce * Cfg1#warrior_cfg.reduce_factor + Reduce)},
%                 #plus_attr{type=1,  value=Factor * (Cfg2#warrior_base_cfg.force * Cfg1#warrior_cfg.force_factor + Force)}
%             ],  
%             ?DEBUG_MSG("warrior add:~p~n", [{L, Factor, Cfg2, Cfg1, Cfg2#warrior_base_cfg.magic_defense * Cfg1#warrior_cfg.magic_defense_factor, 
%                         MagicDefense, Cfg2#warrior_base_cfg.intelligence * Cfg1#warrior_cfg.intelligence_factor * (1 + L2*0.06)}]),
%             L
%     end.

% wing(Id, ItemInfo) ->
%     case item_api:get_info_by_id(ItemInfo, Id, [?ITEM_USE]) of
%         #item{item_id=ItemId, level=Level} ->
%             Cfg = item_cfg:get(ItemId),
%             case Cfg#item_cfg.can_intensify == ?YES of
%                 true ->
%                     ICfg = wing_cfg:get({ItemId, Level}),
%                     Id1 = ICfg#wing_cfg.attr1idx,
%                     Id2 = ICfg#wing_cfg.attr2idx,
%                     Id3 = ICfg#wing_cfg.attr3idx,
%                     Id4 = ICfg#wing_cfg.attr4idx,
%                     Id5 = ICfg#wing_cfg.attr5idx,
%                     F = fun(#plus_attr{type=T, value=V}=R) ->
%                             case T of
%                                 Id1 ->
%                                     NewValue = erlang:trunc(V*(1+ICfg#wing_cfg.attr1ratio)),
%                                     #plus_attr{type=T, value=NewValue};
%                                 Id2 ->
%                                     NewValue = erlang:trunc(V*(1+ICfg#wing_cfg.attr2ratio)),
%                                     #plus_attr{type=T, value=NewValue};
%                                 Id3 ->
%                                     NewValue = erlang:trunc(V*(1+ICfg#wing_cfg.attr3ratio)),
%                                     #plus_attr{type=T, value=NewValue};
%                                 Id4 ->
%                                     NewValue = erlang:trunc(V*(1+ICfg#wing_cfg.attr4ratio)),
%                                     #plus_attr{type=T, value=NewValue};
%                                 Id5 ->
%                                     NewValue = erlang:trunc(V*(1+ICfg#wing_cfg.attr5ratio)),
%                                     #plus_attr{type=T, value=NewValue};
%                                 _ -> R
%                             end
%                     end,
%                     [F(Attr) ||  Attr <- Cfg#item_cfg.plus_attr ];
%                 false ->
%                     Cfg#item_cfg.plus_attr
%             end;
%         _ -> []
%     end.

% bonus({_A, _B, _C, _D, _E, _F, _G, _H, _I, _J, _O, _P, _F, _I}=Base, Plus) ->
%     lists:foldl(
%         fun
%             (#plus_attr{type=7,  value=V}, Acc) -> incr(1, Acc, V);
%             (#plus_attr{type=3,  value=V}, Acc) -> incr(2, Acc, V);
%             (#plus_attr{type=4,  value=V}, Acc) -> incr(3, Acc, V);
%             (#plus_attr{type=5,  value=V}, Acc) -> incr(4, Acc, V);
%             (#plus_attr{type=6,  value=V}, Acc) -> incr(5, Acc, V);
%             (#plus_attr{type=9,  value=V}, Acc) -> incr(6, Acc, V);
%             (#plus_attr{type=15, value=V}, Acc) -> incr(7, Acc, V);
%             (#plus_attr{type=21, value=V}, Acc) -> incr(8, Acc, V);
%             (#plus_attr{type=24, value=V}, Acc) -> incr(9, Acc, V);
%             (#plus_attr{type=30, value=V}, Acc) -> incr(10, Acc, V);
%             (#plus_attr{type=62, value=V}, Acc) -> incr(11, Acc, V);
%             (#plus_attr{type=63, value=V}, Acc) -> incr(12, Acc, V);
%             (#plus_attr{type=1,  value=V}, Acc) -> incr(13, Acc, V);
%             (#plus_attr{type=2,  value=V}, Acc) -> incr(14, Acc, V);
%             (_, Acc) -> Acc
%         end, Base, Plus
%     ).


% get_suit_add(Equips, Job) ->
%     All = suit_cfg:get_all(),
%     Fun = fun({JobId, Idx}, Acc0) when JobId == Job ->
%             Cfg = suit_cfg:get({JobId, Idx}),
%             EquipLen = 6 - length(Cfg#suit_cfg.items-- Equips),
%             if  EquipLen >= 2 ->
%                     %?DEBUG_MSG("suit debug msg:~p~n", [{EquipLen, Cfg#suit_cfg.items, Equips}]),
%                     Acc0 ++ lists:sublist(Cfg#suit_cfg.add2 ++
%                         Cfg#suit_cfg.add3 ++
%                         Cfg#suit_cfg.add4 ++
%                         Cfg#suit_cfg.add5 ++
%                         Cfg#suit_cfg.add6, EquipLen - 1);
%                 true -> Acc0
%             end;
%         (_, Acc0) -> Acc0
%     end,
%     Add = lists:foldl(Fun, [], All),

%     [#plus_attr{type=K, value=V} || [K, V] <- Add].


% incr(Index, Term, Num) ->
%     V = erlang:element(Index, Term),
%     erlang:setelement(Index, Term, V+Num).

% title(Id) ->
%        ICfg = title_cfg:get(Id),
%        if ICfg == false -> [];
%           true ->
%             Attr1 = #plus_attr{type=ICfg#title_cfg.attr1idx, value = ICfg#title_cfg.attr1num},
%             Attr2 = #plus_attr{type=ICfg#title_cfg.attr2idx, value = ICfg#title_cfg.attr2num},
%             Attr3 = #plus_attr{type=ICfg#title_cfg.attr3idx, value = ICfg#title_cfg.attr3num},
%             Attr4 = #plus_attr{type=ICfg#title_cfg.attr4idx, value = ICfg#title_cfg.attr4num},
%             Attr5 = #plus_attr{type=ICfg#title_cfg.attr5idx, value = ICfg#title_cfg.attr5num},
%             [Attr1, Attr2, Attr3, Attr4, Attr5]
%         end.



% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
