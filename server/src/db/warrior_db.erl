-module(warrior_db).
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("logger.hrl").

%% API
-export([get/1, get_one/2, save/1, save_list/1, release_warrior/2]).
-export([get_role/1, save_role/1]).

get(RoleId) ->
    Template = <<"select * from warrior where role_id=~p order by idx">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_record(Rows).

get_one(RoleId, Idx) ->
    Template = <<"select * from warrior where role_id=~p and idx=~p">>,
    Params = [RoleId, Idx],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    case build_record(Rows) of
        [] -> false;
        [R] -> R
    end.

save(Warrior) ->
    NewWarrior = Warrior#warrior{
        attr1 = kv2str(Warrior#warrior.attr1),
        attr2 = kv2str(Warrior#warrior.attr2),
        attr3 = kv2str(Warrior#warrior.attr3),
        attr4 = kv2str(Warrior#warrior.attr4),
        attr5 = kv2str(Warrior#warrior.attr5),
        attr6 = kv2str(Warrior#warrior.attr6)
    },
    Query = ?FILTER_SQL(?update_warrior_sql, ?TAIL(NewWarrior)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save equip error:~n~p~n", [Reason])
    end.

release_warrior(RoleId, Idx) ->
    Sql = <<"update warrior set state=0 where role_id=~p and idx=~p">>,
    mysql_db:update(?FILTER_SQL(Sql, [RoleId, Idx])).

save_list(List) ->
    lists:foreach(fun(#warrior{}=R) -> save(R); (_) -> ok end, List).

build_record(Rows) ->
    F = fun(<<"">>) -> [#kv{}];
        ("") -> [#kv{}];
        (Str) -> str2kv(Str)
    end,

    [begin
        W = erlang:list_to_tuple([warrior|R]),
        [Head1 | Tail1] = F(W#warrior.attr1),
        [Head2 | Tail2] = F(W#warrior.attr2),
        [Head3 | Tail3] = F(W#warrior.attr3),
        [Head4 | Tail4] = F(W#warrior.attr4),
        [Head5 | Tail5] = F(W#warrior.attr5),
        [Head6 | Tail6] = F(W#warrior.attr6),
         
        W#warrior{
        state = case W#warrior.state of
                    1 -> 0;
                    2 -> 0;
                    _ -> W#warrior.state
                end,

        attr1 = [warrior_api:init_slot1(Head1) | Tail1],
        attr2 = [warrior_api:init_slot1(Head2) | Tail2],
        attr3 = [warrior_api:init_slot1(Head3) | Tail3],
        attr4 = [warrior_api:init_slot1(Head4) | Tail4],
        attr5 = [warrior_api:init_slot1(Head5) | Tail5],
        attr6 = [warrior_api:init_slot1(Head6) | Tail6]}
     end || R <- Rows].

%% role_warrior
get_role(RoleId) ->
    Template = <<"select * from role_warrior where role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    case mysql_db:select(Query) of
        [Row] ->
            R = erlang:list_to_tuple([role_warrior|Row]),
            Strength =
            case R#role_warrior.strength of
                <<"">> -> ?STRENGTHEN_INIT;
                undefined -> ?STRENGTHEN_INIT;
                _ -> str2kv(R#role_warrior.strength)
            end,

            Called = init_role_str(R#role_warrior.called, []),
            Rands = init_role_str(R#role_warrior.rands, [0,0,0,0]),
            RandCount = init_role_str(R#role_warrior.rand_counts, [0,0]),
            Wids = lists:filter(fun(I) -> I /= 0 end, init_role_str(R#role_warrior.warrior_id, [])),

            R#role_warrior{warrior_id = Wids, strength=Strength, collects=str2kv(R#role_warrior.collects), called=Called, rands=Rands, rand_counts=RandCount};
        [] ->
            #role_warrior{role_id=RoleId, warrior_id = [], collects=?COLLECT_INIT, called=[], rands=[0,0,0,0], rand_counts=[0,0]}
    end.

init_role_str(Str, Init) ->
    case Str of
        <<"">> -> Init;
        undefined -> Init;
        _ -> [ util:to_integer(I)|| I <- string:tokens(util:to_list(Str), ",")]
    end.


save_role(RoleWarrior) ->

    NewRoleWarrior = RoleWarrior#role_warrior{
        role_id = util:to_list(RoleWarrior#role_warrior.role_id),
        warrior_id = string:join([ util:to_list(I) || I <- RoleWarrior#role_warrior.warrior_id], ","),
        collects = kv2str(RoleWarrior#role_warrior.collects),
        strength = kv2str(RoleWarrior#role_warrior.strength),
        called = string:join([ util:to_list(I) || I <- RoleWarrior#role_warrior.called], ","),
        rands = string:join([ util:to_list(I) || I <- RoleWarrior#role_warrior.rands], ","),
        rand_counts = string:join([ util:to_list(I) || I <- RoleWarrior#role_warrior.rand_counts], ",")
    },

    Query = ?FILTER_SQL(?update_role_warrior_sql, ?TAIL(NewRoleWarrior)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save equip error:~n~p~n", [Reason])
    end.

%% internal
str2kv(B) ->
    S = util:to_list(B),
    [ split_kv(I) || I <- string:tokens(S, "-")].

kv2str([]) -> "";
kv2str(L) ->
    L2 = [cons_kv(I) || I <- L],
    string:join(L2, "-").


%% str2kv1(B) ->
%%     S = util:to_list(B),
%%     [ split_kv(I) || I <- string:tokens(S, "-")].
%%
%% kv2str1(L) ->
%%     L2 = [cons_kv(I) || I <- L],
%%     string:join(L2, "-").

split_kv(Str) ->
    [K, V] = string:tokens(Str, ","),
    #kv{k=util:to_integer(K), v=util:to_integer(V)}.

%% split_kv2(Str) ->
%%     [AttrId, Value, Lock] = string:tokens(Str, ","),
%%     #warrior_cul{id=util:to_integer(AttrId), value = util:to_integer(Value), lock = util:to_integer(Lock)}.


cons_kv(#kv{k=K, v=V}) ->
    lists:concat([util:to_list(K), ",", util:to_list(V)]).

%% cons_kv2( #warrior_cul{id=A, value =B, lock = C}) ->
%%     lists:concat([util:to_list(A), ",", util:to_list(B), ",", util:to_list(C)]).



