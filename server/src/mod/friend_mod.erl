%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-18 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(friend_mod).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("logger.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").

% -export([info/2, is_friend/2, is_enemy/2, is_max/2]).
% -export([build_list/2, build_list_push/3]).
% -export([role_info/1]).
% -export([role2f_role/1]).

% %% API

% %%%===================================================================
% %%% API
% %%%===================================================================

% info(Friends, FRoleId) ->
%     FRoleId2 = util:to_binary(FRoleId),
%     case lists:keyfind(FRoleId2, #friend.friend_id, Friends) of
%         #friend{} =Info -> Info;
%         _Other -> false
%     end.

% is_friend(Friends, FRoleId) ->
%     Info = info(Friends, FRoleId),
%     Info /= false andalso Info#friend.state == ?FRIEND_GOOD.

% is_enemy(Friends, FRoleId) ->
%     Info = info(Friends, FRoleId),
%     Info /= false andalso Info#friend.state == ?FRIEND_BAD.

% is_max(Friends, ?FRIEND_GOOD) ->
%     length([1 || #friend{state=State} <-Friends, State==?FRIEND_GOOD]) >= ?FRIEND_GOOD_MAX;
% is_max(Friends, ?FRIEND_BAD) ->
%     length([1 || #friend{state=State} <-Friends, State==?FRIEND_BAD]) >= ?FRIEND_BAD_MAX.


% role_info(Name) ->
%     case role_db:get_role_by_name(Name) of
%         #role{} = D -> D;
%         _ -> false
%     end.

% build_list(Friends, FRoles) ->
%     F = fun(FriendId) ->
%             case lists:keyfind(FriendId, #friend.friend_id, Friends) of
%                 #friend{state=S} -> S;
%                 _ -> ?FRIEND_GOOD
%             end
%         end,

%     F2 = fun(_, ?OFFLINE) -> ?OFFLINE;
%             (FriendId, ?ONLINE) ->
%                 case lists:keyfind(FriendId, #friend.friend_id, Friends) of
%                     #friend{state=S} when S =:= ?FRIEND_BAD -> ?OFFLINE;
%                     _ -> ?ONLINE
%                 end
%                 % case lists:member(FriendId, Enemy) of
%                 %     true -> ?OFFLINE;
%                 %     false -> ?ONLINE
%                 % end
%     end,

%     [#p_friend{role_id=RoleId, name=Name, level=Level, job=Job, state=F(RoleId), isonline=F2(RoleId, OnlineState)}
%         || #f_role{role_name=Name, role_id=RoleId, level=Level, job=Job, online_state=OnlineState} <- FRoles].

% build_list_push(Friends, URoleId, Roles) ->
%     F = fun(FriendId) ->
%         case lists:keyfind(FriendId, #f_role.role_id, Friends) of
%             false -> true;
%             _ -> false
%         end
%     end,
%     [#p_friend{role_id=RoleId, name=Name, level=Level, job=Job, state=0, isonline=?ONLINE}
%         || #role{role_name=Name, role_id=RoleId, level=Level, job=Job} <- Roles, RoleId /= URoleId, F(RoleId)].


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% role2f_role(#role{}=Role) ->
%     #role{role_name=Name, role_id=RoleId, level=Level, job=Job, online_state=OnlineState} = Role,
%     #f_role{role_name=Name, role_id=RoleId, level=Level, job=Job, online_state=OnlineState}.
