%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(charm_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("common.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([
        get/2,
        getinfo/2,
        create/1,
        update/1,
        clear/1
    ]).

get(RoleId, Object) ->
    Template = <<"SELECT * FROM charm WHERE receiver = ~p AND object = ~p LIMIT ~p">>,
    Params = [RoleId, Object, 20],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_charm(Row).

getinfo(RoleId, State) ->
    Template = <<"SELECT * FROM charm where receiver = ~p AND state = ~p">>,
    Params = [RoleId, State],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_charm(Row).

create(CharmLog) ->
    Query = ?FILTER_SQL(?update_charm_log_sql, ?TAIL(CharmLog)),
    mysql_db:update(Query).

clear(RoleId) ->
    Template1 = <<"SELECT time FROM charm where receiver = ~p AND object = ~p LIMIT ~p, 1">>,
    Params1 = [RoleId, ?CHARM_FLOWER, 20],
    Query1 = ?FILTER_SQL(Template1, Params1),
    Result1 = mysql_db:get(Query1),

    Template2 = <<"SELECT time FROM charm where receiver = ~p AND object = ~p LIMIT ~p, 1">>,
    Params2 = [RoleId, ?CHARM_EGG, 20],
    Query2 = ?FILTER_SQL(Template2, Params2),
    Result2 = mysql_db:get(Query2),
   
    case Result1 of
        null -> skip;
        [Time1] ->
            Template3 = <<"DELETE FROM charm WHERE receiver = ~p AND object = ~p AND time < ~p">>,
            Params3 = [RoleId, ?CHARM_FLOWER, Time1],
            Query3 = ?FILTER_SQL(Template3, Params3),
            mysql_db:delete1(Query3)
    end,
    
    case Result2 of
        null -> skip;
        [Time2] ->
            Template4 = <<"DELETE FROM charm WHERE receiver = ~p AND object = ~p AND time < ~p">>,
            Params4 = [RoleId, ?CHARM_FLOWER, Time2],
            Query4 = ?FILTER_SQL(Template4, Params4),
            mysql_db:delete1(Query4)
    end.

update(#charm_log{sender = Sender, time = Time}) ->
    Template = <<"UPDATE charm SET state = ~p WHERE sender = ~p AND time = ~p">>,
    Params = [?CHARM_LOG_INFOED, Sender, Time],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query);

update(Logs) ->
    [update(X) || X<- Logs].

build_charm(Row) ->
    [build_interact_log(X) || X<- Row].

build_interact_log(Row) ->
    list_to_tuple([charm_log|Row]).


