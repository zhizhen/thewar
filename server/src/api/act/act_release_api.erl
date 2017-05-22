%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-19 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(act_release_api).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% -behaviour(gen_act).

% %% API
% -export([info/2, get/2]).

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
%     handle_close/2
% ]).

% -export([trigger/2,trigger/3]).

% -export([handle_throw/1]).

% -record(act_data, {canget=?NO, data=0, history=[]}).

% -define(ACTRECHARGE_GET_COND(CfgConds), lists:nth(1, CfgConds)).
% -define(ACTRECHARGE_GET_COND2(CfgConds), lists:nth(2, CfgConds)).
% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__act_release__info__c2s{}, Sender) ->
%     gen_act:check_release_act(Sender).

% get(#m__act_release__get__c2s{act_id=ActId, step=Step}, Sender) ->
%     F = fun() ->
%         case gen_act:get_act_data(ActId) of
%             {ok, Act} ->
%                 #act_data{canget=CanGet, history=His} = Act#activity.act_data,
%                 case lists:member(Step, His) of
%                     true -> throw({msg, ?ACT_COMPLEX_GET_REPEATED, Sender});
%                     false -> ok
%                 end,
%                 % 为了保证数据的准确，领礼包时再次校验活动是否完成
%                 {NewCanget, Cfg} = 
%                     case (act_cfg:get(ActId))#act_cfg.type of
%                         ?ACT_RELEASE2 -> get_award_check1(ActId, Step, Act#activity.act_data);
%                         ?ACT_RELEASE5 -> get_award_check2(ActId, Step, Act#activity.act_data);
%                         _ -> get_award_check(ActId, Step, Act#activity.act_data)
%                     end,
%                 case NewCanget of
%                     false -> throw({msg, ?ACT_COMPLEX_GET_FAIL2, Sender});
%                     true -> 
%                         #game_info{role = Role} = role_api:get_user_data(),
%                         Award = 
%                             case Role#role.job of
%                                 ?ROLE_JOB_SWORD -> Cfg#act_detail_cfg.award1;
%                                 ?ROLE_JOB_AXE -> Cfg#act_detail_cfg.award2;
%                                 ?ROLE_JOB_ASSASSIN -> Cfg#act_detail_cfg.award3
%                             end,
%                         role_api:get_award(Award, ?CURR_MODE_FUNC, Sender),
%                         OldData = Act#activity.act_data,
%                         NewActData = OldData#act_data{canget=CanGet-util:bit_set(0, Step), history=His++[Step]},
%                         gen_act:put_act_data(Act#activity{act_data = NewActData}),
%                         NewData = build_data_s2c(ActId, NewActData),
%                         Time = act_mod:get_act_time_zone(ActId),
%                         Sender ! {send, #m__act_release__show__s2c{act_id=ActId, canget=NewActData#act_data.canget, data=NewData, time_zone=Time}},
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
% % 冲级运动会&&等级有好礼&&奔跑吧兄弟
% trigger(ActType, NewLevel, Sender) ->
%     % 找到玩家身上符合这些活动类型的具体活动，更新其详细数据
%     TarActIds = [Id || Id <- gen_act:all_available(), (act_cfg:get(Id))#act_cfg.type == ActType],
%     F = fun(ActId) ->
%             case gen_act:get_act_data(ActId) of
%                 {ok, Act} ->
%                     OldData = Act#activity.act_data,
%                     #act_data{canget=Canget, data=Data} = OldData,
%                     case is_available_with_role(ActId, Data) of
%                         true ->
%                             NewActData = update_act_data(act_cfg:get(ActId), Canget, OldData, NewLevel),
%                             gen_act:put_act_data(Act#activity{act_data=NewActData}),
%                             NewData = build_data_s2c(ActId, NewActData),
%                             Time = act_mod:get_act_time_zone(ActId),
%                             Sender ! {send, #m__act_release__show__s2c{act_id=ActId, canget=NewActData#act_data.canget, data=NewData, time_zone=Time}};
%                         false -> ok
%                     end;
%                 _ -> ok
%             end
%         end,
%     lists:foreach(F, TarActIds).

% % 限时大礼包&&欢乐七天送
% trigger(ActType, Sender) -> 
%     TarActIds = [Id || Id <- gen_act:all_available(), (act_cfg:get(Id))#act_cfg.type == ActType],
%     F = fun(ActId) ->
%             case gen_act:get_act_data(ActId) of
%                 {ok, Act} ->
%                     OldData = Act#activity.act_data,
%                     #act_data{canget=Canget, history=His} = OldData,
%                     ActCfg = act_cfg:get(ActId),
%                     St = lists:foldl(fun(X, Sum) -> util:bit_set(Sum, X) end, Canget, His),
%                     % 如果St大于等于127，那么七天的礼包都已经领完了
%                     {ok, State} = act_srv:get_act_expire_state(ActId),
%                     case State =:= ?ACTIVITY_LIVING andalso St < 127 of
%                         true ->
%                             NewActData = update_act_data(ActCfg, Canget, OldData, 0),
%                             gen_act:put_act_data(Act#activity{act_data=NewActData}),
%                             NewData = build_data_s2c(ActId, NewActData),
%                             Time = act_mod:get_act_time_zone(ActId),
%                             Sender ! {send, #m__act_release__show__s2c{act_id=ActId, canget=NewActData#act_data.canget, data=NewData, time_zone=Time}};
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
%             #act_data{canget=CanGet} = Act#activity.act_data,
%             NewData = build_data_s2c(ActId, Act#activity.act_data),
%             Time = act_mod:get_act_time_zone(ActId),
%             Sender ! {send, #m__act_release__show__s2c{act_id=ActId, canget=CanGet, data=NewData, time_zone=Time}};
%         _ -> ok
%     end.

% % 欢乐七天送data传玩家登录天数
% build_data_s2c(ActId, #act_data{canget=CanGet, data=Data, history=His}) -> 
%     case (act_cfg:get(ActId))#act_cfg.type of
%         ?ACT_RELEASE2 -> 
%             Old = lists:foldl(fun(X, Sum) -> util:bit_set(Sum, X) end, 0, His),
%             length(erlang:integer_to_list(Old+CanGet, 2));
%         ?ACT_RELEASE4 -> 
%             case lists:member(1, His) of
%                 true -> 2;
%                 false -> CanGet
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
% % 奔跑吧兄弟:这个活动检测很麻烦，开服72内达到40级
% update_act_data(#act_cfg{act_id=ActId, type=?ACT_RELEASE4}, CanGet, OldData, NewLevel) ->
%     Cfg = act_detail_cfg:get({ActId, 1}),
%     #game_info{role = Role} = role_api:get_user_data(),
%     case CanGet =:= 0 andalso not lists:member(1, OldData#act_data.history) of
%         true -> 
%             [Hours, Level|_] = Cfg#act_detail_cfg.conds,
%             NewCanget = 
%                 case (Role#role.create_time + Hours * 3600) > ?NOW of
%                     true when NewLevel >= Level -> 1;
%                     _ -> 0
%                 end,
%             OldData#act_data{canget=NewCanget, data=NewLevel};
%         false -> OldData#act_data{canget=CanGet, data=NewLevel}
%     end;
% % 欢乐七天送
% update_act_data(#act_cfg{type=?ACT_RELEASE2}, CanGet, OldData, _NewLevel) ->
%     {Y, M, D} = erlang:date(),
%     Date = Y*10000 + M*100 + D,
%     case Date /= OldData#act_data.data of
%         true ->
%             NewCanget = act_mod:get_act_get_state(CanGet, OldData#act_data.history),
%             OldData#act_data{canget=NewCanget, data=Date};
%         _ -> OldData
%     end;
% % 限时大礼包（暂时不开启）
% update_act_data(#act_cfg{act_id=ActId, type=?ACT_RELEASE5}, CanGet, OldData, _NewLevel) ->
%     {{Y, M, D}, {_, _, _}} = erlang:localtime(),
%     Date = Y*10000 + M*100 + D,
%     case CanGet =:= 0 andalso Date /= OldData#act_data.data of
%         true -> 
%             NewCanget = act_mod:get_act_get_state1(ActId, OldData#act_data.history),
%             OldData#act_data{canget=NewCanget, data=Date};
%         _ -> OldData
%     end;
% % 冲级运动会 & 等级有好礼
% update_act_data(#act_cfg{act_id=ActId}, CanGet, OldData, NewLevel) ->
%     Cfgs = fetch_act_cfgs(ActId, NewLevel),
%     F = fun(Cfg, Sum) -> 
%             Step = Cfg#act_detail_cfg.id2,
%             % 检测这个阶段的礼包是否已经领取过了
%             case lists:member(Step, OldData#act_data.history) of
%                 false -> util:bit_set(Sum, Step);
%                 true -> Sum
%             end
%         end,
%     OldData#act_data{canget=lists:foldl(F, CanGet, Cfgs), data=NewLevel}.

% is_available_with_role(ActId, Data) ->
%     % ActCfg = act_cfg:get(ActId),
%     All = [{Id, Step} || {Id, Step} <- act_detail_cfg:get_all(), Id =:= ActId],
%     Fina = act_detail_cfg:get(lists:last(All)),
%     {ok, State} = act_srv:get_act_expire_state(ActId),
%     case State =:= ?ACTIVITY_LIVING of
%         true when ActId =/= ?ACT_RELEASE4_ID -> Data < ?ACTRECHARGE_GET_COND(Fina#act_detail_cfg.conds);
%         true -> Data < ?ACTRECHARGE_GET_COND2(Fina#act_detail_cfg.conds);
%         false -> false
%     end.

% % 奔跑吧兄弟:这个活动检测很麻烦，开服72内达到40级
% get_award_check(?ACT_RELEASE4_ID, Step, _ActData) -> 
%     Cfg = act_detail_cfg:get({?ACT_RELEASE4_ID, Step}),
%     #game_info{role = Role} = role_api:get_user_data(),
%     [Hours, Level|_] = Cfg#act_detail_cfg.conds,
%     case (Role#role.create_time + Hours * 3600) > ?NOW of
%         true when Role#role.level >= Level -> {true, Cfg};
%         _ -> {false, Cfg}
%     end;
% get_award_check(ActId, Step, ActData) ->
%     Cfg = act_detail_cfg:get({ActId, Step}),
%     {ActData#act_data.data >= ?ACTRECHARGE_GET_COND(Cfg#act_detail_cfg.conds), Cfg}.

% get_award_check1(ActId, Step, ActData) -> 
%     Cfg = act_detail_cfg:get({ActId, Step}),
%     {Cfg /= false andalso util:bit_test(ActData#act_data.canget, Step) =:= 1, Cfg}.

% get_award_check2(ActId, Step, ActData) -> 
%     Cfg = act_detail_cfg:get({ActId, Step}),
%     Canget = act_mod:get_act_get_state1(ActId, ActData),
%     {Cfg /= false andalso util:bit_test(Canget, Step) =:= 1 , Cfg}.

% fetch_act_cfgs(ActId, Lv) ->
%     All = act_detail_cfg:get_all(),
%     Type = [{Id, Step} || {Id, Step} <- All, Id =:= ActId],
%     [act_detail_cfg:get(Id) || Id <- Type, ?ACTRECHARGE_GET_COND((act_detail_cfg:get(Id))#act_detail_cfg.conds) =< Lv].

