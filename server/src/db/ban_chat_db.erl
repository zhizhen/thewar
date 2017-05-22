%% Copyright
-module(ban_chat_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([get/1, create/1, save/1]).


get(Id) ->
    Template = <<"SELECT * FROM ban_chat WHERE role_id=~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    case Row of
        null -> #ban_chat{role_id=Id, end_time=0};
        _ ->
            build_data(Row)
    end.

create(Id) ->
    Template = <<"INSERT INTO ban_chat (role_id, end_time) VALUES (~p, ~p)">>,
    Params = [Id, util:unixtime()],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

save(BanChat) ->
    Query = ?FILTER_SQL(?update_ban_chat_sql, ?TAIL(BanChat)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save ban_chat error:~n~p~n", [Reason])
    end.

build_data([RoleId, EndTime]) ->
    #ban_chat{role_id=RoleId, end_time=EndTime}.