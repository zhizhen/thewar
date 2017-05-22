%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(boss_srv).
% -behaviour(gen_server).
% -include("logger.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("table_record.hrl").

% -export([start_link/0, start_link/5, start_link/6]).
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
% -export([start/3, start/4, join/4, leave/3, battle/5, awake/3, get_info/2]).

% -define(SERVER, ?MODULE).

% -define(TICK_CHECK_STATE, 1000).
% -define(TICK_BROADCAST_BOSS_HURT, 1000).
% -define(TICK_AWAKE, 1000).

% %%%===================================================================
% %%% API
% %%%===================================================================

% start(group, GroupId, BossId, Level) ->
%     boss_sup:start_child(group, group_mod:boss_name(GroupId), BossId, Level, group_mod:srv_name(GroupId)).

% start(world, BossId, Level) ->
%     boss_sup:start_child(world, world_boss_api:world_boss_process_name(BossId), BossId, Level, world_boss_srv).

% join(group, GroupId, RoleId, Name) ->
%     Srv = group_mod:boss_name(GroupId),
%     gen_server:cast(Srv, {join, RoleId, Name});
% join(world, BossId, RoleId, Name) ->
%     Srv = world_boss_api:world_boss_process_name(BossId),
%     gen_server:cast(Srv, {join, RoleId, Name}).

% leave(group, GroupId, RoleId) ->
%     Srv = group_mod:boss_name(GroupId),
%     gen_server:cast(Srv, {leave, RoleId});
% leave(world, BossId, RoleId) ->
%     Srv = world_boss_api:world_boss_process_name(BossId),
%     gen_server:cast(Srv, {leave, RoleId}).

% battle(group, GroupId, RoleId, RoleHP, Hurt) ->
%     Srv = group_mod:boss_name(GroupId),
%     gen_server:cast(Srv, {battle, RoleId, RoleHP, Hurt});
% battle(world, BossId, RoleId, RoleHP, Hurt) ->
%     Srv = world_boss_api:world_boss_process_name(BossId),
%     gen_server:cast(Srv, {battle, RoleId, RoleHP, Hurt}).

% awake(group, GroupId, RoleId) ->
%     Srv = group_mod:boss_name(GroupId),
%     gen_server:call(Srv, {awake, RoleId});
% awake(world, BossId, RoleId) ->
%     Srv = world_boss_api:world_boss_process_name(BossId),
%     gen_server:call(Srv, {awake, RoleId}).

% get_info(group, GroupId) ->
%     Srv = group_mod:boss_name(GroupId),
%     gen_server:call(Srv, {get_info});
% get_info(world, BossId) ->
%     Srv = world_boss_api:world_boss_process_name(BossId),
%     gen_server:call(Srv, {get_info}).


% %%--------------------------------------------------------------------
% %% @doc
% %% Starts the server
% %%
% %% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
% %% @end
% %%--------------------------------------------------------------------

% start_link() ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

% start_link(Type, PidName, GroupId, BossId, Level, Master) ->
%     gen_server:start_link({local, PidName}, ?MODULE, [Type, PidName, GroupId, BossId, Level, Master], []).

% start_link(Type, PidName, BossId, Level, Master) ->
%     gen_server:start_link({local, PidName}, ?MODULE, [Type, PidName, BossId, Level, Master], []).

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
% init([Type, PidName, BossId, Level, Master]) ->
%     cache:init(PidName),
%     Cfg = boss_cfg:get({BossId, Level}),
%     Info = #boss_info{
%         type = Type,
%         master = Master,
%         members = [],
%         state = ?BOSS_WAIT_START,
%         start_time = util:unixtime(),
%         kill_role_id = "",
%         boss_id = BossId,
%         boss_level = Level,
%         boss_hurt = 0,
%         pos_x = Cfg#boss_cfg.pos_x,
%         pos_y = Cfg#boss_cfg.pos_y
%     },

%     cache:add(Info),

%     erlang:send_after(?TICK_CHECK_STATE, self(), tick_check_state),
%     erlang:send_after(?TICK_BROADCAST_BOSS_HURT, self(), tick_broadcast_boss_hurt),
%     erlang:send_after(?TICK_AWAKE, self(), tick_awake),

%     erlang:send_after(1000, self(), tick_boss_action),                                 %% AI计算boss动作，刚开始等个10秒，之后的tick时间要动态计算

%     erlang:send_after(1000, self(), {start_scene}),

%     {ok, null}.

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
% handle_call({get_info}, _From, State) ->
%     Reply = cache:find(boss_info),
%     {reply, Reply, State};

% handle_call({awake, RoleId}, _From, State) ->
%     Info = cache:find(boss_info),
%     case lists:keyfind(RoleId, #boss_member.role_id, Info#boss_info.members) of
%         false -> {reply, false, State};
%         Member ->
%             case Member#boss_member.life /= ?BOSS_ME_DEAD of
%                 true -> {reply, false, State};
%                 false ->
%                     NewMember = Member#boss_member{dead_time=0},
%                     NewInfo = Info#boss_info{members = lists:keyreplace(RoleId, #boss_member.role_id, Info#boss_info.members, NewMember)},
%                     cache:update(NewInfo),
%                     {reply, ok, State}
%             end
%     end;

% handle_call({stop, Reason}, _From, State) ->
%     {stop, Reason, ok, State};

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

% %% 添加用户
% handle_cast({join, RoleId, Name}, State) ->
%     Info = cache:find(boss_info),
%     NewInfo = case lists:keyfind(RoleId, #boss_member.role_id, Info#boss_info.members) of
%         false ->
%             NewMember = #boss_member{
%                     role_id = RoleId,
%                     role_name = Name,
%                     hurt = 0,
%                     dead_time=0,
%                     life=?BOSS_ME_LIVE,
%                     state = ?BOSS_ME_IN
%             },
%             Info#boss_info{members=Info#boss_info.members++[NewMember]};
%         Member ->
%             Info#boss_info{members=lists:keyreplace(RoleId, #boss_member.role_id, Info#boss_info.members, Member#boss_member{state=?BOSS_ME_IN})}
%     end,
%     cache:update(NewInfo),
%     {noreply, State};

% %% 用户离开, 但不删除记录
% handle_cast({leave, RoleId}, State) ->
%     member_leave(RoleId),
%     {noreply, State};

% %% 客户端发来的伤害值
% handle_cast({battle, RoleId, RoleHP, Hurt}, State) ->
%     F = fun() ->

%         Info = cache:find(boss_info),
%         case Info#boss_info.state == ?BOSS_FIGHT of
%             false -> throw({return, {noreply, State}});
%             true -> ok
%         end,
%         case lists:keyfind(RoleId, #boss_member.role_id, Info#boss_info.members) of
%             false -> false;
%             Member ->
%                 case Member#boss_member.life == ?BOSS_ME_DEAD of
%                     true -> throw({return, {noreply, State}});
%                     false -> ok
%                 end,
%                 FinalHurt = Member#boss_member.hurt+Hurt,
%                 {FinalLife, FinalDeadTime} = case RoleHP > 0 of
%                     true -> {?BOSS_ME_LIVE, Member#boss_member.dead_time};
%                     false -> {?BOSS_ME_DEAD, util:unixtime()}
%                 end,

%                 NewMember = Member#boss_member{hurt=FinalHurt, life=FinalLife, dead_time=FinalDeadTime, hp=RoleHP},
%                 NewInfo = Info#boss_info{
%                     members = lists:keyreplace(RoleId, #boss_member.role_id, Info#boss_info.members, NewMember),
%                     boss_hurt = Info#boss_info.boss_hurt + Hurt
%                 },

%                 Cfg = boss_cfg:get({Info#boss_info.boss_id, Info#boss_info.boss_level}),
%                 NewInfo2 = case NewInfo#boss_info.boss_hurt >= Cfg#boss_cfg.max_hp of
%                     false -> NewInfo;
%                     true -> NewInfo#boss_info{kill_role_id=RoleId, kill_role_name=Member#boss_member.role_name}
%                 end,

%                 cache:update(NewInfo2)
%         end,
%         {noreply, State}
%     end,
%     performer(F);

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

% handle_info(tick_check_state, State) ->
%     BossInfo = cache:find(boss_info),
%     Cfg = boss_cfg:get({BossInfo#boss_info.boss_id, BossInfo#boss_info.boss_level}),
%     Now = util:unixtime(),
%     BossState =
%     if
%         BossInfo#boss_info.boss_hurt >= Cfg#boss_cfg.max_hp -> ?BOSS_END;
%         Now - BossInfo#boss_info.start_time < ?BOSS_WAIT_START_TIME -> ?BOSS_WAIT_START;
%         Now - BossInfo#boss_info.start_time < ?BOSS_ALL_TIME -> ?BOSS_FIGHT;
%         true -> ?BOSS_END
%     end,

%     NewBossInfo = BossInfo#boss_info{state=BossState},
%     cache:update(NewBossInfo),

% %%     if
% %%         BossInfo#boss_info.state /= ?BOSS_FIGHT andalso NewBossInfo#boss_info.state == ?BOSS_FIGHT ->
% %%             erlang:send_after(1000, self(), tick_boss_action);                                 %% AI计算boss动作，刚开始等个10秒，之后的tick时间要动态计算
% %%         true -> ok
% %%     end,

%     if
%         BossInfo#boss_info.state /= ?BOSS_END andalso NewBossInfo#boss_info.state == ?BOSS_END ->     %% 转变成结束状态  击败 或者超时 战斗结算并且销毁进程

%             case goddess_misc:get_pid_by_name(BossInfo#boss_info.master) of
%                 false -> ok;
%                 MasterProcess -> gen_server:call(MasterProcess, {afterwards, BossInfo})
%             end,

%             broadcast_list(),                                                %% 广播结算数据
%             self() ! {stop, normal};             %% 销毁线程

%         true -> ok
%     end,

%     erlang:send_after(?TICK_CHECK_STATE, self(), tick_check_state),
%     {noreply, State};

% handle_info(tick_broadcast_boss_hurt, State) ->
%     BossInfo = cache:find(boss_info),
%     Data = #m__boss__base_info__s2c{
%         boss_id=BossInfo#boss_info.boss_id,
%         boss_hurt=BossInfo#boss_info.boss_hurt,
%         rank=boss_mod:build_boss_rank(BossInfo#boss_info.members)
%     },
%     broadcast(Data),
%     erlang:send_after(?TICK_BROADCAST_BOSS_HURT, self(), tick_broadcast_boss_hurt),
%     {noreply, State};

% handle_info(tick_boss_action, State) ->
%     F = fun() ->
%         BossInfo = cache:find(boss_info),
%         case lists:member(BossInfo#boss_info.state, [?BOSS_WAIT_START, ?BOSS_FIGHT]) of
%             false -> throw({return, {noreply, State}});
%             true -> ok
%         end,

%         BossId = BossInfo#boss_info.boss_id,
%         Level = BossInfo#boss_info.boss_level,
%         X = BossInfo#boss_info.pos_x,
%         Y = BossInfo#boss_info.pos_y,
%         Cfg = boss_cfg:get({BossId, Level}),
%         RoadCfg = scene_info_cfg:get(Cfg#boss_cfg.scene_id),
%         #scene_road_info{left=Left, right=Right, top=Top, bottom=Bottom} = lists:keyfind(Cfg#boss_cfg.road, #scene_road_info.type, RoadCfg#scene_info_cfg.info),

%         PosX = rand_srv:random(Left, Right),
%         PosY = rand_srv:random(Top, Bottom),
%         TargetX = case PosX - X > 0 of
%             true -> erlang:min(X + erlang:min(PosX - X, Cfg#boss_cfg.max_x), Right);
%             false -> erlang:min(X - erlang:min(PosX - X, Cfg#boss_cfg.max_x), Left)
%         end,
%         TargetY = case PosY - Y > 0 of
%             true -> erlang:min(Y + erlang:min(PosY - Y, Cfg#boss_cfg.max_y), Bottom);
%             false -> erlang:min(Y - erlang:min(PosY - Y, Cfg#boss_cfg.max_y), Top)
%         end,

%         NewBossInfo = BossInfo#boss_info{
%             pos_x = TargetX,
%             pos_y = TargetY
%         },
%         cache:update(NewBossInfo),

%         Actions = random_boss_action([], Cfg#boss_cfg.first_action),
%         MoveCostTime = math:sqrt(math:pow(TargetX - X, 2) + math:pow(TargetY - Y, 2)) * Cfg#boss_cfg.move_speed,
%         WaitTime =
%             util:to_integer(
%                 MoveCostTime +
%                 lists:sum([(boss_action_tree_cfg:get(ActionId))#boss_action_tree_cfg.action_time || ActionId <- Actions]) +
%                 Cfg#boss_cfg.action_wait
%             ),

%         BroadcastData = #m__boss__action__s2c{
%             action_time = util:unixtime() + util:to_integer(util:to_integer(MoveCostTime)/1000),
%             pos_x = TargetX,
%             pos_y = TargetY,
%             actions = Actions
%         },
%         broadcast(BroadcastData),                 %% 广播 BOSS AI


%         ?DEBUG_MSG("tick boss_action  ~p:   ~p~n", [WaitTime, BroadcastData]),
%         erlang:send_after(WaitTime, self(), tick_boss_action),

%         {noreply, State}
%     end,
%     performer(F);

% handle_info(tick_awake, State) ->
%     BossInfo = cache:find(boss_info),
%     Members = BossInfo#boss_info.members,
%     F = fun(Member) ->
%         case goddess_misc:get_role_pid(Member#boss_member.role_id) of
%             false -> ok;
%             Pid -> Pid ! {send, #m__boss__awake__s2c{}}
%         end,
%         NewMember = Member#boss_member{life=?BOSS_ME_LIVE},
%         Info = cache:find(boss_info),
%         NewInfo = Info#boss_info{members=lists:keyreplace(NewMember#boss_member.role_id, #boss_member.role_id, Info#boss_info.members, NewMember)},
%         cache:update(NewInfo)
%     end,
%     [F(Member) || Member <- Members, Member#boss_member.life == ?BOSS_ME_DEAD, util:unixtime()-Member#boss_member.dead_time >= ?BOSS_DEAD_TIME],

%     erlang:send_after(?TICK_AWAKE, self(), tick_awake),

%     {noreply, State};

% handle_info({start_scene}, State) ->
%     BossInfo = cache:find(boss_info),
%     #boss_info{boss_id=BossId, boss_level=BossLevel, master=Master} = BossInfo,
%     Cfg = boss_cfg:get({BossId, BossLevel}),

%     SrvName = util:to_atom(util:to_list(Master)++util:to_list(BossId)),
%     {ok, Pid} = scene_srv:start_link(SrvName, Cfg#boss_cfg.scene_id),

%     BossInfo = cache:find(boss_info),
%     cache:update(BossInfo#boss_info{scene_pid=Pid}),

%     {noreply, State};

% handle_info({stop, Reason}, State) ->
%     {stop, Reason, State};
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
% terminate(_Reason, _State) ->
%     case cache:find(boss_info) of
%         #boss_info{scene_pid=Pid} ->
%             exit(Pid, kill);
%         _ -> ok
%     end,
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
% random_boss_action(Ids, []) ->
%     Ids;
% random_boss_action(Ids, Actions) ->
%     Cfgs = [{ActionId, (boss_action_tree_cfg:get(ActionId))#boss_action_tree_cfg.probability} || ActionId <- Actions],
%     Id = rand_srv:random_probability_list(Cfgs),
%     Cfg = boss_action_tree_cfg:get(Id),
%     case Cfg#boss_action_tree_cfg.is_end == 0 of     %% 0 不结束
%         true -> random_boss_action(Ids++[Id], Cfg#boss_action_tree_cfg.next_action);
%         false -> Ids
%     end.

% broadcast_list() ->
%     BossInfo = cache:find(boss_info),
%     broadcast_member_info(BossInfo, 1, BossInfo#boss_info.members).

% broadcast_member_info(_, _, []) ->
%     ok;
% broadcast_member_info(BossInfo, Index, [Member|Members]) ->
%     Data = #m__boss__list__s2c{
%         my_rank = Index,
%         my_hurt = Member#boss_member.hurt,
%         kill_role_id = BossInfo#boss_info.kill_role_id,
%         kill_name = BossInfo#boss_info.kill_role_name
%     },
%     case goddess_misc:get_role_pid(Member#boss_member.role_id) of
%         false -> ok;
%         Pid -> Pid ! {send, Data}
%     end,
%     broadcast_member_info(BossInfo, Index+1, Members).

% broadcast(Data) ->
%     #boss_info{members=Members} = cache:find(boss_info),
%     F = fun(Member) ->
%         case lists:member(Member#boss_member.state, [?BOSS_ME_IN])of
%             false -> ok;
%             true ->
%                 case goddess_misc:get_role_pid(Member#boss_member.role_id) of
%                     false -> member_leave(Member#boss_member.role_id);
%                     Pid -> Pid ! {send, Data}
%                 end
%         end
%     end,
%     [F(Member) || Member <- Members].           %% 过滤一下不再boss场景中的人和一些特殊状态的人

% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw({return, State}) ->
%     State;
% handle_throw(Reason) ->
%     throw(Reason).

% member_leave(RoleId) ->
%     Info = cache:find(boss_info),
%     NewInfo = case lists:keyfind(RoleId, #boss_member.role_id, Info#boss_info.members) of
%         false -> Info;
%         Member ->
%             Info#boss_info{members=lists:keyreplace(RoleId, #boss_member.role_id, Info#boss_info.members, Member#boss_member{state=?BOSS_ME_OUT})}
%     end,
%     cache:update(NewInfo).


