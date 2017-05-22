%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 随身商店存档
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(treasure_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([
    load_treasure_to_ets/0,
    get_max_treasure_id/0,
    save/1,
    delete/1,
    get_loot_log/1,
    insert_loot_log/1,
    serialize/1,
    deserialize/1
]).
-define(DATA_VERSION, 1).
%%%===================================================================
%%% API
%%%===================================================================
load_treasure_to_ets() ->
    Sql = <<"SELECT * FROM treasures WHERE del = 0">>,
    Row = mysql_db:select(Sql),
    try build_treasures(Row)
    catch _:R ->
        ?ERROR_MSG("load treasure error:~p~n~p~n", [R, erlang:get_stacktrace()])
    end.

get_max_treasure_id() ->
    Sql = <<"SELECT MAX(CAST(id AS SIGNED)) FROM treasures">>,
    [Id] = mysql_db:get(Sql),
    Id.

save(Treasure = #treasure{guarders = Guarders}) ->
    NewTreasure = Treasure#treasure{guarders = serialize(Guarders)},
    Query = ?FILTER_SQL(?update_treasure_sql, ?TAIL(NewTreasure)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save treasure error:~n~p~n", [{Reason, erlang:get_stacktrace()}])
    end.

delete(Id) ->
    Sql = <<"UPDATE treasures SET del = 1 where id = ?">>,
    try
        mysql_db:update(Sql, [Id])
    catch
        throw:Reason ->
            ?ERROR_MSG("delete treasure error:~n~p~n", [{Reason, erlang:get_stacktrace()}])
    end.
            

get_loot_log(RoleId) ->
    Template = <<"SELECT * FROM treasure_loot WHERE belooter = ~p order by time desc LIMIT ~p">>,
    Params = [RoleId, 10],
    Query = ?FILTER_SQL(Template, Params),
    Row = 
    try 
        mysql_db:select(Query)
    catch 
        throw:Reason -> 
            ?ERROR_MSG("get loot log error:~p~n", [{Reason, erlang:get_stacktrace()}]),
            []
    end,
    build_loot_log(Row).

build_loot_log(Row) ->
    [build_log(X) || X<- Row].

build_log(Row) ->
    list_to_tuple([loot_log|Row]).


insert_loot_log(Log) ->
    Query = ?FILTER_SQL(?update_loot_log_sql, ?TAIL(Log)),
    try mysql_db:update(Query)
    catch throw:Reason ->
            ?ERROR_MSG("save loot log error:~n~p~n", [{Reason, erlang:get_stacktrace()}])
    end.

build_treasures(Row) ->
    [build_treasure(X) || X<- Row].

build_treasure(null) -> false;
build_treasure(Row) ->
    Treasure = list_to_tuple([treasure|Row]),
    NewTreasure = Treasure#treasure{
        id = util:to_binary(Treasure#treasure.id),
        role_id = util:to_binary(Treasure#treasure.role_id),
        helper_id = util:to_binary(Treasure#treasure.helper_id),
        guarders = deserialize(Treasure#treasure.guarders)
    },
    ets:insert(?ETS_TREASURE_GUARD, NewTreasure).

%% 序列化和反序列化 
%% [#treasure_guarder{role_id, role_name, level, idx, start}, ...] -> 
%% "role_id-role-name-level-idx-start, role_id-role_name-level-idx-start,..."
serialize([]) -> "";
serialize(L) ->
    S = string:join([begin
                    [_|F] = tuple_to_list(X),
                    string:join([util:to_list(T)||T<-F], "-")
            end || X <- L], ","),
    util:to_list(?DATA_VERSION) ++ "," ++ S.

deserialize(<<>>) -> [];
deserialize(S) ->
    case string:tokens(util:to_list(S), ",") of
        [] -> [];
        [DataVersion|SList] ->
            diff_version_deserialize(util:to_integer(DataVersion), SList)
    end.

diff_version_deserialize(?DATA_VERSION, SList) ->
    F = fun(X) ->
        S2 = re:split(X, "-", [{return, list}]),
        R = erlang:list_to_tuple([treasure_guarder|S2]),
        R#treasure_guarder{
            role_id = util:to_binary(R#treasure_guarder.role_id),
            role_name = util:to_binary(R#treasure_guarder.role_name),
            level = util:to_integer(R#treasure_guarder.level),
            idx = util:to_integer(R#treasure_guarder.idx),
            start = util:to_integer(R#treasure_guarder.start)
        }
    end,
    [F(X)||X<-SList].

