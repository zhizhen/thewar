%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 四象存档
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(universe_db).

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
% @doc 从数据库获取四象激活信息
get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_universe_sql, Params),
    Row = mysql_db:get(Query),
    build_universe_data(Row).

create(RoleId) -> 
    Template = <<"INSERT INTO universes (role_id, id) VALUES (~p, ~p)">>,
    Params = [RoleId, 0],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

% @doc 更新四象数据库
save(Universe) ->
    Query = ?FILTER_SQL(?update_universe_sql, ?TAIL(Universe)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save universe error:~n~p~n", [Reason])
    end.

build_universe_data(null) -> undefined;
build_universe_data(Row) ->
    list_to_tuple([universe | Row]).
