%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(daily_quest_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
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

%% @doc 初始化任务数据
create(_) ->
    ok.

%% @doc 获取信息
get(RoleId) ->
    Template = <<"select * from daily_quests where role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_quest_data(Row).

%% @doc 存储单个任务
save(DailyQuest) ->
    Query = ?FILTER_SQL(?update_daily_quest_sql, ?TAIL(DailyQuest)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save daily_quest error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_quest_data(Row) ->
    list_to_tuple([quest|Row]).

