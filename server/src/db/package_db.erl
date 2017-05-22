%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(package_db).

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

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 创建角色初始包裹
create(Id) ->
    Slots = serialize(free_slot(1, [])),
    Template = <<"INSERT INTO packages (role_id, slots) VALUES (~p, ~p)">>,
    Params = [Id, Slots],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

%% @doc 从数据库加载背包数据
get(Id) ->
    Params = [Id],
    Query = ?FILTER_SQL(?select_package_sql, Params),
    Row = mysql_db:get(Query),
    build_package_data(Row).


%% @doc 存储包裹信息
save(Package) ->
    NewPackage = Package#package{slots = serialize(Package#package.slots)},
    Query = ?FILTER_SQL(?update_package_sql, ?TAIL(NewPackage)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save package error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_package_data(Row) ->
    Package = list_to_tuple([package | Row]),
    Slots = deserialize(util:to_list(Package#package.slots)),
    Package#package{slots = Slots}.

%% 序列化和反序列化
serialize([]) -> "";
serialize(L) ->
    string:join([util:to_list(X) || X <- L], ",").
deserialize(S) ->
    SList = string:tokens(S, ","),
    [util:to_integer(X) || X <- SList].

free_slot(Num, Acc0) ->
    case package_cfg:get(Num) of
        false -> lists:reverse(Acc0);
        #package_cfg{
                open_slot_num = Slot,
                need_time = 0,
                need_gold = 0,
                need_coin = 0,
                need_item = 0
        } -> free_slot(Num + 1, [Slot|Acc0]);
        _ -> free_slot(Num + 1, Acc0)
    end.




