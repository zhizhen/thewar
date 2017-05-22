%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(mission_mod).

% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% -export([
%     build_mission_info/3,
%     add_mission_times/2,
%     reset_mission_times/2,
%     build_notown_miss_info/2
% ]).

% %%%============================================================================
% %%% API
% %%%============================================================================

% build_mission_info(SceneId, #missions{all=Missions}, #daily{mission=MissionDaily}) ->
%     SceneCfg = scene_cfg:get(SceneId),
%     Fun = fun(X) ->
%         Daily = lists:keyfind(X#mission.mission_id, 1, MissionDaily),
%         case Daily of
%             false ->
%                 #p_mission{
%                         mission_id = X#mission.mission_id,
%                         state = X#mission.state,
%                         score = X#mission.score,
%                         times = 0,
%                         reset_times = 0
%                 };
%             {_, Times, RNum} ->
%                 #p_mission{
%                         mission_id = X#mission.mission_id,
%                         state = X#mission.state,
%                         score = X#mission.score,
%                         times = Times,
%                         reset_times = RNum
%                 }
%         end
%     end,

%     AllCfg = [mission_cfg:get(X#mission.mission_id) || X <- Missions, X#mission.state == ?MISSION_COMPLATED],
%     Normal = lists:max([0]++[X#mission_cfg.mission_id || X <- AllCfg, X#mission_cfg.type == ?MISSION_NORMAL]),
%     Super = lists:max([0]++[X#mission_cfg.mission_id || X <- AllCfg, X#mission_cfg.type == ?MISSION_SUPER]),
%     BigSuper = lists:max([0]++[X#mission_cfg.mission_id || X <- AllCfg, X#mission_cfg.type == ?MISSION_BIG_SUPER]),

%     #m__mission__all_info__s2c{
%             scene_id=SceneId,
%             max_normal_mission_id=Normal,
%             max_super_mission_id=Super,
%             max_big_super_mission_id=BigSuper,
%             mission=[Fun(X) || X <- Missions, lists:member(X#mission.mission_id, SceneCfg#scene_cfg.mission_list)]
%     }.

% add_mission_times(MissionId, #daily{mission=MissionDaily}=Daily) ->
%     Mission = lists:keyfind(MissionId, 1, MissionDaily),
%     case Mission of
%         false ->
%             Daily#daily{mission=Daily#daily.mission++[{MissionId, 1, 0}]};
%         {_, Num, RNum} ->
%             NewMissionDaily = lists:keyreplace(MissionId, 1, MissionDaily, {MissionId, Num+1, RNum}),
%             Daily#daily{mission=NewMissionDaily}
%     end.

% reset_mission_times(MissionId, #daily{mission=MissionDaily}=Daily) ->
%     Mission = lists:keyfind(MissionId, 1, MissionDaily),
%     case Mission of
%         false ->
%             Daily#daily{mission=Daily#daily.mission++[{MissionId, 0, 1}]};
%         {_, _, RNum} ->
%             NewMissionDaily = lists:keyreplace(MissionId, 1, MissionDaily, {MissionId, 0, RNum+1}),
%             Daily#daily{mission=NewMissionDaily}
%     end.

% build_notown_miss_info(#missions{all=Missions}, #daily{mission=MissionDaily}) ->
%     Fun = fun(X) ->
%         Daily = lists:keyfind(X#mission.mission_id, 1, MissionDaily),
%         case Daily of
%             false ->
%                 #p_mission{
%                         mission_id = X#mission.mission_id,
%                         state = X#mission.state,
%                         score = X#mission.score,
%                         times = 0,
%                         reset_times = 0
%                 };
%             {_, Times, RNum} ->
%                 #p_mission{
%                         mission_id = X#mission.mission_id,
%                         state = X#mission.state,
%                         score = X#mission.score,
%                         times = Times,
%                         reset_times = RNum
%                 }
%         end
%     end,
%     #m__mission__notown_info__s2c{
%         mission=[Fun(X) || X <- Missions, check_is_notown(X#mission.mission_id) == true]
%     }.

% check_is_notown(MissionId) ->
%     MissionCfg = mission_cfg:get(MissionId),
%     case MissionCfg#mission_cfg.type of
%         Type when Type >=4 andalso Type =<7 -> true;
%         _ -> false
%     end.
