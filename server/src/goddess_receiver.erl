%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_receiver).

%% API
-export([start_link/1]).

%% callbacks
-export([init/1]).

-include("common.hrl").
-include("logger.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").

-record(state, {
    ip,
    port,
    sock,
    role_id,                          % 玩家角色ID
    client_receiver_pid,              % 他爹
    account_id,                       % 玩家账号
    auth_state=0,                     % 玩家账号验证状态
    step=0,                           % 步数(每个协议加一)
    last_proto_time=0,                % 上一次协议发来的时间，防止快速刷服务器
    proto_error_times=0               % 协议异常次数
}).
%%%===================================================================
%%% API
%%%===================================================================

start_link(ClientReceiverPid) ->
    {ok, proc_lib:spawn_link(?MODULE, init, [ClientReceiverPid])}.

%%%===================================================================
%%% callbacks
%%%===================================================================

init(ClientReceiverPid) ->
    process_flag(trap_exit, true),
    State = receive
        {go, Sock} ->
            {ok, {Ip, Port}} = inet:peername(Sock),
            #state{ip=Ip, port=Port, sock=Sock, client_receiver_pid=ClientReceiverPid};
        {go, Sock, AuthState, AccountId} ->
            {ok, {Ip, Port}} = inet:peername(Sock),
            #state{ip=Ip, port=Port, sock=Sock, client_receiver_pid=ClientReceiverPid, auth_state=AuthState, account_id=AccountId}
    end,
    try
        start_client_process(State)
    catch
        _:Exception ->
            handle_exception(Exception, State)
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @doc 客户端消息分发处理
start_client_process(State=#state{role_id=RoleId, account_id=AccountId, sock=Sock, step=Step, last_proto_time=LastProtoTime, proto_error_times=ProtoErrorTimes}) ->
    NewStep = case Step < ?MAX_STEP of
                  true -> Step +1;
                  false -> 1
              end,
    NowTime = util:longunixtime(),
    NewProtoErrorTimes = case NowTime - LastProtoTime =< ?PROTOCOL_INTERVAL of                   % 如果时间间隔小于约定
        true ->
            case ProtoErrorTimes + 1 >= ?PROTOCOL_ERROR_TIMES of                                 % 达到错误上限
                true ->
                    ?ERROR_MSG("Client send too quickly account_id: ~p  role_id: ~p~n", [AccountId, RoleId]),
                    %gen_tcp:close(Sock),
                    throw(closed);                                                               % 关闭
                false ->
                    ProtoErrorTimes + 1                                                     % 返回错误数
         end;
        false -> 0                                                                               % 返回错误数
    end,
    case goddess_net:recv(Sock, NewStep) of
        {ok, DataRecord} ->
            % ?ERROR_MSG("recv record : ~p~n", [{DataRecord}]),
            NewState = State#state{step=NewStep, last_proto_time=NowTime, proto_error_times=NewProtoErrorTimes},
            client_process(DataRecord, NewState);
        {ok, http_get, DataBin} ->     %% 处理HTTP GET请求
            http_api:handle_http_request(get, Sock, DataBin);
            %gen_tcp:close(Sock);
        {ok, http_post, DataBin} ->    %% 处理HTTP POST请求
            http_api:handle_http_request(post, Sock, DataBin);
            %gen_tcp:close(Sock);
        {error, Reason} ->
            ?ERROR_MSG("recv error: ~p~n", [{Reason}]),
            throw(Reason);
        {'EXIT', _, _} = Reason ->
            throw(Reason)
    end.

%% 处理心跳
client_process(#m__system__heartbeat__c2s{} = DataRecord, State=#state{sock=Sock, role_id = RoleId}) ->
    case system_api:heartbeat(DataRecord) of
        {ok, TimeStamp} ->
            % case goddess_misc:get_role_pid(RoleId)of
            %     false -> goddess_net:send(Sock, #m__system__heartbeat__s2c{time=TimeStamp});
            %     RolePid -> RolePid ! {send, #m__system__heartbeat__s2c{time=TimeStamp}}
            % end,
            ok;
        _ ->
            throw(tick_error)
    end,
    start_client_process(State);

%% 更换角色
% client_process(#m__role__logout__c2s{}, State=#state{auth_state=?ROLE_PASSED}) ->
%     State#state.client_receiver_pid ! role_logout,
%     start_client_process(State#state{auth_state = ?ACCOUNT_PASSED});

%% @doc 客户端账号认证，角色认证及其他业务分发处理
%% 玩家账号登录
client_process(DataRecord, State=#state{auth_state=?ACCOUNT_NOT_PASS}) ->
    case DataRecord of
        %% 玩家账号登录
        #m__account__login__c2s{} ->
            account_login(DataRecord, State);
        %% 玩家账号登录成功之前，不处理任何业务
        _ ->
            throw(account_not_login)
    end,
    start_client_process(State);

%% 玩家角色登录（玩家在游戏服务器中创建角色或已经存在角色才可进入游戏服务器）
client_process(DataRecord, State=#state{account_id=AccountId, sock=Sock, auth_state=?ACCOUNT_PASSED}) ->
    case DataRecord of
        %% 玩家创建角色
        #m__role__create__c2s{} ->
            role_create(DataRecord, State);
        %% 玩家角色登录游戏
        #m__role__login__c2s{} ->
            role_login(DataRecord, State);
        %% delete role
        % #m__role__delete__c2s{} ->
        %     case role_api:delete(AccountId, DataRecord) of
        %         {ok, RoleList} ->
        %             goddess_net:send(Sock, RoleList);
        %         _ -> ok
        %     end;
        %% 玩家角色登录之前，不处理任何业务
        _ ->
            %%             throw(role_not_login)
            throw(role_not_login)
    end,
    start_client_process(State);

%% 玩家业务处理
client_process(DataRecord, State=#state{auth_state=?ROLE_PASSED}) ->
    RolePid = goddess_misc:get_role_pid(State#state.role_id),
    Mod = a,
    Fun = b,
    gen_server:cast(RolePid, {route, Mod, Fun, DataRecord}),
    start_client_process(State).

%% @doc 玩家账号登录
account_login(DataRecord, State=#state{sock=Sock, client_receiver_pid = ReceiverPid}) ->
    case account_api:login(DataRecord) of
        %% 账号登录成功，返回当前账号在游戏服务器中的角色列表
        {ok, AccountId} ->
            account_api:after_login(AccountId, Sock, ReceiverPid),
            {ok, RoleList} = role_api:list(AccountId),
            goddess_net:send(Sock, RoleList),
            NewState = State#state{account_id=AccountId, auth_state=?ACCOUNT_PASSED},
            start_client_process(NewState);
        {error, Reason} ->
            goddess_net:send(Sock, #m__system__notify__s2c{code=Reason}),
            throw({account_login_error, Reason})
    end.

%% @doc 玩家创建角色
role_create(DataRecord, #state{account_id=AccountId, sock=Sock}) ->
    case role_api:create(AccountId, DataRecord) of
        {ok, RoleId} ->
            goddess_net:send(Sock, #m__role__create__s2c{id=RoleId});
        %% 角色创建失败，重名，错误职业等
        {error, Reason} ->
            goddess_net:send(Sock, #m__system__notify__s2c{code=Reason})
    end.

%% @doc 玩家角色登录
role_login(DataRecord, State=#state{account_id=AccountId, sock=Sock, client_receiver_pid=ClientReceiverPid}) ->
    case role_api:login(AccountId, DataRecord) of
        %% 角色登录成功后启动玩家角色进程，并向客户端发送角色数据
        {ok, RoleId} ->
            register_client_receiver_process_name(RoleId, ClientReceiverPid),
            register_receiver_process_name(RoleId, self()),
            gen_server:call(ClientReceiverPid, {role_login, RoleId}),
            RolePid = goddess_misc:get_role_pid(RoleId),
            ets:update_element(?ETS_ROLE_CONN, RoleId, [{#role_conn.account_id, AccountId}]),
            ets:update_element(?ETS_ACCOUNT, AccountId, [{#account_conn.role_pid, RolePid}]),
            NewState = State#state{role_id=RoleId, auth_state=?ROLE_PASSED},

            start_client_process(NewState);
        %% 玩家角色登录游戏错误，账号与角色不匹配等
        {error, Reason} ->
            goddess_net:send(Sock, #m__system__notify__s2c{code = Reason})
    end.

%% @doc 注册ClientReceiver进程名称
register_client_receiver_process_name(RoleId, ClientReceiver) ->
    ClientReceiverProcessName = goddess_misc:client_receiver_process_name(RoleId),
    goddess_misc:register(local, ClientReceiverProcessName, ClientReceiver).

%% @doc 注册ClientReceiver进程名称
register_receiver_process_name(RoleId, Receiver) ->
    ClientReceiverProcessName = goddess_misc:receiver_process_name(RoleId),
    goddess_misc:register(local, ClientReceiverProcessName, Receiver).

%% @doc 异常处理
%% handle_exception({case_clause, {'EXIT', _, role_logout}}, _State) ->
%%     ?DEBUG_MSG("role_logout~n"),
%%     exit(role_logout);

handle_exception(tick_error, _State) ->
    ?DEBUG_MSG("exception: tick error~n"),
    %gen_tcp:close(State#state.sock),
    exit(tick_error);
handle_exception(closed, _State) ->
    ?DEBUG_MSG("exception: client socket closed~n"),
    exit(socket_closed);
handle_exception(timeout, _State) ->
    ?DEBUG_MSG("exception: client socket timeout~n"),
    %gen_tcp:close(State#state.sock),
    exit(socket_timeout);
handle_exception(account_not_login, _State) ->
    ?DEBUG_MSG("exception: account not login~n"),
    %gen_tcp:close(State#state.sock),
    exit(account_not_login);
handle_exception({account_login_error, Reason}, _State) ->
    ?DEBUG_MSG("exception: account login error, Reason: ~p~n", [Reason]),
    %gen_tcp:close(State#state.sock),
    exit(account_login_error);
handle_exception(role_not_login, _State) ->
    ?DEBUG_MSG("exception: role not login~n"),
    %gen_tcp:close(State#state.sock),
    exit(role_not_login);
handle_exception({game_pb_cannot_decode, {Reason, DataBin}}, _State) ->
    ?ERROR_MSG("exception: game_pb cannot decode, Reason: ~p, DataBin: ~p~n",
        [Reason, DataBin]),
    %gen_tcp:close(State#state.sock),
    exit(game_pb_cannot_decode);
handle_exception({mysql_fetch_error, {Reason, Query}}, _State) ->
    ?ERROR_MSG("exception: mysql fetch error, Reason: ~p, Query: ~p~n",
        [Reason, Query]),
    %gen_tcp:close(State#state.sock),
    exit(mysql_fetch_error);
handle_exception({mysql_execute_error, {Reason, Query, Params}}, _State) ->
    ?ERROR_MSG("exception: mysql execute error, Reason: ~p, Query: ~p, Params: ~p~n",
        [Reason, Query, Params]),
    %gen_tcp:close(State#state.sock),
    exit(mysql_execute_error);
handle_exception({mysql_transaction_error, {Reason, Result}}, _State) ->
    ?ERROR_MSG("exception: mysql transaction error, Reason: ~p, Result: ~p~n",
        [Reason, Result]),
    %gen_tcp:close(State#state.sock),
    exit(mysql_transaction_error);
handle_exception({'EXIT', From, Reason}, _State) ->
    ?ERROR_MSG("exit message from other process: ~p~n, Reason:~p~n,Stacktrace: ~p~n",
        [From, Reason, erlang:get_stacktrace()]),
    %gen_tcp:close(State#state.sock),
    exit(role_logout);
handle_exception(OrtherException, _State) ->
    ?ERROR_MSG("unhandled exception: ~p~nStacktrace: ~p~n",
        [OrtherException, erlang:get_stacktrace()]),
    %gen_tcp:close(State#state.sock),
    exit({unhandled_exception, OrtherException}).

