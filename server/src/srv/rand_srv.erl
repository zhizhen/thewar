%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-6-3 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(rand_srv).

-behaviour(gen_server).
-include("logger.hrl").
%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).
-export([random/1, random/2, get_seed/0, random_list/1, random_list/2, random_probability_list/1]).
-define(SERVER, ?MODULE).

-record(seed, {seed}).
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

random(Max) ->
    random(1, Max).
random(Min, Max) ->
    case cache:find(seed) of
        false ->
            Seed = get_seed(),
            random:seed(Seed),
            cache:add(#seed{seed = Seed});
        _ -> ok
    end,
    M = Min - 1,
    random:uniform(Max - M) + M.

random_list(Data) ->
    case cache:find(seed) of
        false ->
            Seed = get_seed(),
            random:seed(Seed),
            cache:add(#seed{seed = Seed});
        _ -> ok
    end,
    Index = random:uniform(length(Data)),
    lists:nth(Index, Data).

random_list(Num, Data) ->
    NewData = lists:delete(random_list(Data), Data),
    case length(NewData) == Num of
        true -> NewData;
        false -> random_list(Num, NewData)
    end.

get_seed() ->
    gen_server:call(?MODULE, get_seed).

random_probability_list(Data) ->
    SumProbability = lists:sum([Probability || {_, Probability} <- Data]),
    RandomNum = rand_srv:random(1, SumProbability),
    select_by_probability(RandomNum, 0, Data).

select_by_probability(RandomNum, Sum, [{Id, Probability}|Data]) ->
    case Sum + Probability >= RandomNum of
        true -> Id;
        false -> select_by_probability(RandomNum, Sum + Probability, Data)
    end.

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
    {ok, #seed{}}.

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
handle_call(get_seed, _From, #seed{seed = Seed} = State) ->
    if  Seed =:= undefined ->
            <<A:32, B:32, C:32>> = crypto:rand_bytes(12),
            random:seed({A, B, C});
        true ->
            random:seed(Seed)
    end,
    NewSeed = {random:uniform(999999), random:uniform(999999), random:uniform(999999)},
    {reply, NewSeed, State#seed{seed = NewSeed}};

handle_call(_Request, _From, State) ->
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
handle_cast(_Msg, State) ->
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
handle_info(_Info, State) ->
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
