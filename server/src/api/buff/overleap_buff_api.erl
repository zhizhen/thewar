%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(overleap_buff_api).

% -include("game_pb.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").

% %% API
% -export([
%     tick/1,
%     create_buff/2
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% create_buff(MissionId, AllTimes) ->
%     #process_global_info{role_id=RoleId} = cache:find(process_global_info),
%     Now = util:unixtime(),
%     Buff = #buff{
%         role_id=RoleId,
%         buff_id = ?OVERLEAP_BUFF_ID,
%         created_at = Now,
%         last_time = Now,
%         run_times = 0,
%         info = util:to_list(MissionId) ++ "," ++ util:to_list(AllTimes)
%     },
%     #game_info{offline=Offline} = role_api:get_user_data(),
%     game_info:update(Offline#offline{overleap_logs=""}),
%     buff_api:add_buff(Buff).


% tick(Buff) ->
%     F = fun() ->
%         [MissionId, AllTimes] = [util:to_integer(X) || X <- string:tokens(util:to_list(Buff#buff.info), ",")],
%         #game_info{role=Role} = role_api:get_user_data(),

%         Cfg = mission_cfg:get(MissionId),

%         case AllTimes =< Buff#buff.run_times of
%             true -> throw(delete);
%             false -> ok
%         end,

%         Now = util:unixtime(),
%         case Now - Buff#buff.last_time < ?OVERLEAP_TIME(Role#role.vip, Cfg#mission_cfg.type) of
%             true -> throw({ignore, Buff});
%             false -> ok
%         end,

%         case overleap(Buff, self()) of
%             delete -> throw(delete);
%             _ -> ok
%         end,

%         NewBuff = Buff#buff{last_time=Buff#buff.last_time+?OVERLEAP_TIME(Role#role.vip, Cfg#mission_cfg.type), run_times=Buff#buff.run_times+1},
%         NewBuff
%     end,
%     performer(F).

% overleap(Buff, ClientSender) ->
%     F = fun() ->
%         [MissionId, _] = [util:to_integer(X) || X <- string:tokens(util:to_list(Buff#buff.info), ",")],

%         #game_info{mission=Missions, daily=Daily, package=Package, role=Role} = role_api:get_user_data(),

%         Cfg = mission_cfg:get(MissionId),

%         case Cfg#mission_cfg.need_power > Role#role.power of
%             true -> throw(delete);
%             _ -> ok
%         end,

%         case erlang:length(package_mod:get_empty_slots(Package)) == 0 of
%             true -> throw(delete);
%             _ -> ok
%         end,

%         MissionDaily = lists:keyfind(MissionId, 1, Daily#daily.mission),
%         case MissionDaily of
%             {_, N, _} ->
%                 if
%                     Cfg#mission_cfg.daily_times == 0 -> ok;
%                     Cfg#mission_cfg.daily_times =< N -> throw(delete);
%                     true -> ok
%                 end;
%             false -> ok
%         end,

%         Mission = lists:keyfind(MissionId, #mission.mission_id, Missions#missions.all),
%         Star = trans_level_to_star(Role#role.vip, Mission#mission.mission_id),
%         Awards = case Star of
%                     1 -> Cfg#mission_cfg.awards_a;
%                     2 -> Cfg#mission_cfg.awards_b;
%                     3 -> Cfg#mission_cfg.awards_c;
%                     4 -> Cfg#mission_cfg.awards_d;
%                     5 -> Cfg#mission_cfg.awards_e;
%                     6 -> Cfg#mission_cfg.awards_f
%                  end,

%         NewDaily = mission_mod:add_mission_times(MissionId, Daily),
%         game_info:update(NewDaily),

%         role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender, quiet),
%         role_api:minus_power(Cfg#mission_cfg.need_power, ClientSender),

%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_MISSION, MissionId, 1),              % 副本任务按id算
%         quest_api:add_quest_process(?QUEST_EVENT_TYPE_ALL_MISSION, Cfg#mission_cfg.type, 1),              % 副本任务按类型算
%         case mission_monster_cfg:get(MissionId) of
%             false -> throw(delete);
%             Monsters ->
%                 TaskMonster = fun({MonsterId, Num}) ->
%                     quest_api:add_quest_process(?QUEST_EVENT_TYPE_ENEMY, MonsterId, Num)      % 击杀怪物任务
%                 end,
%                 [TaskMonster(X) || X <- Monsters]
%         end,

%         ClientSender ! {send, #m__offline__overleap_award__s2c{awards=[]}}
%     end,
%     performer(F).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% trans_level_to_star(RoleVip, MissionId)->
%     VipCfg = viprelate_cfg:get(RoleVip),
%     MissionCfg = mission_cfg:get(MissionId),
%     Level = case MissionCfg#mission_cfg.type of
%                 1 -> VipCfg#viprelate_cfg.normal_overleap_level;
%                 2 -> VipCfg#viprelate_cfg.super_overleap_level;
%                 3 -> VipCfg#viprelate_cfg.ssuper_overleap_level
%             end,
%     Star = case Level of
%                 ["SSS"] -> 1;
%                 ["SS"] -> 2;
%                 ["S"] -> 3;
%                 ["A"] -> 4;
%                 ["B"] -> 5;
%                 ["C"] -> 6
%             end,
%     Star.

% % add_overleap_logs(Logs) ->
% %     #game_info{offline=Offline} = role_api:get_user_data(),
% %     Log = string:join([X || X <- Logs, lists:member(X, [<<>>, ""]) == false], "|"),
% %     NewOffline = case util:to_list(Offline#offline.overleap_logs) == "" of
% %         true -> Offline#offline{overleap_logs=Log};
% %         false -> Offline#offline{overleap_logs=util:to_list(Offline#offline.overleap_logs) ++ "," ++ Log}
% %     end,
% %     game_info:update(NewOffline).


% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw({ignore, Buff}) ->
%     Buff;

% handle_throw(delete) ->
%     delete;

% handle_throw(Reason) ->
%     throw(Reason).

