%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(role_srv).

-behaviour(gen_server).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("common.hrl").
-include("msg_code.hrl").

%% API
-export([start_link/4]).
-export([send2role/2]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
%% 玩家存档
-define(PUT_USER_DATA_TICK,   1000 * 60 * 5).

-record(state, {
        role_id,
        role_state=0,
        client_receiver,
        client_sender,
        sock,
        tick_state=false
    }).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 启动玩家角色进程API
start_link(RoleId, ClientReceiver, ClientSender, Sock) ->
    RoleProcessName = goddess_misc:role_process_name(RoleId),
    gen_server:start_link({local, RoleProcessName}, ?MODULE, {RoleId, ClientReceiver, ClientSender, Sock}, []).


send2role(RolePid, {M, F, A}) when is_pid(RolePid) ->
    RolePid ! {process, M, F, A}, true;
send2role(RolePid, {M, F, A}) when is_binary(RolePid) ->
    send2role(binary_to_list(RolePid), {M, F, A});
send2role(RoleId, {M, F, A}) ->
    RoleProcessName = goddess_misc:role_process_name(RoleId),
    case whereis(RoleProcessName) of
        undefined ->
            false;
        Pid -> Pid  ! {process, M, F, A}, true
    end.

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
%% @doc 启动玩家角色进程
init({RoleId, ClientReceiver, ClientSender, Sock}) ->
    process_flag(trap_exit, true),
    %% 初始化当前进程缓存服务
    cache:init(RoleId),

    cache:add(#process_global_info{role_id=RoleId}),
    role_mod:enter_game(RoleId),
    %% 加入全局连接表
    ets:insert(?ETS_ROLE_CONN, #role_conn{role_id= util:to_list(RoleId), role_pid=self(), sender=ClientSender, sock=Sock}),

    %%启动tick
    erlang:send_after(?PUT_USER_DATA_TICK, self(), {put_user_data}),
    {ok, #state{role_id=RoleId, client_receiver=ClientReceiver, client_sender=ClientSender, sock=Sock}}.

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("role_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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
            ?ERROR_MSG("role_srv handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
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
            ?ERROR_MSG("role_srv handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
terminate(_Reason, State) ->
    % 当receiver是正常退出的时候, Sender将不会死亡
%%     catch erlang:exit(State#state.client_sender, kill),
    % 保险
%%     catch erlang:exit(State#state.client_receiver, kill),

    ets:delete(role_conn, State#state.role_id),

    % friend_api:offline(),
    % scene_api:cleanup(),
    % #game_info{hook=Hook} = role_api:get_user_data(),
    % lists:foreach(fun(Pid) -> Pid ! {offline, State#state.role_id} end, Hook),

    try
        role_mod:leave_game()
    catch
        throw:R -> ?ERROR_MSG("leave game error:~n~p~n", [R])
    end,
    ok.

%% @private
%% @doc Convert process state when code is changed
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @doc 玩家角色登录，加载角色数据并返回，触发登录相关事件
do_call(login, _From, State=#state{client_sender=ClientSender}) ->
    RoleData = role_api:build_login_s2c(),
    self() ! {process, role_api, after_login, []},
    ClientSender ! {send, RoleData},
    {reply, ok, State};

%% @doc 玩家角色登出，卸载玩家数据，出发登出相关事件，发送退出进程消息
do_call({logout, Reason}, _From, State) ->
    {stop, Reason, ok, State};

%% @doc 向玩家发送数据
do_call({send, Data}, _From, State) ->
    State#state.client_sender ! {send, Data},
    {reply, ok, State};

do_call({process, Mod, Fun, Args}, _From, State) ->
    Status = apply(Mod, Fun, [Args, State#state.client_sender]),
    {reply, Status, State};

do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

%% @doc 玩家角色登录，加载角色数据并返回，触发登录相关事件
do_cast(login, State=#state{client_sender=ClientSender}) ->
    RoleData = role_api:build_login_s2c(),
    self() ! {process, role_api, after_login, []},
    ClientSender ! {send, RoleData},
    {noreply, State};

%% @doc 玩家游戏业务路由转发
do_cast({route, Mod, Fun, DataRecord}=R, State) ->
    #game_info{role=Role} = role_api:get_user_data(),
    % ActFuncTag = gen_act:get_all_open_mod(),
    % AllFuncTag = role_api:get_open_function_tag(Role),

    % case lists:member(Mod, (ActFuncTag ++ AllFuncTag ++ [notice_api])) of
    %     true ->
            Args = [DataRecord, State#state.client_sender],
            ?DEBUG_MSG("Receive Log RoleId: ~p, Mod: ~p, Fun: ~p, Args: ~p~n", [State#state.role_id, Mod, Fun, Args]),
            apply(Mod, Fun, Args),
    %     false ->
    %         ?DEBUG_MSG("module not open ===== ~p ~n", [R]),
    %         State#state.client_sender ! {send, #m__system__notify__s2c{code = ?MODULE_NOT_OPEN}}
    % end,
    {noreply, State};

do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

%% @doc 向玩家发送数据
do_info({send, Data}, State) ->
    State#state.client_sender ! {send, Data},
    {noreply, State};

%% @doc TICK
do_info(tick, State) ->
    buff_api:tick(State#state.tick_state),
    case State#state.tick_state of
        false -> ok;
        true -> erlang:send_after(?ROLE_TICK_TIME, self(), tick)
    end,
    {noreply, State};

%% @doc
do_info({change_tick_state, Tag}, State) ->
    OldTag = State#state.tick_state,
    case OldTag == Tag of
        true -> {noreply, State};
        false ->
            case Tag of
                true -> erlang:send_after(?ROLE_TICK_TIME, self(), tick);
                false -> ok
            end,
            {noreply, State#state{tick_state=Tag}}
    end;

do_info({put_user_data}, State) ->
    role_mod:put_user_data(),
    erlang:send_after(?PUT_USER_DATA_TICK, self(), {put_user_data}),
    {noreply, State};

%% @doc 进程间消息处理
do_info({process, M, F, A}, State) ->
    ?DEBUG_MSG("role process api msg:~p~n", [{M, F, A}]),
    apply(M, F, A ++ [State#state.client_sender]),
    {noreply, State};

do_info({logout, Reason}, #state{sock=Sock}=State) ->
    inet:setopts(Sock, [{send_timeout, 5000}]),
    Data = 
        case Reason of
            role_repeat_login -> #m__system__notify__s2c{code=1000};    %% 发给前端的提示语
            role_locked -> #m__system__notify__s2c{code=1001}
        end,
    goddess_net:send(Sock, Data),
    {stop, Reason, State};

do_info({'EXIT', _From, role_logout}, State) ->
    ?DEBUG_MSG("Role Logout: role_srv~n"),
    {stop, role_logout, State};

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.
