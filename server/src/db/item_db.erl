%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(item_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("cfg_record.hrl").

%% API
-export([
        get_max_item_id/0,
        get/1,
        get_by_id/1,
        update/1,
        save/1,
        free_get/2,

        fix_slot/2
]).

%%%===================================================================
%%% API
%%%===================================================================
%% @doc 从数据库加载道具数据
get(RoleId) ->
    Template = <<"SELECT * FROM items WHERE role_id=~p AND state <> ~p">>,
    Params = [RoleId, ?ITEM_DELETE],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_items(Row).

get_by_id(Id) ->
    Template = <<"SELECT * FROM items WHERE id=~p AND state <> ~p">>,
    Params = [Id, ?ITEM_DELETE],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_item_data(Row).

%% @doc 获取最大item id
get_max_item_id() ->
    Query = <<"SELECT MAX(CAST(id AS SIGNED)) FROM items">>,
    [MaxItemId] = mysql_db:get(Query),
    MaxItemId.

%% 试一下
update(#item{slots=S}=Item) ->
    NewItem = Item#item{slots=list2bin(S)},
    Query = ?FILTER_SQL(?update_item_sql, ?TAIL(NewItem)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save item error:~n~p~n", [Reason])
    end.

%% @doc 存档
save(#items{all=Items}) ->
    [update(Item) || Item <- Items].


free_get(RoleId, JobId) ->
    Cfg = suit_cfg:get({JobId, 1}),
    [begin
          Item = item_api:complete_item(#item{role_id = RoleId, item_id=ItemId, num=1, slots=?NEWSLOTS}, 0),
          update(Item#item{state = ?ITEM_USE})
     end || ItemId <- Cfg#suit_cfg.items].


%%%===================================================================
%%% Internal functions
%%%===================================================================
%todo 根据配置动态调整孔数,需要时加上,使用fix函数
build_items(Row) ->
    Items = [build_item_data(X) || X<- Row],
    #items{all = Items}.

build_item_data(null) -> false;
build_item_data(Row) ->
    Item = list_to_tuple([item|Row]),
    Item#item{slots = fix_slot(bin2list(Item#item.slots), 5)}.

bin2list(B) ->
    S = binary_to_list(B),
    [list_to_integer(I) || I <- string:tokens(S, "-")].

list2bin(L) ->
    L2 = [integer_to_list(I) || I <- L],
    list_to_binary(string:join(L2, "-")).


% 是L的元素个数变成Num个, 补0
% 只变长 不变短
fix_slot(L, Num) ->
    Len = erlang:length(L),
    case Len == Num of
        true -> L;
        false when Len > Num ->
            lists:sublist(L, Num);
        false ->
            Num2 = Num - Len,
            L ++ lists:duplicate(Num2, 0)
    end.
