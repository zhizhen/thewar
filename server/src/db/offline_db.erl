%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(offline_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([get/1, create/1, save/1]).

%%%===================================================================
%%% API
%%%===================================================================

get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_offline_sql, Params),
    Row = mysql_db:get(Query),
    build_offline(Row).

create(RoleId) ->
    Template = <<"INSERT INTO offline (role_id) VALUES (~p)">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

%% @doc 存档帐号信息
save(Offline) ->
    Query = ?FILTER_SQL(?update_offline_sql, ?TAIL(Offline)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save offline error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_offline(null) -> null;
build_offline([RoleId, OffexpTime, undefined])-> build_offline([RoleId, OffexpTime, ""]);
build_offline([RoleId, OffexpTime, OverleapLogs]) ->
    #offline{
        role_id = RoleId,
        offexp_time = OffexpTime,
        overleap_logs = OverleapLogs
    }.