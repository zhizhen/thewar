%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mysql_db).

-include("logger.hrl").
-include("mysql.hrl").
-include("goddess.hrl").

%% API
-export([start/6, start/7, connect/6, connect/7, connect/8]).
-export([fetch/1, fetch/2, execute/1, execute/2, execute/3]).
-export([transaction/1, transaction/2]).
-export([get/1, get/2, get/3, get1/1, get1/2]).
-export([insert/1, insert/2, insert/3, insert1/1, insert1/2]).
-export([select/1, select/2, select/3, select1/1, select1/2]).
-export([update/1, update/2, update/3, update1/1, update1/2]).
-export([delete/1, delete/2, delete/3, delete1/1, delete1/2]).

-define(POOL_ID, mysql_conn_pool).
-define(TIMEOUT, 3000).

%%%===================================================================
%%% API functions
%%%===================================================================

%% @doc 启动 MySQL 服务
start(Host, Port, User, Password, Database, Encoding) ->
    start(?POOL_ID, Host, Port, User, Password, Database, Encoding).

%% @doc 启动 MySQL 服务
start(PollId, Host, Port, User, Password, Database, Encoding) ->
    {ok, Pid} = mysql:start_link(PollId, Host, Port,
        User, Password, Database, fun(_, _, _, _) -> ok end, Encoding),
    {ok, Pid}.

%% @doc 连接 MySQL 服务
connect(Host, Port, User, Password, Database, Encoding) ->
    connect(Host, Port, User, Password, Database, Encoding, 1).

%% @doc 连接 MySQL 服务
connect(Host, Port, User, Password, Database, Encoding, ConnNum) ->
    connect(?POOL_ID, Host, Port, User, Password, Database, Encoding, ConnNum).

%% @doc 连接 MySQL 服务
connect(PollId, Host, Port, User, Password, Database, Encoding, ConnNum) ->
    lists:foreach(fun(_) ->
                        mysql:connect(PollId, Host, Port, User, Password, Database, Encoding, true)
                  end,
                  lists:duplicate(ConnNum, dummy)),
    ok.

%% @doc 数据库 INSERT 操作
insert(Query) ->
    insert1(Query).

%% @doc 数据库 INSERT 操作
insert(Query, Params) ->
    insert(?POOL_ID, Query, Params).

%% @doc 数据库 INSERT 操作
insert(PoolId, Query, Params) ->
    Result = execute(PoolId, Query, Params),

    case Result of
        {updated, AffectedRows, LastInsertId} ->
            {AffectedRows, LastInsertId};
        _ ->
            throw({mysql_execute_error, {"mysql_db:insert/3 unsupport statement", Query, Params}})
    end.

%% @doc 数据库 INSERT 操作
insert1(Query) ->
    insert1(?POOL_ID, Query).

%% @doc 数据库 INSERT 操作
insert1(PoolId, Query) ->
    Result = fetch(PoolId, Query),

    case Result of
        {updated, AffectedRows, LastInsertId} ->
            {AffectedRows, LastInsertId};
        _ ->
            throw({mysql_fetch_error, {"mysql_db:insert1/2 unsupport statement", Query}})
    end.

%% @doc 数据库 SELECT 操作，查询单行数据
get(Query) ->
    get1(Query).

%% @doc 数据库 SELECT 操作，查询单行数据
get(Query, Params) ->
    get(?POOL_ID, Query, Params).

%% @doc 数据库 SELECT 操作，查询单行数据
get(PoolId, Query, Params) ->
    Result = execute(PoolId, Query, Params),

    case Result of
        {data, null} ->
            null;
        {data, [Row]} ->
            Row;
        {data, _Rows} ->
            throw({mysql_execute_error, {"Multiple rows returned for mysql_db:get/2 query", Query, Params}});
        _ ->
            throw({mysql_execute_error, {"mysql_db:get/2 unsupport statement", Query, Params}})
    end.

%% @doc 数据库 SELECT 操作，查询单行数据
get1(Query) ->
    get1(?POOL_ID, Query).

%% @doc 数据库 SELECT 操作，查询单行数据
get1(PoolId, Query) ->
    Result = fetch(PoolId, Query),

    case Result of
        {data, null} ->
            null;
        {data, [Row]} ->
            Row;
        {data, _Rows} ->
            throw({mysql_fetch_error, {"Multiple rows returned for mysql_db:get/2 query", Query}});
        _ ->
            throw({mysql_fetch_error, {"mysql_db:get1/2 unsupport statement", Query}})
    end.

%% @doc 数据库 SELECT 操作，查询多行数据
select(Query) ->
    select1(Query).

%% @doc 数据库 SELECT 操作，查询多行数据
select(Query, Params) ->
    select(?POOL_ID, Query, Params).

%% @doc 数据库 SELECT 操作，查询多行数据
select(PoolId, Query, Params) ->
    Result = execute(PoolId, Query, Params),

    case Result of
        {data, null} ->
            [];
        {data, Rows} ->
            Rows;
        _ ->
            throw({mysql_execute_error, {"mysql_db:select/2 unsupport statement", Query, Params}})
    end.

%% @doc 数据库 SELECT 操作，查询多行数据
select1(Query) ->
    select1(?POOL_ID, Query).

%% @doc 数据库 SELECT 操作，查询多行数据
select1(PoolId, Query) ->
    Result = fetch(PoolId, Query),

    case Result of
        {data, null} ->
            [];
        {data, Rows} ->
            Rows;
        _ ->
            throw({mysql_fetch_error, {"mysql_db:select1/2 unsupport statement", Query}})
    end.

%% @doc 数据库 UPDATE 操作
update(Query) ->
    update1(Query).

%% @doc 数据库 UPDATE 操作
update(Query, Params) ->
    update(?POOL_ID, Query, Params).

%% @doc 数据库 UPDATE 操作
update(PoolId, Query, Params) ->
    Result = execute(PoolId, Query, Params),

    case Result of
        {updated, AffectedRows, 0} ->
            AffectedRows;
        _ ->
            throw({mysql_execute_error, {"mysql_db:update/3 unsupport statement", Query, Params}})
    end.

%% @doc 数据库 UPDATE 操作
update1(Query) ->
    update1(?POOL_ID, Query).

%% @doc 数据库 UPDATE 操作
update1(PoolId, Query) ->
    Result = fetch(PoolId, Query),

    case Result of
        {updated, AffectedRows, 0} ->
            AffectedRows;
        _ ->
            throw({mysql_fetch_error, {"mysql_db:update1/2 unsupport statement", Query}})
    end.

%% @doc 数据库 DELETE 操作
delete(Query) ->
    delete1(Query).

%% @doc 数据库 DELETE 操作
delete(Query, Params) ->
    delete(?POOL_ID, Query, Params).

%% @doc 数据库 DELETE 操作
delete(PoolId, Query, Params) ->
    Result = execute(PoolId, Query, Params),

    case Result of
        {updated, AffectedRows, 0} ->
            AffectedRows;
        _ ->
            throw({mysql_execute_error, {"mysql_db:delete/3 unsupport statement", Query, Params}})
    end.

%% @doc 数据库 DELETE 操作
delete1(Query) ->
    delete1(?POOL_ID, Query).

%% @doc 数据库 DELETE 操作
delete1(PoolId, Query) ->
    Result = fetch(PoolId, Query),

    case Result of
        {updated, AffectedRows, 0} ->
            AffectedRows;
        _ ->
            throw({mysql_fetch_error, {"mysql_db:delete1/2 unsupport statement", Query}})
    end.

%% @doc mysql:fetch/3 封装函数
fetch(Query) ->
    fetch(?POOL_ID, Query).

%% @doc mysql:fetch/3 封装函数
fetch(PoolId, Query) ->
    % Result = mysql:fetch(PoolId, Query, ?TIMEOUT),
    Result = mysql:fetch(PoolId, Query),

    case build_mysql_result(Result) of
        {mysql_error, Reason, _ErrCode, _ErrSqlState} ->
            throw({mysql_fetch_error, {Reason, Query}});
        Result1 ->
            Result1
    end.

%% @doc mysql:execute/3 封装函数
execute(Query) ->
    execute(?POOL_ID, Query).

%% @doc mysql:execute/3 封装函数
execute(PoolId, Query) ->
    execute(PoolId, Query, []).

%% @doc mysql:execute/3 封装函数
execute(PoolId, Query, Params) when is_list(Params) ->
    %% 使用调用者进程作为stmt，以保证占位符方式执行sql语句时候，一次操作的原子性
    S = pid_to_list(self()),
    P = string:join(string:tokens(string:substr(S, 2, length(S) - 2), "."), "_"),
    Stmt = list_to_atom("stmt_" ++ P),
    mysql:prepare(Stmt, Query),
    % Result = mysql:execute(PoolId, Stmt, Params, ?TIMEOUT),
    Result = mysql:execute(PoolId, Stmt, Params),

    case build_mysql_result(Result) of
        {mysql_error, Reason, _ErrCode, _ErrSqlState} ->
            throw({mysql_execute_error, {Reason, Query, Params}});
        Result1 ->
            Result1
    end.

%% @doc mysql:transaction/3 封装函数
transaction(Fun) ->
    transaction(?POOL_ID, Fun).

%% @doc mysql:transaction/3 封装函数
transaction(PoolId, Fun) ->
    % case mysql:transaction(PoolId, Fun, ?TIMEOUT) of
    case mysql:transaction(PoolId, Fun) of
        {atomic, _Result} ->
            ok;
        %% TODO: 增加Fun异常处理
        {aborted, {Reason, {rollback_result, Result}}} ->
            throw({mysql_transaction_error, {Reason, Result}})
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @doc mysql_result 结果集分类处理
build_mysql_result(Result) ->
    case Result of
        %% SELECT
        {data, #mysql_result{fieldinfo=_FieldInfo, rows=[], affectedrows=0, insertid=0,
                error="", errcode=0, errsqlstate=""}} ->
            {data, null};
        {data, #mysql_result{fieldinfo=_FieldInfo, rows=Rows, affectedrows=0, insertid=0,
                error="", errcode=0, errsqlstate=""}} ->
            {data, Rows};
        %% INSERT/UPDATE/DELETE
        %% 如果主键自增或执行 LAST_INSERT_ID 函数，则 InsertId 不为0
        {updated, #mysql_result{fieldinfo=[], rows=[], affectedrows=AffectedRows, insertid=InsertId,
                error="", errcode=0, errsqlstate=""}} ->
            {updated, AffectedRows, InsertId};
        %% ERROR
        {error, #mysql_result{fieldinfo=[], rows=[], affectedrows=0, insertid=0,
                error=Reason, errcode=ErrCode, errsqlstate=ErrSqlState}} ->
            {mysql_error, Reason, ErrCode, ErrSqlState}
    end.
