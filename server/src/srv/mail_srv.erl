%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-18 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mail_srv).

-behaviour(gen_server).

-include("logger.hrl").

%% API
-export([
    start_link/0,
    send_mail/5
]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {}).

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

init([]) ->
    erlang:send_after(1000, self(), {clean_mail}),
    {ok, #state{}}.


%% 发系统邮件
send_mail(IdList, Title, Msg, Type, Attachments) ->
    gen_server:cast(?MODULE, {'send_mail', [IdList, Title, Msg, Type, Attachments]}).



%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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

do_call({'send_mail', [IdList, Title, Msg, Type, Attachments]}, _From, State) ->
    mail_api:send_mail(IdList, Title, Msg, Type, Attachments),
    {reply, ok, State};

do_call(_Request, _From, State) ->
    {reply, ok, State}.


do_cast({'send_mail', [IdList, Title, Msg, Type, Attachments]}, State) ->
    mail_api:send_mail(IdList, Title, Msg, Type, Attachments),
    {noreply, State};

do_cast(_Msg, State) ->
    {noreply, State}.


do_info(clean_mail, State) ->
    mail_api:clean_mail(),
    erlang:send_after(1000*60*60*24, self(), {clean_mail}),              % 一天的时间清理一次
    {noreply, State};

do_info(_Info, State) ->
    {noreply, State}.

