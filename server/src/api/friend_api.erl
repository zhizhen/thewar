%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-18 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(friend_api).

% -include_lib("stdlib/include/ms_transform.hrl").

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% -export([list/2, add/2, delete/2, be_enemy/2, interact/2, push/2]).

% %% internal api
% -export([online/1, offline/0]).

% %% ipc call back
% -export([add_by_other/3, unfollow_by_other/2, online_other/5, offline_other/2]).

% -export([new_friend_info/1, update_friend_info/1]).

% %% call back
% -export([handle_throw/1]).

% -define(FUN_ID, 1017).

% %% 邀请组队 搁置
% %% 发起挑战 搁置


% %%%===================================================================
% %%% API
% %%%===================================================================

% %% @doc 好友列表 √
% list(#m__friend__list__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Friends = GameInfo#game_info.friends,
%     FriendEtc = GameInfo#game_info.friends_etc,
%     % Enemy = friend_db:get_enemy(GameInfo#game_info.role#role.role_id),
%     % Enemy = GameInfo#game_info.enemy,
%     PFriends = friend_mod:build_list(Friends#friends.all, FriendEtc#friend_etc.all),
%     Daily = GameInfo#game_info.daily,
%     Sender ! {send, #m__friend__list__s2c{friends = PFriends, interact=Daily#daily.interact, charm=Daily#daily.charm}}.

% %% @doc 添加好友 √
% add(#m__friend__add__c2s{name=Name}, Sender) ->
%     F = fun() ->
%         FRoleInfo = friend_mod:role_info(Name),
%         guard(FRoleInfo, ?FRIEND_NOT_LEGAL, Sender),
%         FRoleId = FRoleInfo#role.role_id,
%         GameInfo = role_api:get_user_data(),
%         RoleId = GameInfo#game_info.role#role.role_id,
%         guard(RoleId /= FRoleId, Sender),
%         Friends = GameInfo#game_info.friends,
%         FriendInfo = friend_mod:info(Friends#friends.all, FRoleId),
%         guard(FriendInfo == false, Sender),
%         guard(not friend_mod:is_max(Friends#friends.all, ?FRIEND_GOOD), Sender),
%         D = #friend{role_id=RoleId, friend_id=FRoleId, state=?FRIEND_GOOD, created_at=?NOW},

%         % friend_db:add(D),
%         %% 更新挑战成就任务 好友数量
%         challenge_api:update_task_process(?CHALLENGE_TYPE_FRIEND_NUM, 0, 1), 
%         challenge_api:update_task_process(?CHALLENGE_TYPE_FRIEND_NUM_TODAY, 0, 1),
        
%         All = [D|Friends#friends.all],
%         game_info:update(Friends#friends{all=All}),
%         new_friend_info(FRoleInfo),

%         role_srv:send2role(FRoleId, {?MODULE, add_by_other, [RoleId, GameInfo#game_info.role#role.role_name]}),
%         Msg = #m__friend__role__s2c{
%                 friend=#p_friend{
%                 role_id=FRoleId,
%                 name=Name,
%                 level=FRoleInfo#role.level,
%                 job=FRoleInfo#role.job,
%                 state=?FRIEND_GOOD,
%                 isonline=?OFFLINE}},
%         Sender ! {send, Msg}
% %%         notify(?FRIEND_ADD_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 删除关系 √
% delete(#m__friend__delete__c2s{role_id=FRoleId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         RoleId = GameInfo#game_info.role#role.role_id,
%         guard(RoleId /= FRoleId, Sender),
%         Friends = GameInfo#game_info.friends,
%         FriendInfo = friend_mod:info(Friends#friends.all, FRoleId),
%         guard(FriendInfo, Sender),

%         friend_db:delete(FriendInfo),

%         All = lists:keydelete(list_to_binary(FRoleId), #friend.friend_id, Friends#friends.all),
%         game_info:update(Friends#friends{all=All}),

%         delete_friend_info(FRoleId),
%         role_srv:send2role(FRoleId, {?MODULE, unfollow_by_other, [RoleId]}),

%         notify(?FRIEND_DEL_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 添加仇敌 √
% be_enemy(#m__friend__be_enemy__c2s{name=Name}, Sender) ->
%     F = fun() ->
%         FRoleInfo = friend_mod:role_info(Name),
%         guard(FRoleInfo, Sender),
%         FRoleId = FRoleInfo#role.role_id,
%         GameInfo = role_api:get_user_data(),
%         RoleId = GameInfo#game_info.role#role.role_id,
%         guard(RoleId /= FRoleId, Sender),
%         Friends = GameInfo#game_info.friends,
%         FriendInfo = friend_mod:info(Friends#friends.all, FRoleId),
%         guard(not friend_mod:is_max(Friends#friends.all, ?FRIEND_BAD), Sender),
%         case FriendInfo of
%             false ->
%                 D = #friend{role_id=RoleId, friend_id=FRoleId, state=?FRIEND_BAD, created_at=?NOW},
%                 % friend_db:add(D),
%                 All = [D|Friends#friends.all];
%             #friend{} = D2 ->
%                 D = D2#friend{state=?FRIEND_BAD},
%                 % friend_db:update(D),
%                 All = lists:keyreplace(FRoleId, #friend.friend_id, Friends#friends.all, D)
%         end,
%         game_info:update(Friends#friends{all=All}),
%         role_srv:send2role(FRoleId, {?MODULE, unfollow_by_other, [RoleId]}),
%         Msg = #m__friend__role__s2c{
%                 friend=#p_friend{
%                         role_id=FRoleId,
%                         name=Name,
%                         level=FRoleInfo#role.level,
%                         job=FRoleInfo#role.job,
%                         state=?FRIEND_BAD,
%                         isonline=?OFFLINE}},
%         Sender ! {send, Msg}
%     end,
%     ?PERFORM(F).

% %% @doc 交互
% interact(#m__friend__interact__c2s{type=Type, name=Name}, Sender) ->
%     F = fun() ->
%     GameInfo = role_api:get_user_data(),
%     #game_info{role=Role, daily=Daily, friends=Friends} = GameInfo,
%     Count = length(Daily#daily.interact),
%     VipCfg = viprelate_cfg:get(Role#role.vip),
%     guard(Count < VipCfg#viprelate_cfg.friend_interactive, Sender),

%     FRoleInfo = friend_mod:role_info(Name),
%     guard(FRoleInfo, Sender),
%     FRoleId = FRoleInfo#role.role_id,
%     guard(Role#role.role_id /= FRoleId, Sender),
%     FriendInfo = friend_mod:info(Friends#friends.all, FRoleId),

%     ?DEBUG_MSG("m__friend__interact__c2s type:~p ~n", [{Type, Name}]),
%     case FriendInfo of
%         false ->
%             throw({msg, ?FRIEND_NO_LEGAL1, Sender});
%         #friend{} ->
%             case lists:member(FRoleId, Daily#daily.interact) of
%                 true ->
%                     throw({msg, ?FRIEND_NO_LEGAL2, Sender});
%                 _ -> ok
%             end,

%             RoleLevel = Role#role.level,
%             role_api:add_exp(exp(RoleLevel), Sender),
%             role_api:add_gold(gold(RoleLevel), Sender),

%             case goddess_misc:get_role_pid(FRoleId) of
%                 false ->
%                     case daily_db:get_other(FRoleId) of
%                         #daily{charm=Charm} = FDaily when Charm < 30  ->
%                             catch role_db:incr(FRoleId, <<"charm">>, 1),
%                             daily_db:save_other(FDaily#daily{charm=Charm+1});
%                         _ ->
%                             ?DEBUG_MSG("~p:~p save other daily error ~n", [?MODULE, ?LINE])
%                     end;
%                 Pid ->
%                     role_srv:send2role(Pid, {role_api, add_charm_with_limit, [1, 30]})
%             end,

%             Interact = [FRoleId | Daily#daily.interact],
%             game_info:update(Daily#daily{interact=Interact})
%     end,
%     living_api:interact(Sender),
%     notify(?FRIEND_INTERACT_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 推送
% push(#m__friend__push__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     RoleInfo = GameInfo#game_info.role,
%     RoleId = RoleInfo#role.role_id,
%     SceneId = RoleInfo#role.scene_id,

%     Roles = ets:select(?ETS_ONLINE_PLAYER, ets:fun2ms(
%         fun(#online{role=#role{scene_id=USceneId}}=O) when USceneId == SceneId -> O end
%     )),

%     case length(Roles) < 5 of
%         true ->
%             Roles1 = Roles ++
%             ets:select(?ETS_ONLINE_PLAYER, ets:fun2ms(
%                 fun(#online{role=#role{scene_id=USceneId}}=O) when USceneId  /= SceneId -> O end
%             ));
%         false ->
%             Roles1 = Roles
%     end,

% %%     List = ets:tab2list(?ETS_ONLINE_PLAYER),
% %%     Length = length(List),
% %%     case Length < 20 of
% %%         true ->
% %%             Roles = List;
% %%         false ->
% %%             Index = random:uniform(Length),
% %%             Roles = lists:sublist(List, Index, 20)
% %%     end,

%     FriendEtc = GameInfo#game_info.friends_etc,
%     Roles2 = [RoleX || #online{role=RoleX} <- Roles1],

%     Friends = friend_mod:build_list_push(FriendEtc#friend_etc.all, RoleId, Roles2),
%     Sender ! {send, #m__friend__push__s2c{friends=Friends}}.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% % 登陆缓存好友信息, 不存库
% new_friend_info(#role{role_id=RoleId}=R) ->
%     GameInfo = role_api:get_user_data(),
%     FriendEtc = GameInfo#game_info.friends_etc,

%     case lists:keyfind(RoleId, #f_role.role_id, FriendEtc#friend_etc.all) of
%         false ->
%             All = [friend_mod:role2f_role(R)|FriendEtc#friend_etc.all],
%             game_info:update(FriendEtc#friend_etc{all=All});
%         _ ->
%             false
%     end.

% update_friend_info(#role{role_id=RoleId}=R) ->
%     GameInfo = role_api:get_user_data(),
%     FriendEtc = GameInfo#game_info.friends_etc,
%     All = lists:keyreplace(RoleId, #f_role.role_id, FriendEtc#friend_etc.all, friend_mod:role2f_role(R)),
%     game_info:update(FriendEtc#friend_etc{all=All}).

% delete_friend_info(RoleId) ->
%     GameInfo = role_api:get_user_data(),
%     FriendEtc = GameInfo#game_info.friends_etc,
%     All = lists:keydelete(list_to_binary(RoleId), #f_role.role_id, FriendEtc#friend_etc.all),
%     game_info:update(FriendEtc#friend_etc{all=All}).


% % 上线
% online(Sender) ->
%     GameInfo = role_api:get_user_data(),
%     RoleId = GameInfo#game_info.role#role.role_id,
%     RoleName = GameInfo#game_info.role#role.role_name,
%     FollowersEtc = GameInfo#game_info.followers_etc,

%     list(#m__friend__list__c2s{}, Sender),


%     %% 给单向好友发送上线信息
%     F1 = fun(Fid) ->
%         role_srv:send2role(Fid, {?MODULE, online_other, [?NO, self(), RoleId, RoleName]})
%     end,

%     lists:foreach(F1, FollowersEtc#follower_etc.all).

% %%     Friends = GameInfo#game_info.friends,
% %%     %% 给好友发送上线消息
% %%     F2 =
% %%     fun(#friend{friend_id=Fid, state=State}) when State == ?FRIEND_GOOD ->
% %%             role_srv:send2role(
% %%                 Fid,
% %%                 {?MODULE, online_other, {?YES, self(), RoleId, RoleName}});
% %%        (_) -> ok
% %%     end,
% %%     lists:foreach(F2, Friends#friends.all).

% % 下线
% offline() ->
%     GameInfo = role_api:get_user_data(),
%     RoleName = GameInfo#game_info.role#role.role_name,
%     FollowersEtc = GameInfo#game_info.followers_etc,
%     F = fun(Fid) ->
%         role_srv:send2role(Fid, {?MODULE, offline_other, [RoleName]})
%     end,
%     lists:foreach(F, FollowersEtc#follower_etc.all).

% %%     Friends = GameInfo#game_info.friends,
% %%     F =
% %%         fun(#friend{friend_id=Fid}) ->
% %%             role_srv:send2role(
% %%                 Fid,
% %%                 {?MODULE, offline_other, {RoleName}});
% %%             (_) -> ok
% %%         end,
% %%     lists:foreach(F, Friends#friends.all).

% %% formula

% exp(Level) -> erlang:trunc(200 + Level * 1.5 * 40).
% gold(Level) -> erlang:trunc(5000 + Level * 1.2 * 100).



% %%%===================================================================
% %%% ipc call back
% %%%===================================================================

% %% @doc 被添加好友
% add_by_other(FRoleId, FRoleName, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     RoleId = GameInfo#game_info.role#role.role_id,
%     RoleName = GameInfo#game_info.role#role.role_name,

%     case RoleId /= FRoleId andalso lists:member(?FUN_ID, GameInfo#game_info.role#role.open_function) of
%         true ->
%             Friends = GameInfo#game_info.friends,
%             FriendInfo = friend_mod:info(Friends#friends.all, FRoleId),
%             case FriendInfo of
%                  false ->
%                      Sender ! {send, #m__friend__addbyother__s2c{name=FRoleName}},

%                      %% 追随者, 给它推送一个在线消息
%                      role_srv:send2role(FRoleId, {?MODULE, online_other, [?NO, false, RoleId, RoleName]}),

%                      %% 更新追随者
%                      FollowersEtc = GameInfo#game_info.followers_etc,
%                      FollowersEtc2 = FollowersEtc#follower_etc{all=[FRoleId | FollowersEtc#follower_etc.all]},
%                      game_info:update(FollowersEtc2);
%                 #friend{state=?FRIEND_GOOD} ->
%                      %% 双向好友, 给它推送一个在线消息
%                      role_srv:send2role(FRoleId, {?MODULE, online_other, [?NO, false, RoleId, RoleName]});
%                 _ ->
%                     ok
%             end;
%         false -> ok
%     end.

% %% @doc 被删除好友或加仇敌,更新追求者列表
% unfollow_by_other(FRoleId, _Sender) ->
%     GameInfo = role_api:get_user_data(),
%     case lists:member(?FUN_ID, GameInfo#game_info.role#role.open_function) of
%         false -> ok;
%         true ->
%             FollowersEtc = GameInfo#game_info.followers_etc,
%             All = FollowersEtc#follower_etc.all,
%             All2 = lists:filter(fun(I) -> I /= FRoleId end, All),
%             FollowersEtc2 = FollowersEtc#follower_etc{all=All2},
%             game_info:update(FollowersEtc2)
%     end.

% %% @doc 收到好友上线消息
% online_other(NeedReply, FRolePid, FRoleId, FRoleName, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     RoleId = GameInfo#game_info.role#role.role_id,
%     RoleName = GameInfo#game_info.role#role.role_name,
%     Friends = GameInfo#game_info.friends,

%     % 收到上线消息, 通知前端
%     % 如果是先收到别人的上线消息,需要发送自己的上线信息
%     % 收到回应的上线消息后,只通知前端
%     case friend_mod:is_friend(Friends#friends.all, FRoleId) of
%         true ->
%             Sender ! {send, #m__friend__online__s2c{name=FRoleName}},
%             if
%                 NeedReply == ?YES ->
%                 role_srv:send2role(FRolePid, {?MODULE, online_other, [?NO, self(), RoleId, RoleName]});
%                 true -> ok
%             end;
%         false ->
%             ok
%     end.

% %% @doc 收到下线消息
% offline_other(RoleName, Sender) ->
%     Sender ! {send, #m__friend__offline__s2c{name=RoleName}}.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% guard(false, Sender) -> throw({msg, ?FRIEND_NO_LEGAL3, Sender});
% guard(_, _) -> ok.

% guard(false, Code, Sender) -> throw({msg, Code, Sender});
% guard(_, _,  _) -> ok.

% %% mute_guard(false) -> throw(ignore);
% %% mute_guard(_) -> ok.

% handle_throw({msg, Code, Sender}) -> notify(Code, Sender);
% handle_throw(ignore) -> ok;
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
