%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(tcp_listener).

-behaviour(gen_server).

%% API
-export([start_link/8]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-include("logger.hrl").

-record(state, {sock, on_startup, on_shutdown, label}).

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
start_link(IPAddress, Port, SocketOpts, ConcurrentAcceptorCount,
        AcceptorSup, OnStartup, OnShutdown, Label) ->
    gen_server:start_link(
        ?MODULE, {IPAddress, Port, SocketOpts, ConcurrentAcceptorCount,
            AcceptorSup, OnStartup, OnShutdown, Label}, []).

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
init({IPAddress, Port, SocketOpts, ConcurrentAcceptorCount,
        AcceptorSup, {M,F,A} = OnStartup, OnShutdown, Label}) ->
    process_flag(trap_exit, true),
    case gen_tcp:listen(Port, SocketOpts ++ [{ip, IPAddress}]) of
        {ok, LSock} ->
            lists:foreach(fun (_) ->
                                  {ok, _APid} = supervisor:start_child(
                                                  AcceptorSup, [LSock])
                          end,
                          lists:duplicate(ConcurrentAcceptorCount, dummy)),
            {ok, {LIPAddress, LPort}} = inet:sockname(LSock),
            ?INFO_MSG("started ~s on ~s:~p~n",
                [Label, goddess_misc:ntoab(LIPAddress), LPort]),
            apply(M, F, A ++ [IPAddress, Port]),
            {ok, #state{sock = LSock,
                        on_startup = OnStartup, on_shutdown = OnShutdown,
                        label = Label}};
        {error, Reason} ->
            ?ERROR_MSG(
              "failed to start ~s on ~s:~p - ~p (~s)~n",
              [Label, goddess_misc:ntoab(IPAddress), Port,
               Reason, inet:format_error(Reason)]),
            {stop, {cannot_listen, IPAddress, Port, Reason}}
    end.

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
handle_call(_Request, _From, State) ->
    {noreply, State}.

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
terminate(Reason, #state{sock=LSock, on_shutdown={M,F,A}, label=Label}) ->
    {ok, {IPAddress, Port}} = inet:sockname(LSock),
    gen_tcp:close(LSock),
    ?INFO_MSG("stopped ~s on ~s:~p, reason: ~p~n",
        [Label, goddess_misc:ntoab(IPAddress), Port, Reason]),
    apply(M, F, A ++ [IPAddress, Port]).

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
