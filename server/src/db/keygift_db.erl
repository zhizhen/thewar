-module(keygift_db).
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").


-export([get_by_key/1, get/2, save/1]).


get_by_key(Key) ->
    Sql = <<"select * from keygift where code_id='~ts' and role_id='~ts'">>,
    Params = [Key, ""],
    Query = ?FILTER_SQL(Sql, Params),
    Row = mysql_db:select(Query),
    build_keygift(Row).

get(Key, RoleId) ->
    Flag = string:substr(Key, 1, 5),
    Sql = <<"select * from keygift where role_id='~ts' and code_id like '~ts%'">>,
    Params = [RoleId, Flag],
    Query = ?FILTER_SQL(Sql, Params),
    mysql_db:select(Query).


save(#keygift{} = Gift) ->
    Query = ?FILTER_SQL(?update_keygift_sql, ?TAIL(Gift)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save giftkey error:~n~p~n", [Reason])
    end.

build_keygift([]) -> [];
build_keygift([Row]) ->
    list_to_tuple([keygift | Row]).
