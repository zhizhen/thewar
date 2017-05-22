%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 名将点拨，即拿代币兑换角色经验
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(coin2exp_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([info/2, follow/2, finish/2, speedup/2]).
% -export([handle_throw/1, open_function/1]).

% -define(COIN2EXP_MAX_STEP,  6).
% -define(COIN2EXP_TYPE_1,   1).
% -define(COIN2EXP_TYPE_2,   2).
% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__coin2exp__info__c2s{}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Coin2exp = GameInfo#game_info.coin2exp,
%             Role = GameInfo#game_info.role,
%             Daily = GameInfo#game_info.daily,
%             VipCfg = viprelate_cfg:get(Role#role.vip),
%             Master = Coin2exp#coin2exp.master,
%             Count = VipCfg#viprelate_cfg.coin2exp - Daily#daily.coin2exp,

%             Step = 
%             if  Coin2exp#coin2exp.master =:= 0 -> 0;
%                 true -> 
%                     Cfg = coin2exp_cfg:get(Coin2exp#coin2exp.master),
%                     common_guard(Cfg, ?COIN2EXP_PARAMS_ERROR1, "coin cfg error\n", Sender),

%                     calc_step(Coin2exp, Cfg)
%             end,
%             Data = #m__coin2exp__info__s2c{master = Master, step = Step, count = Count},
%             Sender ! {send, Data}
%     end,
%     ?PERFORM(F).

% follow(#m__coin2exp__follow__c2s{master = Master}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Coin2exp = GameInfo#game_info.coin2exp,

%             Cfg = coin2exp_cfg:get(Master),
%             common_guard(Cfg, ?COIN2EXP_FOLLOW_FAIL, "coin2exp cfg error\n", Sender),

%             Consume = Cfg#coin2exp_cfg.follow_cost,
%             Result = check_and_use(Consume, Sender),
%             common_guard(Result, ?COIN2EXP_FOLLOW_FAIL, "coin2exp consume not enough\n", Sender),

%             %% 更新挑战成就任务 拜师X次
%             challenge_api:update_task_process(?CHALLENGE_TYPE_COIN2EXP_NUM, 0, 1), 
            
%             game_info:update(Coin2exp#coin2exp{master = Master, follow_time = ?NOW, speedup_count = 0}),
%             notify(?COIN2EXP_FOLLOW_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% finish(#m__coin2exp__finish__c2s{}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Coin2exp = GameInfo#game_info.coin2exp,
%             Role = GameInfo#game_info.role,

%             C = Coin2exp#coin2exp.master =/= 0,
%             common_guard(C, ?COIN2EXP_FINISH_FAIL, "no master\n", Sender),

%             Cfg = coin2exp_cfg:get(Coin2exp#coin2exp.master),

%             S = calc_step(Coin2exp, Cfg) =:= ?COIN2EXP_MAX_STEP,
%             common_guard(S, ?COIN2EXP_FINISH_FAIL, "can't finish\n", Sender),

%             Rate = Cfg#coin2exp_cfg.exp_rate,
%             Level = Role#role.level,
%             All = [exp_cfg:get(X) || X <- exp_cfg:get_all()],
%             LevelCfg = lists:keyfind(Level, #exp_cfg.level, All),
%             NextLvCfg = lists:keyfind(Level + 1, #exp_cfg.level, All),
%             common_guard(NextLvCfg, ?COIN2EXP_FINISH_FAIL, "max level error\n", Sender),

%             LvupExp = NextLvCfg#exp_cfg.exp - LevelCfg#exp_cfg.exp,
%             Exp = erlang:min(Cfg#coin2exp_cfg.max_exp, LvupExp * Rate / 100),
%             role_api:add_exp(Exp, Sender),
%             game_info:update(Coin2exp#coin2exp{master = 0, follow_time = ?NOW, speedup_count = 0}),
%             notify(?COIN2EXP_FINISH_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% speedup(#m__coin2exp__speedup__c2s{type = Type}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Coin2exp = GameInfo#game_info.coin2exp,
%             Daily = GameInfo#game_info.daily,
%             Role = GameInfo#game_info.role,

%             Cfg = coin2exp_cfg:get(Coin2exp#coin2exp.master),
%             VipCfg = viprelate_cfg:get(Role#role.vip),

%             V = Daily#daily.coin2exp < VipCfg#viprelate_cfg.coin2exp,
%             common_guard(V, ?COIN2EXP_SPEEDUP_FAIL, "daily limit\n", Sender),

%             Step = calc_step(Coin2exp, Cfg),
%             S = Step =/= ?COIN2EXP_MAX_STEP,
%             common_guard(S, ?COIN2EXP_SPEEDUP_FAIL, "step reach max\n", Sender),

%             C = 
%             case Type of
%                 ?COIN2EXP_TYPE_2 -> role_api:pay_coin(Cfg#coin2exp_cfg.speedup_coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender);
%                 ?COIN2EXP_TYPE_1 -> check_and_use(Cfg#coin2exp_cfg.speedup_item, Sender);
%                 _ -> common_guard(false, ?COIN2EXP_PARAMS_ERROR2, "type error\n", Sender)
%             end,
%             common_guard(C, ?COIN2EXP_SPEEDUP_FAIL, "consume not enough\n", Sender),

%             Count = Coin2exp#coin2exp.speedup_count + 1,
%             game_info:update(Coin2exp#coin2exp{speedup_count = Count}),
%             game_info:update(Daily#daily{coin2exp = Daily#daily.coin2exp + 1}),
%             notify(?COIN2EXP_SPEEDUP_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% calc_step(Coin2exp, Cfg) ->
%     AddStep = Cfg#coin2exp_cfg.add_step,
%     FollowTime = Coin2exp#coin2exp.follow_time,
%     Origin = AddStep * calc_12_add(FollowTime, ?NOW),
%     Speedup = Coin2exp#coin2exp.speedup_count,
%     SpeedStep = Cfg#coin2exp_cfg.speed_step,
%     erlang:min(?COIN2EXP_MAX_STEP, Origin + Speedup * SpeedStep).

% % 根据起点时间和终点时间计算出中间加的训练度  
% % 跟策划沟通过，非要每天12点和24点各加一次训练度，噢哦  
% calc_12_add(Start, End) ->
%     {H, M, S} = ?TIME_ZONE,
%     (End + H*3600+M*60+S) div (12 * 3600) - (Start + H*3600+M*60+S) div (12 * 3600).

% check_and_use(Consume, Sender) ->
%     Cfgs = [ re:split(X, "-", [{return, list}]) || X <- Consume],
%     D = [{util:to_integer(X), util:to_integer(Y)}||[X, Y]<-Cfgs],
%     check_and_use1(D, Sender).

% check_and_use1([], _) -> true;
% check_and_use1([{0, _}|Rest], Sender) -> check_and_use1(Rest, Sender);
% check_and_use1([{?COIN, Num}|Rest], Sender) -> 
%     case role_api:pay_coin(Num, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender) of
%         false -> false;
%         _ -> check_and_use1(Rest, Sender)
%     end;
% check_and_use1([{ItemId, Num}|Rest], Sender) ->
%     case item_api:remove_by_item_id(ItemId, Num) of
%         false -> false;
%         _ -> check_and_use1(Rest, Sender)
%     end.
    

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({coin2exp_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({coin2exp_guard_error, Reason}) ->
%     ?ERROR_MSG("coin2exp_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
