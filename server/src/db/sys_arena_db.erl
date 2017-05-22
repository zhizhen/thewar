-module(sys_arena_db).

-include("logger.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

-define(ARENA_FUNC_ID, 1).

%% API
-export([get/0, get_max_rank/0, save/1]).


get() ->
    RankQuery = <<"SELECT * FROM sys_arena_rank">>,
    RankRow = mysql_db:select(RankQuery),
    Rank = build_sys_arena_rank_data(RankRow),

    InfoTemplate = <<"SELECT * FROM sys_arena_info where id = ~p">>,
    InfoParams = [?ARENA_FUNC_ID],
    InfoQuery = ?FILTER_SQL(InfoTemplate, InfoParams),
    InfoRow = mysql_db:get(InfoQuery),
    Info = build_sys_arena_info_data(InfoRow),

    #sys_arena{rank=Rank, info=Info}.

get_max_rank() ->
    Query = <<"SELECT MAX(CAST(rank AS SIGNED)) FROM sys_arena_rank">>,
    [MaxItemId] = mysql_db:get(Query),
    MaxItemId.

save(#sys_arena{rank=Rank, info=Info}) ->
    save(Info),
    [save(X) || X <- Rank];

save(#sys_arena_info{}=ArenaInfo) ->
    Query = ?FILTER_SQL(?update_sys_arena_info_sql, ?TAIL(ArenaInfo)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save sys_arena_info error:~n~p~n", [Reason])
    end;

save(#sys_arena_rank{}=ArenaRank) ->
    Query = ?FILTER_SQL(?update_sys_arena_rank_sql, ?TAIL(ArenaRank)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save sys_arena_rank error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

build_sys_arena_rank_data(Row) ->
    [list_to_tuple([sys_arena_rank|X]) || X<- Row].

build_sys_arena_info_data(null) ->
    Info = #sys_arena_info{id=?ARENA_FUNC_ID, last_award_time=0},
    save(Info),
    Info;
build_sys_arena_info_data(Row) ->
    list_to_tuple([sys_arena_info|Row]).


