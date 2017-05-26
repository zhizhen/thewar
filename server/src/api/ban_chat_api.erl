%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-6-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(ban_chat_api).

% -include("table_etc.hrl").
% -include("table_record.hrl").

% -export([
%     ban/1,
%     un_ban/0,
%     is_banned/0
% ]).

% %%%===================================================================
% %%% INTERNAL API
% %%%===================================================================

% ban(Minute) ->
%     GameInfo = role_api:get_user_data(),
%     RoleId = GameInfo#game_info.role#role.role_id,
%     Seconds = Minute * 60,
%     EndTime = util:unixtime() + Seconds,
%     B = #ban_chat{role_id=RoleId, end_time=EndTime},
%     game_info:update(B),
%     ban_chat_db:save(B).
%     %todo send msg to client

% un_ban() ->
%     GameInfo = role_api:get_user_data(),
%     RoleId = GameInfo#game_info.role#role.role_id,
%     B = #ban_chat{role_id=RoleId, end_time=0},
%     game_info:update(B),
%     ban_chat_db:save(B).
%     %todo send msg to client

% is_banned() ->
%     GameInfo = role_api:get_user_data(),
%     #ban_chat{end_time=EndTime} = GameInfo#game_info.ban_chat,
%     util:unixtime() < EndTime.

%%%===================================================================
%%% Internal functions
%%%===================================================================
