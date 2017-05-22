%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(cultivate_api).

% -include("game_pb.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% -export([run/2, save/2]).
% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %% 金-物理攻击
% %% 木-生命
% %% 水-技能防御
% %% 火-技能攻击
% %% 土-物理防御。

% %% run(#m__cultivate__run__c2s{}, Sender) ->
% %%     #game_info{cultivate=Cultivate} = role_api:get_user_data(),
% %%     [_|L] = erlang:tuple_to_list(Cultivate),
% %%     Sum = lists:sum(L),
% %%     Cfg = cfg(Sum),
% %%     role_api:is_enough_gold(Cfg#cultivate_cfg.gold),
% %%     role_api:is_enough_coin(Cfg#cultivate_cfg.coin),
% %%     F = fun([A, B]) ->
% %%     rand_srv:random(A, B)
% %%     end,
% %%     L2 =
% %%     [F(E) || E <- [
% %%         Cfg#cultivate_cfg.attr1,
% %%         Cfg#cultivate_cfg.attr2,
% %%         Cfg#cultivate_cfg.attr3,
% %%         Cfg#cultivate_cfg.attr4,
% %%         Cfg#cultivate_cfg.attr5]],
% %%
% %%     game_info:update(#cultivate_etc{cultivate=L2}),
% %%     Sender ! {send, #m__cultivate__run__s2c{attrs=L2}}.
% %%
% %% save(#m__cultivate__save__c2s{}, Sender) ->
% %%     #game_info{cultivate=Cultivate, cultivate_etc=CultivateEtc} = role_api:get_user_data(),
% %%     case CultivateEtc == undefined orelse CultivateEtc#cultivate_etc.cultivate == undefined of
% %%         true -> notify(?CULTIVATE_NO_LEGAL1, Sender);
% %%         false ->
% %%             [A,B,C,D,E] = CultivateEtc#cultivate_etc.cultivate,
% %%             Cultivate2 = Cultivate#cultivate{
% %%                 attack = Cultivate#cultivate.attack + A,
% %%                 life = Cultivate#cultivate.life + B,
% %%                 skill_attack = Cultivate#cultivate.skill_attack + C,
% %%                 skill_defense = Cultivate#cultivate.skill_defense + D,
% %%                 defense = Cultivate#cultivate.defense + E
% %%             },
% %%             game_info:update(Cultivate2),
% %%             game_info:update(#cultivate_etc{}),
% %%             notify(?CULTIVATE_SAVE_SUCC, Sender)
% %%     end.


% run(#m__cultivate__run__c2s{type=Type}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Cultivate = GameInfo#game_info.cultivate,
%         [cultivate, _ | L] = erlang:tuple_to_list(Cultivate),

%         Cfg = cfg(lists:sum(L), Sender),

%         Pay =
%         case Type of
%             1 ->
%                 role_api:pay_gold(Cfg#cultivate_cfg.gold, Sender);
%             2 ->
%                 case role_api:change_power2(-Cfg#cultivate_cfg.power2, Sender) of
%                     false ->
%                         role_api:pay_coin(Cfg#cultivate_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender);
%                     true -> true
%                 end
%         end,

%         if not Pay -> throw({msg, ?NO_MONEY, Sender}); true -> ok end,

%         L2 = [rand_calc(Type, Cfg1) || Cfg1 <- Cfg#cultivate_cfg.attrs],
%         CultivateEtc = #cultivate_etc{ cultivate = L2 },

%         game_info:update(CultivateEtc),
%         [A1, A2, A3, A4, A5] = L2,

%         Msg = #m__cultivate__run__s2c{
%             attack = A1,
%             life = A2,
%             skill_defense = A3,
%             skill_attack = A4,
%             defense = A5
%         },
%         Sender ! {send, Msg}
%     end,
%     ?PERFORM(F).

% save(#m__cultivate__save__c2s{}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Cultivate = GameInfo#game_info.cultivate,
%         CultivateEtc = GameInfo#game_info.cultivate_etc,

%         [cultivate, _ | L] = erlang:tuple_to_list(Cultivate),
%         Cfg = cfg(lists:sum(L), Sender),

%         %% 是否保存过了
%         if CultivateEtc == undefined orelse CultivateEtc#cultivate_etc.cultivate == undefined ->
%             throw({msg, ?CULTIVATE_NO_LEGAL1, Sender});
%             true -> ok
%         end,

%         F =
%         fun(V1, V2, #cultivate_item_cfg{max=Max}) ->
%            case V1 + V2 of
%                V3 when V3 > Max -> Max;
%                V3 when V3 < 0 -> 0;
%                V3 -> V3
%            end
%         end,

%         [A1, A2, A3, A4, A5] = lists:zipwith3(F, L, CultivateEtc#cultivate_etc.cultivate, Cfg#cultivate_cfg.attrs),

%         Cultivate2 = Cultivate#cultivate{
%             attack = A1,
%             life = A2,
%             skill_defense = A3,
%             skill_attack = A4,
%             defense = A5
%         },
%         game_info:update(Cultivate2),
%         game_info:update(#cultivate_etc{}),

%         %% 更新挑战成就任务状态
%         update_quest_challenge_today(["id"|CultivateEtc#cultivate_etc.cultivate]),
%         update_quest_achievements(Cultivate2),

%         notify(?CULTIVATE_SAVE_SUCC, Sender)

%     end,
%     ?PERFORM(F).

% %===================================================================
% % Internal functions
% %===================================================================

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% rand_calc(Type, Cfg) ->
%     #cultivate_item_cfg{
%             l=L,
%             b=B,
%             gold_negative_chance=Chance1,
%             coin_negative_chance=Chance2
%             } = Cfg,

%     Chance = if Type == 1 -> Chance1; true -> Chance2 end,

%     case rand_srv:random(100) =< Chance of
%         true ->
%             -rand_srv:random(L);
%         false ->
%             rand_srv:random(B)

%     end.

% cfg(V, _Sender) ->
%     ?DEBUG_MSG("~p", [V]),
%     Keys = cultivate_cfg:get_all(),
%     case  lists:filter(fun(X) -> X >= V end, Keys) of
%         [] -> cultivate_cfg:get(lists:last(Keys));
%         [K|_] -> cultivate_cfg:get(K)
%     end.

% update_quest_challenge_today(Cultivate) -> 
%     C = list_to_tuple([cultivate|Cultivate]),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_PHYSIC_ATTACK_TODAY, 0, C#cultivate.attack),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_SKILL_ATTACK_TODAY, 0, C#cultivate.skill_attack),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_PHYSIC_DEFENCE_TODAY, 0, C#cultivate.defense),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_SKILL_DEFENCE_TODAY, 0, C#cultivate.skill_defense),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_LIFE_TODAY, 0, C#cultivate.life).

% update_quest_achievements(Cultivate) ->
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_PHYSIC_ATTACK,Cultivate#cultivate.attack, 0),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_SKILL_ATTACK,Cultivate#cultivate.skill_attack, 0),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_PHYSIC_DEFENCE,Cultivate#cultivate.defense, 0),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_SKILL_DEFENCE,Cultivate#cultivate.skill_defense, 0),
%     challenge_api:update_task_process(?CHALLENGE_TYPE_CULTIVATE_LIFE,Cultivate#cultivate.life, 0).

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

