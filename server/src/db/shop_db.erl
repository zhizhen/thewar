%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 随身商店存档
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(shop_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([
        get/1,
        save/1,
        create/1
]).
-define(DATA_VERSION, 1).
%%%===================================================================
%%% API
%%%===================================================================

%% @doc 创建角色初始随身商店
create(Id) ->
    Template = <<"INSERT INTO shops (role_id, latest_point) VALUES (~p,~p)">>,
    Now = util:unixtime(),
    Params = [Id, Now - ?SHOP_REFRESH_TIME],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

%% @doc 从数据库加载随身商店数据
get(Id) ->
    Template = <<"SELECT * FROM shops WHERE role_id=~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_shop_data(Row).

%% @doc 存储随身商店信息
save(Shop) ->
    NewShop = Shop#shop{shop_items = serialize(Shop#shop.shop_items)},
    Query = ?FILTER_SQL(?update_shop_sql, ?TAIL(NewShop)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save shop error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_shop_data(Row) ->
    Shop = list_to_tuple([shop | Row]),
    Items = deserialize(util:to_list(Shop#shop.shop_items)),
    Shop#shop{shop_items = Items}.

%% 序列化和反序列化
%% [#shop_item{item_id, num, state}, ...] -> "70000_1_0,80000_1_0,..."
serialize([]) -> "";
serialize(L) ->
    S = string:join([begin
                    [_|F] = tuple_to_list(X),
                    string:join([util:to_list(T)||T<-F], "-")
            end || X <- L], ","),
    util:to_list(?DATA_VERSION) ++ "," ++ S.

deserialize(S) ->
    case string:tokens(S, ",") of
        [] -> [];
        [DataVersion|SList] ->
            diff_version_deserialize(util:to_integer(DataVersion), SList)
    end.

%diff_version_deserialize(1, SList) ->
    % oldversion
%    [];
diff_version_deserialize(?DATA_VERSION, SList) ->
    F = fun(X) ->
        S2 = re:split(X, "-", [{return, list}]),
        L = [util:to_integer(Y) ||Y<-S2],
        erlang:list_to_tuple([shop_item|L])
    end,
    [F(X)||X<-SList].

