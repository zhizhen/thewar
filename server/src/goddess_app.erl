%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_app).

-behaviour(application).

-include("common.hrl").
-include("logger.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").

%% API
-export([start/0, stop/0]).

%% Application callbacks
-export([start/2, stop/1]).

-define(APPS, [sasl, goddess]).

%%%===================================================================
%%% API functions
%%%===================================================================

%% @doc 启动游戏服务器API
start() ->
    try
        ok = start_applications(?APPS)
    after
        %% give the error loggers some time to catch up
        timer:sleep(1000)
    end.

%% @doc 关闭游戏服务器API
stop() ->
    F = fun(#role_conn{role_pid=Pid}, _) ->
      gen_server:call(Pid, {logout, stop_server})
    end,
    ets:foldl(F, [], ?ETS_ROLE_CONN),
    ok = stop_applications(?APPS).

%%%===================================================================
%%% Application callbacks
%%%===================================================================

%% @private
%% @doc 启动游戏服务器，运行游戏服务器各类基础服务
start(_StartType, _StartArgs) ->
    {ok, SupPid} = goddess_sup:start_link(),

    ok = start_logger(),
    ok = init_ets(),
    ok = start_mysql(),
    % ok = start_statistics(),
    % ok = start_rand(),
    ok = start_scene(),
    % ok = start_mail(),
    % ok = start_arena(),
    ok = start_id_srv(),
    % ok = start_rank_srv(),
    % ok = start_act_srv(),
    % ok = start_sensitive_srv(),
    ok = start_newworking(),
    % ok = start_group(),
    % ok = start_boss(),
    % ok = start_world_boss(),
    % ok = start_notice(),
    % ok = start_treasure(),
    % warrior_srv:start_link(),


    % get_server_open_time(),
    % reset_all_online_state(),
    ?INFO_MSG("Starting Goddess Done.~n"),
    {ok, SupPid}.

%% @private
%% @doc 关闭游戏服务器
stop(_State) ->
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================
manage_applications(Iterate, Do, Undo, SkipError, ErrorTag, Apps) ->
    Iterate(fun (App, Acc) ->
        case Do(App) of
            ok -> [App | Acc];
            {error, {SkipError, _}} -> Acc;
            {error, Reason} ->
                lists:foreach(Undo, Acc),
                throw({error, {ErrorTag, App, Reason}})
        end
    end, [], Apps),
    ok.

start_applications(Apps) ->
    manage_applications(fun lists:foldl/3,
        fun application:start/1,
        fun application:stop/1,
        already_started,
        cannot_start_application,
        Apps).

stop_applications(Apps) ->
    manage_applications(fun lists:foldr/3,
        fun application:stop/1,
        fun application:start/1,
        not_started,
        cannot_stop_application,
        Apps).

%% @doc 启动日志服务
-spec start_logger() -> ok.
start_logger() ->
    [LogLevel, Dir, Prefix, IsMf] = goddess_env:logger_conf(),
    io:format("logger conf:~p~n", [{LogLevel, Dir, Prefix, IsMf}]),
    loglevel:set(LogLevel),
    gen_event:add_handler(error_logger, file_appender, [Dir, Prefix, IsMf]),
    ?INFO_MSG("Starting Goddess Logger Done! log level: ~p~n", [LogLevel]),
    ok.

%% @doc 初始化服务器全局ETS，并设置服务器相关变量
-spec init_ets() -> ok.
init_ets() ->
    ets:new(?ETS_SERVER_ENV, [set, public, named_table]),
    ets:new(?ETS_ONLINE_PLAYER, [set, public, named_table, {keypos, #online.id}]),

    ServerId = goddess_env:server_conf(),
    ?INFO_MSG("server conf:~p~n", [{ServerId}]),
    ets:insert(?ETS_SERVER_ENV, {server_id, ServerId}),

    Opt = [named_table,
           ordered_set,
           {read_concurrency, true}],

    ets:new(?ETS_ROLE_CONN,    [public, {keypos, #role_conn.role_id}] ++ Opt),
    ets:new(?ETS_ACCOUNT,[public, {keypos, #account_conn.account_id}] ++ Opt),
    ets:new(?ETS_PROCESSES, [named_table, protected, set, {keypos, 1}]),
    ets:insert(?ETS_PROCESSES, {init, erlang:processes()}),
    ok.

%% @doc 启动网络服务
-spec start_newworking() -> ok.
start_newworking() ->
    AcceptorNum = goddess_env:acceptor_num(),
    TcpListener = goddess_env:tcp_listener(),
    TcpOpts = goddess_env:tcp_opts(),
    goddess_networking:start(TcpListener, AcceptorNum, TcpOpts),
    ?INFO_MSG("Starting Goddess Networking Done, TcpListener: ~p, AcceptorNum: ~p, TcpOpts: ~p~n",
        [TcpListener, AcceptorNum, TcpOpts]),
    ok.

%% @doc 启动MySQL服务
-spec start_mysql() -> ok.
start_mysql() ->
    ConnNum = goddess_env:mysql_conn_num(),
    [Host, Port, User, Password, Database, Encoding] = goddess_env:system_db_conf(),
    % ?INFO_MSG("Start Mysql Service Done!~p~n", [{Host, Port, User, Password, Database, Encoding}]),
    {ok, _} = mysql_db:start(admin_conn_pool, Host, Port, User, Password, Database, Encoding),
    mysql_db:connect(Host, Port, User, Password, Database, Encoding, ConnNum),

    % {ok, {Host1, Port1, User1, Password1, Database1}} = system_db:get_game_db_conf(),
    ets:insert(?ETS_SERVER_ENV, {game_db_conf, {Host, Port, User, Password, Database}}),
    % mysql_db:connect(Host1, Port1, User1, Password1, Database1, Encoding, ConnNum),

    % {ok, {AllowPlatform, AllowServerId, AllowClientVersion}} = system_db:get_client_identity_info(),
    % ets:insert(?ETS_SERVER_ENV, {client_identity, {AllowPlatform, AllowServerId, AllowClientVersion}}),
    ?INFO_MSG("Start Mysql Service Done!~p~n", []),
    ok.

%% @doc 启动随机数服务
-spec start_rand() -> ok.
start_rand() ->
    rand_srv:start_link(),
    ?INFO_MSG("Starting Goddess Rand Done"),
    ok.

%% @doc scene sup
-spec start_scene() -> ok.
start_scene() ->
    scene_sup:start_link(),
    [scene_sup:start_child(I) || I <- scene_cfg:get_all()],
    ok.

%% @doc mail sup
-spec start_mail() -> ok.
start_mail() ->
    {ok, Pid} = mail_srv:start_link(),
    ?INFO_MSG("Starting Goddess Mail Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc arena sup
-spec start_arena() -> ok.
start_arena() ->
    {ok, Pid} = arena_srv:start_link(),
    ?INFO_MSG("Starting Goddess Arena Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc 启动ID生成服务
-spec start_id_srv() -> ok.
start_id_srv() ->
    {ok, Pid} = id_srv:start_link(),
    ?INFO_MSG("Starting Goddess Id Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc 启动排行榜服务
-spec start_rank_srv() -> ok.
start_rank_srv() ->
    {ok, Pid} = rank_srv:start_link(),
    ?INFO_MSG("Starting Goddess Rank Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc 活动服务
-spec start_act_srv() -> ok.
start_act_srv() ->
    {ok, Pid} = act_srv:start_link(),
    ?INFO_MSG("Starting Goddess Act Service Done, Pid: ~p~n", [Pid]),
    ok.


%% @doc 启动敏感词过滤服务
-spec start_sensitive_srv() -> ok.
start_sensitive_srv() ->
    {ok, Pid} = sensitive_srv:start_link(),
    ?INFO_MSG("Starting Goddess Sensitive Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc 启动日志缓存服务
-spec start_statistics() -> ok.
start_statistics() ->
    {ok, Pid} = statistics_srv:start_link(),
    ?INFO_MSG("Starting Goddess Statistics Service Done, Pid: ~p~n", [Pid]),
    ok.

%% @doc 获取开服时间
-spec get_server_open_time() -> ok.
get_server_open_time() ->
    {ok, ServerOpenTime} = system_db:get_server_open_time(),
    ets:insert(?ETS_SERVER_ENV, {server_open_time, ServerOpenTime}),
    ?INFO_MSG("Get Server Open Time Done.~n"),
    ok.

%% @doc 重置所有的在线状态
-spec reset_all_online_state() -> ok.
reset_all_online_state() ->
    role_db:reset_all_online_state(),
    ?INFO_MSG("online state reset done.~n"),
    ok.

%% @doc 启动帮会
-spec start_group() -> ok.
start_group() ->
    group_sup:start_link(),
    ?INFO_MSG("start group service Done"),
    ok.

%% @doc 启动BOSS
-spec start_boss() -> ok.
start_boss() ->
    boss_sup:start_link(),
    ?INFO_MSG("start boss service Done"),
    ok.

%% @doc 启动WORLD BOSS
-spec start_world_boss() -> ok.
start_world_boss() ->
    world_boss_srv:start_link(),
    ?INFO_MSG("start world boss service Done"),
    ok.

%% @doc 启动WORLD BOSS
-spec start_notice() -> ok.
start_notice() ->
    notice_srv:start_link(),
    ?INFO_MSG("start world boss service Done"),
    ok.

-spec start_treasure() -> ok.
start_treasure() ->
    treasure_srv:start_link(),
    ?INFO_MSG("start treasure service Done"),
    ok.

