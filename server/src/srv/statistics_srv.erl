%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(statistics_srv).
-behaviour(gen_server).

-include("logger.hrl").
-include("common.hrl").

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([start_link/0, write_log/2]).

-define(SERVER, ?MODULE).
-define(TICK_TIME, 60000).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

write_log(Tag, Parms) ->
    gen_server:cast(?SERVER, {Tag, Parms}).

init([]) ->
    {ok, {Host, Port, User, Password, LogDbName}} = system_db:get_log_db_conf(),
    %% TODO change database name to real log db name.
    mysql_db:connect(?LOG_POOL, Host, Port, User, Password, LogDbName, utf8, 1),
    cache:init(?SERVER),
    cache:add(#statistics_cache{pool=[]}),

    build_log_tables(?STATISTIC_ALL_ITEMS),
    erlang:send_after(?TICK_TIME, self(), tick),

    {ok, []}.

handle_cast({{Table, Type, Format}, Parms}, _State) ->
    Cache = cache:find(statistics_cache),
    NewCache = statistics_mod:build_log({util:to_list(Table), Type, goddess_env:server_id(), Format, Parms}, Cache),
    cache:update(NewCache),
    {noreply, _State};

handle_cast(_Request, State) ->
    {noreply, State}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("statistics_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
do_info(tick, _State) ->
    try
        ?ONLINE_DATA_MSG(ets:info(?ETS_ONLINE_PLAYER, size)),
        Cache = cache:find(statistics_cache),
        lists:map(
            fun({_Tag, Insert})->
                mysql_db:insert1(?LOG_POOL, list_to_binary(Insert))
            end, Cache#statistics_cache.pool)
    catch
        _:Reason ->
            ?ERROR_MSG("statistics_srv write_log exception:State: ~p~nReason: ~p~nStacktrace: ~p~n",
                [_State, Reason, erlang:get_stacktrace()]),
            {noreply, _State}
    end,
    build_log_tables(?STATISTIC_ALL_ITEMS),
    cache:update(#statistics_cache{pool=[]}),
    erlang:send_after(?TICK_TIME, self(), tick),
    {noreply, _State};

do_info(_Info, State) ->
    {noreply, State}.

build_log_tables(Items) ->
    try
        lists:map(fun({Table, Type, Fields}) ->
            {{Y,M,D},_} = erlang:localtime(),
            TableName = case Type of
                    week -> 
                        {Year, Week} = calendar:iso_week_number({Y,M,D}),
                        lists:concat([Table, "_", Year, "_", Week]);
                    month -> lists:concat([Table, "_", Y, "_", M]);
                    one -> Table
                end,
            CreateSql = statistics_mod:build_create_sql({TableName, Fields}),
            mysql_db:update1(?LOG_POOL, list_to_binary(CreateSql))
        end, Items)
    catch
        _:Reason ->
            ?ERROR_MSG("statistics_srv init_log_tables exception:Reason: ~p~nStacktrace: ~p~n",
                [Reason, erlang:get_stacktrace()])
    end.
