-module(role_manager).

-behaviour(gen_server).

%% api
-export([start_link/0, create/1]).

%% gen_server
-export([
        init/1,
        handle_call/3,
        handle_cast/2,
        handle_info/2,
        terminate/2,
        code_change/3
    ]).

%% api
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

create(Conn) ->
    gen_server:cast(?MODULE, {create, {connection, Conn}}).

init([]) ->
    State = undefined,
    {ok, State}.

handle_call(_Req, _From, State) ->
    {reply, ok, State}.

handle_cast({create, {connection, Conn}}, State) ->
    lager:info("gate connection, create role : ~p~n", [{Conn}]),
    Pid = undefined,
    Id = 123,
    Conn ! {role_login, {pid, Pid}, {id, Id}},
    {noreply, State};

handle_cast(Msg, State) ->
    lager:error("unhandled msg : ~p~n", [Msg]),
    {noreply, State}.

handle_info(Info, State) ->
    lager:error("unhandled into : ~p~n", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
