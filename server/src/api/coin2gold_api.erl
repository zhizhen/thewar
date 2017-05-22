%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 点金，即拿代币兑换游戏币
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(coin2gold_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([exchange/2]).
% -export([handle_throw/1, open_function/1]).

% -define(COIN2GOLD_TYPE1,   1).
% -define(COIN2GOLD_TYPE2,   2).
% %%%===================================================================
% %%% API
% %%%===================================================================
% % info(#m__coin2gold__info__c2s{}, Sender) ->
% %     F = fun() ->
% %             GameInfo = role_api:get_user_data(),
% %             % Role = GameInfo#game_info.role,
% %             Daily = GameInfo#game_info.daily,
% %             {D1, D2} = build_times(Daily#daily.coin2gold),
            
% %             % VCfg = viprelate_cfg:get(Role#role.vip),
% %             % common_guard(VCfg, ?COIN2GOLD_PARAMS_ERROR1, "", Sender),

% %             % Limit1 = VCfg#viprelate_cfg.coin2gold1,
% %             % Limit2 = VCfg#viprelate_cfg.coin2gold2,
% %             %% 防止用户vip降级带来负数
% %             Sender ! {send, #m__coin2gold__info__s2c{num1 = D1, num2 = D2}}
% %     end,
% %     ?PERFORM(F).
% exchange(#m__coin2gold__exchange__c2s{type = Type}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Role = GameInfo#game_info.role,
%             Daily = GameInfo#game_info.daily,
%             D1 = Daily#daily.coin2gold1,
%             D2 = Daily#daily.coin2gold2,

%             VCfg = viprelate_cfg:get(Role#role.vip),
%             common_guard(VCfg, ?COIN2GOLD_PARAMS_ERROR2, "vip cfg not found\n", Sender),

%             case Type of
%                 ?COIN2GOLD_TYPE1 -> common_guard(D1 < VCfg#viprelate_cfg.coin2gold1, ?COIN2GOLD_PARAMS_ERROR3, "coin2gold limit num\n", Sender);
%                 ?COIN2GOLD_TYPE2 -> common_guard(D2 < VCfg#viprelate_cfg.coin2gold2, ?COIN2GOLD_PARAMS_ERROR3, "coin2gold limit num\n", Sender)
%             end,

%             {Consume, GetGold} = case Type of
%                                     ?COIN2GOLD_TYPE1 -> 
%                                         if  D1 =:= 0 -> 
%                                                 {0, trunc((100000 + 1 * 200) * math:pow(1.05, Role#role.level / 5))};
%                                             true ->
%                                                 {2 * D1, trunc((100000 + D1 * 200) * math:pow(1.05, Role#role.level / 5))}
%                                         end;
%                                     ?COIN2GOLD_TYPE2 -> {100, trunc((800000 + (D2 + 1) * 2000) * math:pow(1.04, Role#role.level / 5))}
%                                 end,

%             C = role_api:is_enough_coin(Consume),
%             common_guard(C, ?COIN2GOLD_PARAMS_ERROR6, "coin not enough\n", Sender),

%             role_api:pay_coin(Consume, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%             role_api:add_gold(GetGold, Sender),
            
%             case Type of
%                 ?COIN2GOLD_TYPE1 -> game_info:update(Daily#daily{coin2gold1 = D1 + 1});
%                 ?COIN2GOLD_TYPE2 -> game_info:update(Daily#daily{coin2gold2 = D2 + 1})
%             end,
%             % living
%             living_api:coin2gold(Sender),
%             %% 更新挑战成就任务 点金X次
%             challenge_api:update_task_process(?CHALLENGE_TYPE_COIN2GOLD_NUM, 0, 1),

%             notify(?COIN2GOLD_GET_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({coin2gold_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({coin2gold_guard_error, Reason}) ->
%     ?ERROR_MSG("coin2gold_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
