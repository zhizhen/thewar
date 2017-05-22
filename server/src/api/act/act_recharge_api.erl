%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-19 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(act_recharge_api).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% -behaviour(gen_act).

% %% API
% -export([get/2]).

% %% call back
% -export([
%     new/0,
%     show/2,
%     toStr/1,
%     toData/1,
%     % proc_tick/2,
%     % proc_tick_state/1,
%     handle_tick/3,
%     handle_open/2,
%     handle_close/2,
%     get_date/1
% ]).

% -export([trigger/3]).

% -export([handle_throw/1]).

% -record(act_data, {canget=?NO, data=0, history=[]}).

% -define(ACTRECHARGE_GET_COND1(CfgConds), lists:nth(1, CfgConds)).
% -define(ACTRECHARGE_GET_COND2(CfgConds), lists:nth(2, CfgConds)).
% %%%===================================================================
% %%% API
% %%%===================================================================
% get(#m__act_recharge__get__c2s{act_id=ActId, step=Step}, Sender) ->
%     F = fun() ->
%         case gen_act:get_act_data(ActId) of
%             {ok, Act} ->
%                 ActType = (act_cfg:get(ActId))#act_cfg.type,
%                 #act_data{canget=CanGet, history=His, data=Data} = Act#activity.act_data,
%                 case get_award_repeat_check(ActId, Step, CanGet, His) of 
%                     true -> throw({msg, ?ACT_COMPLEX_GET_REPEATED, Sender});
%                     false -> ok
%                 end,
%                 % 为了保证数据的准确，领礼包时再次校验活动是否完成
%                 {NewCanget, Cfg} = get_award_check(ActId, Step, Act#activity.act_data),
%                 case NewCanget of
%                     false -> throw({msg, ?ACT_COMPLEX_GET_FAIL2, Sender});
%                     true -> 
%                         #game_info{role = Role} = role_api:get_user_data(),
%                         Award = get_awards(ActType, Role, Cfg, Data),
%                         role_api:get_award(Award, ?CURR_MODE_FUNC, Sender),
%                         OldData = Act#activity.act_data,
%                         NewActData =
%                             case ActType of
%                                 ?ACT_RECHARGE_ACC_CON -> 
%                                     OldData#act_data{canget=CanGet-util:bit_set(0, Step), history=His++[Step]};
%                                 ?ACT_RECHARGE_GIFT -> 
%                                     OldData#act_data{canget=CanGet-util:bit_set(0, Step), history=His++[Step]};
%                                 _ -> 
%                                     OldData#act_data{canget=?ACT_AWARDED}
%                             end,
%                         gen_act:put_act_data(Act#activity{act_data = NewActData}),
%                         NewData = build_data_s2c(ActId, NewActData#act_data.data, NewActData#act_data.history),
%                         Time = act_mod:get_act_time_zone(ActId),
%                         Sender ! {send, #m__act_recharge__show__s2c{act_id=ActId, canget=NewActData#act_data.canget, data=NewData, time_zone=Time}},
%                         notify(?ACT_COMPLEX_GET_SUCC, Sender)
%                 end;
%             _ ->
%                 notify(?ACT_COMPLEX_GET_FAIL1, Sender)
%         end
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% process api
% %%%===================================================================
% trigger(?RECHARGE_TRIGGER, Money, Sender) ->
%     % 玩家充值会影响到的活动类型
%     RechageActTypes = [?ACT_RECHARGE_FIRST,?ACT_RECHARGE_ACC_REC,?ACT_RECHARGE_CONTINUE,?ACT_RECHARGE_BACK,?ACT_RECHARGE_GIFT],
%     % 找到玩家身上符合这些活动类型的具体活动，更新其详细数据
%     TarActIds = [Id || Id <- gen_act:all_available(), lists:member((act_cfg:get(Id))#act_cfg.type, RechageActTypes)],
%     F = fun(ActId) ->
%             case gen_act:get_act_data(ActId) of
%                 {ok, Act} ->
%                     OldData = Act#activity.act_data,
%                     #act_data{canget=Canget, data=Data} = OldData,
%                     case is_available_with_role(ActId, Data, Canget) of
%                         true when Canget =:= ?NO ->
%                             NewActData = update_act_data(act_cfg:get(ActId), OldData, Money),
%                             gen_act:put_act_data(Act#activity{act_data=NewActData}),
%                             show(Sender, ActId);
%                         _ -> ok
%                     end;
%                 _ -> ok
%             end
%         end,
%     lists:foreach(F, TarActIds);

% trigger(?CONSUME_TRIGGER, Money, Sender) ->
%     ConsumeActTypes = [?ACT_RECHARGE_ACC_CON], % 玩家充值会影响到的活动类型
%     % 找到玩家身上符合这些活动类型的具体活动，更新其详细数据
%     TarActIds = [Id || Id <- gen_act:all_available(), lists:member((act_cfg:get(Id))#act_cfg.type, ConsumeActTypes)],
%     F = fun(ActId) ->
%             case gen_act:get_act_data(ActId) of
%                 {ok, Act}  ->
%                     OldData = Act#activity.act_data,
%                     #act_data{canget=CanGet, data=Data, history=His} = OldData,
%                     % 不会更新活动数据的情况有两：1.玩家已经消费到顶，所有礼包都可获得。2.消费截止时间已经到了
%                     case is_available_with_role(ActId, Data, CanGet) of
%                         true -> 
%                             Cfgs = fetch_act_cfgs(ActId, Data+Money),
%                             F = fun(Cfg, Sum) -> 
%                                     Step = Cfg#act_detail_cfg.id2,
%                                     % 检测这个阶段的礼包是否已经领取过了
%                                     case lists:member(Step, His) of
%                                         false -> util:bit_set(Sum, Step);
%                                         true -> Sum
%                                     end
%                                 end,
%                             NewActData = OldData#act_data{canget=lists:foldl(F, CanGet, Cfgs), data=Data+Money},
%                             gen_act:put_act_data(Act#activity{act_data=NewActData}),
%                             show(Sender, ActId);
%                         false -> ok
%                     end;
%                 _ -> ok 
%             end
%         end,
%     lists:foreach(F, TarActIds).

% %%%===================================================================
% %%% callbacks
% %%%===================================================================
% show(Sender, ActId) ->
%     case gen_act:get_act_data(ActId) of
%         {ok, Act} ->
%             #act_data{canget=Canget1, data=Data, history=His} = Act#activity.act_data,
%             NewData = build_data_s2c(ActId, Data, His),
%             Time = act_mod:get_act_time_zone(ActId),
%             CanGet = 
%                 case (act_cfg:get(ActId))#act_cfg.type of
%                     ?ACT_RECHARGE_BACK -> 
%                         {ok, State} = act_srv:get_act_expire_state(ActId),
%                         if State =:= ?ACT_AWARDED -> 1;true -> 0 end;
%                     _ -> Canget1
%                 end,
%             Sender ! {send, #m__act_recharge__show__s2c{act_id=ActId, canget=CanGet, data=NewData, time_zone=Time}};
%         _ -> ok
%     end.

% build_data_s2c(ActId, Data, His) -> 
%     case (act_cfg:get(ActId))#act_cfg.type of
%         ?ACT_RECHARGE_CONTINUE -> 
%             {Y, M, D} = erlang:date(),
%             Cond = ?ACTRECHARGE_GET_COND1((fetch_act_cfg(ActId))#act_detail_cfg.conds),
%             DT =
%                 if Data =/= 0 ->
%                     {DT1, _} = calendar:time_difference(get_date(util:to_integer(Data)), {{Y, M, D}, {0,0,0}}),
%                     DT1;
%                     true -> 2
%                 end,

%             ContinueDays = length([C || C <- His, C >= Cond]),
%             NeedDays = ?ACTRECHARGE_GET_COND2((fetch_act_cfg(ActId))#act_detail_cfg.conds),
%             case DT of
%                 0 -> ContinueDays;
%                 1 ->
%                     case lists:last(His) >= Cond of 
%                         true -> length([C || C <- His, C >= Cond]);
%                         false -> 0
%                     end;
%                 _  when ContinueDays >= NeedDays -> NeedDays;
%                 _ -> 0
%             end;
%         _ -> Data
%     end.

% %% act srv
% % proc_tick_state(_) -> 0.
% % proc_tick(_, _) -> {false, 0}.

% %% role process
% handle_tick(#activity{} = _ActData, _TickState, _Sender) -> ok.

% handle_open(#activity{} = ActData, Sender) ->
%     {ActData, Sender}.
% handle_close(ActId, Sender) ->
%     {ActId, Sender}.

% new() -> #act_data{}.
% toData(Str) ->
%     [A, B|T] = string:tokens(Str, "-"),
%     CanGet = util:to_integer(A),
%     Data = util:to_integer(B),
%     His = 
%         case T of 
%             [] -> [];
%             [T1] -> [util:to_integer(I) || I <- string:tokens(T1, ",")]
%         end,
%     #act_data{canget = CanGet, data = Data, history = His}.

% toStr(#act_data{canget=CanGet, data=Data, history=His}) ->
%     H = string:join([util:to_list(X) || X <- His], ","),
%     L = [util:to_list(I) || I <- [CanGet, Data]],
%     case H of 
%         [] -> string:join(L, "-");
%         _ -> string:join(L, "-") ++ "-" ++ H
%     end.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% update_act_data(#act_cfg{act_id=ActId, type=?ACT_RECHARGE_CONTINUE}, OldData, Money) ->
%     Cfg = fetch_act_cfg(ActId),
%     #act_data{data=Date, history=His} = OldData,
%     {Y, M, D} = erlang:date(),
%     Date1 = Y*10000 + M*100 + D,
%     DT =
%         if Date =/= 0 ->
%             {DT1, _} = calendar:time_difference(get_date(util:to_integer(Date)), {{Y, M, D}, {0,0,0}}),
%             DT1;
%             true -> 2
%         end,
%     NewHis =
%         case DT of  
%             0 ->
%                 case His of
%                     [] -> [Money];
%                     L -> lists:sublist(His, length(His)-1) ++ [lists:last(L) + Money]
%                 end;
%             1 -> get_right_his(His, ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds), []) ++ [Money];
%             _ -> [Money]
%         end,

%     % 首先判断充值了几天，若少于连续充值要求的天数，返回
%     case length(NewHis) < ?ACTRECHARGE_GET_COND2(Cfg#act_detail_cfg.conds) of
%         true -> OldData#act_data{data=Date1, history=NewHis};
%         false ->
%             CanGet = 
%                 case lists:last(NewHis) >= ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds) of
%                     true -> ?YES;
%                     false -> ?NO
%                 end,
%             OldData#act_data{canget=CanGet, data=Date1, history=NewHis}
%     end;
% update_act_data(#act_cfg{act_id=ActId, type=?ACT_RECHARGE_BACK}, OldData, Money) -> 
%     OldMoney = OldData#act_data.data,
%     case act_mod:check_act_end(ActId) of
%         false -> OldData#act_data{data = OldMoney + Money};
%         true -> OldData#act_data{canget = ?YES}
%     end;
% update_act_data(#act_cfg{act_id=ActId, type=?ACT_RECHARGE_GIFT}, OldData, Money) ->
%     Cfgs = fetch_act_cfgs(ActId, OldData#act_data.data + Money),
%     F = fun(Cfg, Sum) -> 
%             Step = Cfg#act_detail_cfg.id2,
%             % 检测这个阶段的礼包是否已经领取过了
%             case lists:member(Step, OldData#act_data.history) of
%                 false -> util:bit_set(Sum, Step);
%                 true -> Sum
%             end
%         end,
%     OldData#act_data{canget=lists:foldl(F, OldData#act_data.canget, Cfgs), data=OldData#act_data.data+Money};
% update_act_data(#act_cfg{act_id=ActId}, OldData, Money) -> 
%     Cfg = act_detail_cfg:get({ActId, 1}),
%     OldMoney = OldData#act_data.data,
%     case OldMoney + Money >= ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds) of
%         true -> OldData#act_data{canget = ?YES, data = OldMoney + Money};
%         false -> OldData#act_data{data = OldMoney + Money}
%     end.

% is_available_with_role(ActId, _Data, _Canget) ->
%     {ok, State} = act_srv:get_act_expire_state(ActId),
%     State =:= ?ACTIVITY_LIVING.
%     % ActCfg = act_cfg:get(ActId),
%     % All = [{Id, Step} || {Id, Step} <- act_detail_cfg:get_all(), Id =:= ActId],
%     % Fina = act_detail_cfg:get(lists:last(All)),
%     % util:is_expired(ActCfg#act_cfg.date1).
%     % case ActCfg#act_cfg.type of
%     %     % 连续充值的检测过期方法特殊，因为Data存的是上次充值时间戳。所以判断是否过期和礼品是否已领取
%     %     ?ACT_RECHARGE_CONTINUE -> 
%     %         IsExpired = util:is_expired(ActCfg#act_cfg.date1),
%     %         IsExpired andalso Canget =/= ?ACT_AWARDED;
%     %     _ ->
%     %         case util:is_expired(ActCfg#act_cfg.date1) of
%     %             true -> Data < ?ACTRECHARGE_GET_COND1(Fina#act_detail_cfg.conds);
%     %             false -> false
%     %         end
%     % end.

% get_awards(ActType, Role, Cfg, Data) -> 
%     case ActType of 
%         ?ACT_RECHARGE_BACK -> 
%             ["5-" ++ util:to_list(Data * ?ACT_BACK_RATE)];
%         _ ->
%             case Role#role.job of
%                 ?ROLE_JOB_SWORD -> Cfg#act_detail_cfg.award1;
%                 ?ROLE_JOB_AXE -> Cfg#act_detail_cfg.award2;
%                 ?ROLE_JOB_ASSASSIN -> Cfg#act_detail_cfg.award3
%             end
%     end.

% get_award_repeat_check(ActId, Step, CanGet, His) -> 
%     case (act_cfg:get(ActId))#act_cfg.type of
%         ?ACT_RECHARGE_ACC_CON -> lists:member(Step, His);
%         ?ACT_RECHARGE_GIFT -> lists:member(Step, His);
%         _ -> CanGet =:= ?ACT_AWARDED
%     end.

% get_award_check(ActId, Step, ActData) ->
%     ActType = (act_cfg:get(ActId))#act_cfg.type,
%     case ActType of
%         ?ACT_RECHARGE_CONTINUE -> 
%             Cfg = fetch_act_cfg(ActId),
%             IsRight = lists:all(fun(X) -> X >= ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds) end, ActData#act_data.history),
%             {length(ActData#act_data.history) >= ?ACTRECHARGE_GET_COND2(Cfg#act_detail_cfg.conds) andalso IsRight, Cfg};
%         ?ACT_RECHARGE_ACC_CON -> 
%             Cfg = act_detail_cfg:get({ActId, Step}),
%             {ActData#act_data.data >= ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds), Cfg};
%         ?ACT_RECHARGE_BACK -> 
%             {ok, State} = act_srv:get_act_expire_state(ActId),
%             {State =:= ?ACTIVITY_AWARDED, #act_detail_cfg{}};
%         _ -> 
%             Cfg = fetch_act_cfg(ActId),
%             {ActData#act_data.data >= ?ACTRECHARGE_GET_COND1(Cfg#act_detail_cfg.conds), Cfg}
%     end.

% % [5,6,3,4,5,8] -> D > 5 -> [5,8]
% get_right_his([], _, L) -> L;
% get_right_his([H|T], Limit, L) -> 
%     if H >= Limit ->
%         get_right_his(T, Limit, L ++ [H]);
%         true -> get_right_his(T, Limit, [])
%     end.

% fetch_act_cfgs(ActId, Money) ->
%     All = act_detail_cfg:get_all(),
%     Type = [{Id, Step} || {Id, Step} <- All, Id =:= ActId],
%     [act_detail_cfg:get(Id) || Id <- Type, ?ACTRECHARGE_GET_COND1((act_detail_cfg:get(Id))#act_detail_cfg.conds) =< Money].

% fetch_act_cfg(ActId) ->
%     [H|_]  = [{Id, Step} || {Id, Step} <- act_detail_cfg:get_all(), Id =:= ActId],
%     act_detail_cfg:get(H).

% get_date(Time)->
%     Y = Time div 10000,
%     M = Time rem 10000 div 100,
%     D = Time rem 10000 rem 100,
%     {{Y,M,D}, {0,0,0}}.
