%% Copyright
-module(friend_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([create/0, get/1, gets/1, get_follower/1, update/1, delete/1, save/1]).

create() -> ok.

get(RoleId) ->
    Template = <<"SELECT * FROM friends WHERE role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_data(Rows).

%% @doc 加我为好友的，并且不是我的仇敌的人
get_follower(RoleId) ->
    Template = <<"select role_id from friends where friend_id=~p and state=~p and role_id not in (select friend_id from friends where role_id=~p and state=~p)">>,
    Params = [RoleId, ?FRIEND_GOOD, RoleId, ?FRIEND_BAD],
    Query = ?FILTER_SQL(Template, Params),
    All = mysql_db:select(Query),
    #follower_etc{all= [FRoleId || [FRoleId] <- All]}.

% %% @doc 把我当仇敌的人
% get_enemy(RoleId) ->
%     Template = <<"select role_id from friends where friend_id=~p and state=~p">>,
%     Params = [RoleId, ?FRIEND_BAD],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:select(Query).

gets([]) -> #friend_etc{};
gets(Friends) ->
    RoleIds = [Friend#friend.friend_id || Friend <- Friends],
    Roles = role_db:gets(RoleIds),
    FRoles = [friend_mod:role2f_role(R) || R <- Roles],
    #friend_etc{all=FRoles}.

% add(Friend) ->
%     Query = ?FILTER_SQL(?update_friend_sql, ?TAIL(Friend)),
%     try
%         mysql_db:update(Query)
%     catch
%         throw:Reason ->
%             ?ERROR_MSG("add friends:~n~p~n", [Reason])
%     end.

delete(#friend{role_id=RoleId, friend_id=FriendId}) ->
    Template = <<"delete from friends where role_id=~p and friend_id=~p">>,
    Params = [RoleId, FriendId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:delete(Query).

update(Friend) ->
    Query = ?FILTER_SQL(?update_friend_sql, ?TAIL(Friend)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("update friends:~n~p~n", [Reason])
    end.

%% @doc 存档
save(#friends{all=Friends}) ->
    [update(Friend) || Friend <- Friends].

%% internal
build_data(Rows) ->
    All = [ build_friend_data(Row) || Row <- Rows],
    #friends{all=All}.

build_friend_data([RoleId, FriendId, State, CreateAt]) ->
    #friend{role_id=RoleId, friend_id=FriendId, state=State, created_at=CreateAt}.

