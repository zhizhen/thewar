%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 四象存档
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(boudoir_db).

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
% @doc 从数据库获取神女阁激活信息
get(RoleId) ->
    Template = <<"SELECT * FROM boudoirs WHERE role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    case mysql_db:get(Query) of
        null -> #boudoir{role_id=RoleId};
        Row ->
            build_boudoir_data(Row)
    end.

create(RoleId) ->
    Template = <<"INSERT INTO boudoirs (role_id, floor, opened_seals) VALUES (~p, ~p, ~p)">>,
    Params = [RoleId, 1, 0],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

% @doc 更新神女阁数据库
save(Boudoir) ->
    Query = ?FILTER_SQL(?update_boudoir_sql, ?TAIL(Boudoir)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save boudoir error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_boudoir_data(Row) ->
    list_to_tuple([boudoir|Row]).