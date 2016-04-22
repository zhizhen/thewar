-module(schema).
-export([rebuild_schema/0]).

-define(RAM, {ram_copies, Nodes}).
-define(DISC, {disc_copies, Nodes}).
-define(TABLE_DEF(Name, Type, Copies, Fields), {Name, [Copies, {type, Type},
            {attributes, Fields}]}).

rebuild_schema() ->
    stopped = mnesia:stop(),
    ok = mnesia:delete_schema(all_nodes()),
    timer:sleep(500),
    ok = mnesia:create_schema(all_nodes()),
    timer:sleep(500),
    ok = mnesia:start().

rebuild_score_and_data() ->
    rebuild_score(),
    setup_games(),
    setup_players().

rebuild_score() ->
    rebuild_score(all_nodes()).

%% Private

rebuild_score(Nodes) ->
    rebuild_core_table(Nodes),
    setup_counters().

rebuild_core_tables(Nodes) ->
    RanTables = [
    ],
    ok.
