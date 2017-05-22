%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mission_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").

%% API
-export([
    get/1,
    save/1,
    create/2
]).

%%%===================================================================
%%% API
%%%===================================================================
%% @doc 从数据库加载背包数据
get(Id) ->
    Template = <<"SELECT * FROM missions WHERE role_id=~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_mission_data(Row).

create(RoleId, MissionId) ->
    Template = <<"INSERT INTO missions (role_id, mission_id, state, score) VALUES (~p, ~p, ~p, ~p)">>,
    Params = [RoleId, MissionId, ?MISSION_OPEN, 0],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

save(#missions{all = Missions}) ->
    [save(Mission) || Mission <- Missions];

%% @doc 存储任务信息
save(Mission) ->
    Query = ?FILTER_SQL(?update_mission_sql, ?TAIL(Mission)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save mission error:~n~p~n", [Reason])
    end.


%%%===================================================================
%%% Internal functions
%%%===================================================================
build_mission_data(Row) ->
    AllMission = [list_to_tuple([mission|X]) || X <- Row],
    #missions{all=AllMission}.
