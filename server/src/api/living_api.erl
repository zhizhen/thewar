%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-14 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(living_api).

% -include("cfg_record.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% %% API
% -export([show/2, get/2, get_live_value/2]).
% -export([handle_throw/1]).

% -export([sign/1, clifford/1, coin2gold/1, daily_quest/1, interact/1, arena_challenge/1, shop_refresh/1, spirit_get/1, golden_mission/1]).
% -export([scout_random/1, warrior_collect/1, mission_super/1, mission_big_super/1, worldboss_join/1, mall_buy/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% show(#m__living__show__c2s{}, Sender) ->
%     #game_info{role = Role, daily=Daily, achievements = AchInfo} = role_api:get_user_data(),
%     Arena = arena_srv:get_info_by_role_id(Role#role.role_id),
%     show2(Role, Daily, Arena, AchInfo, Sender).

% show2(_Role, Daily, Arena, AchInfo, Sender) ->
%     Honor = case Arena of
%         false -> 0;
%         #sys_arena_rank{total_honor = H} -> H
%     end,
%     Finished = [Item#challenge_item.item_id || Item <- AchInfo#achievement.info, Item#challenge_item.status =:= ?TASK_AWARDED],
%     Achievements = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- AchInfo#achievement.info, Process =/= 0 andalso Status =/= ?TASK_AWARDED],

%     Sender ! {send, #m__living__show__s2c{
%             value = Daily#daily.live_value, 
%             livekv = Daily#daily.live_kv, 
%             got = Daily#daily.live_got,
%             total_honor = Honor,
%             challenge_finished = Finished,
%             achievements = Achievements
%         }}.

% %% @doc 锦囊
% get(#m__living__get__c2s{id=Id}, Sender) ->
%     #game_info{daily=Daily} = role_api:get_user_data(),
%     #daily{live_value=Value, live_got=Got} = Daily,
%     F = fun() ->
%         Cfg = living2_cfg:get(Id),
%         if not Cfg -> throw({msg, ?LIVING_NO_LEGAL1, Sender}); true -> ok end,
%         if Cfg#living2_cfg.value > Value -> throw({msg, ?LIVING_NO_LEGAL2, Sender}); true -> ok end,
%         case lists:member(Id, Got) of
%             true -> throw({msg, ?LIVING_NO_LEGAL3, Sender});
%             false -> ok
%         end,
%         role_api:get_award(Cfg#living2_cfg.award, ?CURR_MODE_FUNC, Sender),
%         game_info:update(Daily#daily{live_got=[Id|Got]}),
%         Sender ! {send, #m__living__get__s2c{id=Id}}
%     end,
%     ?PERFORM(F).

% get_live_value(#m__living__get_live_value__c2s{id = Id}, Sender) ->
%     #game_info{daily=Daily} = role_api:get_user_data(),
%     #daily{live_kv=Kv} = Daily,

%     case lists:keyfind(Id, #p_livekv.id, Kv) of
%         false -> Sender ! {send, #m__system__notify__s2c{code = ?LIVING_GET_VALUE_FAIL}};
%         Value ->
%             case Value#p_livekv.task_status of
%                 1 -> Sender ! {send, #m__system__notify__s2c{code = ?LIVING_GET_VALUE_FAIL}};
%                 _ ->
%                     Cfg = living_cfg:get(Value#p_livekv.id),
%                     V = Cfg#living_cfg.value,
%                     case Value#p_livekv.count >= Cfg#living_cfg.needcount of
%                         false -> Sender ! {send, #m__system__notify__s2c{code = ?LIVING_GET_VALUE_FAIL}};
%                         true -> 
%                             Kv2 = lists:keyreplace(Id, #p_livekv.id, Kv, Value#p_livekv{task_status=1}),
%                             Daily2 = Daily#daily{live_kv=Kv2},
%                             game_info:update(Daily2#daily{live_value = Daily2#daily.live_value + V, live_kv = Kv2}),
%                             Sender ! {send, #m__system__notify__s2c{code = ?LIVING_GET_VALUE_SUCC}}
%                     end
%             end
%     end.

% %% hook api
% sign(Sender)    ->          add_value(1, Sender).
% clifford(Sender) ->         add_value(2, Sender).
% coin2gold(Sender) ->        add_value(3, Sender).
% daily_quest(Sender) ->      add_value(4, Sender).
% interact(Sender) ->         add_value(5, Sender).
% arena_challenge(Sender) ->  add_value(6, Sender).
% %% tmp7(Sender) ->          add_value(7, Sender).
% shop_refresh(Sender) ->     add_value(8, Sender).
% spirit_get(Sender) ->       add_value(9, Sender).
% golden_mission(Sender) ->   add_value(10, Sender).
% scout_random(Sender) ->     add_value(11, Sender).
% warrior_collect(Sender) ->  add_value(12, Sender).
% worldboss_join(Sender) ->   add_value(13, Sender).
% mission_super(Sender) ->    add_value(14, Sender).
% mission_big_super(Sender) ->add_value(15, Sender).
% mall_buy(Sender) ->         add_value(16, Sender).


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% add_value(K, Sender) ->
%     Cfg = living_cfg:get(K),
%     Count = Cfg#living_cfg.needcount,
%     #game_info{role = Role, daily=Daily, achievements = AchInfo} = role_api:get_user_data(),

%     case lists:keyfind(K, #p_livekv.id, Daily#daily.live_kv) of
%         false ->
%             % first trigger
%             V = 0,
%             Kv = [#p_livekv{id=K, count=V, task_status = 0}| Daily#daily.live_kv];
%         #p_livekv{id=K, count=V} ->
%             Kv = Daily#daily.live_kv
%     end,
%     case V of
%         Count -> ok;
%         V when V < Count ->
%             Count2 = V + 1,
%             Kv2 = lists:keyreplace(K, #p_livekv.id, Kv, #p_livekv{id=K, count=Count2, task_status=0}),
%             Daily2 = Daily#daily{live_kv=Kv2},
%             game_info:update(Daily2),
%             % %% 更新挑战成就任务 活跃度
%             % challenge_api:update_task_process(?CHALLENGE_TYPE_LIVING_VALUE, Daily2#daily.live_value, 0),
%             Arena = arena_srv:get_info_by_role_id(Role#role.role_id),
%             show2(Role, Daily2, Arena, AchInfo, Sender);
%         _ -> wrong
%     end.


% %% all_complete(Kv, OId) ->
% %%     F = fun() ->
% %%     [begin
% %%         Cfg = living_cfg:get(K),
% %%         NeedCount = Cfg#living_cfg.needcount,
% %%         case lists:keyfind(K, #p_livekv.id, Kv) of
% %%             false -> throw(false);
% %%             #p_livekv{count=Count} when Count==NeedCount-> ok;
% %%             _ -> throw(false)
% %%         end
% %%     end || K <- living_cfg:get_all(), K /= OId]
% %%     end,
% %%
% %%     case catch F() of
% %%     List when is_list(List) -> true;
% %%     _Other -> false
% %%     end.

% % callback
% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
