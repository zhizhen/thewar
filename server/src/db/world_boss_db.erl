%% Copyright
-module(world_boss_db).

-include("table_etc.hrl").
-include("table_record.hrl").
-include("logger.hrl").
-include("common.hrl").

-export([get/1, save/1, create/2]).

create(BossId, Level) ->
    Template = <<"INSERT INTO world_boss (boss_id, level) VALUES (~p, ~p)">>,
    Params = [BossId, Level],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

get(BossId) ->
    Template = <<"SELECT * FROM world_boss WHERE boss_id = ~p">>,
    Params = [BossId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_world_boss_data(Row).

save(WorldBoss) ->
    Query = ?FILTER_SQL(?update_world_boss_sql, ?TAIL(WorldBoss)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save world boss error:~n~p~n", [Reason])
    end.

build_world_boss_data(null) -> null;
build_world_boss_data([BossId, Level]) ->
    #world_boss{
        boss_id = BossId,
        level = Level
    }.