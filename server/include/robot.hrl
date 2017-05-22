%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc 返回码
%%% @date 2013-04-09 18:54:55
%%% 
%%% @end
%%%-------------------------------------------------------------------
-define(ETS_ONLINE_ROBOT, ets_online_robot).
-define(DEFAULT_IP, "127.0.0.1").
%-define(DEFAULT_IP, "192.168.1.14").
-define(DEFAULT_PORT, 8888).

-define(PLATFORM, "DEV").
-define(SERVERID, "1001").
-define(VERSION, "1.0.0").

%% -define(PLATFORM, "91_ios").
%% -define(SERVERID, "1001").
%% -define(VERSION, "1.0.0").

-define(TCP_OPTS, [binary, {packet, 0}, {active, true}]).
-define(TCP_TIMEOUT, 1000).
-define(HEART_BEAT, 30000).

-define(PRINT(Msg),
    io:format(Msg)).

-define(PRINT(Format, Args),
    io:format(Format, Args)).

-record(robot, {account_id, pid}).
-record(cost_node, {present, parent, f, g, h}).
