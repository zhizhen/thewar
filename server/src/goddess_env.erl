%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_env).

-include("goddess.hrl").

%% API
-export([
    logger_conf/0,
    tcp_opts/0,
    tcp_listener/0,
    acceptor_num/0,
    system_db_conf/0,
    mysql_conn_num/0,
    server_conf/0,
    server_id/0,
    server_open_time/0,
    statistic_master_server/0,
    client_identity/0
]).
%%%===================================================================
%%% API
%%%===================================================================

%% @doc 获取当前服务器平台标志及服务器ID，此信息将存储于ETS中
server_conf() ->
    ServerId = get_goddess_env(server_id, 1000),
    ServerId.

%% @doc 从ETS中获得服务器ID
server_id() ->
    [{server_id, ServerId}] = ets:lookup(?ETS_SERVER_ENV, server_id),
    ServerId.

client_identity() ->
    [{client_identity, Identity}] = ets:lookup(?ETS_SERVER_ENV, client_identity),
    Identity.

server_open_time() ->
    [{server_open_time, ServerOpenTime}] = ets:lookup(?ETS_SERVER_ENV, server_open_time),
    ServerOpenTime.

%% @doc 获取日志配置
logger_conf() ->
    case get_goddess_env(logger_conf) of
        Conf when is_list(Conf) ->
            LogLevel    = proplists:get_value(log_level, Conf, 4),
            Dir         = proplists:get_value(dir, Conf, "logs"),
            Prefix      = proplists:get_value(prefix_name, Conf, "goddess"),
            IsMf        = proplists:get_value(is_mf, Conf, true),
            [LogLevel, Dir, Prefix, IsMf];
        _ ->
            throw(logger_conf_undefined)
    end.

%% @doc 获取tcp配置参数
-spec tcp_opts() -> list() | undefined.
tcp_opts() ->
    get_goddess_env(tcp_opts).

%% @doc 获取tcp监听端口
-spec tcp_listener() -> integer().
tcp_listener() ->
    get_goddess_env(tcp_listener, 8888).

%% @doc 获取tcp listener accept数量
-spec acceptor_num() -> integer().
acceptor_num() ->
    get_goddess_env(acceptor_num, 1).

%% @doc 获取mysql数据库配置，默认为[]
-spec system_db_conf() -> list().
system_db_conf() ->
    case get_goddess_env(erlang:list_to_atom("db_conf")) of
        MySQLConf when is_list(MySQLConf) ->
            Host     = proplists:get_value(host, MySQLConf, "127.0.0.1"),
            Port     = proplists:get_value(port, MySQLConf, 3306),
            User     = proplists:get_value(user, MySQLConf, "root"),
            Password = proplists:get_value(password, MySQLConf, "123456"),
            Database = proplists:get_value(database, MySQLConf, "server"),
            Encoding = proplists:get_value(encoding, MySQLConf, utf8),
            [Host, Port, User, Password, Database, Encoding];
        _ ->
            throw(system_db_conf_undefined)
    end.

statistic_master_server() ->
    get_goddess_env(statistic_master_server, false).

-spec mysql_conn_num() -> integer().
%% @doc 获取mysql连接数
mysql_conn_num() ->
    get_goddess_env(mysql_conn_num, 1).

%%%===================================================================
%%% Internal functions
%%%===================================================================
get_goddess_env(Key) ->
    get_goddess_env(Key, undefined).

get_goddess_env(Key, Default) ->
    get_app_env(goddess, Key, Default).

get_app_env(AppName, Key, Default) ->
    case application:get_env(AppName, Key) of
        undefined   -> Default;
        {ok, Value} -> Value
    end.
