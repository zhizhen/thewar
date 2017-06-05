%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(id_srv).

-behaviour(gen_server).

-include("logger.hrl").

%% API
-compile(export_all).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {
        max_role_id,
        max_scene_id
    }).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 启动ID生成服务
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% @doc 生成角色ID
gen_role_id() ->
    gen_server:call(?SERVER, gen_role_id).

gen_scene_id() ->
    gen_server:call(?SERVER, gen_scene_id).
%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
%% @doc 初始化ID生成服务
init([]) ->
    MaxRoleId = init_max_role_id(),
    % MaxItemId = init_max_item_id(),
    % MaxMailId = init_max_mail_id(),
    % MaxSpiritId = init_max_spirit_id(),
    % MaxArenaRank = init_max_arena_rank(),
    % MaxGroupId = init_max_group_id(),
    % MaxNoticeId = init_max_notice_id(),
    % MaxTreasureId = init_max_treasure_id(),

    State = #state{
            max_role_id = MaxRoleId,
            max_scene_id = 0
            % max_item_id=MaxItemId, 
            % max_mail_id=MaxMailId, 
            % max_arena_rank=MaxArenaRank, 
            % max_spirit_id=MaxSpiritId, 
            % max_group_id=MaxGroupId, 
            % max_notice_id=MaxNoticeId,
            % max_treasure_id=MaxTreasureId
        },
    {ok, State}.

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("id_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

%% @private
%% @doc Handling cast messages
handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("id_srv handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc Handling all non call/cast messages
handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("id_srv handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
terminate(_Reason, _State) ->
    ok.

%% @private
%% @doc Convert process state when code is changed
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

init_max_role_id() ->
    case role_db:get_max_role_id() of
        undefined ->
            ServerId = goddess_env:server_id(),
            1;
        MaxRoleId ->
            util:to_integer(MaxRoleId)
    end.

%% @doc 生成角色ID
do_call(gen_role_id, _From, State) ->
    NewMaxRoleId = State#state.max_role_id + 1,
    {reply, NewMaxRoleId, State#state{max_role_id=NewMaxRoleId}};

do_call(gen_scene_id, _From, State) ->
    New = State#state.max_scene_id + 1,
    {reply, New, State#state{max_scene_id = New}};

do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.
