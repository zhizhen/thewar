%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-1-20 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(notice_srv).
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").

% -behaviour(gen_server).

% %% API
% -export([start_link/0]).

% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).
% -export([get_notices/0, add_notice/7, delete_notice/1, update_notice/8]).

% -define(SERVER, ?MODULE).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% Starts the server
% %%
% %% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
% %% @end
% %%--------------------------------------------------------------------
% start_link() ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

% get_notices() ->
%     gen_server:call(?SERVER, get_notices).

% add_notice(Type, CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval) ->
%     gen_server:cast(?SERVER, {add_notice, Type, CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval}).

% delete_notice(NoticeId) ->
%     gen_server:cast(?SERVER, {delete_notice, util:to_binary(NoticeId)}).

% update_notice(NoticeId, Type, _CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval) ->
%     gen_server:cast(?SERVER, {update_notice, util:to_binary(NoticeId), Type, StartedAt, ExpiredAt, Title, Msg, ShowInterval}).

% %%%===================================================================
% %%% gen_server callbacks
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Initializes the server
% %%
% %% @spec init(Args) -> {ok, State} |
% %%                     {ok, State, Timeout} |
% %%                     ignore |
% %%                     {stop, Reason}
% %% @end
% %%--------------------------------------------------------------------
% init([]) ->
%     {ok, #notices{all = notice_db:get()}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling call messages
% %%
% %% @spec handle_call(Request, From, State) ->
% %%                                   {reply, Reply, State} |
% %%                                   {reply, Reply, State, Timeout} |
% %%                                   {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, Reply, State} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_call(Request, From, State) ->
%     try
%         do_call(Request, From, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Request, State, Reason, erlang:get_stacktrace()]),
%             {reply, ok, State}
%     end.
% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling cast messages
% %%
% %% @spec handle_cast(Msg, State) -> {noreply, State} |
% %%                                  {noreply, State, Timeout} |
% %%                                  {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_cast(Msg, State) ->
%     try
%         do_cast(Msg, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Msg, State, Reason, erlang:get_stacktrace()]),
%             {noreply, State}
%     end.
% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling all non call/cast messages
% %%
% %% @spec handle_info(Info, State) -> {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_info(Info, State) ->
%     try
%         do_info(Info, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Info, State, Reason, erlang:get_stacktrace()]),
%             {noreply, State}
%     end.
% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% This function is called by a gen_server when it is about to
% %% terminate. It should be the opposite of Module:init/1 and do any
% %% necessary cleaning up. When it returns, the gen_server terminates
% %% with Reason. The return value is ignored.
% %%
% %% @spec terminate(Reason, State) -> void()
% %% @end
% %%--------------------------------------------------------------------
% terminate(_Reason, _State) ->
%     ok.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Convert process state when code is changed
% %%
% %% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
% %% @end
% %%--------------------------------------------------------------------
% code_change(_OldVsn, State, _Extra) ->
%     {ok, State}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% do_call(get_notices, _From, State) ->
%     {reply, State, State};
% do_call(_Request, _From, State) ->
%     Reply = ok,
%     {reply, Reply, State}.

% do_cast({add_notice, Type, CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval}, State) ->
%     Notice = #notice{id=id_srv:gen_notice_id(), type=Type, created_at=util:to_integer(CreatedAt), started_at=StartedAt, expired_at=util:to_integer(ExpiredAt), title=Title, msg=Msg, show_interval=ShowInterval},
%     notice_db:save(Notice),
%     NewState = State#notices{all = State#notices.all ++ [Notice]},
%     case Type == 0 of
%         true ->
%             broadcast(#m__notice__add__s2c{notices=notice_api:build_p_notices([Notice])});
%         false ->
%             ok
%     end,
%     {noreply, NewState};

% do_cast({delete_notice, NoticeId}, State) ->
%     NewList = 
%         case lists:keyfind(NoticeId, #notice.id, State#notices.all) of
%             #notice{} = Notice -> 
%                 notice_db:save(Notice#notice{expired_at=0}),
%                 lists:keydelete(NoticeId, #notice.id, State#notices.all);
%             _ -> State#notices.all
%         end,
%     {noreply, State#notices{all = NewList}};

% do_cast({update_notice, NoticeId, Type, StartedAt, ExpiredAt, Title, Msg, ShowInterval}, State) ->
%     NewList = 
%         case lists:keyfind(NoticeId, #notice.id, State#notices.all) of
%             #notice{} = Notice -> 
%                 New = Notice#notice{type=Type, started_at=util:to_integer(StartedAt), expired_at=util:to_integer(ExpiredAt), title=Title, msg=Msg, show_interval=ShowInterval},
%                 notice_db:save(New),
%                 lists:keyreplace(NoticeId, #notice.id, State#notices.all, New);
%             _ -> State#notices.all
%         end,
%     {noreply, State#notices{all = NewList}};

% do_cast(_Msg, State) ->
%     {noreply, State}.

% do_info(_Info, State) ->
%     {noreply, State}.

% broadcast(Msg) ->
%     ets:foldl(
%         fun(#role_conn{sender=Sender}, _) ->
%             Sender ! {send, Msg}
%         end, 0, role_conn).
