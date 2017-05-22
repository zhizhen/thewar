%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 四象系统
%%% @end
%%% Created : 2013-8-5 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(universe_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([upgrade/2, handle_throw/1, open_function/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% upgrade(#m__universe__upgrade__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{universe = Universe} = role_api:get_user_data(),
%         Cfg = universe_cfg:get(Universe#universe.id),
%         Msg1 = io_lib:format("universe ~p cfg not found\n", [Universe#universe.id]),
%         common_guard(Cfg, ?UNIVERSE_UPGRADE_FAILED, Msg1, Sender),

%         TopCheck = Cfg#universe_cfg.next /= Universe#universe.id,
%         Msg2 = "universe reached top level!\n",
%         common_guard(TopCheck, ?UNIVERSE_UPGRADE_FAILED, Msg2, Sender),

%         G = role_api:is_enough_gold(Cfg#universe_cfg.gold),
%         C = role_api:is_enough_coin(Cfg#universe_cfg.coin),
%         V = role_api:is_enough_vigor(Cfg#universe_cfg.vigor),
%         Consume = G andalso C andalso V,
%         Msg3 = "consume not enough!\n",
%         common_guard(Consume, ?UNIVERSE_UPGRADE_FAILED, Msg3, Sender),

%         role_api:pay_gold(Cfg#universe_cfg.gold, Sender),
%         role_api:pay_coin(Cfg#universe_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         role_api:minus_vigor(Cfg#universe_cfg.vigor, Sender),

%         %% 更新挑战成就任务状态
%         update_quest_challenge(Cfg#universe_cfg.next),

%         NewUniverse = Universe#universe{id = Cfg#universe_cfg.next},
%         game_info:update(NewUniverse),
%         PUniverse = universe_mod:build_p_universe(NewUniverse),
%         Sender ! {send, #m__universe__info__s2c{universe_info = PUniverse}}
%         %notify(?UNIVERSE_UPGRADE_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% open_function(_FuncId) -> ok.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% update_quest_challenge(NewID) -> 
%     challenge_api:update_task_process(?CHALLENGE_TYPE_UNIVERSE_NUM_TODAY, 0, 1),
%     if NewID rem 8 =:= 0 ->
%         challenge_api:update_task_process(?CHALLENGE_TYPE_UNIVERSE_ID, NewID, 1);
%         true -> false
%     end.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({universe_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({universe_guard_error, Reason}) ->
%     ?ERROR_MSG("universe_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
