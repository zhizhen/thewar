%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 排行榜服务
%%% @end
%%% Created : 2013-8-13 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(rank_srv).
-include("common.hrl").
-include("logger.hrl").

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(TICK_TIME, 1).
-define(REFRESH_TIME, 22*60*60).
-record(state, {title_refresh_tag = 0}).

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
init([]) ->
    ets:new(?ETS_RANK, [set, public, named_table, {keypos, 1}]),
    build_rank(?RANK_TYPE_LEVEL),
    build_rank(?RANK_TYPE_FIGHT),
    build_rank(?RANK_TYPE_ARENA),
    build_rank(?RANK_TYPE_HONOR),
    build_rank(?RANK_TYPE_CHARM),
    erlang:send_after(?TICK_TIME, self(), tick),
    {ok, #state{}}.

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

do_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

do_cast(_Msg, State) ->
    {noreply, State}.

do_info({refreash, Type}, State) ->
    build_rank(Type),
    {noreply, State};

% Last = server_open_time
do_info(tick, #state{title_refresh_tag = Tag} = State) ->
    Now = erlang:localtime(),
    NewTag = 
        if Tag =/= 0 -> 
            rank_api:rank_title(),
            Tag;
            true -> 1
        end,

    {{_, _, _}, {NH, NM, NS}} = Now,
    TimeStamp = NH * 60 * 60 + NM * 60 + NS,
    TickTime = 
        if 
            TimeStamp > ?REFRESH_TIME -> 24*60*60 + ?REFRESH_TIME - TimeStamp;
            TimeStamp =:= ?REFRESH_TIME -> 24*60*60;
            TimeStamp < ?REFRESH_TIME -> ?REFRESH_TIME - TimeStamp
        end,
        
    ?INFO_MSG("rank_srv:do_info======~p",[{TickTime,TimeStamp}]),
    erlang:send_after(TickTime*1000, self(), tick),
    {noreply, State#state{title_refresh_tag = NewTag}};

do_info(_Info, State) ->
    {noreply, State}.

build_rank(Type) ->
    ?DEBUG_MSG("goddess refresh rank!\n", []),
    Now = util:unixtime(),
    Num = rank_mod:get_rank_num(Type),
    Rank = rank_db:get(Type, Num),
    ets:insert(?ETS_RANK, {{last_fresh_point, Type}, Now}),
    ets:insert(?ETS_RANK, {Type, Rank}),

    Frequency = rank_mod:get_rank_frequency(Type),
    erlang:send_after(Frequency, self(), {refreash, Type}).


