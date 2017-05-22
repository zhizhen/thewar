%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 1014-10-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(achievement_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([
    create/1,
    get/1,
    save/1
]).

%%%===================================================================
%%% API
%%%===================================================================
% @doc 从数据库获取达成的成就信息
get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_achievement_sql, Params),
    Row = mysql_db:get(Query),
    build_achievement_datas(Row).

create(RoleId) -> 
    Template = <<"INSERT INTO achievements (role_id, info) VALUES (~p, '~ts')">>,
    Params = [RoleId, build_achievements()],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:update(Query).

% @doc 更新四象数据库
save(Achievements) ->
    Query = ?FILTER_SQL(?update_achievement_sql, ?TAIL(Achievements#achievement{info = serialize_achievement_datas(Achievements#achievement.info)})),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save achievement error:~n~p~n", [Reason])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_achievements() ->
    All = challenge_cfg:get_all(),
    L = [X || X <- All, fetch_achievement_tasks(X)],
    serialize_datas(L).

fetch_achievement_tasks(TaskID) ->
    Task = challenge_cfg:get(TaskID),
    if Task =/= false andalso Task#challenge_cfg.type =:= 2 ->
        true;
        true -> false
    end.

serialize_datas(List) -> 
    L = [challenge_cfg:get(X) || X <- List],
    L1 = [lists:concat([util:to_list(X#challenge_cfg.task_id), "-", util:to_list(0), "-", util:to_list(0)]) || X <- L],
    string:join(L1, ",").

% "1001-2-1,1002-1-0,1003-2-2" -> [{1001,2,1}, {1002,1,0}, {1003,2,2}]
build_achievement_datas(Row) -> 
    A = list_to_tuple([achievement|Row]),
    L = string:tokens(util:to_list(A#achievement.info), ","),
    L1 = [list_to_tuple(string:tokens(util:to_list(X), "-")) || X <- L],
    A#achievement{info = [{challenge_item, util:to_integer(Id), util:to_integer(Process), util:to_integer(Status)} || {Id, Process, Status} <- L1]}.

% [{1001,2,1}, {1002,1,0}, {1003,2,2}] -> "1001-2-1,1002-1-0,1003-2-2"
serialize_achievement_datas(List) -> 
    L = [lists:concat([util:to_list(Id), "-", util:to_list(Process), "-", util:to_list(Status)]) || {challenge_item, Id, Process, Status} <- List],
    string:join(L, ",").
