%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-define(TIME_ZONE, {8, 0, 0}).
-define(MAX_STEP, 10240).                                                       % 数据包计数最大值
-define(PROTOCOL_INTERVAL, 100).                                                % 最小的协议间隔时间(毫秒)
-define(PROTOCOL_ERROR_TIMES, 50).                                              % 允许协议异常的次数,仅限于发送协议太快

-define(SECRET_KEY, ")7yt4e!#)gcy&amp;#0^hlme-+082=s!b!$8+h$+(j0bucx0+nu%pe").  % 账号认证密钥
-define(EXPIRE_TIME, 60).                                                       % 账号认证过期时间

-define(PROTOCOL_KEY, "96b7a3915e").                                            % 通信秘钥

%% ETS
-define(ETS_SERVER_ENV, ets_server_env).                                        % 服务器环境变量
-define(ETS_ONLINE_PLAYER, ets_online_player).                                  % 服务器在线玩家
-define(ETS_ROLE_CONN, role_conn).                                              % 玩家连接表
-define(ETS_ACCOUNT, account_conn).                                             % account
-define(ETS_PROCESSES, ets_processes).                                          % 初始化进程列表
-define(ETS_TREASURE_GUARD, ets_treasure_guard).                                % 天地财宝守护信息

-define(GM_CLIENT_IPS, ["210.73.207.90", "127.0.0.1", "192.168.1.14", "120.132.75.102"]).         % GM后台允许列表
