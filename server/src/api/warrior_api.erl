%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-2-24 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(warrior_api).
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").
% -include("common.hrl").

% -export([show/2, fight/2, rest/2, collect/2, collect_save/2, build/2, strengthen/2, warrior_info/2]).
% -export([attach/2, deattach/2]).
% -export([call1/2, call2/2, decompose/2, levelup/2, quality/2, add_exp1/2, add_soul1/2, add_soul2/2]).
% -export([unlock/2, wash/2]).
% -export([release_warrior/1, release_warrior/2, change_warrior/2, get_warrior/2, update_rand/3]).
% -export([rand/2]).
% -export([after_login/1, show_info/1]).

% -export([rand_cfg/2]).
% -export([add_warrior/2]).

% -export([warrior_len/1]).

% -export([init_slot1/1]).
% -export([build_p_warrior_info/2]).
% -export([handle_throw/1]).

% -export([get_level/1]).

% -define(FreeCollect, 3).

% -define(F1, 1).
% -define(F2, 2).
% -define(F3, 3).
% -define(F4, 4).
% -define(F5, 5).
% -define(F6, 6).
% -define(F7, 7).
% -define(F8, 8).
% -define(F9, 9).
% -define(F10, 10).
% -define(F11, 11).

% -define(MAX_W, 60).

% -define(MAX_F, 3).

% -define(FAIL_COLLECT, 3).
% -define(WARRIOR_NOTICE_QUALITY, 4).

% -define(FIRST_WARRIOR_ID_NORMAL, 130343).
% -define(FIRST_WARRIOR_ID_COIN, 130099).

% -define(CHANGE_SOUL_CONSUME, 10000).

% -define(RAND_CONSUME_COIN, 50).
% %% 1:蓝魂单次普通刷将
% %% 2:蓝魂单次必得蓝将
% %% 3:蓝魂10连抽必得蓝将
% %% 4:蓝魂10连抽普通得将
% %% 5:元宝单次普通刷将
% %% 6:元宝单次必得紫将
% %% 7:元宝10连抽必得紫将
% %% 8:元宝10连抽普通得将
% %% 9:武将召唤左
% %% 10:武将召唤中
% %% 11:武将召唤右

% %%%===================================================================
% %%% API
% %%%===================================================================
% show(#m__warrior__show__c2s{}, Sender) ->
%     Sender ! {send, show_info(role_api:get_user_data())}.

% show_info(GameInfo) ->
%     #game_info{warrior=Warrior, role_warrior=RoleWarrior, daily=Daily} = GameInfo,
%     #role_warrior{warrior_id=WarriorId, soul1=S1, soul2=S2, collects=Collects,
%     consume_type=CT, consume_num=_CN, ccount=Count, strength=Strength,
%     cd=Cd, rands=Rands} = RoleWarrior,

%     Free = case Daily#daily.warrior_collect >= ?FreeCollect of
%         true -> 0;
%         _ -> ?FreeCollect - Daily#daily.warrior_collect
%     end,

%     PStrength = [#p_strength{idx=Id, value=V} || #kv{k=Id, v=V} <- Strength],
%     {Souls, Count1} = if CT == 0 -> {[], 0}; true -> {[#p_soul{type=K, num=V} || #kv{k=K, v=V} <- Collects], Count} end,
%     [A1, B1, C1, T1] = Rands,
%     {ok, T2, A2, B2, C2} = warrior_srv:info(),

%     {T, A, B, C} =
%     case T1 > T2 of
%         true -> {T1, A1, B1, C1};
%         false -> {T2, A2, B2, C2}
%     end,

%     game_info:update(RoleWarrior#role_warrior{rands=[A,B,C,T]}),


%     #m__warrior__show__s2c{
%         free_collect = Free,
%         consume_type = CT,
%         warrior_id = WarriorId,
%         souls = Souls,
%         collect_count = Count1,
%         soul1=S1,
%         soul2=S2,
%         cd1 = Daily#daily.warrior_call_cd,
%         cd2 = Cd,
%         call_daily_count = Daily#daily.warrior_call,
%         call_count = RoleWarrior#role_warrior.callcount,
%         call_count1 = RoleWarrior#role_warrior.callcount1,
%         warriors = build_p_warrior(Warrior),
%         strength = PStrength,
%         rand_time = T,
%         ids = [A, B, C],
%         called = [
%             begin
%                 case lists:member(I, RoleWarrior#role_warrior.called) of
%                     true -> ?YES;
%                     false -> ?NO
%                 end
%             end|| I <- [A, B, C]],
%         collectsave =  Daily#daily.collectsave
%      }.

% after_login(Sender) ->
%     #game_info{role_warrior=RoleWarrior, daily=Daily} = role_api:get_user_data(),
%     Sender ! {send,
%         #m__warrior__count__s2c{
%             cd1 = Daily#daily.warrior_call_cd,
%             cd2 = RoleWarrior#role_warrior.cd,
%             call_daily_count = Daily#daily.warrior_call,
%             call_count = RoleWarrior#role_warrior.callcount,
%             call_count1 = RoleWarrior#role_warrior.callcount1
%         }
%     }.


% % 集魂
% collect(#m__warrior__collect__c2s{type=Type}, Sender) ->
%     #game_info{role=Role, role_warrior=RoleWarrior, daily=Daily} = role_api:get_user_data(),
%     #role_warrior{collects=Collects, consume_type=CT1, consume_num=CN, ccount=CCount} = RoleWarrior,

%     CollectSaveLimitCfg = viprelate_cfg:get(Role#role.vip),
%     CannotSave = Daily#daily.collectsave > CollectSaveLimitCfg#viprelate_cfg.collect_soul_times,

%     CT = if CT1 == 0 -> Type; true -> CT1 end,

%     case CCount /= 0 of
%         true -> continue_collect;
%         false -> ok
%     end,

%     case CannotSave orelse CT == ?FAIL_COLLECT of
%         true ->  notify(?WARRIOR_COLLECT_FAIL, Sender);
%         false ->
%             Cfg = warrior_collect_cfg:get({CCount+1, CT}),
%             Consume = Cfg#warrior_collect_cfg.consume,

%             Pay =
%                 case CT of
%                     1 ->
%                         case Daily#daily.warrior_collect < 3 of
%                             true -> ok;
%                             false ->
%                                 role_api:pay_gold(Consume, Sender)
%                         end;
%                     2 ->
%                         role_api:pay_coin(Consume, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender)
%                 end,

%             Fail = not (rand_srv:random(100) =< Cfg#warrior_collect_cfg.succ_chance),

%             case Pay of
%                 false ->
%                     notify(?WARRIOR_COLLECT_PAY_FAIL, Sender);
%                 _ when Fail ->
%                     notify(?WARRIOR_COLLECT_FAIL, Sender),
%                     game_info:update(RoleWarrior#role_warrior{consume_type=?FAIL_COLLECT, consume_num=CN+Consume, ccount=CCount+1}),
%                     game_info:update(Daily#daily{warrior_collect=Daily#daily.warrior_collect+1}),
%                     ok;
%                 _ ->
%                     [#kv{v=V1}|_] = Collects,
%                     [Min, Max] = Cfg#warrior_collect_cfg.produc_range,
%                     Collects2 = [#kv{k=CT, v=V1 + rand_srv:random(Min, Max)}],

%                     case RoleWarrior#role_warrior.collect_flag of
%                         ?NO ->
%                             % 第一次集魂 送50个蓝魂
%                             S1 = RoleWarrior#role_warrior.soul1 + 50,
%                             Sender ! {send, #m__role__update_attr__s2c{attr_type=?WARRIOR_SOUL1, value=S1, channel=?ATTR_CHANNEL_QUIET}},
%                             game_info:update(RoleWarrior#role_warrior{consume_type=CT, soul1=S1, consume_num=CN+Consume, ccount=CCount+1, collects=Collects2, collect_flag=?YES});
%                         _ ->
%                             game_info:update(RoleWarrior#role_warrior{consume_type=CT, consume_num=CN+Consume, ccount=CCount+1, collects=Collects2})
%                     end,
%                     game_info:update(Daily#daily{warrior_collect=Daily#daily.warrior_collect+1}),
%                     living_api:warrior_collect(Sender),
%                     Sender ! {send, #m__warrior__collect__s2c{
%                         souls=[#p_soul{type=K, num=V} || #kv{k=K, v=V} <- Collects2]}}
%             end
%     end.


% % 收割
% collect_save(#m__warrior__collect_save__c2s{}, Sender) ->
%     #game_info{role=Role, role_warrior=RoleWarrior, daily = Daily} = role_api:get_user_data(),
%     #role_warrior{soul1=S1, soul2=S2, collects=Collects, consume_type=CT1} = RoleWarrior,

%     CollectSaveLimitCfg = viprelate_cfg:get(Role#role.vip), %% 每日集魂收取次数根据vip等级而定
%     case CT1 of
%         0 -> notify(?WARRIOR_COLLECT_SAVE_FAIL, Sender);
%         _ when Daily#daily.collectsave < CollectSaveLimitCfg#viprelate_cfg.collect_soul_times ->
%             [#kv{k=K, v=V} | _] = Collects,
%             {S11, S22} = case K of
%                              1 -> {S1+V, S2};
%                              2 -> {S1, S2+V}
%                          end,
%             game_info:update(RoleWarrior#role_warrior{soul1=S11, soul2=S22, consume_type=0, consume_num=0, ccount=0, collects=?COLLECT_INIT}),
%             game_info:update(Daily#daily{collectsave = Daily#daily.collectsave+1}),
%             notify(?WARRIOR_COLLECT_SAVE_SUCC, Sender);
%         _ -> notify(?WARRIOR_COLLECT_SAVE_FAIL, Sender)
%     end.

% % 出战
% fight(#m__warrior__fight__c2s{id=Id}, Sender) ->
%     #game_info{role=Role, warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),
%     #role_warrior{warrior_id = Wids, warrior_attach_id = _Aid} = RoleWarrior,

%     Names = fun(WId) ->
%         Cfg = warrior_cfg:get(WId),
%         Cfg#warrior_cfg.warrior_name
%         end,

%     case get_warrior([Id|Wids], Warrior) of
%         false ->
%             notify(?WARRIOR_FIGHT_FAIL, Sender);
%         [W | Ws] ->
%             Len = length(Wids),
%             CannotFight = if
%                 Len == 1 ->
%                     Role#role.level < 30;
%                 Len == 2 ->
%                     Role#role.level < 45;
%                 Len >= 3 ->
%                     true;
%                 true -> false
%             end,
%             Fname = Names(W#warrior.warrior_id),
%             Fnames = [ Names(Wi#warrior.warrior_id) || Wi <- Ws],

%             case CannotFight orelse lists:member(Fname, Fnames) orelse lists:member(W#warrior.idx, Wids) of
%                 true ->
%                     notify(?WARRIOR_FIGHT_FAIL, Sender);
%                 false ->
%                     Cfg = warrior_cfg:get(W#warrior.warrior_id),
%                     case Cfg#warrior_cfg.type == 1 andalso W#warrior.state == ?FREE of
%                         true ->
%                             notify(?WARRIOR_FIGHT_SUCC, Sender),
%                             RoleWarrior1 =
%                                 case RoleWarrior#role_warrior.warrior_attach_id == Id of
%                                     true -> RoleWarrior#role_warrior{warrior_id=[Id|Wids], warrior_attach_id=0};
%                                     false -> RoleWarrior#role_warrior{warrior_id=[Id|Wids]}
%                                 end,
%                             game_info:update(RoleWarrior1),
%                             % 更新武将出战类任务
%                             quest_api:add_quest_process(?QUEST_EVENT_TYPE_WARRIOR_FIGHT, 0, 0);
%                         false ->
%                             notify(?WARRIOR_FIGHT_FAIL, Sender)
%                     end
%             end;
%         _ ->
%             notify(?WARRIOR_FIGHT_FAIL, Sender)
%     end.


% % 休息
% rest(#m__warrior__rest__c2s{id=Id}, _Sender) ->
%     #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),
%     #role_warrior{warrior_id=Wids} = RoleWarrior,
%     case lists:member(Id, Wids) of
%         true -> game_info:update(RoleWarrior#role_warrior{warrior_id=Wids -- [Id]});
%         false -> ok
%     end.

% %
% attach(#m__warrior__attach__c2s{idx=Idx}, Sender) ->
%     #game_info{role_warrior=RoleWarrior, warrior=Warrior} = role_api:get_user_data(),
%     #role_warrior{warrior_id = Wids} = RoleWarrior,

%     case get_warrior([Idx], Warrior) of
%         false -> notify(?WARRIOR_NO_LEGAL8, Sender);
%         [W] when W#warrior.idx == RoleWarrior#role_warrior.warrior_attach_id ->
%             notify(?WARRIOR_SUCC2, Sender);
%         [W] ->
%             Cfg = warrior_cfg:get(W#warrior.warrior_id),
%             case Cfg#warrior_cfg.type == 1 andalso W#warrior.state == ?FREE of
%                 true ->
%                     game_info:update(RoleWarrior#role_warrior{warrior_id = Wids -- [Idx], warrior_attach_id = Idx}),
%                     % 更新武将出战类任务
%                     quest_api:add_quest_process(?QUEST_EVENT_TYPE_WARRIOR_ATTACH, 0, 0),
%                     notify(?WARRIOR_SUCC2, Sender);
%                 false ->
%                     notify(?WARRIOR_NO_LEGAL8, Sender),
%                     ok
%             end;
%         _ ->
%             notify(?WARRIOR_NO_LEGAL8, Sender)
%     end.

% %
% deattach(#m__warrior__deattach__c2s{}, _Sender) ->
%     #game_info{role_warrior=RoleWarrior, warrior=Ws} = role_api:get_user_data(),
%     #role_warrior{warrior_attach_id=Id} = RoleWarrior,
%     case get_warrior([Id], Ws) of
%         false -> ok;
%         _ ->
%             game_info:update(RoleWarrior#role_warrior{warrior_attach_id=0})
%     end.



% % 武魂精炼
% build(#m__warrior__build__c2s{type=Type}, Sender) ->
%     #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),
%     #role_warrior{soul1=N1, soul2=N2} = RoleWarrior,
    
%     F = fun() ->
%         IsEnough = 
%             case Type of 
%                 1 -> role_api:is_enough_gold(?CHANGE_SOUL_CONSUME);
%                 2 -> role_api:is_enough_gold(?CHANGE_SOUL_CONSUME * 10);
%                 _ -> throw({msg, ?PARAMS_ERROR, Sender})
%             end,

%         if not IsEnough ->
%             throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,

%         Result =
%             case Type of
%                 1 -> build_fun(N1, N2, 1);
%                 2 -> build_fun(N1, N2, 10);
%                 _ -> false
%             end,

%         case Result of
%             {A, B} ->
%                 case Type of
%                     1 -> role_api:pay_gold(?CHANGE_SOUL_CONSUME, Sender);   %% 精炼一次10000块，十次100000
%                     2 -> role_api:pay_gold(?CHANGE_SOUL_CONSUME * 10, Sender);
%                     _ -> false
%                 end,
%                 game_info:update(RoleWarrior#role_warrior{soul1=A, soul2=B}),
%                 notify(?WARRIOR_BUILD_SUCC, Sender);
%             _ ->
%                 notify(?WARRIOR_BUILD_FAIL, Sender)
%         end
%     end,
%     ?PERFORM(F).


% % 强化
% strengthen(#m__warrior__strengthen__c2s{idx=Idx}, Sender) ->
%     #game_info{role=Role, warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),
%     #role_warrior{strength=S, soul1=S1, soul2=S2} = RoleWarrior,
%     F = fun() ->
%         case Warrior of
%             [] -> throw({msg, ?WARRIOR_STRENGTH_FAIL, Sender});
%             _ -> ok
%         end,

%         #kv{k=K, v=Level} = lists:nth(Idx, S),

%         case Level >= Role#role.level of
%             true -> throw({msg, ?REQUIRE_LEVEL, Sender});
%             _ -> ok
%         end,

%         Cfg = warrior_strengthen_cfg:get({Idx, Level+1}),
%         case Cfg of
%             false -> notify(?WARRIOR_STRENGTH_FAIL, Sender);
%             _ -> ok
%         end,

%         case S1 < Cfg#warrior_strengthen_cfg.s1 orelse
%             S2 < Cfg#warrior_strengthen_cfg.s2 orelse
%             (not role_api:is_enough_gold(Cfg#warrior_strengthen_cfg.consume)) of
%             true ->throw({msg, ?NO_MONEY, Sender});
%             false -> ok
%         end,

%         role_api:pay_gold(Cfg#warrior_strengthen_cfg.consume, Sender),

%         NewS = l_insert(S, Idx, #kv{k=K, v=Level+1}),
%         game_info:update(RoleWarrior#role_warrior{
%             strength=NewS,
%             soul1=S1-Cfg#warrior_strengthen_cfg.s1,
%             soul2=S2-Cfg#warrior_strengthen_cfg.s2}),
%         notify(?WARRIOR_STRENGTH_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% unlock(#m__warrior__unlock__c2s{id=Id, slot=Slot}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, warrior=Warriors} = role_api:get_user_data(),
%         [Warrior] = get_warrior([Id], Warriors),
%         Cfg = warrior_attr_cfg:get(Slot),

%         case Role#role.level < Cfg#warrior_attr_cfg.level of
%             true -> throw({msg, ?WARRIOR_UNLOCK_FAIL, Sender});
%             _ -> ok
%         end,

%         Attr = lists:nth(Slot, [
%             Warrior#warrior.attr1,
%             Warrior#warrior.attr2,
%             Warrior#warrior.attr3,
%             Warrior#warrior.attr4,
%             Warrior#warrior.attr5,
%             Warrior#warrior.attr6]),

%         Cfg = warrior_attr_cfg:get(Slot),
%         WCfg = warrior_cfg:get(Warrior#warrior.warrior_id),

%         Next = length(Attr) + 1,

%         case WCfg#warrior_cfg.soul_type of
%             1 when Next > Cfg#warrior_attr_cfg.blue ->
%                 throw({msg, ?WARRIOR_UNLOCK_FAIL, Sender});
%             _ when Next > Cfg#warrior_attr_cfg.purple ->
%                 throw({msg, ?WARRIOR_UNLOCK_FAIL, Sender});
%             _ -> ok
%         end,

%         Coin =
%             case length(Attr) + 1 of
%                 2 -> Cfg#warrior_attr_cfg.consume_unlock2;
%                 3 -> Cfg#warrior_attr_cfg.consume_unlock3;
%                 4 -> Cfg#warrior_attr_cfg.consume_unlock4;
%                 _ -> throw({msg, ?WARRIOR_NO_LEGAL1, Sender}) % max
%             end,

%         Pool =  Cfg#warrior_attr_cfg.attr_pool -- [I#kv.k || I <- Attr],

%         AttrId = lists:nth(rand_srv:random(length(Pool)), Pool),

%         Range = lists:keyfind(AttrId, #warrior_attr_range.id, Cfg#warrior_attr_cfg.attr_range),
%         Value = rand_srv:random(Range#warrior_attr_range.min, Range#warrior_attr_range.max),


%         NewAttr = Attr ++ [#kv{k=AttrId, v=Value}],

%         NewWarrior =
%             case Slot of
%                 1 -> Warrior#warrior{attr1=NewAttr};
%                 2 -> Warrior#warrior{attr2=NewAttr};
%                 3 -> Warrior#warrior{attr3=NewAttr};
%                 4 -> Warrior#warrior{attr4=NewAttr};
%                 5 -> Warrior#warrior{attr5=NewAttr};
%                 6 -> Warrior#warrior{attr6=NewAttr};
%                 _ -> throw({msg, ?WARRIOR_UNLOCK_FAIL, Sender})
%             end,

%         NewWarriors = lists:keyreplace(Id, #warrior.idx, Warriors, NewWarrior),

%         role_api:pay_coin(Coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         game_info:update(warrior, NewWarriors),
%         F = fun(#kv{k=AId, v=V}) -> #p_warrior_attr{id = AId, value=V } end,
%         Sender ! {send, #m__warrior__unlock__s2c{id=Id, attr=[ F(I) || I <- NewAttr]}}
%     end,
%     ?PERFORM(F).


% wash(#m__warrior__wash__c2s{id=Id, type=T, slot=Slot, lock1=L1, lock2=L2, lock3=L3, lock4=L4}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, warrior=Warriors, role_warrior=RoleWarrior} = role_api:get_user_data(),
%         [Warrior] = get_warrior([Id], Warriors),
%         Cfg = warrior_attr_cfg:get(Slot),

%         case Role#role.level  < Cfg#warrior_attr_cfg.level of
%             true -> throw({msg, ?WARRIOR_WASH_FAIL, Sender});
%             _ -> ok
%         end,

%         if Slot > 6 -> throw({msg, ?WARRIOR_WASH_FAIL, Sender}); true -> ok end,

%         Attr = lists:nth(Slot, [
%             Warrior#warrior.attr1,
%             Warrior#warrior.attr2,
%             Warrior#warrior.attr3,
%             Warrior#warrior.attr4,
%             Warrior#warrior.attr5,
%             Warrior#warrior.attr6]),

%         AttrLen = length(Attr),
%         Locks = lists:sublist([L1, L2, L3, L4], AttrLen),
%         LockNum = lists:sum(Locks),


%         PayFun =
%             case T of
%                 1 ->
%                     Consume = Cfg#warrior_attr_cfg.consume_coin + Cfg#warrior_attr_cfg.consume_coin_when_lock * LockNum,
%                     case role_api:is_enough_coin(Consume) of
%                         false ->
%                             throw({msg, ?NO_MONEY, Sender});
%                         _ -> ok
%                     end,
%                     fun() -> role_api:pay_coin(Consume, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender) end;
%                 2 ->
%                     Consume = Cfg#warrior_attr_cfg.consume_soul + Cfg#warrior_attr_cfg.consume_soul_when_lock * LockNum,
%                     #role_warrior{soul2=Soul2} = RoleWarrior,
%                     if Soul2 < Consume -> throw({msg, ?NO_MONEY, Sender}); true -> ok end,
%                     fun() -> game_info:update(RoleWarrior#role_warrior{soul2=Soul2-Consume}) end
%             end,

%         OldPool = Cfg#warrior_attr_cfg.attr_pool,

%         LockAttr = [
%             if L1 == ?YES -> (lists:nth(1, Attr))#kv.k; true -> 0 end,
%             if L2 == ?YES -> (lists:nth(2, Attr))#kv.k; true -> 0 end,
%             if L3 == ?YES -> (lists:nth(3, Attr))#kv.k; true -> 0 end,
%             if L4 == ?YES -> (lists:nth(4, Attr))#kv.k; true -> 0 end],

%         Pool = OldPool -- LockAttr,

%         {_, _, NewAttrs} =
%             lists:foldl(fun(_, {List, Len, Acc}) ->
%                 R = rand_srv:random(Len),
%                 V = lists:nth(R, List),
%                 {List -- [V], Len-1, [V|Acc]}
%             end, {Pool, length(Pool), []}, lists:reverse(lists:seq(1, AttrLen))),


%         ZipF = fun(Lock, _, OldAttr) when Lock == ?YES -> OldAttr;
%             (_, AttrId, _) ->
%                 Range = lists:keyfind(AttrId, #warrior_attr_range.id, Cfg#warrior_attr_cfg.attr_range),
%                 Value = rand_srv:random(Range#warrior_attr_range.min, Range#warrior_attr_range.max),
%                 #kv{k=AttrId, v=Value}
%         end,

%         NewAttr = lists:zipwith3(ZipF, Locks, NewAttrs, Attr),

%         NewWarrior =
%             case Slot of
%                 1 -> Warrior#warrior{attr1=NewAttr};
%                 2 -> Warrior#warrior{attr2=NewAttr};
%                 3 -> Warrior#warrior{attr3=NewAttr};
%                 4 -> Warrior#warrior{attr4=NewAttr};
%                 5 -> Warrior#warrior{attr5=NewAttr};
%                 6 -> Warrior#warrior{attr6=NewAttr};
%                 _ -> throw({msg, ?WARRIOR_WASH_FAIL, Sender})
%             end,

%         NewWarriors = lists:keyreplace(Id, #warrior.idx, Warriors, NewWarrior),
%         PayFun(),
%         ?DEBUG_MSG("~p", [NewWarrior]),
%         game_info:update(warrior, NewWarriors),
%         F = fun(#kv{k=AId, v=V}) -> #p_warrior_attr{id = AId, value=V } end,
%         Sender ! {send, #m__warrior__wash__s2c{id=Id, attr=[ F(I) || I <- NewAttr]} }
%     end,
%     ?PERFORM(F).


% call1(#m__warrior__call1__c2s{id=Id}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),

%         case warrior_len(Warrior) < ?MAX_W of
%             false -> throw({msg, ?WARRIOR_NO_LEGAL2, Sender});
%             true -> ok
%         end,

%         Cfg = warrior_cfg:get(Id),
%         S1 = RoleWarrior#role_warrior.soul1,
%         S2 = RoleWarrior#role_warrior.soul2,

%         [A, B, C, _] = RoleWarrior#role_warrior.rands,

%         case lists:member(Id, RoleWarrior#role_warrior.called) of
%             true -> throw({msg, ?WARRIOR_NO_LEGAL2, Sender});
%             false -> ok
%         end,

%         case lists:member(Id, [A, B, C]) of
%             false ->
%                 throw({msg, ?WARRIOR_NO_LEGAL2, Sender});
%             true ->
%                 ok
%         end,

%         {CS1, CS2} =
%             case Cfg#warrior_cfg.soul_type of
%                 1 -> {Cfg#warrior_cfg.consume_soul, 0};
%                 2 -> {0, Cfg#warrior_cfg.consume_soul}
%             end,


%         case S1 >= CS1 andalso  S2 >= CS2 of
%             false ->
%                 throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,
%         {Nw, Warrior2} = new_warrior(Role, Id, Warrior),
%         %warrior_db:save(Nw),
%         game_info:update(warrior, Warrior2),

%         Called =  [Id | RoleWarrior#role_warrior.called],
%         game_info:update(RoleWarrior#role_warrior{soul1=S1-CS1, soul2=S2-CS2, called= Called }),
%         Sender ! {send, #m__warrior__call1__s2c{idx=Nw#warrior.idx, id=Nw#warrior.warrior_id}}

%     end,
%     ?PERFORM(F).

% % 白 1
% % 绿 2
% % 蓝 3,4,5
% % 紫 6

% call2(#m__warrior__call2__c2s{type=T}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, daily=Daily, warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),
%         Cfg = warrior_call2_cfg:get(T),

%         #warrior_call2_cfg{gold=Gold, coin=Coin, s1=Soul1, s2=Soul2} = Cfg,

%         Now = ?NOW,

%         PayCheck =
%             fun(free) -> true;
%                ({PayGold, PayCoin, PayS1, PayS2}) ->
%                 role_api:is_enough_gold(PayGold) andalso
%                 role_api:is_enough_coin(PayCoin) andalso
%                 RoleWarrior#role_warrior.soul1 >= PayS1 andalso
%                 RoleWarrior#role_warrior.soul2 >= PayS2
%             end,

%         GoPay =
%             fun(Pay, RoleWarrior3, Sender1) ->
%                 RoleWarrior2 =
%                     case RoleWarrior3 of
%                         false -> RoleWarrior;
%                         _ -> RoleWarrior3
%                     end,

%                 {PayGold, PayCoin, PayS1, PayS2} =
%                     case Pay of
%                         free -> {0, 0, 0, 0};
%                         _ -> Pay
%                     end,

%                 role_api:pay_gold(PayGold, Sender1),
%                 role_api:pay_coin(PayCoin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender1),

%                 #role_warrior{soul1=OldS1, soul2=OldS2} = RoleWarrior2,
%                 case T of
%                     1 ->
%                         case Pay of
%                             free ->
%                                 % 每日免费次数
%                                 game_info:update(Daily#daily{warrior_call_cd = Now, warrior_call = Daily#daily.warrior_call+1});
%                             _ -> ok
%                         end,
%                         case RoleWarrior2#role_warrior.callcount >= 10 of
%                             true ->
%                                 game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2, callcount=0});
%                             false ->
%                                 game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2, callcount=RoleWarrior2#role_warrior.callcount+1})
%                         end;
%                     2 ->
%                         NewCd = case Pay of
%                             free -> Now;
%                             _ -> RoleWarrior2#role_warrior.cd
%                         end,
                        
%                         case RoleWarrior2#role_warrior.callcount1 >= 10 of
%                             true ->
%                                 game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2, cd=NewCd, callcount1=0});
%                             false ->
%                                 game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2, cd=NewCd, callcount1=RoleWarrior2#role_warrior.callcount1+1})
%                         end;
%                     3 ->
%                         game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2});
%                     4 ->
%                         game_info:update(RoleWarrior2#role_warrior{soul1=OldS1-PayS1, soul2=OldS2-PayS2})
%                 end
%             end,

%         WLen = warrior_len(Warrior),

%         case WLen < ?MAX_W of
%             false -> throw({msg, ?WARRIOR_NO_LEGAL3, Sender});
%             true -> ok
%         end,


%         Warrior3 =
%             case T of
%                 1 when Daily#daily.warrior_call_cd == 0 ->
%                     FirstId = ?FIRST_WARRIOR_ID_NORMAL,
%                     {N, Warrior2} = new_warrior(Role, FirstId, Warrior),
%                     {free, false, [N], Warrior2};
%                 1 ->

% %%                     ?DEBUG_MSG("warrior!!! ~p ~n", [{Now, Daily#daily.warrior_call_cd, Cfg#warrior_call2_cfg.cd}]),

%                     IsCd = Now < Daily#daily.warrior_call_cd + Cfg#warrior_call2_cfg.cd,

%                     Pay =
%                         case Daily#daily.warrior_call < 10 of
%                             true when not IsCd -> free;
%                             _ -> {Gold, Coin, Soul1, Soul2}
%                         end,

%                     case PayCheck(Pay) of
%                         true ->
%                             Id2 = if RoleWarrior#role_warrior.callcount >= 10 -> ?F2; true -> ?F1 end,
%                             {Counts, WId} = rands(Id2, RoleWarrior#role_warrior.rand_counts),
%                             {N, Warrior2} = new_warrior(Role, WId, Warrior),
%                             {Pay, RoleWarrior#role_warrior{rand_counts=Counts}, [N], Warrior2};
%                         false -> {false, ?NO_MONEY}
%                     end;

%                 2 when RoleWarrior#role_warrior.cd == 0 ->
%                     FirstID = ?FIRST_WARRIOR_ID_COIN,
%                     {N, Warrior2} = new_warrior(Role, FirstID, Warrior),
%                     {free, false, [N], Warrior2};

%                 2  ->
%                     IsCd =  Now < RoleWarrior#role_warrior.cd + Cfg#warrior_call2_cfg.cd,
%                     Pay =
%                         case IsCd  of
%                             false -> free;
%                             true -> {Gold, Coin, Soul1, Soul2}
%                         end,

%                     case PayCheck(Pay) of
%                         true ->
%                             Id2 = if RoleWarrior#role_warrior.callcount1 >= 10 -> ?F6; true -> ?F5 end,
%                             {Counts, WId} = rands(Id2, RoleWarrior#role_warrior.rand_counts),
%                             {N, Warrior2} = new_warrior(Role, WId, Warrior),
%                             {Pay, RoleWarrior#role_warrior{rand_counts=Counts}, [N], Warrior2};
%                         false -> {false, ?NO_MONEY}
%                     end;
%                 3 when WLen =< (?MAX_W-10) ->
%                     Pay = {Gold, Coin, Soul1, Soul2},

%                     case PayCheck(Pay) of
%                         true ->
%                             {Counts, Id1} = rands(?F3, RoleWarrior#role_warrior.rand_counts),
%                             {N1, Warrior2} = new_warrior(Role, Id1, Warrior),
%                             {Ns, Ws, Counts2} =
%                                 lists:foldl(
%                                     fun(_, {L, W, C}) ->
%                                         {C1, Id3} = rands(?F4, C),
%                                         {N, Warrior4} = new_warrior(Role, Id3, W),
%                                         {[N|L], Warrior4, C1}
%                                     end,
%                                     {[N1], Warrior2, Counts}, lists:seq(1, 9)
%                                 ),
%                             {Pay, RoleWarrior#role_warrior{rand_counts=Counts2}, Ns, Ws};
%                         false -> {false, ?NO_MONEY}
%                     end;


%                 4 when WLen =< (?MAX_W-10) ->
%                     Pay = {Gold, Coin, Soul1, Soul2},
%                     case PayCheck(Pay) of
%                         true ->
%                             {Counts, Id1} = rands(?F7, RoleWarrior#role_warrior.rand_counts),
%                             {N1, Warrior2} = new_warrior(Role, Id1, Warrior),
%                             {Ns, Ws, Counts2} =
%                                 lists:foldl(
%                                     fun(_, {L, W, C}) ->
%                                         {C1, Id3} = rands(?F8, C),
%                                         {N, Warrior4} = new_warrior(Role, Id3, W),
%                                         {[N|L], Warrior4, C1}
%                                     end,
%                                     {[N1], Warrior2, Counts}, lists:seq(1, 9)
%                                 ),
%                             {Pay, RoleWarrior#role_warrior{rand_counts=Counts2}, Ns, Ws};
%                         false -> {false, ?NO_MONEY}
%                     end;
%                 _ ->
%                     {false, ?WARRIOR_NO_LEGAL3}
%             end,

%         case Warrior3 of
%             {false, Code} ->
%                 notify(Code, Sender);
%             {Pay1, RoleWarrior2, Ns1, Ws1} ->
%                 game_info:update(warrior, Ws1),
%                 %warrior_db:save_list(Ns1),

%                 GoPay(Pay1, RoleWarrior2, Sender),
%                 after_login(Sender),
%                 Sender ! {send, #m__warrior__call2__s2c{warriors=[#p_warrior_call2{idx=N#warrior.idx, id=N#warrior.warrior_id} || N <- Ns1]}}
%         end
%     end,
%     ?PERFORM(F).

% decompose(#m__warrior__decompose__c2s{idx=Idx}, Sender) ->
%     #game_info{warrior=Warrior,role=Role, role_warrior=RoleWarrior} = role_api:get_user_data(),
%     case (not lists:member(Idx, RoleWarrior#role_warrior.warrior_id)) andalso RoleWarrior#role_warrior.warrior_attach_id /= Idx of
%         false ->
%             notify(?WARRIOR_NO_LEGAL4, Sender),
%             false;
%         true ->
%             case get_warrior([Idx], Warrior) of
%                 false ->
%                     notify(?WARRIOR_NO_LEGAL5, Sender),
%                     ok;
%                 [W] ->
%                     Wid = W#warrior.warrior_id,
%                     Warrior2 = lists:keyreplace(Idx, #warrior.idx, Warrior, #warrior{role_id=Role#role.role_id, idx=Idx}),
%                     Cfg = warrior_cfg:get(Wid),
                    
%                     case Cfg#warrior_cfg.quality == 6 of
%                         false ->
%                             S1 = RoleWarrior#role_warrior.soul1 + Cfg#warrior_cfg.soul,
%                             game_info:update(RoleWarrior#role_warrior{soul1=S1});
%                         true ->
%                             S2 = RoleWarrior#role_warrior.soul2 + Cfg#warrior_cfg.soul,
%                             game_info:update(RoleWarrior#role_warrior{soul2=S2})
%                     end,
%                     game_info:update(warrior, Warrior2),
%                     notify(?WARRIOR_SUCC1, Sender)
%             end
%     end,
%     ok.

% levelup(#m__warrior__levelup__c2s{idx=Idx, idxs=Idxs1}, Sender) ->
%     F = fun() ->
%         #game_info{warrior=Warriors,role=Role, role_warrior=RoleWarrior} = role_api:get_user_data(),
%         #role_warrior{warrior_id=FightIds, warrior_attach_id=AttachId} = RoleWarrior,

%         Idxs = set(Idxs1),

%         case erlang:length(Idxs) > 8 orelse lists:member(Idx, Idxs) of
%             true -> throw({msg, ?WARRIOR_NO_LEGAL6, Sender});
%             false -> ok
%         end,

%         Warrior = 
%             case get_warrior([Idx], Warriors) of 
%                 false -> throw({msg, ?WARRIOR_NO_LEGAL6, Sender});
%                 [W] -> W
%             end,

%         Cfg = warrior_cfg:get(Warrior#warrior.warrior_id),
%         case role_api:is_enough_gold(Cfg#warrior_cfg.gold1 * erlang:length(Idxs)) of 
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,

%         EatenWarriors = 
%             case get_warrior(Idxs, Warriors) of 
%                 false -> throw({msg, ?WARRIOR_NO_LEGAL6, Sender});
%                 Ws -> Ws
%             end,

%         FreeCheck = lists:all(fun(X) -> (not lists:member(X#warrior.idx, FightIds ++ [AttachId])) orelse X#warrior.state == ?FREE end, EatenWarriors),
%         case FreeCheck of
%             false -> throw({msg, ?WARRIOR_NO_LEGAL6, Sender});
%             true ->
%                 Exp1 = lists:sum([ begin
%                     Wcfg = warrior_cfg:get(I#warrior.warrior_id),
%                     Wcfg#warrior_cfg.hasexp
%                 end || I <- EatenWarriors]) + Warrior#warrior.exp,

%                 Exp = final_exp(Exp1, Cfg, Role#role.level),

%                 Warriors2 = lists:keyreplace(Idx, #warrior.idx, Warriors, Warrior#warrior{exp=Exp}),
%                 Warriors3 =
%                     lists:foldl(
%                         fun(I, Acc) ->
%                             lists:keyreplace(I, #warrior.idx, Acc, #warrior{idx=I, role_id=Role#role.role_id})
%                         end,
%                         Warriors2, Idxs
%                     ),

%                 role_api:pay_gold(Cfg#warrior_cfg.gold1 * erlang:length(Idxs), Sender),
%                 notify(?WARRIOR_SUCC3, Sender),
%                 game_info:update(warrior, Warriors3)
%         end
%     end,
%     ?PERFORM(F).


% quality(#m__warrior__quality__c2s{idxs=Idxs}, Sender) ->
%     F = fun() ->
%         #game_info{warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),
%         [Id1|Ids] = Idxs,
%         [W1|Ws] =
%             case get_warrior(Idxs, Warrior) of
%                 false -> throw({msg, ?WARRIOR_NO_LEGAL7, Sender});
%                 L -> L
%             end,

%         Cfg = warrior_cfg:get(W1#warrior.warrior_id),

%         case Cfg#warrior_cfg.wids -- [ Ww#warrior.warrior_id || Ww <- Ws] of
%             [] -> ok;
%             _ -> throw({msg, ?WARRIOR_NO_LEGAL7, Sender})
%         end,

%         [use_guard(itemid, NItemId, NeedNum, Sender) || [NItemId, NeedNum] <- Cfg#warrior_cfg.items],

%         NeedExp = get_exp(Cfg#warrior_cfg.wlevel),
%         case W1#warrior.exp < NeedExp of
%             true -> throw({msg, ?WARRIOR_NO_LEGAL7, Sender});
%             false -> ok
%         end,

%         case
%         role_api:is_enough_coin(Cfg#warrior_cfg.coin) andalso
%             role_api:is_enough_gold(Cfg#warrior_cfg.gold) andalso
%             RoleWarrior#role_warrior.soul1 >= Cfg#warrior_cfg.s1 andalso
%             RoleWarrior#role_warrior.soul2 >= Cfg#warrior_cfg.s2 of
%             false ->
%                 throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,


%         Id = Cfg#warrior_cfg.nextid,
%         Warrior2 = lists:keyreplace(Id1, #warrior.idx, Warrior, W1#warrior{warrior_id=Id, exp=NeedExp}),

%         Warrior3 =
%             [begin
%                 case lists:member(W#warrior.idx, Ids) of
%                     true -> #warrior{role_id=W#warrior.role_id, idx=W#warrior.idx};
%                     false -> W
%                 end
%             end || W <- Warrior2],

%         role_api:pay_gold(Cfg#warrior_cfg.gold, Sender),
%         role_api:pay_coin(Cfg#warrior_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         game_info:update(RoleWarrior#role_warrior{
%             soul1=RoleWarrior#role_warrior.soul1-Cfg#warrior_cfg.s1,
%             soul2=RoleWarrior#role_warrior.soul2-Cfg#warrior_cfg.s2}),

%         RemoveList = lists:concat([begin
%             List1 = item_api:remove_by_item_id(NItemId, NeedNum),
%             [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- List1]
%         end || [NItemId, NeedNum] <- Cfg#warrior_cfg.items]),

%         Msg = #m__package__consume__s2c{items=RemoveList},
%         Sender ! {send, Msg},

%         notify(?WARRIOR_SUCC4, Sender),
%         game_info:update(warrior, Warrior3)
%     end,
%     ?PERFORM(F).


% rand(#m__warrior__rand__c2s{}, Sender) ->
%     #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),
%     case role_api:is_enough_coin(?RAND_CONSUME_COIN) of
%         true ->
%             [A, B, C, _] = RoleWarrior#role_warrior.rands,
%             [A1, B1, C1] = warrior_srv:rand_ws([A, B, C]),
%             game_info:update(RoleWarrior#role_warrior{rands=[A1,B1,C1,?NOW], called=[]}),
%             role_api:pay_coin(?RAND_CONSUME_COIN, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),

%             Sender ! {send, #m__warrior__rand__s2c{
%                 rand_time = ?NOW,
%                 ids = [A1, B1, C1],
%                 called = [?NO, ?NO, ?NO]
% %%                 called = [begin
% %%                     case lists:member(I, RoleWarrior#role_warrior.called) of
% %%                         true -> ?YES;
% %%                         false -> ?NO
% %%                     end
% %%                 end|| I <- [A1, B1, C1]]
%             }};
%         false ->
%             notify(?NO_MONEY, Sender)
%     end.


% add_exp1(Exp, _Sender) ->
%     #game_info{warrior=Warrior, role_warrior=RoleWarrior, role=Role} = role_api:get_user_data(),
%     Idx = RoleWarrior#role_warrior.warrior_id,
%     case get_warrior(Idx, Warrior) of
%         false -> ok;
%         Ws ->
%             Warrior2 =
%             lists:foldl(
%             fun(W, Wss) ->
%                 Cfg = warrior_cfg:get(W#warrior.warrior_id),
%                 case Cfg#warrior_cfg.type of
%                     1 ->
%                         Exp1 = final_exp(W#warrior.exp+Exp, Cfg, Role#role.level),
%                         lists:keyreplace(W#warrior.idx, #warrior.idx, Wss, W#warrior{exp=Exp1});
%                     _ -> Wss
%                 end

%             end, Warrior, Ws),
%             game_info:update(warrior, Warrior2)
%     end.

% add_soul1(Num, Sender) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     #game_info{role_warrior = RoleWarrior} = role_api:get_user_data(),
%     S1 = RoleWarrior#role_warrior.soul1 + Final,
%     game_info:update(RoleWarrior#role_warrior{soul1 = S1}),
%     Sender ! {send, #m__role__update_attr__s2c{attr_type=?WARRIOR_SOUL1, value=S1, channel=?ATTR_CHANNEL_NORMAL}}.

% add_soul2(Num, Sender) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     #game_info{role_warrior = RoleWarrior} = role_api:get_user_data(),
%     S1 = RoleWarrior#role_warrior.soul2 + Final,
%     game_info:update(RoleWarrior#role_warrior{soul2 = S1}),
%     Sender ! {send, #m__role__update_attr__s2c{attr_type=?WARRIOR_SOUL2, value=S1, channel=?ATTR_CHANNEL_NORMAL}}.

% %%%===================================================================
% %%% process functions
% %%%===================================================================
% release_warrior(Idx, _Sender) -> 
%     ?DEBUG_MSG("receive release warrior request:~p~n", [Idx]),
%     release_warrior(Idx).

% release_warrior(Idx) ->
%     #game_info{warrior=Warrior} = role_api:get_user_data(),
%     case get_warrior([Idx], Warrior) of
%         false -> false;
%         [W] when W#warrior.state  == ?FREE ->
%             true;
%         [W] when W#warrior.state /= ?FREE ->
%             W2 = lists:keyreplace(Idx, #warrior.idx, Warrior, W#warrior{state=?FREE}),
%             game_info:update(warrior, W2),
%             true;
%         _ -> false
%     end.

% change_warrior(_Idx, ?FIGHT) -> false;
% change_warrior(_Idx, ?ATTACH) -> false;
% change_warrior(Idx, Reason) ->
%     #game_info{warrior=Warrior, role_warrior=RoleWarrior} = role_api:get_user_data(),
%     case get_warrior([Idx], Warrior) of
%         false -> false;
%         [W] when W#warrior.state == Reason -> true;
%         [W] ->
%             W2 = lists:keyreplace(Idx, #warrior.idx, Warrior, W#warrior{state=Reason}),
%             game_info:update(warrior, W2),

%             case Idx of
%                 Idx when Idx == RoleWarrior#role_warrior.warrior_attach_id ->
%                     game_info:update(RoleWarrior#role_warrior{warrior_attach_id=0});
%                 _ ->
%                     game_info:update(RoleWarrior#role_warrior{warrior_id=RoleWarrior#role_warrior.warrior_id--[Idx]})
%             end,
%             true;
%         _ -> false
%     end.

% warrior_info(GameInfo, T) ->
%     #game_info{warrior=Warrior, role_warrior=RoleWarrior} = GameInfo,
%     #role_warrior{warrior_id=WarriorId, warrior_attach_id=WarriorId2, strength=Strength} = RoleWarrior,
%     Idx = case T of 1 -> WarriorId; 2 -> [WarriorId2] end,
%     case get_warrior(Idx, Warrior) of
%         false ->
%             [#p_warrior_info{
%                 idx = 0,
%                 warrior_id = 0,
%                 exp=0, state=0, attr1 = [], attr2 = [], attr3 = [], attr4 = [], attr5 = [], attr6 = [],
%                 strength= [#p_strength{idx=Id, value=V} || #kv{k=Id, v=V} <- Strength]}];
%         Ws ->
%             [build_p_warrior_info(R, Strength) || R <- Ws]
%     end.


% build_p_warrior_info(#warrior{idx=Idx, state=State, warrior_id=Wid, exp=Exp,
%     attr1 = C1, attr2 = C2, attr3 = C3, attr4 = C4, attr5 = C5, attr6 = C6}, Strength) ->

%     F = fun(#kv{k =Id, v = V}) ->
%         #p_warrior_attr{id = Id, value=V}
%     end,

%     PStrength = [#p_strength{idx=Id, value=V} || #kv{k=Id, v=V} <- Strength],
%     #p_warrior_info{
%         idx=Idx,
%         warrior_id = Wid,
%         exp=Exp,
%         state = State,
%         attr1 = [ F(I) || I <- C1],
%         attr2 = [ F(I) || I <- C2],
%         attr3 = [ F(I) || I <- C3],
%         attr4 = [ F(I) || I <- C4],
%         attr5 = [ F(I) || I <- C5],
%         attr6 = [ F(I) || I <- C6],
%         strength=PStrength
%     }.

% update_rand(Ids, RandTime, Sender) ->
%     #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),
%     game_info:update(RoleWarrior#role_warrior{rands=Ids ++ [RandTime]}),

%     Sender ! {send, #m__warrior__rand__s2c{
%         rand_time = RandTime,
%         ids = Ids,
%         called = [?NO, ?NO, ?NO]
% %%         called = [begin
% %%             case lists:member(I, RoleWarrior#role_warrior.called) of
% %%                 true -> ?YES;
% %%                 false -> ?NO
% %%             end
% %%         end|| I <- Ids]
%     }}.



% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% add_warrior(WId, Sender) ->
%     #game_info{role=Role, warrior=Warrior} = role_api:get_user_data(),
%     case warrior_len(Warrior) < ?MAX_W of
%         false -> false;
%         true ->
%             {Nw, Warrior2} = new_warrior(Role, WId, Warrior),
%             %warrior_db:save(Nw),
%             game_info:update(warrior, Warrior2),
%             Sender ! {send, #m__warrior__call1__s2c{idx=Nw#warrior.idx, id=Nw#warrior.warrior_id}},
%             true
%     end.

% final_exp(Exp, #warrior_cfg{wlevel=WLevel}, RoleLevel) ->
%     Level = if WLevel < RoleLevel -> WLevel; true -> RoleLevel end,
%     Cfg =
%     case warrior_level_cfg:get(Level+1) of
%         false -> warrior_level_cfg:get(Level);
%         O -> O
%     end,
%     MaxExp = Cfg#warrior_level_cfg.exp - 1,
%     if MaxExp < Exp -> MaxExp; true -> Exp end.

% get_level(#warrior{exp=Exp}) ->
%     get_level(Exp);
% get_level(Exp) ->
%     Keys = warrior_level_cfg:get_all(),

%     Levels = lists:filter(fun(K) -> get_exp(K) =< Exp end, Keys),
%     lists:last(Levels).

% get_exp(Level) ->
%     Cfg = warrior_level_cfg:get(Level),
%     Cfg#warrior_level_cfg.exp.


% new_warrior(Role, WarriorId, Ws) ->
%     %% 武将品质大于4并且不为可噬之魂时发时间公告
%     Cfg = warrior_cfg:get(WarriorId),
%     if Cfg#warrior_cfg.quality >= ?WARRIOR_NOTICE_QUALITY andalso Cfg#warrior_cfg.type =:= 1 ->
%         Notice = #chat_content{
%             role=#chat_role{role_name=Role#role.role_name, role_id=Role#role.role_id},
%             warrior=WarriorId
%         },
%         Msg = chat_mod:make_msg(?CHAT_WORLD, 26, [], Notice),
%         broadcast_api:server(Msg);
%         true -> ok
%     end,
%     InitF = fun(Index) ->
%                 WCfg = warrior_attr_cfg:get(Index),
%                 Pool = WCfg#warrior_attr_cfg.attr_pool,
%                 AttrId = lists:nth(rand_srv:random(length(Pool)), Pool),
%                 Range = lists:keyfind(AttrId, #warrior_attr_range.id, WCfg#warrior_attr_cfg.attr_range),
%                 Value = rand_srv:random(Range#warrior_attr_range.min, Range#warrior_attr_range.max),
%                 #kv{k=AttrId, v=Value}
%             end,

%      R = #warrior{role_id=Role#role.role_id, warrior_id=WarriorId, exp=0,
%              attr1 = [InitF(1)],
%              attr2 = [InitF(2)],
%              attr3 = [InitF(3)],
%              attr4 = [InitF(4)],
%              attr5 = [InitF(5)],
%              attr6 = [InitF(6)]
%     },
%     add_idx(Ws, R).

% find_hole([]) -> {ok1, 1};
% find_hole(R1) ->
%     R = lists:sort(fun(A, B) -> A#warrior.idx < B#warrior.idx end, R1),
%     F = fun(Idx, W) ->
%         case Idx /= W#warrior.idx of
%             true -> {ok1, Idx};
%             false when W#warrior.warrior_id == 0 ->
%                 {ok2, Idx};
%             _ -> false
%         end
%     end,
%     case [V || V <- lists:zipwith(F, lists:seq(1, length(R)), R), V /= false] of
%         [] ->
%             Last = lists:last(R),
%             {ok1, Last#warrior.idx+1};
%         [H|_]-> H
%     end.

% add_idx(Ws, W) ->
%     case find_hole(Ws) of
%         {ok1, Idx} ->
%             {W#warrior{idx=Idx}, [W#warrior{idx=Idx}|Ws]};
%         {ok2, Idx} ->
%             {W#warrior{idx=Idx}, lists:keyreplace(Idx, #warrior.idx, Ws, W#warrior{idx=Idx})};
%         false ->
%             throw({msg, ?NO_LEGAL})
%     end.



% get_warrior(L, Warrior) ->
% %%     ?DEBUG_MSG("get warrior ~p ~n", [{L}]),
%     All = [ lists:keyfind(Idx, #warrior.idx, Warrior) || Idx <- L],
%     case lists:all(fun(false) -> false;
%         (W) -> W#warrior.warrior_id /= 0
%     end, All) of
%         false -> false;
%         _ -> All
%     end.

% build_fun(A, _, C) when A < 10*C -> false;
% build_fun(A, B, C) -> {A-10*C, B+C}.

% build_p_warrior(Warrior) ->
%     F = fun(#kv{k=Id, v=V}) -> #p_warrior_attr{id = Id, value=V} end,
%     [ #p_warrior{
%         idx = Idx,
%         id=Id,
%         exp=Exp,
%         state=State,
%         attr1 = [ F(I) || I <- C1],
%         attr2 = [ F(I) || I <- C2],
%         attr3 = [ F(I) || I <- C3],
%         attr4 = [ F(I) || I <- C4],
%         attr5 = [ F(I) || I <- C5],
%         attr6 = [ F(I) || I <- C6]} || #warrior{idx=Idx, exp=Exp, state=State, warrior_id=Id, attr1 = C1, attr2 = C2, attr3 = C3, attr4 = C4, attr5 = C5, attr6 = C6} <- Warrior, Id /= 0 ].


% %% collect_f(0, ConsumeType, 0) ->
% %%     Cfg = warrior_collect_cfg:get({0, ConsumeType, 0}),
% %%     case rand_srv:random(100) =< Cfg#warrior_collect_cfg.purple_chance of
% %%         false ->
% %%             collect_f(1, ConsumeType, 0);
% %%         true ->
% %%             collect_f(2, ConsumeType, 0)
% %%     end;
% %% collect_f(SoulType, ConsumeType, SoulCount) ->
% %%     Cfg = warrior_collect_cfg:get({SoulType, ConsumeType, SoulCount}),
% %%     V = rand_srv:random(100),
% %%     F = fun({Index, E}, Acc) ->
% %%         case V - Acc =< E of
% %%             true ->
% %%                 case (SoulCount + Index) > Cfg#warrior_collect_cfg.max of
% %%                     false ->
% %%                         throw({idx, Index});
% %%                     true ->
% %%                         throw({boom})
% %%                 end;
% %%             false ->
% %%                 Acc + E
% %%         end
% %%     end,
% %%     case catch lists:foldl(F, 0, lists:zip(lists:seq(1, length(Cfg#warrior_collect_cfg.chance)), Cfg#warrior_collect_cfg.chance)) of
% %%         {idx, I} ->
% %%             {add, SoulType, I};
% %%         {boom} ->
% %%             {boom, SoulType}
% %%     end.

% init_slot1(#kv{k=Id}=R) ->
%     case Id of
%         0 ->
%             Cfg = warrior_attr_cfg:get(1),
%             Idx = rand_srv:random(length(Cfg#warrior_attr_cfg.attr_pool)),
%             Id2 = lists:nth(Idx, Cfg#warrior_attr_cfg.attr_pool),
%             Range = lists:keyfind(Id2, #warrior_attr_range.id, Cfg#warrior_attr_cfg.attr_range),
%             V = rand_srv:random(Range#warrior_attr_range.min, Range#warrior_attr_range.max),
%             #kv{k=Id2, v=V};
%         _ -> R
%     end.

% warrior_len(Warrior) ->
%     erlang:length(lists:filter(fun(#warrior{warrior_id=Id}) -> Id /= 0 end, Warrior)).

% rands(FId, [A, B]) ->
%     Cfg = rand_cfg(FId, [A, B]),
%     Ls = Cfg#warrior_chance_cfg.ws,
%     Index = rand_srv:random(length(Ls)),
%     Id = lists:nth(Index, Ls),

%     Counts =
%         case Cfg#warrior_chance_cfg.set_zero of
%             ?YES when Cfg#warrior_chance_cfg.count_type == 1 -> [0, B];
%             ?YES when Cfg#warrior_chance_cfg.count_type == 2 -> [A, 0];
%             ?NO when Cfg#warrior_chance_cfg.count_type == 1  -> [A+1, B];
%             ?NO when Cfg#warrior_chance_cfg.count_type == 2  -> [A, B+1];
%             _ -> [A, B]
%         end,
%     {Counts, Id}.

% rand_cfg(FId, [A, B]) ->
%     Cfgs = [ warrior_chance_cfg:get({Id, FId2}) || {Id, FId2} <- warrior_chance_cfg:get_all(), FId2 == FId ],
%     Rands =
%         [begin
%             Count = case C#warrior_chance_cfg.count_type of
%                 1 -> A; 2 -> B; _ -> 0
%             end,
%             lists:max([C#warrior_chance_cfg.chance + Count * C#warrior_chance_cfg.add_chance, 0])

%         end || C <- Cfgs],

%     Pos = rand_srv:random(lists:sum(Rands)),

%     Result =
%         lists:foldl(
%             fun(_, {find, Index}) ->
%                 {find, Index};
%                 (Num, {Index, Acc}) ->
%                     case Pos =< Acc of
%                         true -> {find, Index};
%                         false -> {Index+1, Acc+Num}
%                     end
%             end, {0, 0}, Rands),

%     I =
%     case Result of
%         {find, Index} -> Index;
%         {Index, _} -> Index
%     end,

%     lists:nth(I, Cfgs).


% l_insert(L, Idx, Item) ->
%     lists:sublist(L, Idx-1) ++ [Item | lists:nthtail(Idx, L)].

% use_guard(T, Tv, Num, Sender) ->
%     case item_api:is_item_enough(T, Tv, Num) of
%         true -> ok;
%         false ->
%             throw({msg, ?ITEM_USE_FAILED, Sender})
%     end.

% set(L) ->
%     sets:to_list(sets:from_list(L)).

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

