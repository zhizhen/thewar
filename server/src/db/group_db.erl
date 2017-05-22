%% Copyright
-module(group_db).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").

% %% API
% -export([all/0, load_to_ets/2, load_to_ets/3, all_state/1, clean/1, get_max_group_id/0, get/1, update/1]).
% -export([all_member/1, get_member/1, get_role_group/1, get_role_state/1, update_member/1, incr/4,
%     update_to_normal_state/3, update_to_request_state/3, update_element/4, update_state/1, delete_state/2, all_role_request/1]).
% -export([get_pool/1, save_pool/1]).
% -export([get_meeting/1, save_meeting/1, meeting_add_value/4]).
% -export([decode/1, encode/1]).

% % group
% all() ->
%     Sql = <<"select * from groups order by exp desc">>,
%     case mysql_db:select(Sql) of
%         [] -> [];
%         Rows ->
%             [ build_data(Row) || Row <- Rows]
%     end.

% load_to_ets(Ets, Id) ->
%     Template = <<"select role_id, role_name, group_state.group_id, group_state.state, level, post, job, value_today, value, value_time, allvalue,  group_state.time, fight  from group_state left join group_member using(role_id) left join roles  using(role_id) where group_state.group_id=~p">>,
%     Params = [Id],
%     Query = ?FILTER_SQL(Template, Params),
%     lists:foreach(load_fun(Ets), mysql_db:select(Query)).

% load_to_ets(Ets, Id, RoleId) ->
%     Template = <<" select role_id, role_name, group_state.group_id, group_state.state, level, post, job, value_today, value, value_time, allvalue, group_state.time, fight  from group_state left join group_member using(role_id) left join roles  using(role_id) where group_state.group_id=~p and role_id=~p">>,
%     Params = [RoleId, Id],
%     Query = ?FILTER_SQL(Template, Params),
%     lists:foreach(load_fun(Ets), mysql_db:select(Query)).

% %% private fun
% load_fun(Ets) ->
%     fun(R) ->
%         D = erlang:list_to_tuple([group_member_ets|R]),
%         #group_member_ets{} = D,
%         ets:insert(Ets, D)
%     end.


% all_state(Id) ->
%     Template = <<"select * from group_state where group_id=~p">>,
%     Params = [Id],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:select(Query) of
%         [] -> [];
%         Rows ->
%             [ build_state(Row)||Row <- Rows]
%     end.

% all_role_request(RoleId) ->
%     Template = <<"select group_id from group_state where role_id=~p and state=~p">>,
%     Params = [RoleId, ?G_REQUEST],
%     Query = ?FILTER_SQL(Template, Params),
%     [Id || [Id] <- mysql_db:select(Query)].

% clean(GroupId) ->
%     Template1 = <<"delete from groups where id=~p">>,
%     Params1 = [GroupId],
%     Query1 = ?FILTER_SQL(Template1, Params1),
%     mysql_db:delete(Query1),
%     Template2 = <<"delete from group_state where group_id=~p">>,
%     Params2 = [GroupId],
%     Query2 = ?FILTER_SQL(Template2, Params2),
%     mysql_db:delete(Query2).

% get_max_group_id() ->
%     Sql = <<"SELECT MAX(CAST(id AS SIGNED)) FROM groups">>,
%     [Id] = mysql_db:get(Sql),
%     Id.

% get(GroupID) ->
%     Template = <<"select * from groups where id=~p">>,
%     Params = [GroupID],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:select(Query) of
%         [] -> [];
%         [Row] -> build_data(Row)
%     end.

% update(#groups{}=R) ->
%     [_|L] = erlang:tuple_to_list(R),
%     Sql = ?FILTER_SQL(?update_groups_sql, L),
%     mysql_db:update(Sql).

% %%%===================================================================
% %%% group member
% %%%===================================================================


% % group member
% all_member(GroupId) ->
%     Template = <<"select * from group_member where group_id=~p">>,
%     Params = [GroupId],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:select(Query) of
%         [] -> [];
%         Rows ->
%             [build_member(Row) || Row <- Rows]
%     end.

% get_member(RoleId) ->
%     Template = <<"select * from group_member where role_id=~p">>,
%     Params = [RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:select(Query) of
%         [] -> #group_member{role_id=RoleId, attr_list=[]};
%         [Row] -> build_member(Row)
%     end.

% % member_incr(100001, group_member, "value", 1)
% incr(RoleId, Table1, Name, Value) ->
%     Elem = util:to_binary(Name),
%     Table = util:to_binary(Table1),
%     Template = [<<"update ">>,  Table, <<" set ">>, Elem, <<"=">>, Elem, <<"+">>, <<"~p where role_id=~p">>],
%     Params = [Value, RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:update(Query).

% get_role_group(RoleId) ->
%     Template = <<"select * from group_id from group_member where role_id=~p and group_id != 0">>,
%     Params = [RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:select(Query).

% get_role_state(RoleId) ->
%     Template = <<"select * from group_state where role_id=~p and state=~p">>,
%     Params = [RoleId, ?G_NORMAL],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:get(Query) of
%         null -> #group_state{role_id=RoleId, group_id=0};
%         Row -> build_state(Row)
%     end.

% update_member(#group_member{} = Member) ->
%     NewMember = Member#group_member{group_id = util:to_list(Member#group_member.group_id), attr_list=encode(Member#group_member.attr_list)},
%     Query = ?FILTER_SQL(?update_group_member_sql, ?TAIL(NewMember)),
%     mysql_db:update(Query).


% %%%===================================================================
% %%% state
% %%%===================================================================

% delete_state(RoleId, GroupId) ->
%     Template = <<"delete from group_state where role_id=~p and group_id=~p">>,
%     Params = [RoleId, GroupId],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:delete(Query).

% update_state(#group_state{}=R) ->
%     case R#group_state.role_id ==0 orelse R#group_state.group_id == 0 of
%         true -> throw({wrong, ?MODULE, ?LINE});
%         _ -> ok
%     end,
%     Query = ?FILTER_SQL(?update_group_state_sql, ?TAIL(R)),
%     mysql_db:update(Query).

% update_to_normal_state(RoleId, GId, Time) ->
%     Params = [RoleId, GId, ?G_NORMAL, ?POST_MEMBER, Time],
%     Query = ?FILTER_SQL(?update_group_state_sql, Params),
%     mysql_db:update(Query).

% update_to_request_state(RoleId, GId, Time) ->
%     Params = [RoleId, GId, ?G_REQUEST, ?POST_MEMBER, Time],
%     Query = ?FILTER_SQL(?update_group_state_sql, Params),
%     mysql_db:update(Query).

% update_element(RoleId, GId, Elem, Value) ->
%     Sql = [<<"update group_state set ">>, util:to_binary(Elem), <<"=">>, util:to_binary(Value), <<" where role_id=~p and group_id=~p">>],
%     Sql2 = erlang:list_to_binary(Sql),
%     Query = ?FILTER_SQL(Sql2, [RoleId, GId]),
%     ?DEBUG_MSG("~p ~n", [Query]),
%     mysql_db:update(Query).


% %%%===================================================================
% %%% group pool
% %%%===================================================================
% %% pool
% get_pool(RoleId) ->
%     Template = <<"select * from group_pool where role_id=~p">>,
%     Params = [RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     case mysql_db:get(Query) of
%         null -> #group_pool{role_id=RoleId};
%         [RoleId2, PoolId, Num] ->
%               #group_pool{role_id=RoleId2, pool_id=PoolId, num=Num}
%     end.

% save_pool(#group_pool{}=R) ->
%     Query = ?FILTER_SQL(?update_group_pool_sql, ?TAIL(R)),
%     mysql_db:update(Query).

% %%%===================================================================
% %%% group meeting
% %%%===================================================================
% get_meeting(RoleId) ->
%     Template = <<"select * from group_role_meeting where role_id=~p">>,
%     Params = [RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     T = ?NOW,
%     case mysql_db:get(Query) of
%         null -> #group_role_meeting{role_id=RoleId, times=T};
%         [RoleId2, Gift, Time] ->
%             case util:is_today(Time) of
%                 false ->
%                     #group_role_meeting{role_id=RoleId2, times=T};
%                 true ->
%                     #group_role_meeting{role_id=RoleId2, gift=Gift, times=Time}
%             end
%     end.

% save_meeting(#group_role_meeting{}=R) ->
%     Query = ?FILTER_SQL(?update_group_role_meeting_sql, ?TAIL(R)),
%     mysql_db:update(Query).

% meeting_add_value(Value, Time, Limit, RoleId) ->
%     Template = <<"update group_role_meeting meet, group_member member set meet.gift = meet.gift+1, meet.times=~p, member.value=member.value+~p, member.value_time=~p where meet.gift < ~p and meet.role_id=~p and meet.role_id=member.role_id">>,
%     Params = [Time, Value, Time, Limit, RoleId],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:update(Query).


% %%%===================================================================
% %%% common
% %%%===================================================================


% build_data(L) ->
%     #groups{} = erlang:list_to_tuple([groups|L]).

% %% use kv
% build_member(L) ->
%     R = erlang:list_to_tuple([group_member|L]),
%     AttrList = decode(R#group_member.attr_list),
%     ValueTime = R#group_member.value_time,
%     case util:is_today(ValueTime) of
%         true ->
%             R#group_member{attr_list=AttrList};
%         false ->
%             R#group_member{attr_list=AttrList, value_today=0, value_count=0}
%     end.

% build_state(L) ->
%     #group_state{} = erlang:list_to_tuple([group_state|L]).

% split_kv([]) -> "";
% split_kv(Str) ->
%     [K, V] = string:tokens(Str, ","),
%     #p_kv{k=util:to_integer(K), v=util:to_integer(V)}.

% concat_kv(#p_kv{k=K, v=V}) ->
%     lists:concat([util:to_list(K), ",", util:to_list(V)]).

% build_Kv([]) -> [];
% build_Kv(B) ->
%     S = util:to_list(B),
%     [ split_kv(I) || I <- string:tokens(S, "-")].

% serilize_kv(L) ->
%     L2 = [concat_kv(I) || I <- L],
%     string:join(L2, "-").

% decode(null) -> [];
% decode(A) -> build_Kv(A).
% encode(A) -> serilize_kv(A).

