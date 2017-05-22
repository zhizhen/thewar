-module(cultivate_db).

-include("table_record.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([create/1, get/1, save/1]).

get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_cultivate_sql, Params),
    Row = mysql_db:get(Query),
    case Row of
        null -> #cultivate{role_id=RoleId};
        L ->
            erlang:list_to_tuple([cultivate|L])
    end.

create(RoleId) ->
    Query = ?FILTER_SQL(?update_cultivate_sql, ?TAIL(#cultivate{role_id = RoleId})),
    mysql_db:update(Query).

save(Cultivate) ->
    Query = ?FILTER_SQL(?update_cultivate_sql, ?TAIL(Cultivate)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save cultivate error:~n~p~n", [Reason])
    end.
