%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(system_db).

-include("logger.hrl").
-include("common.hrl").

%% API
-export([connect/6, connect/7]).
-export([get_game_db_conf/0, get_log_db_conf/0, get_server_open_time/0, get_client_identity_info/0]).

-define(POLL_ID, admin_conn_pool).

%%%===================================================================
%%% API functions
%%%===================================================================

%% @doc MySQL服务
connect(Host, Port, User, Password, Database, Encoding) ->
    connect(Host, Port, User, Password, Database, Encoding, 1).

%% @doc MySQL服务
connect(Host, Port, User, Password, Database, Encoding, ConnNum) ->
    {ok, Pid} = mysql_db:start(?POLL_ID, Host, Port, User, Password, Database, Encoding),
    mysql_db:connect(?POLL_ID, Host, Port, User, Password, Database, Encoding, ConnNum),
    {ok, Pid}.

%% @doc 获取游戏服务器数据库配置
get_game_db_conf() ->
    ServerId = goddess_env:server_id(),
    Template = <<"SELECT * FROM servers WHERE server_id=~p">>,
    Params = [ServerId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get1(?POLL_ID, Query),
    [_, _, Host, Port, User, Password, Database | _] = Row,
    {ok, {util:to_list(Host), Port, util:to_list(User), util:to_list(Password), util:to_list(Database)}}.

get_log_db_conf() ->
    ServerId = goddess_env:server_id(),
    Template = <<"SELECT log_server_db_host,log_server_db_port,log_server_db_user,log_server_db_password,log_server_db_name FROM servers WHERE server_id=~p">>,
    Params = [ServerId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get1(?POLL_ID, Query),
    [Host, Port, User, Password, LogName] = Row,
    {ok, {util:to_list(Host), Port, util:to_list(User), util:to_list(Password), util:to_list(LogName)}}.

get_server_open_time() ->
    ServerId = goddess_env:server_id(),
    Template = <<"SELECT game_server_open_time FROM servers WHERE server_id=~p">>,
    Params = [ServerId],
    Query = ?FILTER_SQL(Template, Params),
    [ServerOpenTime] = mysql_db:get1(?POLL_ID, Query),
    {ok, util:to_integer(ServerOpenTime)}.

get_client_identity_info() ->
    ServerId = goddess_env:server_id(),
    Template = <<"SELECT allow_platform, allow_server_id, allow_client_version FROM servers WHERE server_id=~p">>,
    Params = [ServerId],
    Query = ?FILTER_SQL(Template, Params),
    [AllowPlatform, AllowServerId, AllowClientVersion] = mysql_db:get1(?POLL_ID, Query),
    {ok, {string:tokens(util:to_list(AllowPlatform), ","), string:tokens(util:to_list(AllowServerId), ","), string:tokens(util:to_list(AllowClientVersion), ",")}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

