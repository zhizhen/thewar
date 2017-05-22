%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(spirit_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([
        create/1,
        get/1,
        save/1,
        add/1,
        get_max_id/0
]).

%%%===================================================================
%%% API
%%%===================================================================
%% @doc 初始化玩家神格相关的数据
create(RoleId) ->
    InitNpcs = (1 bsl 0),
    update(#spirit_npc{role_id=RoleId, npcs=InitNpcs}),
    SpiritSlots = init_spirit_slot(RoleId),
    [update(X) || X <- SpiritSlots].

%% @doc 从数据库加载玩家所有神格和装备槽数据
get(RoleId) ->
    Template1 = <<"SELECT * FROM spirits WHERE role_id=~p and state != ~p">>,
    Params1 = [RoleId, ?SPIRIT_NOT_AVAILABLE],
    Query1 = ?FILTER_SQL(Template1, Params1),
    Row1 = mysql_db:select(Query1),
    Spirits = build_spirit_data(Row1),

    Template2 = <<"SELECT * FROM spirit_slots WHERE role_id=~p">>,
    Params2 = [RoleId],
    Query2 = ?FILTER_SQL(Template2, Params2),
    Row2 = mysql_db:select(Query2),
    SpiritSlots = build_spirit_slot_data(Row2),

    Template3 = <<"SELECT * FROM spirit_npcs WHERE role_id=~p">>,
    Params4 = [RoleId],
    Query4 = ?FILTER_SQL(Template3, Params4),
    Row4 = mysql_db:get(Query4),
    SpiritNpc = build_spirit_npc_data(Row4, RoleId),

    #spiritinfo{spirits=Spirits, spiritslots=SpiritSlots, spiritnpc=SpiritNpc}.

%% @doc 存储玩家神格相关的数据
save(SpiritInfo) ->
    #spiritinfo{spirits=Spirits, spiritslots=SpiritSlots, spiritnpc=SpiritNpc}=SpiritInfo,
    [update(X) || X <- Spirits],
    [update(X) || X <- SpiritSlots],
    update(SpiritNpc).

%% @doc 增加神格数据
add(NewSpirit) ->
    update(NewSpirit).

%% @doc 获取最大id
get_max_id() ->
    Query = <<"SELECT MAX(CAST(id AS SIGNED)) FROM spirits">>,
    [MaxId] = mysql_db:get(Query),
    MaxId.

%% --------------------------------------------------------------------------
%% @doc 存储单个装备槽信息
update(#spirit{}=Spirit) ->
    Query = ?FILTER_SQL(?update_spirit_sql, ?TAIL(Spirit)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save spirit error:~n~p~n", [Reason])
    end;

%% @doc 存储单个装备槽信息
update(#spirit_slot{}=SpiritSlot) ->
    Query = ?FILTER_SQL(?update_spirit_slot_sql, ?TAIL(SpiritSlot)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save spirit slot error:~n~p~n", [Reason])
    end;

%% @doc 存储神格商店信息
update(#spirit_npc{}=SpiritNpc) ->
    Query = ?FILTER_SQL(?update_spirit_npc_sql, ?TAIL(SpiritNpc)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save spirit info error:~n~p~n", [Reason])
    end.
 
%%%===================================================================
%%% Internal functions
%%%===================================================================
%% 初始化8个装备槽
init_spirit_slot(RoleId) ->
    Ids = spirit_slot_cfg:get_all(),
    F = fun(SlotId) ->
            #spirit_slot{
                role_id = RoleId,
                slot_id = SlotId,
                id = "0",
                state = 0
            }
    end,
    [F(X)|| X <- Ids].

build_spirit_data(Row) ->
    [{spirit, util:to_list(Id), RoleId, SpiritId, Exp, SlotId, State} || [Id, RoleId, SpiritId, Exp, SlotId, State] <- Row].

build_spirit_slot_data(Row) ->
    [{spirit_slot, RoleId, util:to_integer(SlotId), util:to_list(Id), State} || [RoleId, SlotId, Id, State] <- Row].

build_spirit_npc_data(null, RoleId) ->
    #spirit_npc{role_id=RoleId, npcs=1};
build_spirit_npc_data([RoleId, Npcs], _) ->
    #spirit_npc{role_id=RoleId, npcs=Npcs}.