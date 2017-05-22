%% Copyright
-module(act_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("logger.hrl").
-include("common.hrl").
-include("cfg_record.hrl").

%% API
-export([fetch_server_activitys/0, update_single_act/1]).
-export([gets/1, get/2, save/1]).
% -export([gets/0]).

-define(MANAGER, 0).

% 取出所有未关闭的活动
fetch_server_activitys() ->
    Template = <<"SELECT * FROM global_activity WHERE open_state != ~p">>,
    Params = [?ACTIVITY_CLOSED],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_activity_datas(Row).

gets(RoleId) ->
    ActIds = gen_act:all_available(),
    get(RoleId, ActIds).

get(RoleId, ActId) when is_integer(ActId) ->
    Template = <<"SELECT * FROM activity WHERE role_id=~p AND act_id=~p">>,
    Params = [RoleId, ActId],
    Query = ?FILTER_SQL(Template, Params),
    Row = 
        case mysql_db:select(Query) of
            [] -> [];
            [H|_] -> H
        end,

    build_data(RoleId, ActId, Row);

get(RoleId, ActIds) ->
    Template = <<"SELECT * FROM activity WHERE role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),

    Acts = mysql_db:select(Query),

    F = fun([_, ActId, _]) -> lists:member(ActId, ActIds);
           (_) -> false
        end,

    Acts2 = lists:filter(F, Acts),
    Acts3 = lists:map(
        fun([_, ActId, _]=Row) ->
            build_data(RoleId, ActId, Row)
        end, Acts2),

    #acts{all=[Data ||{ok, Data} <- Acts3]}.

save(#activity{role_id=RoleId, act_id=ActId, act_data=ActData}) ->
    Query = ?FILTER_SQL(?update_activity_sql, [util:to_list(RoleId), ActId, util:to_list(ActData)]),
    mysql_db:update(Query).


build_data(RoleId, ActId, []) ->
    gen_act:build(RoleId, ActId, []);
build_data(RoleId, ActId, [_, _, ActData]) ->
    gen_act:build(RoleId, ActId, ActData).


update_single_act(#global_activity{} = Act) ->
    Query = ?FILTER_SQL(?update_global_activity_sql, ?TAIL(Act)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save sigle act error:~n~p~n", [Reason])
    end.


build_activity_datas([]) -> [];
build_activity_datas(Row) -> 
    [erlang:list_to_tuple([global_activity|L]) || L <- Row].
