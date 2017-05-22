%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_master_srv).

% -include_lib("stdlib/include/ms_transform.hrl").

% -behaviour(gen_server).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").

% %% API
% -export([create/4, join/2, update/1, update/3]).
% -export([act_info/1, act_update/1, act_update/3]).

% -export([get_info/1, get_by_title/1, all_group/0]).
% %% -export([search_by_title/1, search_like_by_title/1]).
% -export([start_link/0]).

% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).

% -define(SERVER, ?MODULE).
% -define(GROUP_MASTER_ETS, group_master_ets).
% -define(GROUP_ACT_ETS, group_act_ets).

% -define(INTERVAL, 5000).

% -record(loc_list, {l}).

% -record(state, {srvs=[], tref}).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% Starts the server
% %%
% %% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
% %% @end
% %%--------------------------------------------------------------------

% % @doc 创建
% create(Title, RoleId, RoleName, GroupMember) ->
%     gen_server:call(?SERVER, {create, Title, RoleId, RoleName, GroupMember}).

% % @doc 帮会信息发生变化
% update(#groups{}=G) ->
%     gen_server:cast(?SERVER, {update, G, self()}).

% update(Id, Pos, V) ->
%     gen_server:call(?SERVER, {update_group, {Id, Pos, V}}).

% all_group() ->
%     ets:tab2list(?GROUP_MASTER_ETS).

% % 已经发出帮派加入申请
% join(RoleId, GroupId) ->
%     gen_server:call(?SERVER, {join, RoleId, GroupId}).

% start_link() ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

% % ets
% get_by_title(Title) ->
%     Pattern = ets:fun2ms(fun(#groups_ets{title=T}=R) when T == Title -> R end),
%     ets:select(?GROUP_MASTER_ETS, Pattern, 1).

% get_info(GroupId) ->
%     case catch ets:lookup(?GROUP_MASTER_ETS, util:to_binary(GroupId)) of
%         [R] -> R;
%         [] -> false;
%         Error ->
%             ?DEBUG_MSG("****************error!!! module: ~p line: ~p error: ~p ~n", [?MODULE, ?LINE, Error])
%     end.

% %% search_by_title(Title) ->
% %%     Pattern = ets:fun2ms(fun(#groups_ets{title=T}=R) when T == Title -> R end),
% %%     case ets:select(?GROUP_MASTER_ETS, Pattern, 1) of
% %%         {[#groups_ets{id=Id, exp=Exp, members=Members}], _} ->
% %%             {Id, Exp, Members};
% %%         _ -> []
% %%     end.
% %%
% %% search_like_by_title(Title) ->
% %%     BTitle = util:to_binary(Title),
% %%     ets:foldl(
% %%         fun(#groups_ets{title=T}=R, Acc) ->
% %%             case binary:match(T, BTitle) of
% %%                 nomatch -> Acc;
% %%                 _ -> [R|Acc]
% %%             end
% %%         end, [], ?GROUP_MASTER_ETS).


% act_update(#group_act_ets{id=Id}=R) ->
%     case catch ets:insert(?GROUP_ACT_ETS, R#group_act_ets{id=util:to_list(Id)}) of
%         {'Exit', _} = R ->
%             ?DEBUG_MSG("module: ~p line:~p error: ~p~n", [?MODULE, ?LINE, R]);
%         _ -> ok
%     end.
    
% act_update(Id2, Pos, V) ->
%     Id = util:to_list(Id2),
%     case catch ets:update_element(?GROUP_ACT_ETS, Id, [{Pos, V}]) of
%         {'Exit', _} = R ->
%             ?DEBUG_MSG("module: ~p line:~p error: ~p~n", [?MODULE, ?LINE, R]);
%         _ -> ok
%     end.

% group_update(Id, Pos, V) ->
%     case catch ets:update_element(?GROUP_MASTER_ETS, util:to_binary(Id), [{Pos, V}]) of
%         {'Exit', _} = R ->
%             ?DEBUG_MSG("module: ~p line:~p error: ~p~n", [?MODULE, ?LINE, R]);
%         _ -> ok
%     end.

% act_info(Id2) ->
%     Id = util:to_list(Id2),
%     case catch ets:lookup(?GROUP_ACT_ETS, Id) of
%         [R] -> R;
%         [] -> false;
%         O ->
%             ?DEBUG_MSG("module: ~p line:~p error: ~p~n", [?MODULE, ?LINE, O])
%     end.

% %%%===================================================================
% %%% gen_server callbacks
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Initializes the server
% %%
% %% @spec init(Args) -> {ok, State} |
% %%                     {ok, State, Timeout} |
% %%                     ignore |
% %%                     {stop, Reason}
% %% @end
% %%--------------------------------------------------------------------
% init([]) ->
%     cache:init(self()),
%     ets:new(?GROUP_MASTER_ETS, [named_table, {keypos, #groups_ets.id}]),
%     ets:new(?GROUP_ACT_ETS, [public, named_table, {keypos, #group_act_ets.id}]),
%     All = group_db:all(),
%     GroupsEts = [ convert(R) || R <- All],
%     GroupsEts2 = rank(GroupsEts),
%     cache:insert_other(?SERVER, #loc_list{l=GroupsEts2}),
%     save(GroupsEts2),

%     {ok, TRef} = timer:send_interval(?INTERVAL, tick),
%     erlang:send_after(1000, self(), {start_child}),
%     {ok, #state{tref=TRef}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling call messages
% %%
% %% @spec handle_call(Request, From, State) ->
% %%                                   {reply, Reply, State} |
% %%                                   {reply, Reply, State, Timeout} |
% %%                                   {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, Reply, State} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_call({create, Title, RoleId, RoleName, GroupMember}, _From, State) ->
%     case get_by_title(Title) of
%         '$end_of_table' ->
%             GroupId = id_srv:gen_group_id(),
%             Now = ?NOW,
%             G = #groups{id=GroupId,
%                 title=Title,
%                 creat_time=Now,
%                 creator_id=RoleId,
%                 creator_name=RoleName,
%                 master_id=RoleId,
%                 master_name=RoleName},
%             group_db:update(G),

%             GState = #group_state{
%                 role_id=RoleId,
%                 group_id=GroupId,
%                 state=?G_NORMAL,
%                 post=?POST_MANAGER1,
%                 time=0
%             },
%             group_db:update_state(GState),
%             group_boss_db:create(GroupId),

%             GroupMember2 = GroupMember#group_member{group_id=GroupId, value=1000, value_today=1000, value_time=Now, allvalue=1000},
%             group_db:update_member(GroupMember2),
%             group_sup:start_child(GroupId),

%             G1 = convert(G),
% %%             ets:insert(?GROUP_MASTER_ETS, G1),

%             #loc_list{l=L} = cache:find_other(?SERVER, loc_list),
%             L2 = rank([G1|L]),
%             cache:insert_other(?SERVER, #loc_list{l=L2}),
%             save(L2),

%             {reply, GroupMember2, State};
%         _ ->
%             {reply, false, State}
%     end;

% handle_call({join, RoleId, GroupId}, _From, State) ->
%     Reply =
%     case group_db:get_role_state(RoleId) of
%         #group_state{group_id=0} ->
%             group_db:update_to_normal_state(RoleId, GroupId, ?NOW),
%             true;
%         #group_state{group_id=Gid} when Gid == GroupId ->
%             keep;
%         _ ->
%             false
%     end,
%     {reply, Reply, State};

% handle_call({update_group, {Id, Pos, V}}, _From, State) ->
%     group_update(Id, Pos, V),
%     Reply = ok,
%     {reply, Reply, State};

% handle_call(_Request, _From, State) ->
%     Reply = ok,
%     {reply, Reply, State}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling cast messages
% %%
% %% @spec handle_cast(Msg, State) -> {noreply, State} |
% %%                                  {noreply, State, Timeout} |
% %%                                  {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_cast({update, R, Pid}, State) ->
%     R1 = convert(R),
%     #loc_list{l=L} = cache:find_other(?SERVER, loc_list),

%     L3 =
%     case lists:keyfind(R1#groups_ets.id, #groups_ets.id, L) of
%         false ->
%             rank([R1|L]);
%         #groups_ets{} ->
%             L2 = lists:keydelete(R1#groups_ets.id, #groups_ets.id, L),
%             rank([R1|L2])
%     end,

%     save(L3),
%     cache:insert_other(?SERVER, #loc_list{l=L3}),

% %%     TT = [ {Id, Exp, TR} || #groups_ets{id=Id, exp=Exp, rank=TR} <- L3],
% %%     ?DEBUG_MSG("ran:~n~p ~n", [lists:sort(fun({_, E1, _}, {_, E2, _}) -> E1 > E2 end, TT)]),

%     #groups_ets{rank=Rank} = lists:keyfind(R1#groups_ets.id, #groups_ets.id, L3),

%     Pid ! {broadcast, {update, Rank}},

%     {noreply, State};

% handle_cast(rank, State) ->
%     #loc_list{l=L} = cache:find_other(?SERVER, loc_list),
%     L2 = rank(L),
%     save(L2),
%     cache:insert_other(?SERVER, #loc_list{l=L2}),
%     {noreply, State};

% handle_cast({srv_start, Pid, Id}, #state{srvs=Srvs}=State) ->
%     {noreply, State#state{srvs=[{Id, Pid}|Srvs]}};
% handle_cast({srv_stop, Id}, #state{srvs=Srvs}=State) ->
%     #loc_list{l=L} = cache:find_other(?SERVER, loc_list),
%     L2 = lists:keydelete(util:to_binary(Id), #groups_ets.id, L),
%     cache:insert_other(?SERVER, #loc_list{l=L2}),
%     ets:delete(?GROUP_MASTER_ETS, util:to_binary(Id)),
%     ets:delete(?GROUP_ACT_ETS, Id),
%     L3 = rank(L2),
%     save(L3),
%     {noreply, State#state{srvs=lists:keydelete(Id, 1, Srvs)}};
% handle_cast(_Msg, State) ->
%     {noreply, State}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling all non call/cast messages
% %%
% %% @spec handle_info(Info, State) -> {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_info(tick, #state{srvs=Srvs}=State) ->
%     Now = ?NOW,
%     [ Pid ! {tick, Now} || {_, Pid} <- Srvs],
%     {noreply, State};
% handle_info({start_child}, State) ->
%     #loc_list{l=L} = cache:find_other(?SERVER, loc_list),
%     [ group_sup:start_child(Id) || #groups_ets{id=Id} <- L ],
%     {noreply, State};
% handle_info(_Info, State) ->
%     {noreply, State}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% This function is called by a gen_server when it is about to
% %% terminate. It should be the opposite of Module:init/1 and do any
% %% necessary cleaning up. When it returns, the gen_server terminates
% %% with Reason. The return value is ignored.
% %%
% %% @spec terminate(Reason, State) -> void()
% %% @end
% %%--------------------------------------------------------------------
% terminate(_Reason, #state{tref=Tref}=_State) ->
%     timer:cancel(Tref),
%     ok.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Convert process state when code is changed
% %%
% %% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
% %% @end
% %%--------------------------------------------------------------------
% code_change(_OldVsn, State, _Extra) ->
%     {ok, State}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% save(L) ->
%     [ets:insert(?GROUP_MASTER_ETS, Data) || Data <- L].

% rank(L) ->
%     L2 = lists:sort(fun(A, B) -> A#groups_ets.exp > B#groups_ets.exp end, L),
%     rank2(L2).

% rank2(L) ->
%     F = fun(#groups_ets{}=G, Index) -> {Index+1, G#groups_ets{rank=Index}} end,
%     lmap(F, L, 1, []).


% lmap(_, [], _, R) -> R;
% lmap(F, [H|T], A, R) ->
%     {A1, H1} = F(H, A),
%     lmap(F, T, A1, [H1|R]).


% convert(#groups{}=G) ->
%     #groups_ets{
%         id = G#groups.id,                                   %% 帮会id
%         title = G#groups.title,                                   %% 名字
%         gold = G#groups.gold,                                 %% 金币
%         exp = G#groups.exp,                                  %% 经验
%         members = G#groups.members,                              %% 人数
%         notice = G#groups.notice,                              %% 公告
%         level = G#groups.level,
%         level_time = G#groups.level_time,                           %% 升级时间
%         creat_time = G#groups.creat_time,                           %% 创建时间
%         creator_id = G#groups.creator_id,                          %% 帮主id
%         creator_name = G#groups.creator_name,                        %% 名字
%         master_id = G#groups.master_id,                           %% 帮主id
%         master_name = G#groups.master_name,                         %% 名字
%         close_time = G#groups.close_time,                            %% 解散时间
%         rank = 0
%     }.
