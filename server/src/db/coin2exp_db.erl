%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(coin2exp_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("common.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").

%% API
-export([get/1, create/1, save/1]).

%%%===================================================================
%%% API
%%%===================================================================

get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_coin2exp_sql, Params),
    Row = mysql_db:get(Query),
    build_coin2exp(Row).

create(RoleId) ->
    Query = ?FILTER_SQL(?update_coin2exp_sql, ?TAIL(#coin2exp{role_id = RoleId})),
    mysql_db:update(Query).

%% @doc
save(Coin2exp) ->
    Query = ?FILTER_SQL(?update_coin2exp_sql, ?TAIL(Coin2exp)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save coin2exp error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

build_coin2exp(Row) ->
    case Row of
        null ->
            null;
        _ ->
            erlang:list_to_tuple([coin2exp|Row])
    end.
