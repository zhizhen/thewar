-module(scene_robot).
% -author("zhuo.yan").
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").

% -compile([export_all]).

% -export([handle/1]).

% -define(scene_id, robot:get_robot(sceneid)).
% %% -define(scene_id, 30001).

% p(R) -> error_logger:info_msg("~p ~n", [R]).


% move(#m__scene__move__s2c{}=_R) -> ok.
% leave(#m__scene__leave__s2c{}=_R) -> ok.
% update_pos(#m__scene__update_pos__s2c{}=_R) -> ok.
% neighbours(#m__scene__neighbours__s2c{}=_R) -> ok.
% lineinfo(_) -> ok.
% roleline(_) -> ok.


% switch(Line) ->
%     M = #m__scene__switch_line__c2s{line_id=Line},
%     esend(M).


% handle(try_entry) ->
%     Msg = #m__scene__enter__c2s{scene_id=?scene_id},
%     esend(Msg);

% handle(try_walk) ->
%     Cfg = scene_info_cfg:get(?scene_id),
%     #scene_info_cfg{born_x=X, born_y=Y} = Cfg,
%     bot_move:handle(update_pos, X, Y, 1, right, ?scene_id).

% switch_line(Line) ->
%     M = #m__scene__switch_line__c2s{line_id=Line},
%     esend(M).

% esend(Data) ->
%     robot:send2server(robot:get_robot(pid), Data).

