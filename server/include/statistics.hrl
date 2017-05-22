%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
%% Logging mechanism

-record(statistics_cache, {pool = []}).
-record(coin_cost,{
    item_id = 0,
    num = 0,
    desc = ""
    }).

-define(GET, 1).
-define(USED, 0).
-define(CONSUME, 1).
-define(RECHARGE, 0).

-define(STATISTIC_CONSUME_COIN, {coin, week,["account_id", "role_id", "type", "coin", "info", "item_id", "num"]}).
-define(STATISTIC_DAU, {user_dau, month, ["account_id", "role_id"]}).
-define(STATISTIC_SPIRIT, {spirit, week, ["account_id", "role_id", "spirit_id", "type"]}).
-define(STATISTIC_ITEM, {item, week, ["role_id", "item_id", "item_tem_id", "num", "type"]}).
-define(STATISTIC_MALL, {mall, week, ["role_id", "item_tem_id", "num"]}).
-define(STATISTIC_ONLINE, {log_online, one, ["online"]}).
-define(STATISTIC_ALL_ITEMS, [?STATISTIC_CONSUME_COIN, ?STATISTIC_DAU, ?STATISTIC_SPIRIT, ?STATISTIC_ITEM, ?STATISTIC_MALL, ?STATISTIC_ONLINE]).

-define(CONSUMPTION_MSG(AccountId, RoleId, Coin, ItemConsum),
    statistics_srv:write_log(?STATISTIC_CONSUME_COIN, [AccountId, RoleId, ?CONSUME, Coin, ItemConsum#coin_cost.desc, ItemConsum#coin_cost.item_id, ItemConsum#coin_cost.num])).

-define(DAU_MSG(AccountId, RoleId),
    statistics_srv:write_log(?STATISTIC_DAU, [AccountId, RoleId])).

-define(SPIRIT_MSG(AccountId, RoleId, SpiritId, Type),
    statistics_srv:write_log(?STATISTIC_SPIRIT, [AccountId, RoleId, SpiritId, Type])).

-define(ITEM_MSG(RoleId, ItemId, ItemTemId, Num, Type),
    statistics_srv:write_log(?STATISTIC_ITEM, [RoleId, ItemId, ItemTemId, Num, Type])).

-define(MALL_MSG(RoleId, ItemTemId, Num),
    statistics_srv:write_log(?STATISTIC_MALL, [RoleId, ItemTemId, Num])).

-define(ONLINE_DATA_MSG(OnlineNum),
    statistics_srv:write_log(?STATISTIC_ONLINE, [OnlineNum])).

-define(RECHARGE_MSG(AccountId, RoleId, Coin, Desc),
    statistics_srv:write_log(?STATISTIC_CONSUME_COIN, [AccountId, RoleId, ?RECHARGE, Coin, Desc, "", ""])).


