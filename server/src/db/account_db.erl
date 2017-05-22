%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(account_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("common.hrl").

%% API
-export([
        create/1,
        get/1,
        save/1,
        update_login_time/1
]).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 获取account信息
get(AccountId) ->
    Template = <<"SELECT * FROM accounts WHERE account_id=~p">>,
    Params = [AccountId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_account_data(Row).

%% @doc 创建角色初始账号信息
create(AccountId) ->
    Template = <<"INSERT INTO accounts (account_id, create_time, login_time) VALUES (~p, ~p, ~p)">>,
    Params = [AccountId, util:unixtime(), util:unixtime()],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

%% @doc 存档帐号信息
save(Account) ->
    Query = ?FILTER_SQL(?update_account_sql, ?TAIL(Account)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save account error:~n~p~n", [Reason])
    end.

update_login_time(AccountId) ->
    Template = <<"UPDATE accounts SET login_time = ~p WHERE account_id = ~p">>,
    Params = [util:unixtime(), AccountId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_account_data(Row) ->
    case Row of
        null ->
            null;
        _ ->
            erlang:list_to_tuple([account|Row])
    end.

