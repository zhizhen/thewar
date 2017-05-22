%% Copyright
-module(sign_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([get/1, update/1]).

get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_sign_sql, Params),
    Rows = mysql_db:select(Query),
    case Rows of
        [] -> #sign{role_id=RoleId, general=0, vip=0};
        [Row] ->
            build(Row)
    end.

update(Sign) ->
    Query = ?FILTER_SQL(?update_sign_sql, ?TAIL(Sign)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save sign error:~n~p~n", [Reason])
    end.

build([RoleId, Days1, Days2]) ->
    #sign{role_id=RoleId, general=Days1, vip=Days2}.
