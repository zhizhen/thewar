%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(buff_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([get/1, update/1, save/1, delete/1]).

%%%===================================================================
%%% API
%%%===================================================================

get(RoleId) ->
    Template = <<"SELECT * FROM buffs WHERE role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_buffs(Row).

%% @doc 存储单个
update(#buff{}=Buff) ->
    Query = ?FILTER_SQL(?update_buff_sql, ?TAIL(Buff)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save buff error:~n~p~n", [Reason])
    end.

%% @doc 存档
save(#buffs{all=Buffs}) ->
    [update(Buff) || Buff <- Buffs].

delete(#buff{}=Buff) ->
    Template = <<"DELETE FROM buffs WHERE role_id=~p AND buff_id=~p">>,
    Params = [Buff#buff.role_id, Buff#buff.buff_id],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:delete(Query).

%%%===================================================================
%%% Internal functions
%%%===================================================================

build_buffs(Row) ->
    Buffs = [list_to_tuple([buff|X]) || X<- Row],
    #buffs{all = Buffs}.
