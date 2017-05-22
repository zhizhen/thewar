%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------

%% Logging mechanism

%% Print in standard output
-define(LOG_POOL, log_conn_pool).

-define(PRINT(Msg),
    io:format(Msg)).

-define(PRINT(Format, Args),
    io:format(Format, Args)).


-define(DEBUG_MSG(Msg),
    logger:debug_msg(?MODULE, ?LINE, Msg, [])).

-define(DEBUG_MSG(Format, Args),
    logger:debug_msg(?MODULE, ?LINE, Format, Args)).


-define(INFO_MSG(Msg),
    logger:info_msg(?MODULE, ?LINE, Msg, [])).

-define(INFO_MSG(Format, Args),
    logger:info_msg(?MODULE, ?LINE, Format, Args)).


-define(WARNING_MSG(Msg),
    logger:warning_msg(?MODULE, ?LINE, Msg, [])).

-define(WARNING_MSG(Format, Args),
    logger:warning_msg(?MODULE, ?LINE, Format, Args)).


-define(ERROR_MSG(Msg),
    logger:error_msg(?MODULE, ?LINE, Msg, [])).

-define(ERROR_MSG(Format, Args),
    logger:error_msg(?MODULE, ?LINE, Format, Args)).


-define(CRITICAL_MSG(Msg),
    logger:critical_msg(?MODULE, ?LINE, Msg, [])).

-define(CRITICAL_MSG(Format, Args),
    logger:critical_msg(?MODULE, ?LINE, Format, Args)).
