-module(arena_db).

-include("logger.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API

-export([get/1, create/1, save/1]).

get(RoldId) ->
    Template = <<"SELECT * FROM arenas WHERE role_id=~p">>,
    Params = [RoldId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_arena_data(Row).

create(RoleId) ->
    Template = <<"INSERT INTO arenas (role_id, last_pk_time) VALUES (~p, ~p)">>,
    Params = [RoleId, 0],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

save(Arena) ->
    NewArena = Arena#arena{pk_logs=serilize_arena_logs([], Arena#arena.pk_logs)},
    Query = ?FILTER_SQL(?update_arena_sql, ?TAIL(NewArena)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save arena error:~n~p~n", [Reason])
    end.

%===================================================================
% Internal functions
%===================================================================
build_arena_data([RoleId, LastPkTime, undefined]) ->
    build_arena_data([RoleId, LastPkTime, ""]);
build_arena_data([RoleId, LastPkTime, PkLogs]) ->
    Logs = build_arena_logs(PkLogs),
    list_to_tuple([arena, RoleId, LastPkTime, Logs]).

build_arena_logs(PkLogs) ->
    Logs = string:tokens(util:to_list(PkLogs), "-"),

    %% 数据库被注入导致存在角色名为"", tokens不出来名字的情况，后期这个验证可以删
    TLogs = [L ||L <- string:tokens(Logs, ","), erlang:length(L) == 9],

    F = fun([Type, Success, PkTime, MyRank, MyLevel, RivalRoleId, RivalRoleName, RivalRank, RivalJob]) ->
        #arena_log{
            type = util:to_integer(Type),
            success = util:to_integer(Success),
            pk_time = util:to_integer(PkTime),
            my_rank = util:to_integer(MyRank),
            my_level = util:to_integer(MyLevel),
            rival_role_id = util:to_list(RivalRoleId),
            rival_role_name = util:to_list(RivalRoleName),
            rival_rank = util:to_integer(RivalRank),
            rival_job = util:to_integer(RivalJob)
        }
    end,
    [F(X) || X <- TLogs].


serilize_arena_logs(All, []) ->
    string:join(All, "-");
serilize_arena_logs(All, [Log|Logs]) ->
    NewAll = All ++ [string:join([util:to_list(X) || X <- lists:nthtail(1, tuple_to_list(Log))], ",")],
    serilize_arena_logs(NewAll, Logs).
