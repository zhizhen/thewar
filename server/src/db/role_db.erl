%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(role_db).

-include("logger.hrl").
-include("common.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("cfg_record.hrl").

%% API
-export([
    get/1,
    gets/1,
    save/1,
    list/1,
    create/3,
    incr/3,
    set/3,
    get_role_by_name/1,
    get_role_name_by_id/1,
    get_role_by_account_id_and_role_id/2,
    get_max_role_id/0,
    check_role_id/1,
    reset_all_online_state/0,
    erase/1
]).

%%%===================================================================
%%% API
%%%===================================================================
check_role_id(RoleId) ->
    Template = <<"SELECT COUNT(*) FROM roles WHERE role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    [Count] = mysql_db:get(Query),
    case Count of
        0 -> false;
        _ -> true
    end.

%% @doc 获取玩家数据
get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_role_sql, Params),
    Row = mysql_db:get(Query),
    build_role_data(Row).

gets(Ids) ->
    Template1 = <<"select * from roles where ">>,
    Template2 = ["role_id=~p" || _ <- lists:duplicate(length(Ids), 1)],
    Template3 = string:join(Template2, " or "),
    Template4 = erlang:list_to_binary([Template1 | erlang:list_to_binary(Template3)]),
    Query = ?FILTER_SQL(Template4, Ids),
    Rows = mysql_db:select(Query),
    [build_role_data2(Row) || Row <- Rows, Row /= []].

get_role_by_name(Name) ->
    Template = <<"SELECT * FROM roles WHERE role_name='~ts'">>,
    Params = [Name],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_role_data(Row).

get_role_name_by_id(Id) ->
    Template = <<"SELECT role_name FROM roles WHERE role_id=~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    [Row] = mysql_db:get(Query),
    Row.

get_role_by_account_id_and_role_id(AccountId, RoleId) ->
    %% state 为0时角色正常，为1时被封禁，为2时被删除。
    Template = <<"SELECT * FROM roles WHERE account_id=~p AND role_id=~p">>,
    Params = [AccountId, RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_role_data(Row).

%% @doc 获取最大角色id
get_max_role_id() ->
    Query = <<"SELECT MAX(CAST(role_id AS SIGNED)) FROM roles">>,
    [MaxRoleId] = mysql_db:get(Query),
    MaxRoleId.

%% @doc 玩家角色列表
list(AccountId) ->
    Template = <<"SELECT role_id, role_name, account_id, create_time, login_time
        FROM roles
        WHERE account_id=~p 
        ORDER BY login_time DESC">>,
    Params = [AccountId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:select(Query).

%% @doc 创建玩家角色
create(RoleId, AccountId, Name) ->
    CreateTime = util:unixtime(),
    % Cfg = scene_info_cfg:get(20001),
    % #scene_info_cfg{born_x=PosX, born_y=PosY} = Cfg,

    Role = #role{
        role_id = RoleId,
        account_id = AccountId,
        role_name = util:to_binary(Name),
        create_time = CreateTime,
        login_time = CreateTime
        % job = Job,
        % scene_id = 20001,
        % pos_x = PosX,
        % pos_y = PosY,
        % story = "",
        % guide = ""
    },

    % SceneIds = serilize(Role#role.open_scene),
    % FuncIds = serilize(Role#role.open_function),
    % StoryIds = serilize(Role#role.story),
    % Guide = serilize(Role#role.guide),
    % NewRole = Role#role{open_scene=SceneIds, open_function=FuncIds, story=StoryIds, guide=Guide},

    Query = ?FILTER_SQL(?update_role_sql, ?TAIL(Role)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save role error:~n~p~n", [Reason])
    end.

%% @doc 存储角色信息
save(Role) ->
    % NowTime = util:unixtime(),
    % UpdateRole = Role#role{update_time=NowTime, ol_time=role_api:get_all_ol_time()},
    % game_info:update(UpdateRole),

    % SceneIds = serilize(Role#role.open_scene),
    % FuncIds = serilize(Role#role.open_function),
    % StoryIds = serilize(Role#role.story),
    % Guide = serilize(Role#role.guide),
    % Treasure = serialize_treasure(Role#role.treasure),
    % NewRole = Role#role{open_scene=SceneIds, open_function=FuncIds, update_time=NowTime, story=StoryIds, treasure = Treasure, ol_time=role_api:get_all_ol_time(), guide=Guide},

    Query = ?FILTER_SQL(?update_role_sql, ?TAIL(Role)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save role error:~n~p~n", [Reason])
    end.

incr(RoleId, Elem, Value) ->
    Template = <<"update roles set ~ts=~ts+~p where role_id=~ts">>,
    Params = [util:to_list(Elem),util:to_list(Elem), Value, RoleId],
    
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

set(RoleId, Elem, Value) ->
    Template = <<"update roles set ~ts=~p where role_id=~ts">>,
    Params = [util:to_list(Elem), Value, RoleId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

reset_all_online_state() ->
    Template = <<"UPDATE roles SET online_state = ~p">>,
    Params = [?OFFLINE],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

erase(RoleId) ->
    Sqls = [
%%         <<"delete from accounts">>,
        <<"delete from achievements">>,
        <<"delete from activity">>,
        <<"delete from arenas">>,
        <<"delete from ban_chat">>,
        <<"delete from boudoirs">>,
        <<"delete from buffs">>,
%%         <<"delete from charm">>,
        <<"delete from coin2exp">>,
        <<"delete from cultivate">>,
        <<"delete from daily">>,
        <<"delete from daily_quests">>,
        <<"delete from equips">>,
        <<"delete from explores">>,
        <<"delete from feedback">>,
        <<"delete from friends">>,
%%         <<"delete from group_boss">>,
        <<"delete from group_member">>,
        <<"delete from group_pool">>,
        <<"delete from group_role_meeting">>,
        <<"delete from group_state">>,
        <<"delete from group_trees">>,
%%         <<"delete from groups">>,
        <<"delete from items">>,
        <<"delete from mails">>,
        <<"delete from missions">>,
%%         <<"delete from notice">>,
        <<"delete from offline">>,
        <<"delete from packages">>,
        <<"delete from quests">>,
        <<"delete from role_warrior">>,
        <<"delete from roles">>,
        <<"delete from shops">>,
        <<"delete from sign">>,
        <<"delete from skills">>,
        <<"delete from spirit_npcs">>,
        <<"delete from spirit_packs">>,
        <<"delete from spirit_slots">>,
        <<"delete from spirits">>,
%%         <<"delete from sys_arena_info">>,
%%         <<"delete from sys_arena_rank">>,
        <<"delete from treasure_loot">>,
        <<"delete from treasures">>,
        <<"delete from universes">>,
        <<"delete from warrior">>,
        <<"delete from world_boss">>
    ],
    [ catch mysql_db:update(list_to_binary([Sql, <<" where role_id=">>, util:to_binary(RoleId)])) || Sql <- Sqls].

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_role_data(null) -> null;
build_role_data(Row) ->
    Role = list_to_tuple([role|Row]),
    % SceneIds = string:tokens(to_list(BaseRole#role.open_scene), ","),
    % FuncIds = string:tokens(to_list(BaseRole#role.open_function), ","),
    % StoryIds = string:tokens(to_list(BaseRole#role.story), ","),
    % Guide = string:tokens(to_list(BaseRole#role.guide), ","),

    % NewSceneIds = [util:to_integer(X) || X <- SceneIds],
    % NewFuncIds = [util:to_integer(X) || X <- sets:to_list(sets:from_list(FuncIds))],
    % NewStoryIds = [util:to_integer(X) || X <- StoryIds],
    % NewTreasure = deserialize_treasure(BaseRole#role.treasure),
    % Role = BaseRole#role{open_scene=NewSceneIds, open_function=NewFuncIds, story=NewStoryIds, treasure = NewTreasure, guide=Guide},
    Role.

to_list(Bin) ->
    util:to_list(Bin).

build_role_data2(Row) ->
    list_to_tuple([role|Row]).

serilize(undefined) -> "";
serilize([]) -> "";
serilize(L) ->
    string:join([util:to_list(X) || X <- L], ",").

% serialize_treasure(undefined) -> "";
% serialize_treasure(Treasure) when is_record(Treasure, treasure)->
%     NewTreasure = Treasure#treasure{guarders = treasure_db:serialize(Treasure#treasure.guarders)},
%     V = ?TAIL(NewTreasure),
%     string:join([util:to_list(T)||T<-V], ";").
    
% deserialize_treasure(<<>>) -> undefined;
% deserialize_treasure(<<"undefined">>) -> undefined;
% deserialize_treasure(undefined) -> undefined;
% deserialize_treasure(Row) ->
%     L = re:split(util:to_list(Row), ";", [{return, list}]),
%     R = list_to_tuple([treasure|L]),
%     R#treasure{
%         id = util:to_integer(R#treasure.id),
%         role_id = util:to_binary(R#treasure.role_id),
%         helper_id = util:to_binary(R#treasure.helper_id),
%         treasure_id = util:to_integer(R#treasure.treasure_id),
%         explore_time = util:to_integer(R#treasure.explore_time),
%         del = util:to_integer(R#treasure.del),
%         guarders = treasure_db:deserialize(R#treasure.guarders)
%     }.
