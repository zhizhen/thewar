%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_tree_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([
        get/1,
        save/1,
        clean/1
]).

%%%===================================================================
%%% API
%%%===================================================================
%% @doc 神树活动相关数据
get(GroupId) -> 
    Template = <<"select * from group_trees where group_id = ~p">>,
    Params = [GroupId],
    Query = ?FILTER_SQL(Template, Params),
    Tree = case mysql_db:select(Query) of
            [] ->
                #group_tree_info{
                        group_id=GroupId,
                        air = 0,
                        members = [],
                        logs = []
                    };
            [Row] ->
                Complete = Row++[?NOW],
                erlang:list_to_tuple([group_tree_info|Complete])
        end,

    Members = build_members(Tree#group_tree_info.members),
    Logs = build_logs(Tree#group_tree_info.logs),
    Tree#group_tree_info{members=Members, logs=Logs}.

save(#group_tree_info{}=GroupTree) ->
    NewGroupTree = GroupTree#group_tree_info{
        members = serilize_members(GroupTree#group_tree_info.members),
        logs = serilize_logs(GroupTree#group_tree_info.logs)
    },
    Params = [NewGroupTree#group_tree_info.group_id, NewGroupTree#group_tree_info.air, NewGroupTree#group_tree_info.members, NewGroupTree#group_tree_info.logs],
    Query = ?FILTER_SQL(?update_group_tree_sql, Params),
    mysql_db:update(Query).

clean(GroupId) ->
    Template = <<"delete from group_trees where group_id=~p">>,
    Params = [GroupId],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:delete(Query).

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_members(Members) ->
    List = string:tokens(util:to_list(Members), ","),
    List1 = [list_to_tuple(string:tokens(util:to_list(X), "-")) || X <- List],
    [{group_tree_member, RoleId, util:to_integer(Devote), util:to_integer(Rank), util:to_integer(Last)}|| {RoleId, Devote, Rank, Last} <- List1].

serilize_members(Members) ->
    List = [lists:concat([util:to_list(RoleId), "-", util:to_list(Devote), "-", util:to_list(LastRank), "-", util:to_list(Last)]) || {group_tree_member, RoleId, Devote, LastRank, Last} <- Members],
    string:join(List, ",").

build_logs(Waters) ->
    WaterList = string:tokens(util:to_list(Waters), ","),
    List1 = [list_to_tuple(string:tokens(util:to_list(X), "-")) || X <- WaterList],
    [{group_tree_log, RoleId, util:to_integer(Time), util:to_integer(Level), util:to_integer(Type)}|| {RoleId, Time, Level, Type} <- List1].

serilize_logs(Waters) ->
    WaterList = [lists:concat([util:to_list(RoleId), "-", util:to_list(Time), "-", util:to_list(Level), "-", util:to_list(Type)]) || {group_tree_log, RoleId, Time, Level, Type} <- Waters],
    string:join(WaterList, ",").
