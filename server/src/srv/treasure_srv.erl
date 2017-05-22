%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-6-20 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(treasure_srv).
-include_lib("stdlib/include/ms_transform.hrl").

-behaviour(gen_server).
-include("logger.hrl").
-include("table_etc.hrl").
-include("cfg_record.hrl").
-include("table_record.hrl").
-include("common.hrl").
%% API
-export([start_link/0]).
-export([
        replace_treasure/1, 
        get_treasure/1,
        get_treasures/1, 
        random_treasure/1,
        delete_treasure/1,
        free_warrior/1
    ]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(TICK_TIME, 5*60*1000).
-define(SECURE_TIME, 60 * 60).
-define(DISAPPREAR_TIME, 10 * 60).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

replace_treasure(Treasure) ->
    gen_server:call(?SERVER, {replace_treasure, Treasure}).


random_treasure(RoleId) ->
    gen_server:call(?SERVER, {random_treasure, RoleId}).

get_treasure(Id) ->
    case ets:lookup(?ETS_TREASURE_GUARD, Id) of
        [] -> false;
        [R|_]-> R
    end.

get_treasures(RoleId) ->
    MS=ets:fun2ms(fun(T=#treasure{role_id=R, helper_id = H}) 
            when R=:=RoleId orelse H =:= RoleId -> T end),
    ets:select(?ETS_TREASURE_GUARD, MS).

delete_treasure(Id) ->
    ets:delete(?ETS_TREASURE_GUARD, Id),
    treasure_db:delete(Id).
%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init(_) ->
    ?INFO_MSG("init treasure!\n", []),
    Opt = [named_table, public, 
        {read_concurrency, true}, 
        {keypos, #treasure.id}],
    ets:new(?ETS_TREASURE_GUARD, Opt),
    treasure_db:load_treasure_to_ets(),
    erlang:send_after(?TICK_TIME, self(), tick_award),
    {ok, []}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

do_call({replace_treasure, Treasure}, _From, State) ->
    ets:insert(?ETS_TREASURE_GUARD, Treasure),
    treasure_db:save(Treasure),
    {reply, ok, State};

do_call({random_treasure, RoleId}, _From, State) ->
    Now = util:unixtime(),
    MS=ets:fun2ms(fun(T=#treasure{
                    role_id = R, 
                    guarders = [#treasure_guarder{start = E}|_],
                    explore_time = D
                }
            ) 
            when R =/= RoleId andalso Now - E >= ?SECURE_TIME 
            andalso Now - D >= ?DISAPPREAR_TIME -> T 
        end),
    List = ets:select(?ETS_TREASURE_GUARD, MS),
    Length = erlang:length(List),
    Result = 
    if  Length =:= 0 -> false;
        true ->
            R = rand_srv:random(Length),
            Re = lists:nth(R, List),
            NewRe = Re#treasure{explore_time = Now},
            ets:insert(?ETS_TREASURE_GUARD, NewRe),
            NewRe
    end,
    {reply, Result, State};

do_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

do_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

do_info(tick_award, State) ->
    List = ets:tab2list(?ETS_TREASURE_GUARD),
    Now = util:unixtime(),
    F = fun(X) ->
            Cfg = treasure_cfg:get(X#treasure.treasure_id),
            NeedHour = Cfg#treasure_cfg.hour,
            GuardTime = lists:min([Y#treasure_guarder.start || Y <- X#treasure.guarders]),
            Actually = (Now - GuardTime) div 3600,
            if  Actually >= NeedHour ->
                    treasure_api:owner_award(X, 100),
                    [free_warrior(Y) || Y <- X#treasure.guarders],
                    treasure_srv:delete_treasure(X#treasure.id);
                true -> ok
            end
    end,
    lists:foreach(F, List),
    erlang:send_after(?TICK_TIME, self(), tick_award),
    {noreply, State};
do_info(_Info, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
free_warrior(#treasure_guarder{role_id = RoleId, idx = Idx}) ->
    ?DEBUG_MSG("free guarder:~p~n", [{RoleId, Idx}]),
    case goddess_misc:get_role_pid(RoleId) of
        false -> 
            warrior_db:release_warrior(RoleId, Idx);
        Pid ->
            Pid ! {process, warrior_api, release_warrior, [Idx]}
    end.

