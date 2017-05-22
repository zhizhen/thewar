%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(robot_manager).
-behaviour(gen_server).

-include("robot.hrl").

%% API
-export([start_link/0, start_link/2, login_one/0, login_one/1, login_many/1,
        logout_one/1, logout_many/0, login_many/3,
        show_online/0, command_one/2, command_many/1,
        show_count/0]).

-export([c/3, c/4]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).
-record(state, {ip, port}).

%%%===================================================================
%%% API
%%%===================================================================
-spec start_link() -> {ok, pid()}|{error, string()}|ignore .
%% @doc 使用默认IP地址和端口
start_link() ->
    gen_server:start({local, ?MODULE}, ?MODULE, [?DEFAULT_IP, ?DEFAULT_PORT], []).

-spec start_link(string(), integer()) -> {ok, pid()}|{error, string()}|ignore .
%% @doc 输入IP地址和端口
start_link(Ip, Port) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Ip, Port], []).

-spec login_one() -> ok.
%% @doc 创建一个机器人
login_one() ->
    gen_server:call(?MODULE, {'login_one'}).

login_one(Account) ->
    N = make_robot_account(Account),
    gen_server:call(?MODULE, {'login_one', N}).

-spec login_many(integer()) -> ok.
%% @doc 启动指定数量机器人
login_many(Num) ->
    gen_server:call(?MODULE, {'login_many', Num}, infinity).

login_many(StartId, Num, SceneId) ->
    gen_server:call(?MODULE, {'login_many', StartId, Num, SceneId}, infinity).

-spec logout_one(string()) -> string() | atom().
logout_one(Account) ->
    gen_server:call(?MODULE, {'logout_one', Account}).

-spec logout_many() -> ok.
logout_many() ->
    gen_server:call(?MODULE, {'logout_many'}).

-spec show_online() -> list().
%% @doc 显示所有在线机器人的信息
show_online() ->
    gen_server:call(?MODULE, {'show_online'}).

show_count() ->
    gen_server:call(?MODULE, {show_count}).

-spec command_one(string(), integer()) -> ok.
%% @doc 给指定的一个机器人发命令,Command两种格式：
%% 1 -> {M, F, A}            格式的自定义命令，需要到M 模块自己定义F 命令操作
%% 2 -> {send2server,Record} 死亡模式，自己拼凑协议record，打包后直接发给服务端
%% @end
command_one(Account, Command) ->
    gen_server:call(?MODULE, {'command_one', Account, Command}).

% easy way to use command_one
c(N, M, F) -> c(N, M, F, []).
c(N, M, F, A) ->
    Account = "robot_" ++ erlang:integer_to_list(N),
    command_one(Account, {M, F, A}).

-spec command_many(integer()) -> ok.
%% @doc 给所有的机器人发命令,Command两种格式：
%% 1 -> {M, F, A}            自定义模式，需要到M 模块自己定义F 命令操作
%% 2 -> {send2server,Record} 死亡模式，自己拼凑协议record，打包后直接发给服务端
%% @end
command_many(Command) -> 
    gen_server:call(?MODULE, {'command_many', Command}, infinity).
%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
%% @doc 启动机器人管理进程
init([Ip, Port]) ->
    process_flag(trap_exit, true),
    ets:new(?ETS_ONLINE_ROBOT, [{keypos, #robot.account_id}, named_table, public, set]),

    % 机器人共享的地图数据
    {ok, #state{ip = Ip, port = Port}}.

%% @private
%% @doc Handling call messages
handle_call({'login_one'},_From, #state{ip = Ip, port = Port}=State) ->
    AccId = make_robot_account(unused_account(1)),
    case robot:start_link(AccId, Ip, Port) of
        {ok, Pid}       -> {reply, Pid, State};
        {error, Error}  -> {reply, Error, State}
    end;

handle_call({'login_one', AccId},_From, #state{ip = Ip, port = Port}=State) ->
    case robot:start_link(AccId, Ip, Port) of
        {ok, Pid}       -> {reply, Pid, State};
        {error, Error}  -> {reply, Error, State}
    end;

handle_call({'login_many', Num}, _From, #state{ip = Ip, port = Port}=State) ->
    Fun = fun(Id) ->
            timer:sleep(200),
            AccId = make_robot_account(unused_account(Id)),
            case robot:start_link(AccId, Ip, Port) of
                {ok, _Pid}       -> 1;
                {error, _Error}  -> 0
            end
    end,
    ResultList = [Fun(X)||X<- lists:seq(1, Num)],
    SuccessNum = lists:sum(ResultList),
    {reply, io_lib:format("Expected num :~p ;started num :~p~n", [Num, SuccessNum]), State};

handle_call({'login_many', StartId, Num, SceneId}, _From, #state{ip = Ip, port = Port}=State) ->
    Fun = fun(Id) ->
        timer:sleep(1000),
        AccId = make_robot_account(unused_account(Id)),
        case robot:start_link(AccId, Ip, Port, SceneId) of
            {ok, _Pid}       -> 1;
            {error, _Error}  -> 0
        end
    end,
    ResultList = [Fun(X)||X<- lists:seq(StartId, StartId+Num)],
    SuccessNum = lists:sum(ResultList),
    {reply, io_lib:format("Expected num :~p ;started num :~p~n", [Num, SuccessNum]), State};

handle_call({'logout_one', Account}, _From, State) ->
    case ets:lookup(?ETS_ONLINE_ROBOT, Account) of
        [] ->{reply, "robot not_exist, use robot_manager:show_online().", State};
        [#robot{pid = Pid}] -> {reply, Pid ! stop, State}
    end;

handle_call({'logout_many'}, _From, State) ->
    ets:foldr(fun(#robot{pid = Pid}, _Acc0) ->
                Pid ! stop end, [], ?ETS_ONLINE_ROBOT),
    {reply, ok, State};

handle_call({'show_online'}, _From, State) ->
    {reply, ets:tab2list(?ETS_ONLINE_ROBOT), State};

handle_call({show_count}, _From, State) ->
    {reply, length(ets:tab2list(?ETS_ONLINE_ROBOT)), State};

handle_call({'command_one', Account, {_M, _F, _A}=Command}, _From, State) ->
    case ets:lookup(?ETS_ONLINE_ROBOT, Account) of
        [] -> {reply, "robot not_exist, use robot_manager:show_online().", State};
        [#robot{pid = Pid}] -> {reply, Pid ! Command, State}
    end;

handle_call({'command_many', Command}, _From, State) ->
    [begin Pid ! Command end || #robot{pid = Pid}<-ets:tab2list(?ETS_ONLINE_ROBOT)],
    {reply, Command, State};

handle_call(Request, From, State) ->
    ?PRINT("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", 
        [Request, From, State]),
    {reply, ok, State}.

%% @private
%% @doc Handling cast messages
handle_cast(Msg, State) ->
    ?PRINT("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

%% @private
%% @doc Handling all non call/cast messages
%% 捕获机器人退出的消息
handle_info({'EXIT', From, Reason}, State) ->
    ?PRINT("robot exit singal from :~p~nReason:~p~n", [From, Reason]),
    ets:match_delete(?ETS_ONLINE_ROBOT, #robot{pid = From, _ = '_' }),
    {noreply, State};

handle_info(Info, State) ->
    ?PRINT("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.

%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
terminate(Reason, State) ->
    ?PRINT("robot_manager terminate, reason: ~p, state: ~p~n", [Reason, State]),
    ok.

%% @private
%% @doc Convert process state when code is changed
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
%%%============================================================================
%%% Local functions
%%%============================================================================
unused_account(Id) ->
    AccId = make_robot_account(Id),
    case ets:lookup(?ETS_ONLINE_ROBOT, AccId) of
        [] -> Id;
        _ -> unused_account(Id +1)
    end.
make_robot_account(Id) ->
    "robot_" ++ util:to_list(Id).
