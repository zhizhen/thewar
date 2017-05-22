-module(daily_db).

% -include("logger.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("common.hrl").

% %% API
% -export([get/1, create/1, save/1, build_new_data/1]).
% -export([get_other/1, save_other/1]).
% -export([get_groups/1]).


% get(Id) ->
%     Params = [Id],
%     Query = ?FILTER_SQL(?select_daily_sql, Params),
%     Row = mysql_db:get(Query),
%     build_daily_data(Id, Row).

% get_groups([]) -> [];
% get_groups(Members) ->
%     Length = erlang:length(Members),
%     Template = "select role_id, scout_b_count from daily where role_id in (~s)",
%     Format = string:join(["~ts"|| _ <- lists:seq(1, Length)], ","),
%     Template1 = io_lib:format(Template, [Format]),
%     Params = [RoleId || #group_member_ets{role_id = RoleId} <- Members],
%     Query = ?FILTER_SQL(util:to_binary(Template1), Params),
%     Row = mysql_db:select(Query),
%     build_scout_data(Row).

% create(Id) ->
%     Template = <<"insert into daily (role_id, today) values (~p, ~p)">>,
%     Params = [Id, "2013-1-1"],
%     Query = ?FILTER_SQL(Template, Params),
%     mysql_db:insert(Query).

% save(Daily) ->
%     NewDaily = build_serialize_data(Daily),
%     Query = ?FILTER_SQL(?update_daily_sql, ?TAIL(NewDaily)),
%     try
%         mysql_db:update(Query)
%     catch
%         throw:Reason ->
%             ?ERROR_MSG("save daily error:~n~p~n", [Reason])
%     end.

% build_daily_data(RoleId, null) -> build_new_data(RoleId);
% build_daily_data(RoleId, Row) ->
%     OriginDaily = erlang:list_to_tuple([daily|Row]),
%     Today1 = build_today(OriginDaily#daily.today),
%     Today2 = erlang:localtime(),
%     {DT, _} = calendar:time_difference(Today1, Today2),
%     case DT == 0 of
%         true ->
%             build_unserialize_data(OriginDaily);
%         false ->
%             build_new_data(RoleId)
%     end.

% %% @doc 对某些字段做序列化
% build_serialize_data(Daily) ->
%     Daily#daily{
%         today = serialize_today(Daily#daily.today),
%         mission = serialize_mission(Daily#daily.mission),
%         interact = serialize_interact(Daily#daily.interact),
%         live_kv = serialize_kv(Daily#daily.live_kv),
%         live_got = serialize_list(Daily#daily.live_got),
%         clifford = serialize_datas(Daily#daily.clifford),
%         mall_buy = serialize_mall(Daily#daily.mall_buy),
%         group_buy = group_db:encode(Daily#daily.group_buy),
%         scout_help_log = serialize_scout(Daily#daily.scout_help_log),
%         scout_me_help_log = serialize_scout(Daily#daily.scout_me_help_log),
%         shop_buy = serialize_mall(Daily#daily.shop_buy),
%         challenge = serialize_challenge_datas(Daily#daily.challenge)
%     }.

% %% @doc 仅对需要做反序列化的字段重新赋值
% build_unserialize_data(Daily) ->
%     Daily#daily{
%         role_id = util:to_binary(Daily#daily.role_id),
%         today = build_today(Daily#daily.today),
%         mission = build_mission(Daily#daily.mission),
%         interact = build_interact(Daily#daily.interact),
%         clifford = build_datas(Daily#daily.clifford),
%         live_kv = build_Kv(Daily#daily.live_kv),
%         live_got = split_list(Daily#daily.live_got),
%         mall_buy = build_mall(Daily#daily.mall_buy),
%         group_buy = group_db:decode(Daily#daily.group_buy),
%         scout_help_log = build_scout(Daily#daily.scout_help_log),
%         scout_me_help_log = build_scout(Daily#daily.scout_me_help_log),
%         shop_buy = build_mall(Daily#daily.shop_buy),
%         challenge = build_challenge_datas(Daily#daily.challenge)
%     }.

% build_new_data(RoleId) ->
%     {Today, _} = erlang:localtime(),
%     #daily{
%         role_id = RoleId,
%         today = {Today, {0,0,0}},
%         chat = 0,
%         mission = [],
%         arena_challenge = 0,
%         arena_add_times = 0,
%         spirit_gold = 0,
%         interact = [],
%         clifford_free = 0,
%         clifford_count = 0,
%         clifford = [],
%         coin2gold1 = 0,
%         coin2gold2 = 0,
%         live_value = 0,
%         live_kv = [],
%         live_got = [],
%         mall_buy = [],
%         vip_gift = 0,
%         group_buy = [],
%         group_tree_water = 0,
%         charm = 0,
%         warrior_collect = 0,
%         scout_count = 0,
%         scout_a_count = 0,
%         scout_h_count = 0,
%         scout_b_count = 0,
%         scout_cicle = 0,
%         scout_step = 1,
%         scout_help_log = [],
%         scout_me_help_log = [],
%         scout_award = 0,
%         power_times = 0,
%         shop_buy = [],
%         charge = 0,
%         sign_general = 1,
%         sign_vip = 1,
%         challenge = [],
%         online_time = 0,
%         challenge_reset_times = 0,
%         challenge_award = 0
%     }.

% build_mission(Mission) ->
%     MissionList = string:tokens(util:to_list(Mission), ","),
%     MissionList2 = [string:tokens(util:to_list(X), "-") || X <- MissionList],
%     [{util:to_integer(MissionId), util:to_integer(Num), util:to_integer(RNum)} 
%         || [MissionId, Num, RNum] <- MissionList2].
% serialize_mission(Mission) ->
%     MissionList = [lists:concat([
%                 util:to_list(MissionId), "-" ,
%                 util:to_list(Num), "-", 
%                 util:to_list(RNum)]) || {MissionId, Num, RNum} <- Mission],
%     string:join(MissionList, ",").

% % interact
% build_interact(B) ->
%     S = binary_to_list(B),
%     [list_to_binary(I) || I <- string:tokens(S, "-")].

% serialize_interact([]) -> "";
% serialize_interact(L) ->
%     L2 = [binary_to_list(I) || I <- L],
%     list_to_binary(string:join(L2, "-")).

% % "1001-1,1002-0,1003-2" -> [{1001,1}, {1002,0}, {1003,2}]
% build_datas(Str) -> 
%     L = string:tokens(util:to_list(Str), ","),
%     L1 = [list_to_tuple(string:tokens(util:to_list(X), "-")) || X <- L],
%     [{util:to_integer(Id), util:to_integer(Data)}|| {Id, Data} <- L1].

% % [{1001,1}, {1002,0}, {1003,2}] -> "1001-1,1002-0,1003-2"
% serialize_datas(List) -> 
%     L = [lists:concat([util:to_list(Id), "-", util:to_list(Data)]) || {Id, Data} <- List],
%     string:join(L, ",").

% % "1001-2-1,1002-1-0,1003-2-2" -> [{1001,2,1}, {1002,1,0}, {1003,2,2}]
% build_challenge_datas(null) -> [];
% build_challenge_datas(Str) ->
%     L = string:tokens(util:to_list(Str), ","),
%     L1 = [list_to_tuple(string:tokens(util:to_list(X), "-")) || X <- L],
%     [{challenge_item, util:to_integer(Id), util:to_integer(Process), util:to_integer(Status)} || {Id, Process, Status} <- L1].

% % [{1001,2,1}, {1002,1,0}, {1003,2,2}] -> "1001-2-1,1002-1-0,1003-2-2"
% serialize_challenge_datas(List) -> 
%     L = [lists:concat([util:to_list(Id), "-", util:to_list(Process), "-", util:to_list(Status)]) || {challenge_item, Id, Process, Status} <- List],
%     string:join(L, ",").

% build_today(Today) ->
%     Time = [util:to_integer(I) || I <- string:tokens(util:to_list(Today), "-")],
%     {list_to_tuple(Time), {0,0,0}}.
% serialize_today({{Y, M, D}, _}) ->
%     Time = [erlang:integer_to_list(I) || I <- [Y, M, D]],
%     string:join(Time, "-").

% % living 每日活跃
% split_kv(Str) ->
%     [K, V, S] = string:tokens(Str, "-"),
%     #p_livekv{id=util:to_integer(K), count=util:to_integer(V), task_status=util:to_integer(S)}.

% concat_kv(#p_livekv{id=K, count=V, task_status=S}) ->
%     lists:concat([util:to_list(K), "-", util:to_list(V), "-", util:to_list(S)]).

% build_Kv(undefined) -> [];
% build_Kv(B) ->
%     S = util:to_list(B),
%     [ split_kv(I) || I <- string:tokens(S, ",")].

% serialize_kv(L) ->
%     L2 = [concat_kv(I) || I <- L],
%     string:join(L2, ",").

% split_list(B) ->
%     S = util:to_list(B),
%     [util:to_integer(I) || I <- string:tokens(S, "-")].

% serialize_list(L) ->
%     L2 = [integer_to_list(I) || I <- L],
%     string:join(L2, "-").

% serialize_mall(L) ->
%     F = fun({K, V}) ->
%         lists:concat([util:to_list(K), "-", util:to_list(V)])
%     end,
%     L2 = [ F(I) || I <- L],
%     string:join(L2, ",").

% build_mall(undefined) -> [];
% build_mall(B) ->
%     S = util:to_list(B),
%     F = fun(I) ->
%         [K, V] = string:tokens(I, "-"),
%         {util:to_integer(K), util:to_integer(V)}
%     end,
%     [ F(I) || I <- string:tokens(S, ",")].

% serialize_scout(undefined) -> [];
% serialize_scout(L) -> string:join([util:to_list(X) || X <- L], ",").

% build_scout(null) -> [];
% build_scout(B) -> string:tokens(util:to_list(B), ",").

% build_scout_data(Row) ->
%     [{X, Y} || [X, Y]<- Row].


% %%%===================================================================
% %%% change other role daily, alias
% %%%===================================================================

% get_other(RoleId) ->
%     ?MODULE:get(RoleId).

% save_other(#daily{}=Daily) ->
%     save(Daily).
