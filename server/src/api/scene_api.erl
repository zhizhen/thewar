%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-10 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(scene_api).

-include("logger.hrl").
-include("game_pb.hrl").
-include("msg_code.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("cfg_record.hrl").
-include("common.hrl").

-compile(export_all).

% %% API
% -export([move/2, update_pos/2, leave/2, enter/2, stop/2, switch_line/2]).
% -export([leave/3]).

% %% internal api
% -export([cleanup/0, open_function/1]).


% %%%===================================================================
% %%% Server API
% %%%===================================================================

% leave(#m__scene__leave__c2s{}, _Sender) -> ok.

% leave(Role, SceneId, LineId) ->
%     scene_srv:leave(Role#role.role_id, srv_name(SceneId), LineId).

%% @doc 进入地图 + 切换地图
enter(#m__scene__enter__c2s{scene_id=SceneId}, Sender) ->
    % SceneCfg = scene_cfg:get(SceneId),
    #game_info{role=Role} = role_api:get_user_data(),

    % OpenScene = Role#role.open_scene,
    % HasOpen = lists:member(SceneId, OpenScene),
    % IsSame = SceneEtc#scene_etc.current_scene_id == SceneId,

    % ?DEBUG_MSG("SceneEts ~p ~p ~n", [SceneEtc, SceneId]),


    % Cfg = scene_info_cfg:get(SceneId),
    % {LineId, OpenLines} =
    % case Cfg of
    %     #scene_info_cfg{type=Type} when Type == ?SCENE_CITY_TYPE ->
    %         case SceneCfg == false orelse HasOpen == false of
    %             true ->
    %                 ?DEBUG_MSG("cfg: ~p hasopen: ~p issame: ~p~n", [SceneCfg, HasOpen, IsSame]),
    %                 {checkfail, []};
    %             false when IsSame ->
    %                 {same, []};
    %             false ->
    %                 % 进入新地图, pos传{0,0}, 会自动修正为出生点
    %                 scene_srv:entry(Role#role.role_id, {0, 0}, srv_name(SceneId), SceneId)
    %         end;
    %     #scene_info_cfg{type = Type} when Type == ?SCENE_SPECIAL_TYPE ->
    %         case IsSame of
    %             true ->
    %                 {same, []};
    %             false ->
    %                 % 进入新地图, pos传{0,0}, 会自动修正为出生点
    %                 scene_srv:entry(Role#role.role_id, {0, 0}, srv_name(SceneId), SceneId)
    %         end;
    %     _ ->
    %         % 单人副本
    %         {pass, []}
    % end,

    % case LineId of
    %     checkfail ->
    %         % 配置问题 或者 未开放
    %         Sender ! {send, #m__system__notify__s2c{code=?SCENE_FAIL}};
    %     false ->
    %         % 进入srv失败
    %         Sender ! {send, #m__system__notify__s2c{code=?SCENE_FAIL}};
    %     same ->
    %         % 本来就在场景里
    %         fuck;
    %     _ ->
    %         % leave old scene
    %         case SceneEtc#scene_etc.current_scene_id of
    %             0 -> ok;
    %             OldSceneId ->
    %                 scene_srv:leave(Role#role.role_id, srv_name(OldSceneId), SceneEtc#scene_etc.line_id)
    %         end,

    %         NeedSave = Cfg#scene_info_cfg.type == ?SCENE_CITY_TYPE,

    %         game_info:update(#scene_etc{current_scene_id=SceneId,
    %             need_save=NeedSave, line_id=LineId,
    %             target_x=0, target_y=0}),

    %         case LineId of
    %             pass ->
    %                 Sender ! {send, #m__scene__roleline__s2c{line=0, openlines=[]}};
    %             _ when NeedSave ->
    %                 game_info:update(Role#role{scene_id=SceneId, pos_x=Cfg#scene_info_cfg.born_x, pos_y=Cfg#scene_info_cfg.born_y}),
    %                 Sender ! {send, #m__scene__roleline__s2c{line=LineId, openlines=OpenLines}};
    %             _ ->
    %                 Sender ! {send, #m__scene__roleline__s2c{line=LineId, openlines=OpenLines}}
    %         end
    % end.
    scene_srv:entry(Role#role.role_id, srv_name(SceneId), SceneId),
    ok.

% %% @doc 开始移动
% move(#m__scene__move__c2s{dest_x=Dx, dest_y=Dy}, _Sender) ->
%     #game_info{role=Role, scene_etc=SceneEtc} = role_api:get_user_data(),
%     #scene_etc{line_id=LineId, target_x=X, target_y=Y} = SceneEtc,

%     SceneId = scene_id(Role, SceneEtc),
%     Cfg = scene_info_cfg:get(SceneId),

%     case Cfg#scene_info_cfg.width < Dx orelse Cfg#scene_info_cfg.height < Dy of
%         true -> ?DEBUG_MSG("ERROR!!!!!!: m__scene__move__c2s{x=~p, y=~p} check fail~n", [Dx, Dy]);
%         false ->
%             case {X, Y} /= {Dx, Dy} of
%                 false -> false;
%                 true ->
%                     game_info:update(SceneEtc#scene_etc{target_x=Dx, target_y=Dy}),
%                     scene_srv:move(Role#role.role_id, srv_name(SceneId), {Dx, Dy}, LineId)
%             end
%     end.

% %% @doc 同步位置 sync
% update_pos(#m__scene__update_pos__c2s{pos_x=X, pos_y=Y}, _Sender) ->
%     #game_info{role=Role, scene_etc=SceneEtc} = role_api:get_user_data(),

%     SceneId = scene_id(Role, SceneEtc),
%     Cfg = scene_info_cfg:get(SceneId),
%     case Cfg#scene_info_cfg.width < X orelse Cfg#scene_info_cfg.height < Y of
%         true -> ?DEBUG_MSG("ERROR!!!!!!: m__scene__update_pos__c2s{x=~p, y=~p} check fail~n", [X, Y]);
%         false ->
%             case SceneEtc#scene_etc.need_save of
%                 true ->
%                     game_info:update(Role#role{pos_x=X, pos_y=Y});
%                 _ -> ok
%             end,
%             #scene_etc{line_id=LineId} = SceneEtc,
%             scene_srv:sync(Role#role.role_id, srv_name(SceneId), {X, Y}, LineId)
%     end.

% %% @doc 停止移动
% stop(#m__scene__stop__c2s{}, _Sender) ->
%     #game_info{role=Role, scene_etc=SceneEtc} = role_api:get_user_data(),
%     #scene_etc{target_x=X, target_y=Y, line_id=LineId} = SceneEtc,
%     case {X, Y} /= {0, 0} of
%         true when SceneEtc#scene_etc.need_save ->
%             game_info:update(Role#role{pos_x=X, pos_y=Y});
%         _ -> ok
%     end,
%     SceneId = scene_id(Role, SceneEtc),
%     scene_srv:stop(Role#role.role_id, srv_name(SceneId), LineId).

% %% @doc 切线
% switch_line(#m__scene__switch_line__c2s{line_id=LineId}, Sender) ->
%     #game_info{role=Role, scene_etc=SceneEtc} = role_api:get_user_data(),
%     SceneId = scene_id(Role, SceneEtc),
%     case scene_srv:join_line(Role, srv_name(SceneId), SceneId, SceneEtc#scene_etc.line_id, LineId) of
%        true ->
%            game_info:update(SceneEtc#scene_etc{line_id=LineId}),
%            Sender ! {send, #m__system__notify__s2c{code=?SWITCH_SUCC}};
%        false ->
%            Sender ! {send, #m__system__notify__s2c{code=?SWITCH_FAIL}}
%     end.


% %% internal api
% cleanup() ->
%     #game_info{role=Role, scene_etc=SceneEtc} = role_api:get_user_data(),
%     #scene_etc{current_scene_id=SceneId} = SceneEtc,
%     case SceneId of
%         0 -> ok;
%         _ ->
%             scene_srv:leave(Role#role.role_id, srv_name(SceneId), SceneEtc#scene_etc.line_id)
%     end.

% scene_id(Role, SceneEtc) ->
%     case SceneEtc#scene_etc.current_scene_id /= 0 of
%         true ->
%             SceneEtc#scene_etc.current_scene_id;
%         false ->
%             Role#role.scene_id
%     end.


srv_name(SceneId) ->
    Cfg = line_cfg:get(SceneId),
    case catch scene_mod:scene_name(SceneId) of
        {'EXIT', _Reason} ->
%%             ?DEBUG_MSG("EXIT: sceneid: ~p ~nCfg: ~p~n, Reason:~p~n", [SceneId, Cfg, Reason]),
            ?DEBUG_MSG("leave sceneId: ~p ~n", [SceneId]),
            false;
        O -> O
    end.

% open_function(_FuncId) ->
%     ok.
