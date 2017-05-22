%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-19 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(offline_api).

% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("game_pb.hrl").

% %% API
% -export([
%     get/2,
%     start_overleap/2,
%     stop_overleap/2,
%     get_overleap_logs/2
% ]).

% -export([reset_off_exp_time/0, open_function/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% get(#m__offline__get__c2s{}, Sender) ->
%     F = fun() ->
%             GameInfo = role_api:get_user_data(),
%             Role = GameInfo#game_info.role,
%             Offline = GameInfo#game_info.offline,
%             All = ?NOW - Offline#offline.offexp_time,
            
%             Cfg = viprelate_cfg:get(Role#role.vip),
%             CfgE = expoffline_cfg:get(Role#role.level),

%             if  Cfg =:= false orelse CfgE =:= false ->
%                     throw({msg, ?OFFLINE_PARAMS_ERROR1, Sender});
%                 true -> ok
%             end,

%             T = erlang:min(All, Cfg#viprelate_cfg.expoffline_max_time * 3600),
%             ExpT = (T div CfgE#expoffline_cfg.time) * CfgE#expoffline_cfg.exp,
%             role_api:add_exp(ExpT, Sender),

%             offline_api:reset_off_exp_time(),
%             notify(?OFFLINE_GET_EXP_SUCC, Sender)
%     end,
%     performer(F).

% reset_off_exp_time() ->
%     #game_info{offline = Offline} = role_api:get_user_data(),
%     game_info:update(Offline#offline{offexp_time = ?NOW}).


% start_overleap(#m__offline__start_overleap__c2s{mission_id=MissionId, times=Times}, ClientSender) ->
%     F = fun() ->
%         #game_info{role = Role, role_etc=RoleEtc, mission=Missions, daily = Daily, package=Package} = role_api:get_user_data(),
%         Cfg = mission_cfg:get(MissionId),
%         if Cfg == false ->
%             throw({msg, ?OFFLINE_PARAMS_ERROR2, ClientSender});
%             true -> ok
%         end,

%         if Cfg#mission_cfg.need_level > Role#role.level ->
%             throw({msg, ?OFFLINE_PARAMS_ERROR3, ClientSender});
%             true -> ok
%         end,

%         if RoleEtc#role_etc.mission_process /= ?MISSION_OUT ->
%             throw({msg, ?OFFLINE_PARAMS_ERROR4, ClientSender});
%             true -> ok
%         end,

%         if Times =< 0 ->
%             throw({msg, ?OFFLINE_PARAMS_ERROR5, ClientSender});
%             true -> ok
%         end,

%         ComplateMission = [X#mission.mission_id || X <- Missions#missions.all, X#mission.state==?MISSION_COMPLATED],
%         case lists:member(MissionId, ComplateMission) of
%             false ->throw({msg, ?OFFLINE_PARAMS_ERROR6, ClientSender});
%             _ -> ok
%         end,

%         case Cfg#mission_cfg.need_power * Times > Role#role.power of
%             true -> throw({msg, ?OFFLINE_PARAMS_ERROR7, ClientSender});
%             _ -> ok
%         end,

%         case erlang:length(package_mod:get_empty_slots(Package)) == 0 of
%             true -> throw({msg, ?OFFLINE_PARAMS_ERROR8, ClientSender});
%             _ -> ok
%         end,

%         MissionDaily = lists:keyfind(MissionId, 1, Daily#daily.mission),
%         case MissionDaily of
%             {_, N, _} ->
%                 if
%                     Cfg#mission_cfg.daily_times == 0 -> ok;
%                     Cfg#mission_cfg.daily_times =< N -> throw({msg, ?OFFLINE_PARAMS_ERROR9, ClientSender});
%                     true -> ok
%                 end;
%             false -> ok
%         end,

%         Mission = lists:keyfind(MissionId, #mission.mission_id, Missions#missions.all),
%         if Mission == false ->
%             throw({msg, ?NOT_IN_MISSION, ClientSender});
%             true -> ok
%         end,

%         case Cfg#mission_cfg.type of
%             ?MISSION_SUPER -> living_api:mission_super(ClientSender);
%             ?MISSION_BIG_SUPER -> living_api:mission_big_super(ClientSender);
%             _ -> ok
%         end,

%         overleap_buff_api:create_buff(MissionId, Times),

%         ClientSender ! {send, #m__system__notify__s2c{code=?MISSION_OVERLEAP_SUCESS}}
%     end,
%     performer(F).

% stop_overleap(#m__offline__stop_overleap__c2s{}, ClientSender) ->
%     buff_api:remove_buff(?OVERLEAP_BUFF_ID),
%     ClientSender ! {send, #m__system__notify__s2c{code=?MISSION_OVERLEAP_STOP}}.

% get_overleap_logs(#m__offline__get_overleap_logs__c2s{}, Sender) ->
%     #game_info{offline=Offline} = role_api:get_user_data(),
%     Sender ! {send, #m__offline__get_overleap_logs__s2c{logs=Offline#offline.overleap_logs}}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% open_function(_FuncId) ->
%     % offline_api:reset_off_exp_time(),
%     ok.

% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
