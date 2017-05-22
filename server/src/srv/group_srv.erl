%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_srv).

% -behaviour(gen_server).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").

% -include("logger.hrl").

% %% API
% -export([join/2, leave/3, close/2, close_cancel/1, reply_request/3, appoint/3, invite_reply/3]).
% -export([transfer/4, invite/5, notice/2, kick/4, value/4, update_member/1, update_member/3, members/1, requests/1]).
% -export([join_meeting/2, water/4, chat/3]).
% -export([srv_broadcast/2]).
% -export([start_link/0, start_link/1]).

% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).

% -define(SERVER, ?MODULE).
% %todo close delay
% -define(DELAY, 259200).

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
% srv_broadcast(Id, M) ->
%     %% e.g  treasure -- group_srv:srv_broadcast(GroupId, {treasure, RoleId, RoleName, Id, TempId})
%     Srv = group_mod:srv_name(Id),
%     gen_server:cast(Srv, {broadcast, M}).

% join(Id, Role) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {join, Role}).

% % %doc 退出帮会
% leave(Id, RoleId, RoleName) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {leave, RoleId, RoleName}).

% %% get_request(Id, Sender) ->
% %%     Srv = group_mod:srv_name(Id),
% %%     gen_server:call(Srv, {get_request, Sender}).

% % 已经发出帮派加入申请, 再没有得到回复之前, 能否再申请加入别的帮派
% reply_request(Id, RoleId, Reply) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {reply_request, RoleId, Reply}).

% % @doc 解散, 设定解散时间, 离线消息
% close(Id, Now) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {close, Now}).

% close_cancel(Id) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {close_cancel}).

% appoint(Id, {RoleId, RoleName}, Post) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {appoint, {RoleId, RoleName}, Post}).

% transfer(Id, SRoleId, DRoleId, DRoleName) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {transfer, SRoleId, DRoleId, DRoleName}).

% invite(Id, Pid, RoleId, RoleName, ORoleId) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {invite, Pid, RoleId, RoleName, ORoleId}).

% invite_reply(Id, RoleId, Reply) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {invite_reply, RoleId, Reply}).

% notice(Id, Content) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {notice, Content}).

% kick(Id, RoleId, RoleName, ORoleId) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {kick, RoleId, RoleName, ORoleId}).

% value(Id, RoleId, RoleName, Exp) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:cast(Srv, {value, RoleId, RoleName, Exp}).

% join_meeting(Id, RoleId) ->
%     Srv = group_mod:srv_name(Id),
%     gen_server:call(Srv, {join_meeting, RoleId}).

% water(GroupId, RoleId, Cfg, Type) ->
%     Srv = group_mod:srv_name(GroupId),
%     gen_server:call(Srv, {water, RoleId, GroupId, Cfg, Type}).



% update_member(#game_info{role=Role, group_member=GroupMember, group_etc=GroupEtc}) ->
%     Id = GroupMember#group_member.group_id,
%     case Id == 0 of
%         true -> ok;
%         false ->
%             Srv = group_mod:srv_name(Id),
%             R = #group_member_ets{
%                 role_id = Role#role.role_id,
%                 role_name = Role#role.role_name,
%                 group_id = Id,
%                 state = GroupEtc#group_state.state,
%                 level = Role#role.level,
%                 job = Role#role.job,
%                 value_today = GroupMember#group_member.value_today,
%                 value = GroupMember#group_member.value,
%                 value_time = GroupMember#group_member.value_time,
%                 allvalue = GroupMember#group_member.allvalue,
%                 fight = Role#role.fight
%             },
%             gen_server:cast(Srv, {update_member, R})
%     end.

% update_member(GroupId, RoleId, KvList) ->
%     Ets = group_mod:ets_name(GroupId),
%     ets:update_element(Ets, RoleId, KvList).

% remove_ets(GroupId, RoleId) ->
%     Ets = group_mod:ets_name(GroupId),
%     ets:delete(Ets, RoleId).

% update_ets(#group_member_ets{group_id=GroupId}=R)  ->
%     Ets = group_mod:ets_name(GroupId),
%     ets:insert(Ets, R).

% find(GroupId, RoleId) ->
%     Ets = group_mod:ets_name(GroupId),
%     ?DEBUG_MSG("ets:~p ~p", [Ets, RoleId]),
%     case ets:lookup(Ets, RoleId) of
%         [R|_] -> R;
%         [] -> false
%     end.


% members(0) -> [];
% members(Id) ->
%     Ets = group_mod:ets_name(Id),
%     [ R || #group_member_ets{state=?G_NORMAL} = R <- ets:tab2list(Ets)].

% requests(0) -> [];
% requests(Id) ->
%     Ets = group_mod:ets_name(Id),
%     [ R || #group_member_ets{state=?G_REQUEST} = R <- ets:tab2list(Ets)].

% chat(GroupId, Msg, ORoleId) ->
%     Ets = group_mod:ets_name(GroupId),
%     ets:foldl(fun(#group_member_ets{role_id=RoleId}, _) when RoleId /= ORoleId ->
%         broadcast_api:give_sender(RoleId, Msg);
%         (_, _) -> 0
%     end, 0, Ets).

% % master
% start_link() ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

% start_link(Id) ->
%     GroupId = util:to_list(Id),
%     Srv = group_mod:srv_name(GroupId),
%     gen_server:start_link({local, Srv}, ?MODULE, [GroupId], []).

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
% init([GroupId]) ->
%     Info = group_db:get(GroupId),
%     State = group_db:all_state(GroupId),
%     Ets = group_mod:ets_name(GroupId),

%     ets:new(Ets, [named_table, public, {keypos, #group_member_ets.role_id}]),
%     group_db:load_to_ets(Ets, GroupId),

%     Tree = group_tree_db:get(GroupId),
%     Boss = group_boss_db:get(GroupId),

%     Act = #group_act_ets{
%         id = GroupId,
%         meeting = #group_meeting{},
%         tree = Tree,
%         boss = Boss
%     },
%     group_master_srv:act_update(Act),

%     gen_server:cast(group_master_srv, {srv_start, self(), GroupId}),
%     {ok, #group_info{id=GroupId, info=Info, mstate=State, ets=Ets}}.

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
% handle_call({reply_request, RoleId2, Reply}, _From, #group_info{id=Id, info=Info, mstate=MState, ets=Ets}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     Title = Info#groups.title,

%     Fail = fun() ->
%         role_srv:send2role(RoleId, {group_api, join_fail, [Id, Title]}),
%         group_db:delete_state(RoleId, Id),
%         M = lists:keydelete(RoleId, #group_state.role_id, MState),
%         remove_ets(Id, RoleId),
%         {true, State#group_info{mstate=M}}
%     end,

%     {Result, State3} =
%     case is_full(Info) of
%         true when Reply == ?YES ->
%             {full, State};
%         true ->
%             Fail();
%         false ->
%             case lists:keyfind(RoleId, #group_state.role_id, MState) of
%                 #group_state{state=?G_REQUEST} = R ->
%                     case Reply of
%                         ?NO ->
%                             Fail();
%                         ?YES ->
%                             case group_master_srv:join(RoleId, Id) of
%                                 false ->
%                                     {_, State2} = Fail(),
%                                     {false, State2};
%                                 Other ->
%                                     {Info3, M2} =
%                                     case Other of
%                                         true ->
%                                             Info2 = Info#groups{members=Info#groups.members+1},
%                                             group_master_srv:update(Info2),
%                                             group_db:update(Info2),
%                                             srv_broadcast({join_succ, RoleId}),
%                                             ets:update_element(Ets, RoleId, [{#group_member_ets.state, ?G_NORMAL}]),
%                                             role_srv:send2role(RoleId, {group_api, join_succ, [Id, Title]}),
%                                             {Info2, lists:keyreplace(RoleId, #group_state.role_id, MState, R#group_state{state=?G_NORMAL, post=?POST_MEMBER})};
%                                         false ->
%                                             group_db:delete_state(RoleId, Id),
%                                             {Info, lists:keydelete(RoleId, #group_state.role_id, MState)};
%                                         _ ->
%                                             {Info, lists:keyreplace(RoleId, #group_state.role_id, MState, R#group_state{state=?G_NORMAL, post=?POST_MEMBER})}
%                                     end,
%                                     {true, State#group_info{info=Info3, mstate=M2}}
%                             end
%                     end;
%                 _ ->
%                     {false, State}
%             end
%     end,
%     {reply, Result, State3};

% handle_call({appoint, {RoleId2, RoleName}, Post}, _From, #group_info{id=Id, ets=Ets, mstate=Mstate}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     case lists:keyfind(RoleId, #group_state.role_id, Mstate) of
%         #group_state{state=?G_NORMAL, post=OPost} = R when OPost /= Post->
%             R2 = R#group_state{post=Post},
%             group_db:update_state(R2),
%             role_srv:send2role(RoleId, {group_api, appoint_by_other, [Id, Post]}),
%             M2 = lists:keyreplace(RoleId, #group_state.role_id, Mstate, R2),
%             ets:update_element(Ets, RoleId, [{#group_member_ets.post, Post}]),
%             srv_broadcast({appoint, RoleId2, RoleName, OPost, Post}),
%             {reply, true, State#group_info{mstate=M2}};
%         #group_state{state=?G_NORMAL} ->
%             role_srv:send2role(RoleId, {group_api, appoint_by_other, [Id, Post]}),
%             {reply, true, State};
%         _ ->
%             {reply, false, State}
%     end;
% handle_call({close, Now}, _From, #group_info{info=Info}=State) ->
%     #groups{close_time=CTime} = Info,
%     case CTime of
%         0 ->
%             CTime2 = Now + ?DELAY,
%             Info2 = Info#groups{close_time=CTime2},
%             group_db:update(Info2),
%             group_master_srv:update(Info2#groups.id, #groups_ets.close_time, CTime2),
%             {reply, true, State#group_info{info=Info2}};
%         _ ->
%             {reply, false, State}
%     end;
% handle_call({close_cancel}, _From, #group_info{info=Info}=State) ->
%     Info2 = Info#groups{close_time=0},
%     group_db:update(Info2),
%     group_master_srv:update(Info2#groups.id, #groups_ets.close_time, 0),
%     {reply, true, State#group_info{info=Info2}};

% handle_call({transfer, SRoleId2, DRoleId2, DRoleName}, _From, #group_info{id=Id, info=Info, mstate=Mstate}=State) ->
%     SRoleId = util:to_binary(SRoleId2),
%     DRoleId = util:to_binary(DRoleId2),
%     S = lists:keyfind(SRoleId, #group_state.role_id, Mstate),
%     D = lists:keyfind(DRoleId, #group_state.role_id, Mstate),

%     case S#group_state.post == ?POST_MANAGER1 andalso D#group_state.post == ?POST_MANAGER2 of
%         true ->
%             S1 = S#group_state{post=?POST_MEMBER},
%             D1 = D#group_state{post=?POST_MANAGER1},
%             group_db:update_state(S1),
%             group_db:update_state(D1),

%             DRole = role_db:get(DRoleId),
%             Info2 = Info#groups{master_id=DRoleId, master_name=DRole#role.role_name},

%             group_master_srv:update(Info2),
%             Mstate2 = lists:keyreplace(SRoleId, #group_state.role_id, Mstate, S1),
%             Mstate3 = lists:keyreplace(DRoleId, #group_state.role_id, Mstate2, D1),

%             update_member(Id, SRoleId, [{#group_member_ets.post, ?POST_MEMBER}]),
%             update_member(Id, DRoleId, [{#group_member_ets.post, ?POST_MANAGER1}]),

%             group_db:update_element(SRoleId2, Id, "post", ?POST_MEMBER),
%             group_db:update_element(DRoleId2, Id, "post", ?POST_MANAGER1),

%             group_db:update(Info2),
%             role_srv:send2role(DRoleId, {group_api, transfer_by_other, [transfer]}),

%             %% 转让帮主，帮派频道里显示公告
%             % srv_broadcast({appoint, DRoleId2, DRole#role.role_name, ?POST_MANAGER1, ?POST_MEMBER}),
%             srv_broadcast({transfer, DRoleId2, DRoleName}),
%             {reply, true, State#group_info{info=Info2, mstate=Mstate3}};
%         false ->
%             {reply, false, State}
%     end;
% handle_call({notice, Content}, _From, #group_info{info=Info}=State) ->
%     Info2 = Info#groups{notice=Content},
%     gen_server:call(group_master_srv, {update_group, {Info2#groups.id, #groups_ets.notice, Content}}),
%     group_db:update(Info2),

%     srv_broadcast({notice, Content}),
%     {reply, true, State#group_info{info=Info2}};

% handle_call({kick, RoleId, RoleName, ORoleId2}, _From, #group_info{id=Id, info=Info, mstate=Mstate} = State) ->
%     ORoleId = util:to_binary(ORoleId2),
%     #group_state{post=SP} = lists:keyfind(util:to_binary(RoleId), #group_state.role_id, Mstate),
%     case lists:keyfind(ORoleId, #group_state.role_id, Mstate) of
%         #group_state{post=P} when P > SP ->
%             Mstate2 = lists:keydelete(ORoleId, #group_state.role_id, Mstate),
%             Info2 = Info#groups{members=Info#groups.members-1},
%             group_master_srv:update(Info2),
%             group_db:update(Info2),
%             clean_someone(Id, ORoleId),
%             srv_broadcast({kick, {RoleId, RoleName, ORoleId}}),
%             % 告知玩家已经被踢出帮派，如果玩家不在线，发邮件提醒
%             case role_srv:send2role(ORoleId, {group_api, kick_by_other, [Info2#groups.id, Info2#groups.title, RoleId, RoleName]}) of
%                 true -> ok;
%                 false -> mail_srv:send_mail([ORoleId], "system_notice_kicked", "system_notice_kicked", ?MAILING_TYPE_BULLETIN, "")
%             end,
%             {reply, true, State#group_info{info=Info2, mstate=Mstate2}};
%         _ ->
%             {reply, true, State}
%     end;

% handle_call({leave, RoleId2, RoleName}, _From, #group_info{id=Id, info=Info, mstate=Mstate}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     case lists:keyfind(RoleId, #group_state.role_id, Mstate) of
%         #group_state{} ->
%             M = lists:keydelete(RoleId, #group_state.role_id, Mstate),
%             Info2 = Info#groups{members = Info#groups.members-1},
%             group_master_srv:update(Info2),
%             group_db:update(Info2),
%             clean_someone(Id, RoleId),
%             srv_broadcast({leave, {RoleId, RoleName}}),
%             {reply, true, State#group_info{mstate=M, info=Info2}};
%         _ ->
%             {reply, false, State}
%     end;

% handle_call({invite, Pid, RoleId, RoleName, ORoleId}, _From, #group_info{info=Info}=State) ->
%     case is_full(Info) of
%         true ->
%             {reply, full, State};
%         false ->
%             gen_server:cast(self(), {invite, Pid, RoleId, RoleName, ORoleId}),
%             {reply, true, State}
%     end;
% handle_call({join, Role}, _From, #group_info{info=Info, id=Id, mstate=Mstates}=State) ->
%     case is_full(Info) of
%         true ->
%             {reply, full, State};
%         false ->
%             Now = ?NOW,
%             group_db:update_to_request_state(Role#role.role_id, Id, Now),
%             MasterId = Info#groups.master_id,
%             R = #group_member_ets{
%                 role_id = Role#role.role_id,
%                 role_name = Role#role.role_name,
%                 group_id = Id,
%                 state = ?G_REQUEST,
%                 level = Role#role.level,
%                 post = ?POST_MEMBER,
%                 job = Role#role.job,
%                 value = 0,
%                 value_time = 0,
%                 value_today = 0,
%                 allvalue = 0,
%                 time = Now,
%                 fight = Role#role.fight
%             },
%             update_ets(R),

%             ?DEBUG_MSG("~p ~n", [{MasterId, Info#groups.master_name}]),

%             role_srv:send2role(MasterId, {group_api, handle_request, [R]}),

%             Mstate = #group_state{role_id=Role#role.role_id, group_id=Id, state=?G_REQUEST},

%             State2 =
%             case lists:keyfind(Role#role.role_id, #group_state.role_id, Mstates) of
%                 false ->
%                     State#group_info{mstate=[Mstate|Mstates]};
%                 _ ->
%                     State
%             end,
%             {reply, true, State2}
%     end;
% handle_call({invite_reply, RoleId, Reply}, _From, #group_info{info=Info}=State) ->
%     case Reply == ?YES andalso is_full(Info) of
%         true ->
%             {reply, full, State};
%         false ->
%             gen_server:cast(self(), {invite_reply, RoleId, Reply}),
%             {reply, true, State}
%     end;

% handle_call({join_meeting, RoleId}, _From, #group_info{id=Id, info=Info, mstate=Mstate}=State) ->
%     Now = ?NOW,

%     #group_act_ets{meeting=Meeting} = group_master_srv:act_info(Id),
%     Cfg = group_meeting_cfg:get(Info#groups.level),
%     case Meeting#group_meeting.cd+Cfg#group_meeting_cfg.cd > Now of
%         true ->
%             {reply, false, State};
%         false ->
%             N = length(Meeting#group_meeting.roles) + 1,
%             case N >= Cfg#group_meeting_cfg.rolecount of
%                 true ->
%                     % 聚义完成
%                     group_master_srv:act_update(Id, #group_act_ets.meeting, #group_meeting{cd=Now}),
%                     F = fun(ORoleId) ->
%                             case role_srv:send2role(ORoleId, {group_meeting_api, succ, [meeting_succ]}) of
%                                 false ->
%                                     group_db:meeting_add_value(Cfg#group_meeting_cfg.value, ?NOW, Cfg#group_meeting_cfg.count, ORoleId),
%                                     Ets = group_mod:ets_name(Id),
%                                     group_db:load_to_ets(Ets, Id, ORoleId);
%                                 _ ->
%                                     ok
%                             end
%                     end,
%                     AllRoles = [RoleId | Meeting#group_meeting.roles],
%                     [ F(ORoleId) || ORoleId <- AllRoles ],
%                     self() ! {addexp, Cfg#group_meeting_cfg.exp},
%                     srv_broadcast({meeting, AllRoles}),
%                     {reply, true2, State};
%                 false when N == 1 ->
%                     % 首个加入聚义的
%                     group_master_srv:act_update(Id, #group_act_ets.meeting, #group_meeting{time=Now, roles=[RoleId], cd=0}),
%                     {reply, true, State};
%                 false ->
%                     case lists:member(RoleId, Meeting#group_meeting.roles) of
%                         false ->
%                             News = [RoleId|Meeting#group_meeting.roles],
%                             broadcast_api:group(Mstate, #m__group_meeting__otherjoin__s2c{role_id=News}),
%                             group_master_srv:act_update(Id, #group_act_ets.meeting, #group_meeting{roles=News, cd=0});
%                         true -> ok
%                     end,
%                     {reply, true, State}
%             end
%     end;

% handle_call({water, RoleId, GroupId, Cfg, Type}, _From, #group_info{info=Info}=State) ->
%     #group_act_ets{tree=Tree} = group_master_srv:act_info(GroupId),
%     NewTree = group_tree_api:role_water(RoleId, Tree, Cfg, Type, Info#groups.level),

%     {NewInfo, NewTree2} = if NewTree#group_tree_info.air >= Cfg#group_tree_cfg.max_air ->
%                             Ninfo = group_tree_api:do_when_air_full(Info, Cfg),
%                             {Ninfo, NewTree#group_tree_info{air=Cfg#group_tree_cfg.max_air}}; % Cfg#group_tree_cfg.max_air
%                             true -> {Info, NewTree}
%                         end,

%     group_master_srv:act_update(GroupId, #group_act_ets.tree, NewTree2),
%     {reply, true, State#group_info{info=NewInfo}};

% handle_call({afterwards, BossInfo}, _From, #group_info{id=Id}=State) ->
%     #group_act_ets{boss=GroupBoss} = group_master_srv:act_info(Id),
%     group_boss_api:afterwards(GroupBoss, BossInfo),
%     {reply, ok, State};

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
% handle_cast({invite, Pid, RoleId2, RoleName, ORoleId2}, #group_info{id=Id, info=Info, invites=Invites}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     ORoleId = util:to_binary(ORoleId2),
%     case lists:keyfind(ORoleId, 1, Invites) of
%         false ->
%             role_srv:send2role(Pid, {group_api, invite_by_other, [RoleId, RoleName, Id, Info#groups.title, self()]});
%         _ -> ok
%     end,
%     {noreply, State};
% handle_cast({join, Role}, #group_info{id=Id, info=Info, mstate=Mstates}=State) ->
%     case lists:keyfind(Role#role.role_id, #group_state.role_id, Mstates) of
%         false ->
%             Now = ?NOW,
%             group_db:update_to_request_state(Role#role.role_id, Id, Now),
%             MasterId = Info#groups.master_id,
%             % 通知帮主
%             Mstate = #group_state{role_id=Role#role.role_id, group_id=Id, state=?G_REQUEST},
%             R = #group_member_ets{
%                 role_id = Role#role.role_id,
%                 role_name = Role#role.role_name,
%                 group_id = Id,
%                 state = ?G_REQUEST,
%                 level = Role#role.level,
%                 post = 0,
%                 job = Role#role.job,
%                 value = 0,
%                 value_time = 0,
%                 value_today = 0,
%                 allvalue = 0,
%                 time = Now
%             },
%             update_ets(R),
%             role_srv:send2role(MasterId, {group_api, handle_request, [R]}),
%             State2 = State#group_info{mstate=[Mstate|Mstates]};
%         _ ->
%             State2 = State
%     end,
%     {noreply, State2};
% handle_cast({invite_reply, RoleId2, ?NO}, #group_info{invites=Invites}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     Invites2 = lists:keydelete(RoleId, 1, Invites),
%     State2 = State#group_info{invites=Invites2},
%     {noreply, State2};
% handle_cast({invite_reply, RoleId2, ?YES}, #group_info{id=Id, info=Info, mstate=Mstate, invites=Invites}=State) ->
%     RoleId = util:to_binary(RoleId2),
%     case lists:keyfind(RoleId, 1, Invites) of
%         {RoleId} ->
%             R = #group_state{role_id=RoleId, group_id=Id, state=?G_NORMAL, post=?POST_MEMBER},

%             case group_master_srv:join(RoleId, Id) of
%                 false ->
%                     State2 = State;
%                 Other ->
%                     if Other == incr ->
%                         Info2 = Info#groups{members=Info#groups.members+1},
%                         group_db:update(Info2),
%                         group_master_srv:update(Info2),

%                         Mstate2 = [R|Mstate],
%                         State2 = State#group_info{info=Info2, mstate=Mstate2},
%                         role_srv:send2role(RoleId, {group_api, join_succ, [Id, Info2#groups.title]});
%                         true ->
%                             State2 = State
%                     end
%             end,
%             Invites2 = lists:keydelete(RoleId, 1, Invites),
%             State3 = State2#group_info{invites=Invites2};
%         _ ->
%             State3 = State
%     end,
%     {noreply, State3};
% handle_cast({value, RoleId, RoleName, Exp}, #group_info{info=Info}=State) ->
%     Info2 = Info#groups{exp= Info#groups.exp + Exp, level=get_level(Info#groups.exp+Exp)},
%     group_db:update(Info2),
%     group_master_srv:update(Info2),
%     srv_broadcast({value, RoleId, RoleName, Exp }),
%     {noreply, State#group_info{info=Info2}};

% handle_cast({addexp, Exp}, #group_info{info=Info}=State) ->
%     Info2 = Info#groups{exp= Info#groups.exp+Exp, level=get_level(Info#groups.exp+Exp)},
%     group_db:update(Info2),
%     group_master_srv:update(Info2),
%     {noreply, State#group_info{info=Info2}};

% handle_cast({update_member, #group_member_ets{role_id=RoleId}=R}, #group_info{mstate=Mstate}=State) ->
%     case lists:keyfind(RoleId, #group_state.role_id, Mstate) of
%         #group_state{post=Post, time=Time} ->
%             update_ets(R#group_member_ets{post=Post, time=Time});
%         O ->
%             ?DEBUG_MSG("===============why ~p~n", [O]),
%             ok
%     end,
%     {noreply, State};

% %% ------------------------------ broadcast -----------------------------------
% handle_cast({broadcast, {join_succ, RoleId}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 28,
%     Role = role_db:get(RoleId),
%     Content = #chat_content{
%         % content = <<"">>,
%         % role = #chat_role{role_id=Role#role.role_id, role_name=Role#role.role_name},
%         % group = #chat_group{title=Info#groups.title, id=Id}
%         role = #chat_role{role_id=Role#role.role_id, role_name=Role#role.role_name}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {leave, {RoleId, RoleName}}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 27,
%     Content = #chat_content{
%                 role = #chat_role{role_id=RoleId, role_name=RoleName}
%             },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {kick, {RoleId, RoleName, ORoleId}}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 29,
%     Role = role_db:get(ORoleId),
%     Content = #chat_content{
%                 role=#chat_role{role_id=Role#role.role_id, role_name=Role#role.role_name},
%                 role2=#chat_role{role_name=RoleName, role_id=RoleId}
%             },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {notice, Content}}, #group_info{mstate=Mstate}=State) ->
%     Msg = #m__group__notice__s2c{content=Content},
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {meeting, RoleIds}}, #group_info{id=Id, mstate=Mstate}=State) ->
%     TmpId = 12,
%     F = fun(RoleId) ->
%         case find(Id, RoleId) of
%             #group_member_ets{role_name=RoleName} -> #chat_role{role_id=RoleId, role_name=RoleName};
%             false -> 
%                 RoleName = role_db:get_role_name_by_id(RoleId),
%                 #chat_role{role_id=RoleId, role_name=RoleName}
%         end
%     end,
%     MeetRoles = lists:map(F, RoleIds),
%     Content = #chat_content{
%                 role = lists:nth(1, MeetRoles),
%                 role2 = lists:nth(2, MeetRoles),
%                 role3 = lists:nth(3, MeetRoles)
%             },

%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),

%     {noreply, State};

% handle_cast({broadcast, {value, RoleId, RoleName, Exp}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 20,
%     Content = #chat_content{
%         content=erlang:integer_to_list(Exp),
%         role = #chat_role{role_id=RoleId, role_name=RoleName}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {appoint, RoleId, RoleName, OPost, Post}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = case OPost > Post of
%                 true -> 21;
%                 _ -> 22
%             end,

%     Content = #chat_content{
%         content = group_mod:post_name(Post),
%         role = #chat_role{role_id=RoleId, role_name=RoleName}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% % srv_broadcast({treasure, Id})
% handle_cast({broadcast, {treasure, RoleId, RoleName, Id, TemplateId}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 23,
%     Content = #chat_content{
%         role = #chat_role{role_id=RoleId, role_name=RoleName},
%         treasure = #chat_item{item_id=TemplateId, id=Id}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};

% handle_cast({broadcast, {transfer, RoleId, RoleName}}, #group_info{mstate=Mstate}=State) ->
%     TmpId = 25,
%     Content = #chat_content{
%         role = #chat_role{role_id=RoleId, role_name=RoleName}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     broadcast_api:group(Mstate, Msg),
%     {noreply, State};


% handle_cast({broadcast, #m__system__notify__s2c{}=M}, #group_info{mstate=Mstate}=State) ->
%     broadcast_api:group(Mstate, M),
%     {noreply, State};


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
% handle_info({tick, Now}, State) ->
%     case group_api:tick(Now, State) of
%         {stop, NewState} ->
%             {stop, normal, NewState};
%         {run, NewState} ->
%             Act = group_master_srv:act_info(NewState#group_info.id),

%             LF =
%                 fun(F, {Flag1, Act1}) ->
%                     case F(Act1, NewState#group_info.info, Now) of
%                         {true, Act2} ->
%                             {true, Act2};
%                         {_, Act2} -> {Flag1, Act2}
%                     end
%                 end,

%             {Flag, Act2} =
%             lists:foldl(LF, {false, Act},
%                 [fun group_meeting_api:tick/3,
%                  fun group_pool_api:tick/3,
%                  fun group_tree_api:tick/3,
%                  fun group_boss_api:tick/3]),

% %%             ?DEBUG_MSG("~p ~n", [{Flag, Act#group_act_ets.tree}]),

%             % 任何一个tick有改动,会进行一次更新, 否则不更新
%             if Flag -> group_master_srv:act_update(Act2); true -> ok end,

%             {noreply, NewState}
%     end;

% handle_info({ack, invite_by_other, RoleId2}, #group_info{invites=Invites} = State) ->
%     RoleId = util:to_binary(RoleId2),
%     State2 =
%     case lists:keyfind(RoleId, 1, Invites) of
%         false ->
%             State#group_info{invites=[{RoleId}|Invites]};
%         _ ->
%             State
%     end,
%     {noreply, State2};

% handle_info({offline, RoleId2}, #group_info{invites=Invites} = State) ->
%     RoleId = util:to_binary(RoleId2),
%     Invites2 = lists:keydelete(RoleId, 1, Invites),
%     {noreply, State#group_info{invites=Invites2}};

% handle_info({broadcast, {update, Rank}}, #group_info{info=Info, mstate=Mstate}=State) ->
%     M = #m__group__update__s2c{level=Info#groups.level, exp=Info#groups.exp, rank=Rank},
%     broadcast_api:group(Mstate, M),
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
% terminate(_Reason, #group_info{id=Id}) ->
%     #group_act_ets{tree=Tree, boss=Boss, pool_pid=Pid} = group_master_srv:act_info(Id),
%     exit(Pid, normal),
%     group_tree_db:save(Tree),
%     group_boss_db:save(Boss),
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
% srv_broadcast(M) ->
%     gen_server:cast(self(), {broadcast, M}).

% is_full(#groups{exp=Exp, members=Members}) ->
%     Cfg = group_level_cfg:get(get_key(Exp)),
%     Members >= Cfg#group_level_cfg.max.

% get_key(Exp) ->
%     Keys = group_level_cfg:get_all(),
%     case [K || K <- Keys, K >= Exp] of
%         [] ->
%             lists:last(Keys);
%         [Key|_] ->
%             Key
%     end.

% get_level(Exp) ->
%     Key = get_key(Exp),
%     Cfg = group_level_cfg:get(Key),
%     Cfg#group_level_cfg.level.


% clean_someone(GroupId, RoleId) ->
%     group_db:delete_state(RoleId, GroupId),
%     remove_ets(GroupId, RoleId),

%     % tree
%     Act = group_master_srv:act_info(GroupId),
%     Tree = Act#group_act_ets.tree,
%     M2 = lists:keydelete(RoleId, #group_tree_member.role_id, Tree#group_tree_info.members),
%     group_master_srv:act_update(GroupId, #group_act_ets.tree, Tree#group_tree_info{members=M2}),
%     ok.
