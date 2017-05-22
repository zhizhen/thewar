%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 商城存档
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mall_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([
        get/1,
        save/1,
        create/1
]).
%%%===================================================================
%%% API
%%%===================================================================
create(Id) ->
    Template = <<"INSERT INTO malls (role_id) VALUES (~p)">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

get(Id) ->
    Template = <<"SELECT * FROM malls WHERE role_id=~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_mall_data(Row).

save(Mall) ->
    Mall1 = Mall#mall{logs=serialize(Mall#mall.logs)},
    Query = ?FILTER_SQL(?update_mall_sql, ?TAIL(Mall1)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save mall error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_mall_data(null) ->
    #mall{logs = []};
build_mall_data(Row) ->
    Mall = list_to_tuple([mall|Row]),
    Items = deserialize(util:to_list(Mall#mall.logs)),
    Mall#mall{logs = Items}.

%% 序列化和反序列化
serialize([]) -> "";
serialize(L) ->
    L1 = [string:join([util:to_list(Id), util:to_list(Num)],"-") || {mall_item, Id,Num} <- L],
    string:join(L1, ",").

deserialize("undefined") -> [];
deserialize(S) ->
    case string:tokens(S, ",") of
        [] -> [];
        L -> 
            F = fun(D) -> 
                    [Id, Num] = string:tokens(D, "-"),
                    {mall_item, util:to_integer(Id), util:to_integer(Num)}
                end,
            lists:map(F, L)
    end.
