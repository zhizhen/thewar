-module(pay_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([get_by_id/1, get_by_roleid/2, insert/1, update/1]).

get_by_id(OrderId) ->
    Params = [OrderId],
    Query = <<"select * from orders where orderid='~ts'">>,
    Query1 = ?FILTER_SQL(Query, Params),
    case mysql_db:select(Query1) of
        [] -> false;
        [Row] -> build(Row)
    end.

get_by_roleid(RoleId, State) ->
    Params = [RoleId, State],
    Query = <<"select * from orders where role_id='~ts' and state='~p'">>,
    Query1 = ?FILTER_SQL(Query, Params),
    Rows = mysql_db:select(Query1),
    builds(Rows).

insert(Order) ->
    Query = <<"insert into orders(orderid,role_id,account_id,num,time,state) values('~ts','~ts', '~ts', ~p,~p,~p)">>,
    Query1 = ?FILTER_SQL(Query, ?TAIL(Order)),
    try 
        mysql_db:insert(Query1)
    catch throw:Reason ->
        ?ERROR_MSG("insert order error:~p~n", [{Order, Reason}])
end.

update(Order) ->
    Query = ?FILTER_SQL(?update_order_sql, ?TAIL(Order)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save order error:~n~p~n", [{Order, Reason}])
    end.

builds([]) -> [];
builds(Rows) ->
    [build(Row) || Row <- Rows].

build(Row) ->
    list_to_tuple([order|Row]).
