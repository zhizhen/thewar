%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 排行榜
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(rank_db).
-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([
        get/2
]).

%%%===================================================================
%%% API
%%%===================================================================

get(?RANK_TYPE_LEVEL, Num) -> 
    Template = <<"select role_id, role_name, level, fight, title, honor, charm from roles order by exp desc limit ~p">>,
    Params = [Num],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_ranks(Row);

get(?RANK_TYPE_FIGHT, Num) ->
    Template = <<"select role_id, role_name, level, fight, title, honor, charm from roles order by fight desc, exp desc limit ~p">>,
    Params = [Num],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_ranks(Row);

get(?RANK_TYPE_ARENA, Num) ->
    Template = <<"select role.role_id, role.role_name, role.level, role.fight, role.title, role.honor, role.charm
    from sys_arena_rank as rank, roles as role 
    where rank.role_id = role.role_id 
    order by rank.rank asc limit ~p">>,
    Params = [Num],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_ranks(Row);

get(?RANK_TYPE_HONOR, Num) ->
    Template = <<"select role.role_id, role.role_name, role.level, role.fight, role.title, role.honor, role.charm
    from sys_arena_rank as rank, roles as role 
    where rank.role_id = role.role_id 
    order by role.honor desc, role.exp desc limit ~p">>,
    Params = [Num],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_ranks(Row);

get(?RANK_TYPE_CHARM, Num) ->
    Template = <<"select role_id, role_name, level, fight, title, honor, charm from roles order by charm desc, exp desc limit ~p">>,
    Params = [Num],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_ranks(Row);

get(_, _) -> [].

build_ranks(Row) ->
    [erlang:list_to_tuple([rank|X]) || X <- Row].
