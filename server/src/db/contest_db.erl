%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 1014-10-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(contest_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([
    get/1,
    save/1,
    get_enemy_roles/1
]).

%%%===================================================================
%%% API
%%%===================================================================
% @doc 
get(RoleId) ->
    Params = [RoleId],
    Query = ?FILTER_SQL(?select_contest_sql, Params),
    case mysql_db:get(Query) of
        null -> #contest{role_id=RoleId, enemy = []};
        Row -> build_contest_data(Row)
    end.

% @doc 
save(Contest) ->
    Query = ?FILTER_SQL(?update_contest_sql, ?TAIL(Contest#contest{enemy = serialize_enemy_datas(Contest#contest.enemy)})),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save achievement error:~n~p~n", [Reason])
    end.

% @doc 
get_enemy_roles(Level) ->
    Template = <<"SELECT r.role_id, r.role_name, r.job, r.level, r.fight,  i2.item_id AS armor, i1.item_id AS weapon
        FROM roles AS r, equips AS e, items i1, items i2 
        WHERE r.level >= ~p
        AND r.level <= ~p 
        AND r.state <> 2 
        AND r.role_id = e.role_id 
        AND e.weapon = i1.id 
        AND e.armor = i2.id">>,
    Params = [Level-2, Level+2],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_enemy_datas(Rows).
%%%===================================================================
%%% Internal functions
%%%===================================================================
build_contest_data(Row) -> 
    A = list_to_tuple([contest|Row]),
    L = string:tokens(util:to_list(A#contest.enemy), ","),
    L1 = [list_to_tuple([p_contest_enemy] ++ string:tokens(util:to_list(X), "-")) || X <- L],
    A#contest{enemy = fix_data_type(L1)}.

serialize_enemy_datas(EnemyList) -> 
    F = 
    fun(X) -> 
        [p_contest_enemy|L1] = tuple_to_list(X),
        string:join([util:to_list(A) || A <- L1], "-")
    end,
    L = lists:map(F, EnemyList),
    string:join(L, ",").

build_enemy_datas([]) -> [];
build_enemy_datas(Rows) ->
    L = [list_to_tuple([p_contest_enemy|Row] ++ [?ARENA_PEOPLE, 0]) || Row <- Rows],
    fix_data_type(L).

fix_data_type(EnemyList) ->
    [{p_contest_enemy, util:to_list(Id), Name, util:to_integer(Job),util:to_integer(Lv),
    util:to_integer(Fight),util:to_integer(Armor),util:to_integer(Weapon),
    util:to_integer(Type),util:to_integer(State)} || {p_contest_enemy, Id, Name, Job, Lv, Fight, Armor, Weapon, Type, State} <- EnemyList].
