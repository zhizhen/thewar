%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(equip_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_record.hrl").
-include("common.hrl").
-include("table_etc.hrl").
-include("cfg_record.hrl").

%% API
-export([
    create/1,
    get/1,
    save/1,
    equip/1
]).

%%%===================================================================
%%% API
%%%===================================================================
%% @doc 根据id获取装备信息
get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_equip_sql, Params),
    Row = mysql_db:get(Query),
    build_equip_data(Row, RoleId).

%% @doc 创建角色初始装备
create(RoleId) ->
    Query = ?FILTER_SQL(?update_equip_sql, ?TAIL(#equip{role_id=RoleId})),
    mysql_db:update(Query).

%% @doc 存储装备信息
save(Equip) ->
    Query = ?FILTER_SQL(?update_equip_sql, ?TAIL(Equip)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save equip error:~n~p~n", [Reason])
    end.

equip(RoleId) ->
    #items{all = Items} = item_db:get(RoleId),
    FirstEquip =
    lists:foldl(
    fun(#item{item_id = ItemId, id = Id}, Equip) ->
        Cfg = item_cfg:get(ItemId),
        case Cfg#item_cfg.sub_type of
            ?ITEM_SUB_TYPE_WEAPON ->
                Equip#equip{weapon = Id};
            ?ITEM_SUB_TYPE_HELM ->
                Equip#equip{helm=Id};
            ?ITEM_SUB_TYPE_ARMOR ->
                Equip#equip{armor=Id};
            ?ITEM_SUB_TYPE_BOOTS ->
                Equip#equip{boots=Id};
            ?ITEM_SUB_TYPE_RING ->
                Equip#equip{ring=Id};
            ?ITEM_SUB_TYPE_NECKLACE ->
                 Equip#equip{necklace=Id}
        end
    end, #equip{role_id = RoleId}, Items
    ),
    save(FirstEquip).

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_equip_data(Row, Id) ->
    case Row of
        null ->
            #equip{role_id= util:to_list(Id)};
        _ ->
            [_RoleId, _Weapon, _Helm, _Armor, _Boots, _Ring, _Necklace, _FashionableDress] = Row,
            #equip{
                role_id = util:to_list(_RoleId),                             %% 角色编号
                weapon = _Weapon,                               %% 武器
                helm = _Helm,                                 %% 头盔
                armor = _Armor,                                %% 盔甲
                boots = _Boots,                                %% 靴子
                ring = _Ring,                                 %% 戒指
                necklace = _Necklace,                             %% 项链
                fashionable_dress = _FashionableDress                     %% 时装
            }
    end.
