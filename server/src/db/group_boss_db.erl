%% Copyright
-module(group_boss_db).

-include("table_etc.hrl").
-include("logger.hrl").
-include("common.hrl").

-export([get/1, save/1, create/1, delete/1]).

create(Id) ->
    Template = <<"INSERT INTO group_boss (group_id, start_time) VALUES (~p, ~p)">>,
    Params = [Id, 0],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:insert(Query).

get(Id) ->
    Template = <<"SELECT group_id, info, start_time FROM group_boss WHERE group_id = ~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_group_boss_data(Id, Row).

delete(Id) ->
    Template = <<"DELETE FROM group_boss WHERE group_id = ~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:delete(Query).

save(GroupBoss) ->
    Template = <<"UPDATE group_boss SET info = '~ts', start_time = ~p WHERE group_id = ~p">>,
    Params = [serilize_info(GroupBoss#group_boss.info), GroupBoss#group_boss.start_time, GroupBoss#group_boss.group_id],
    Query = ?FILTER_SQL(Template, Params),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save group boss error:~n~p~n", [Reason])
    end.

build_info(Info) ->
    InfoList = string:tokens(util:to_list(Info), ","),
    Tmp = [string:tokens(util:to_list(X), "-") || X <- InfoList],
    [{util:to_integer(BossId), util:to_integer(Level)} || [BossId, Level] <- Tmp].

serilize_info(Info) ->
    InfoList = [lists:concat([util:to_list(BossId), "-" ,util:to_list(Level)]) || {BossId, Level} <- Info],
    string:join(InfoList, ",").

build_group_boss_data(Id, null) ->
    #group_boss{
        group_id = Id,
        info = [],
        start_time = 0
    };
build_group_boss_data(Id, [GroupId, undefined, StartTime]) ->
    build_group_boss_data(Id, [GroupId, "", StartTime]);
build_group_boss_data(_Id, [GroupId, Info, StartTime]) ->
    #group_boss{
        group_id = GroupId,
        info = build_info(Info),
        start_time = StartTime
    }.