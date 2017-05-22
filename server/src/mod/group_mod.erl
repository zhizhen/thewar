%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-31 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_mod).
-include("common.hrl").

%% API
-export([srv_name/1, ets_name/1, pool_name/1, boss_name/1]).
-export([intime/2, post_name/1]).

%%%===================================================================
%%% API
%%%===================================================================
srv_name(Id) ->
    erlang:list_to_atom("group_srv_" ++ util:to_list(Id)).
ets_name(Id) ->
    erlang:list_to_atom("ets_group_srv_" ++ util:to_list(Id)).
pool_name(Id) ->
    erlang:list_to_atom("group_pool_" ++ util:to_list(Id)).
boss_name(Id) ->
    erlang:list_to_atom("group_boss_name_" ++ util:to_list(Id)).

intime(Start, End) ->
    {H, M, _} = erlang:time(),
    [H1, M1] = [util:to_integer(I) || I <- string:tokens(Start, ":")],
    [H2, M2] = [util:to_integer(I) || I <- string:tokens(End, ":")],
    H1 < H orelse (H1 == H andalso M1 =< M) andalso
    H2 > H orelse (H2 == H andalso M2 > M).

post_name(?POST_MANAGER1) -> <<"帮主">>;
post_name(?POST_MANAGER2) -> <<"副帮主">>;
post_name(?POST_MANAGER3) -> <<"干部">>;
post_name(?POST_MEMBER) -> <<"成员">>.


%%%===================================================================
%%% Internal functions
%%%===================================================================
