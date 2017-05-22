%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(quest_db).

-include("logger.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("common.hrl").

%% API
-export([
    get/1,
    update/1,
    save/1,
    create/1
]).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 初始化任务数据
create(RoleId) ->
    Template = <<"INSERT INTO daily_quests (role_id) values (~p)">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

%% @doc 获取信息
get(RoleId) ->
    Template1 = <<"SELECT * FROM quests WHERE role_id=~p">>,
    Params1 = [RoleId],
    Query1 = ?FILTER_SQL(Template1, Params1),
    Row1 = mysql_db:select(Query1),
    AllQuest = build_all_quest_data(Row1),

    Template2 = <<"SELECT * FROM daily_quests WHERE role_id=~p">>,
    Params2 = [RoleId],
    Query2 = ?FILTER_SQL(Template2, Params2),
    Row2 = mysql_db:get(Query2),
    DailyQuest = build_daily_quest_data(Row2),

    #quests{all = AllQuest, daily = DailyQuest}.


%% @doc 存储单个任务
update(#daily_quest{}=DailyQuest) ->
    Query = ?FILTER_SQL(?update_daily_quest_sql, ?TAIL(DailyQuest)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save daily_quest error:~n~p~n", [Reason])
    end;


%% @doc 存储单个任务
update(#quest{}=Quest) ->
    Query = ?FILTER_SQL(?update_quest_sql, ?TAIL(Quest)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save quest error:~n~p~n", [Reason])
    end.

%% @doc 存档
save(#quests{all=Quests,daily=Daily}) ->
    update(Daily),
    [update(Quest) || Quest <- Quests].


%%%===================================================================
%%% Internal functions
%%%===================================================================
build_all_quest_data(null) ->    [];
build_all_quest_data(Row) ->
    [list_to_tuple([quest|X]) || X <- Row].

build_daily_quest_data(Row) ->
    list_to_tuple([daily_quest|Row]).


