%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc 黄金迷阵, 刷钱副本
%%%
%%% @end
%%% Created : 2013-10-16 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(golden_mission_api).
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").



% %% API
% -export([show/2, delay/2, start/2, stop/2]).

% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% show(#m__golden_mission__show__c2s{}, Sender) ->
%     #game_info{role=Role, daily=Daily, golden_mission_etc=GMissionEtc1} = role_api:get_user_data(),
%     Cfg = viprelate_cfg:get(Role#role.vip),

%     % 如果过期,更新数据
%     case update(?NOW, GMissionEtc1, Cfg) of
%         {ok, GMissionEtc} -> game_info:update(GMissionEtc);
%         {false, GMissionEtc} -> ok
%     end,

%     Count = Cfg#viprelate_cfg.golden_times - Daily#daily.golden_mission,
%     Start = if GMissionEtc#golden_mission_etc.start == undefined -> 0; true ->GMissionEtc#golden_mission_etc.start end,
%     Delay = if GMissionEtc#golden_mission_etc.delay == undefined -> 0; true ->GMissionEtc#golden_mission_etc.delay end,

%     Sender ! {send, #m__golden_mission__show__s2c{count=Count, start=Start, delay=Delay}}.

% %% @doc 延长副本时间
% delay(#m__golden_mission__delay__c2s{type=_Type}, _Sender) -> ok.
% %% delay(#m__golden_mission__delay__c2s{type=Type}, Sender) ->
% %%     F = fun() ->
% %%         #game_info{role=Role, daily=Daily, golden_mission_etc=GMissionEtc1} = role_api:get_user_data(),
% %%
% %%         Cfg = viprelate_cfg:get(Role#role.vip),
% %%         if not Cfg -> throw({msg, ?NO_LEGAL, Sender}); true -> ok end,
% %%
% %%         case update(?NOW, GMissionEtc1, Cfg) of
% %%             {true, GMissionEtc} -> game_info:update(GMissionEtc1);
% %%             {false, GMissionEtc} -> ok
% %%         end,
% %%
% %%         % 已经延时了
% %%         case GMissionEtc#golden_mission_etc.delay of
% %%             undefined -> ok;
% %%             _Other ->
% %%                 throw({msg, ?NO_LEGAL, Sender})
% %%         end,
% %%
% %%         if Daily#daily.golden_mission >= Cfg#viprelate_cfg.golden_times ->
% %%             throw({msg, ?NO_LEGAL, Sender});
% %%             true -> ok end,
% %%
% %%         % todo tmp
% %%         case Type of
% %%             0 -> Time = 1 * 60, PayCoin = 2;
% %%             1 -> Time = 2 * 60, PayCoin = 5;
% %%             _ -> Time =0, PayCoin = 0,
% %%                 throw({msg, ?GOLDEN_DELAY_FAIL, Sender})
% %%         end,
% %%
% %%         case role_api:is_enough_coin(PayCoin) of
% %%             true ->
% %%                 role_api:pay_coin(PayCoin, ?MODULE, Sender);
% %%             false ->
% %%                 throw({msg, ?NO_MONEY, Sender})
% %%         end,
% %%
% %%         game_info:update(#golden_mission_etc{delay=Time}),
% %%         notify(?GOLDEN_DELAY_SUCC, Sender)
% %%     end,
% %%     ?PERFORM(F).


% %% @doc 进入副本
% start(#m__golden_mission__start__c2s{type=Type}, Sender) ->
%     #game_info{role=Role, daily=Daily, golden_mission_etc=GMissionEtc1} = role_api:get_user_data(),
%     Cfg = viprelate_cfg:get(Role#role.vip),

%     TypeCfg = gold_mission_cfg:get(Type),

%     DelayTime = TypeCfg#gold_mission_cfg.time * 60,

%     case update(?NOW, GMissionEtc1, Cfg) of
%         {ok, GMissionEtc} -> game_info:update(GMissionEtc);
%         {false, GMissionEtc} -> ok
%     end,

%     GoldenMissionCount = Daily#daily.golden_mission,

%     case GMissionEtc#golden_mission_etc.start /= undefined orelse
%         GoldenMissionCount >= Cfg#viprelate_cfg.golden_times of
%         true -> notify(?GOLDEN_MISSION_NO_LEGAL1, Sender);
%         false ->
%             PayCoin = TypeCfg#gold_mission_cfg.pay,
%             case PayCoin /= 0 andalso role_api:is_enough_coin(PayCoin) of
%                 true ->
%                     role_api:pay_coin(PayCoin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender);
%                 false when PayCoin /= 0->
%                     notify(?NO_MONEY, Sender);
%                 false -> ok
%             end,

%             Start = ?NOW,
%             game_info:update(GMissionEtc#golden_mission_etc{start=Start, delay=DelayTime}),
%             M = #m__golden_mission__start__s2c{start_time=Start, delay=DelayTime},
%             living_api:golden_mission(Sender),
%             Sender ! {send, M}
%     end.

% %% @doc 结束
% stop(#m__golden_mission__stop__c2s{isdie=IsDie, count1=_C1, count2=C2}, Sender) ->
%     Now = ?NOW,
%     #game_info{role=Role, golden_mission_etc=GMissionEtc, daily=Daily} = role_api:get_user_data(),
%     game_info:update(#golden_mission_etc{}),

%     Cfg = viprelate_cfg:get(Role#role.vip),
%     % 未开始, 死亡, 过期
%     case GMissionEtc == undefined orelse
%          GMissionEtc#golden_mission_etc.start == undefined orelse
%          IsDie == ?YES orelse
%          overdue(Now, GMissionEtc, Cfg)  of

%         true ->
%             Sender ! {send, #m__golden_mission__stop__s2c{result=?NO, gold=0}};
%         false ->
%             % 黄金迷城金币奖励 = 10000+玩家等级^0.4*杀怪数量*2000
%             Gold = erlang:trunc(10000 + math:pow(Role#role.level, 0.4) * C2 * 2000),
%             role_api:add_gold(Gold, Sender),
%             game_info:update(Daily#daily{golden_mission=Daily#daily.golden_mission+1}),

%             Sender ! {send, #m__golden_mission__stop__s2c{result=?YES, gold=Gold}}
%     end.

% overdue(_, undefined, _) -> false;
% overdue(_, #golden_mission_etc{start=undefined}, _) -> false;
% overdue(CurrentTime, #golden_mission_etc{start=Start, delay=Delay1}, Cfg) ->
%     Delay = if Delay1 == undefined -> 0; true -> Delay1 end,
%     CurrentTime > Start + Cfg#viprelate_cfg.golden_time+Delay+Cfg#viprelate_cfg.golden_delay.

% update(_, undefined, _) ->
%     {false, #golden_mission_etc{}};
% update(CurrentTime, GMissionEtc, Cfg) ->
%     case overdue(CurrentTime, GMissionEtc, Cfg) of
%         true -> {true, GMissionEtc#golden_mission_etc{start=undefined}};
%         false ->{false, GMissionEtc}
%     end.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% handle_throw({msg, Code, Sender}) -> notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
