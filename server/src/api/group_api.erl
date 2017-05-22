%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_api).
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("common.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").

% -include("logger.hrl").

% %% API
% -export([role_group/1]).
% -export([info/2, create/2, join/2, get_request/2, reply_request/2, leave/2, skipcd/2, close/2, close_cancel/2, close_by_other/4, tick/2]).
% -export([appoint/2, appoint_by_other/3, transfer/2, transfer_by_other/2, notice/2, value/2, list/2, list/1, train/2, members/2, post_check/3]).
% -export([invite/2, invite_by_other/6, invite_reply/2, kick/2, kick_by_other/5, mall/2, mall_list/2]).
% -export([join_fail/3, join_succ/3, handle_request/2]).
% -export([add_value/2]).
% -export([add_value_callback/3]).

% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% role_group(#game_info{role=Role, group_member=GroupMember, group_etc=GroupEtc}) ->
%     Requests = group_db:all_role_request(Role#role.role_id),
%     Default = #p_role_group{
%             groupid= 0,
%             title = "",
%             level = 0,
%             rank = 0,
%             exp = 0,
%             members = 0,
%             post= 0,
%             value_today = 0,
%             value = 0,
%             value_time = 0,
%             attrs = [],
%             requests = Requests,
%             master_id="",
%             master_name="",
%             close_time = 0,
%             notice="",
%             value_count = 0,
%             allvalue = 0,
%             group_cd = Role#role.group_cd
%     },
%     case GroupMember#group_member.group_id of
%         GroupId when GroupId /= <<"0">> ->
%             case group_master_srv:get_info(GroupId) of
%                 #groups_ets{title=Title, level=Level, exp=Exp, rank=Rank,
%                     master_id=MId, master_name=MName, members=Members,
%                     close_time=CT, notice=Notice} ->
%                     #p_role_group{
%                             groupid= GroupMember#group_member.group_id,
%                             title = Title,
%                             level = Level,
%                             rank = Rank,
%                             exp = Exp,
%                             members = Members,
%                             post= GroupEtc#group_state.post,
%                             value_today= GroupMember#group_member.value_today,
%                             value = GroupMember#group_member.value,
%                             value_time = GroupMember#group_member.value_time,
%                             attrs = GroupMember#group_member.attr_list,
%                             requests = Requests,
%                             master_id = MId,
%                             master_name = MName,
%                             close_time = CT,
%                             notice = Notice,
%                             value_count = GroupMember#group_member.value_count,
%                             allvalue = GroupMember#group_member.allvalue,
%                             group_cd = Role#role.group_cd
%                     };
%                 _ -> Default
%             end;
%         _ ->
%             Default
%     end.

% %% @doc
% info(#m__group__info__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Sender ! {send,
%     #m__group__info__s2c{
%         role_group = role_group(GameInfo)
%     }}.

% members(#m__group__members__c2s{}, Sender) ->
%     #game_info{group_member=GroupMember} = role_api:get_user_data(),
%     Sender ! {send, #m__group__members__s2c{members=[convert2p2(R) || R <- group_srv:members(GroupMember#group_member.group_id)]}}.


% list(#m__group__list__c2s{}, Sender) ->
%     Sender ! {send,
%     #m__group__list__s2c{
%         groups = [ convert2p(E) || E <- group_master_srv:all_group() ]
%     }}.

% list(Sender) ->
%     Sender ! {send,
%     #m__group__list__s2c{
%         groups = [ convert2p(E) || E <- group_master_srv:all_group() ]
%     }}.

% %% @doc 创建帮会 √
% create(#m__group__create__c2s{title=Title}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%         OldGroupId = util:to_binary(GroupMember#group_member.group_id),
%         if OldGroupId /= <<"0">> -> throw({msg, ?GROUP_NO_LEGAL1, Sender}); true -> ok end,
%         Pay = 100000,
%         case role_api:is_enough_gold(Pay) of
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> ok
%         end,

%         case group_master_srv:create(title(Title), Role#role.role_id, Role#role.role_name, GroupMember) of
%             false -> throw({msg, ?GROUP_NO_LEGAL2, Sender});
%             #group_member{} = GroupMember2 ->
%                 game_info:update(GroupMember2),
%                 game_info:update(#group_state{post=?POST_MANAGER1}),
%                 Sender ! {send, #m__group__create__s2c{groupid=GroupMember2#group_member.group_id}}
%         end,
%         role_api:pay_gold(Pay, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 搜索 undone
% %% search(#m__group__search__c2s{title=Title}, Sender) ->
% %%     case group_master_srv:search_by_title(title(Title)) of
% %%         [] -> Sender ! {send, #m__system__notify__s2c{code=?GROUP_SEARCH_NONE}};
% %%         L ->
% %%             Sender ! {send, #m__group__search__s2c{
% %%                 groups = [ convert2p(E) || E <- group_master_srv:all_group() ]
% %%             }}
% %%     end.

% join(#m__group__join__c2s{groupid=GroupId}, Sender) ->
%     #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%     OldGroupId = util:to_binary(GroupMember#group_member.group_id),
%     case OldGroupId == <<"0">> andalso ( Role#role.group_cd == 0 orelse Role#role.group_cd =< ?NOW) of
%         true ->
%             case group_srv:join(GroupId, Role) of
%                 full ->
%                     Sender ! {send, #m__system__notify__s2c{code=?GROUP_FULL}};
%                 _ ->
%                     Sender ! {send, #m__system__notify__s2c{code=?GROUP_JOIN_SUCC}}
%             end;
%         false ->
%             Sender ! {send, #m__system__notify__s2c{code=?GROUP_NO_LEGAL3}}
%     end.

% join_fail(GroupId, _Title, Sender) ->
%     Sender ! {send, #m__group__joinfail__s2c{groupid=GroupId}}.

% join_succ(GroupId, _Title, Sender) ->
%     #game_info{group_member=GroupMember} = role_api:get_user_data(),
%     case GroupMember#group_member.group_id == <<"0">> orelse GroupMember#group_member.group_id == 0 of
%         true ->
%             game_info:update(GroupMember#group_member{group_id=GroupId}),
%             game_info:update(#group_state{post=?POST_MEMBER}),
%             Sender ! {send, #m__group__join__s2c{groupid=GroupId}};
%         false -> ok
%     end.

% %%%  处理加入申请一类的
% get_request(#m__group__get_request__c2s{}, Sender) ->
%     F = fun() ->
%     #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     post_check(GroupEtc#group_state.post, #group_post_cfg.handle_request, Sender),
%         ?DEBUG_MSG("get_request ~p ~n", [GroupMember#group_member.group_id]),
%     L = group_srv:requests(GroupMember#group_member.group_id),
%     M = #m__group__request__s2c{ requests = [begin
%         #p_group_request{role_id=RoleId,role_name=RoleName, level=Level, job=Job, time=Time}
%         end || #group_member_ets{role_id=RoleId, role_name=RoleName, level=Level, job=Job, time=Time} <- L ] },
%     Sender ! {send, M}
%     end,
%     ?PERFORM(F).

% handle_request(#group_member_ets{role_id=RoleId, role_name=RoleName, level=Level, job=Job, time=Time}, Sender) ->
%     Sender ! {send, #m__group__request__s2c{requests=[#p_group_request{role_id=RoleId,role_name=RoleName, level=Level, job=Job, time=Time}]}}.

% %% @doc 回复申请
% reply_request(#m__group__reply_request__c2s{role_id=RoleId, reply=Reply}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%         OldGroupId = GroupMember#group_member.group_id,
%         if OldGroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,
%         post_check(GroupEtc#group_state.post, #group_post_cfg.handle_request, Sender),

%         case group_srv:reply_request(OldGroupId, RoleId, Reply) of
%             true ->
%                 Sender ! {send, #m__system__notify__s2c{code=?GROUP_REPLY_SUCC}};
%             full ->
%                 Sender ! {send, #m__system__notify__s2c{code=?GROUP_FULL}};
%             false ->
%                 Sender ! {send, #m__system__notify__s2c{code=?GROUP_REPLY_FAIL}}
%         end
%     end,
%     ?PERFORM(F).

% skipcd(#m__group__skipcd__c2s{}, Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     Pay = 500,
%     case  role_api:is_enough_coin(Pay) of
%         false ->
%             notify(?NO_MONEY, Sender);
%         true ->
%             role_api:pay_coin(Pay, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%             game_info:update(Role#role{group_cd=0}),
%             notify(?GROUP_SKIPCD_SUCC, Sender)
%     end.

% leave(#m__group__leave__c2s{}, Sender) ->
%     % check 帮主无法leave
%     #game_info{role=Role, group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{role_id=RoleId, group_id=GroupId} = GroupMember,

%     if GroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.leave, Sender),

%     Time = ?NOW+?CDTIME,
%     case group_srv:leave(GroupId, RoleId, Role#role.role_name) of
%         true ->
% %%             group_tree_db:clean_when_quit_group(RoleId),
%             group_tree_db:clean(RoleId),
%             game_info:update(Role#role{group_cd=Time}),
%             game_info:update(GroupMember#group_member{group_id = <<"0">>}),
%             game_info:update(#group_state{}),
%             notify(?GROUP_LEAVE_SUCC, Sender);
%         false ->
%             notify(?GROUP_NO_LEGAL4, Sender)
%     end.

% % @doc 解散
% close(#m__group__close__c2s{}, Sender) ->
%     #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.close, Sender),
%     Now = ?NOW,

%     case group_srv:close(GroupId, Now) of
%         false ->
%             notify(?GROUP_CLOSE_FAIL, Sender);
%         true ->
%             group_tree_db:clean(GroupId),
%             notify(?GROUP_CLOSE_SUCC, Sender)
%     end.

% % @doc 解散回调
% close_by_other(GroupId, ORoleId, Title, Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     game_info:update(#group_member{role_id=Role#role.role_id, group_id = <<"0">>}),

%     ORole = role_db:get(ORoleId),
%     TmpId = 7,
%     Default = chat_api:chat_content_template(),
%     Content = Default#chat_content{
%             role = #chat_role{role_id=ORoleId, role_name=ORole#role.role_name},
%             group = #groups{id=GroupId, title=Title}
%     },
%     Msg = chat_mod:make_msg(?CHAT_GROUP, TmpId, [], Content),
%     Sender ! {send, Msg}.

% %% @doc 取消解散
% close_cancel(#m__group__close_cancel__c2s{}, Sender) ->
%     #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.close, Sender),
%     group_srv:close_cancel(GroupId).

% % @doc 任命
% appoint(#m__group__appoint__c2s{role_id=ORoleId, post=OPost}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%         #group_member{group_id=GroupId} = GroupMember,
%         Post = GroupEtc#group_state.post,
%         ORole = role_db:get(ORoleId),

%         if ORoleId == GroupMember#group_member.role_id -> throw({msg, ?GROUP_NO_LEGAL5, Sender});
%             true -> ok end,

%         if GroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,

%         case OPost of
%             ?POST_MANAGER2 ->
%                 post_check(Post, #group_post_cfg.appoint1, Sender);
%             ?POST_MANAGER3 ->
%                 post_check(Post, #group_post_cfg.appoint2, Sender);
%             ?POST_MANAGER1 -> throw({msg, ?GROUP_NO_LEGAL6, Sender});
%             _ ->
%                 post_check(Post, #group_post_cfg.appoint3, Sender)
%         end,
%         case group_srv:appoint(GroupId, {ORoleId, ORole#role.role_name}, OPost) of
%             true ->
%                 notify(?GROUP_APPOINT_SUCC, Sender);
%             false ->
%                 notify(?GROUP_APPOINT_FAIL, Sender)
%         end
%     end,
%     ?PERFORM(F).

% appoint_by_other(_GroupId, Post, Sender) ->
%     game_info:update(#group_state{post=Post}),
%     Sender ! {send, #m__group__appointbyother__s2c{post=Post}}.


% % @doc 转让帮主
% transfer(#m__group__transfer__c2s{role_id=ORoleId}, Sender) ->
%     #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{role_id=RoleId, group_id=GroupId} = GroupMember,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.transfer, Sender),

%     OROle = role_db:get(ORoleId),
%     case ORoleId /= RoleId andalso group_srv:transfer(GroupId, RoleId, ORoleId, OROle#role.role_name) of
%         true ->
%             game_info:update(GroupEtc#group_state{post=?POST_MEMBER}),
%             group_srv:srv_broadcast(GroupId, #m__system__notify__s2c{code = ?GROUP_T_SUCC});
%         false ->
%             notify(?GROUP_T_FAIL, Sender)
%     end.

% transfer_by_other(transfer, Sender) ->
%     game_info:update(#group_state{post=?POST_MANAGER1}),
%     notify(?GROUP_T_BYOTHER, Sender).

% % @doc 发出邀请
% invite(#m__group__invite__c2s{role_id=ORoleId}, Sender) ->
%     F = fun() ->
%     #game_info{role=Role, group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{role_id=RoleId, group_id=GroupId} = GroupMember,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.invite, Sender),
%     case goddess_misc:get_role_pid(ORoleId) of
%         false ->
%             Sender ! {send, #m__system__notify__s2c{code=?GROUP_NO_LEGAL7}};
%         Pid ->
%             case group_srv:invite(GroupId, Pid, RoleId, Role#role.role_name, ORoleId) of
%                 full ->
%                     notify(?GROUP_FULL, Sender);
%                 _ ->
%                     notify(?GROUP_INVITE_SUCC, Sender)
%             end
%     end
%     end,
%     ?PERFORM(F).

% % @doc 接收到邀请
% invite_by_other(RoleId, RoleName, Id, Title, Srv, Sender) ->
%     #game_info{role=Role, hook=Hook} = role_api:get_user_data(),
%     game_info:update(hook, [Srv|Hook]),

%     Srv ! {ack, invite_by_other, Role#role.role_id},
%     Sender ! #m__group__invitebyother__s2c{
%         role_id=RoleId,
%         role_name=RoleName,
%         groupid=Id,
%         title=Title
%     }.

% add_value(Value, _Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember} = role_api:get_user_data(),
%         NewValue = GroupMember#group_member.value +  Value,
%         game_info:update(GroupMember#group_member{value=NewValue}),
%         group_srv:update_member(role_api:get_user_data())
%     end,
%     ?PERFORM(F).

% %% @doc
% invite_reply(#m__group__invite_reply__c2s{groupid=GroupId, reply=Reply}, Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     case group_srv:invite_reply(GroupId, Role#role.role_id, Reply) of
%         full ->
%             notify(?GROUP_FULL, Sender);
%         _ -> ok
%     end.

% % @doc 踢人 todo 职位检测
% kick(#m__group__kick__c2s{role_id=ORoleId}, Sender) ->
%     #game_info{role=Role, group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     case util:to_binary(ORoleId) == util:to_binary(Role#role.role_id) of
%         true -> ok;
%         false ->
%             #group_member{group_id=GroupId} = GroupMember,
%             post_check(GroupEtc#group_state.post, #group_post_cfg.kick, Sender),
%             group_srv:kick(GroupId, Role#role.role_id, Role#role.role_name, ORoleId)
%     end.

% kick_by_other(GroupId, _Title, RoleId, RoleName, Sender) ->
%     #game_info{group_member=GroupMember} = role_api:get_user_data(),
%     case util:to_binary(GroupMember#group_member.group_id) == GroupId of
%         true ->
%             game_info:update(#group_member{}),
%             Sender ! {send, #m__group__kick__s2c{
%                 role_id = RoleId,
%                 role_name = RoleName,
%                 groupid = GroupId
%             }};
%         false ->
%             false % !
%     end.

% %% @doc 公告栏
% notice(#m__group__notice__c2s{content=Content}, Sender) ->
%     F = fun() ->
%     #game_info{group_member=GroupMember, group_etc=GroupEtc} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,
%     post_check(GroupEtc#group_state.post, #group_post_cfg.notice, Sender),
%     group_srv:notice(GroupId, Content)
%     end,
%     ?PERFORM(F).

% %% @doc 捐献
% value(#m__group__value__c2s{id=Id}, Sender) ->
%     F = fun() ->
%         Cfg = group_value_cfg:get(Id),
%         if Cfg == false -> throw({msg, ?GROUP_VALUE_FAIL, Sender}); true -> ok end,
%         #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%         #group_member{group_id=GroupId, value_today=VT, value=V, value_count=VC, allvalue=VS} = GroupMember,
%         if VC >= Cfg#group_value_cfg.count -> throw({msg, ?GROUP_VALUE_FAIL, Sender}); true -> ok end,
%         if GroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,
%         case role_api:is_enough_gold(Cfg#group_value_cfg.gold) of
%             false -> throw({msg, ?NO_MONEY, Sender});
%             true -> role_api:pay_gold(Cfg#group_value_cfg.gold, Sender)
%         end,
%         Value = Cfg#group_value_cfg.value,
%         game_info:update(GroupMember#group_member{value_today=VT+Value, value=V+Value, value_time=?NOW, value_count=VC+1, allvalue=VS+Value}),
%         group_srv:value(GroupId, Role#role.role_id, Role#role.role_name, Cfg#group_value_cfg.exp),
%         group_srv:update_member(role_api:get_user_data()),
%         notify(?GROUP_VALUE_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% train(#m__group__train__c2s{attr_id=AttrId}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,
%         #groups_ets{level=GroupLevel} = group_master_srv:get_info(GroupId),
%         AttrList = GroupMember#group_member.attr_list,
%         case lists:keyfind(AttrId, #p_kv.k, AttrList) of
%             #p_kv{k=AttrId, v=Level} ->
%                 AttrList2 = AttrList;
%             false ->
%                 Level = 0,
%                 AttrList2 = [#p_kv{k=AttrId, v=0}|AttrList]
%         end,
%         NextLevel = Level+1,
%         Cfg = group_training_cfg:get({AttrId, NextLevel}),

%         if Cfg#group_training_cfg.group_level > GroupLevel ->
%             throw({msg, ?GROUP_NO_LEGAL16, Sender});
%             true -> ok
%         end,

%         if Cfg == false -> throw({msg, ?GROUP_NO_LEGAL8, Sender}); true -> ok end,

%         NeedValue = Cfg#group_training_cfg.value,
%         UValue = GroupMember#group_member.value,
%         if UValue < NeedValue -> throw({msg, ?GROUP_NO_LEGAL9, Sender}); true -> ok end,

%         AttrList3 = lists:keyreplace(AttrId, #p_kv.k, AttrList2, #p_kv{k=AttrId, v=NextLevel}),
%         UValue2 = UValue - NeedValue,
%         game_info:update(GroupMember#group_member{value=UValue2, attr_list=AttrList3}),
%         group_srv:update_member(role_api:get_user_data()),

%         notify(?GROUP_TRAIN_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc mall
% mall(#m__group__mall__c2s{item_id=ItemId, num=Num}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, group_member=GroupMember, daily=Daily} = role_api:get_user_data(),
%         GroupId = GroupMember#group_member.group_id,
%         if GroupId == 0 -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,
%         #groups_ets{level=GroupLevel} = group_master_srv:get_info(GroupId),
%         Cfg = group_mall_cfg:get({GroupLevel, ItemId}),
%         if Cfg == false -> throw({msg, ?GROUP_NO_LEGAL10, Sender}); true -> ok end,
%         % if GroupLevel /= Cfg#group_mall_cfg.guildlevel ->
%         %     throw({msg, ?GROUP_NO_LEGAL11, Sender});
%         %     true -> ok end,

%         Count = Cfg#group_mall_cfg.count,

%         GroupBuy = Daily#daily.group_buy,
%         ?DEBUG_MSG("~p ~n", [{count, Count, groupbuy, GroupBuy}]),

%         case lists:keyfind(ItemId, #p_kv.k, GroupBuy) of
%             #p_kv{v=V} ->
%                 case (V+Num) > Count of
%                     false -> ok;
%                     true ->
%                         throw({msg, ?GROUP_NO_LEGAL12, Sender})
%                 end,
%                 GroupBuy2 = GroupBuy;
%             false when Num > Count ->
%                 V = 0, GroupBuy2 = GroupBuy,
%                 throw({msg, ?GROUP_NO_LEGAL12, Sender});
%             false ->
%                 V = 0,
%                 GroupBuy2 = [#p_kv{k=ItemId, v=V}|GroupBuy]
%         end,

%         case package_api:check_slots_enough(Num, ItemId) of
%             fasle ->
%                 throw({msg, ?GROUP_NO_LEGAL13, Sender});
%             _ -> ok
%         end,

%         ItemCfg = item_cfg:get(ItemId),
%         SNum = ItemCfg#item_cfg.stack_num,
%         Div = Num div SNum,
%         Rem = Num rem SNum,
%         Item = #item{
%                 role_id = Role#role.role_id,
%                 item_id = ItemId
%         },

%         NeedValue = Cfg#group_mall_cfg.value,

%         UValue = GroupMember#group_member.value,
%         if UValue < NeedValue ->
%             throw({msg, ?GROUP_NO_LEGAL14, Sender}); true -> ok end,
%         UValue2 = UValue - NeedValue,

%         GroupBuy3 = lists:keyreplace(ItemId, #p_kv.k, GroupBuy2, #p_kv{k=ItemId, v=V+Num}),
%         Daily2 = Daily#daily{group_buy=GroupBuy3},

%         item_api:add_items([Item#item{num = SNum} || _ <- lists:seq(1, Div)] ++ [Item#item{num = Rem}]),
%         game_info:update(GroupMember#group_member{value=UValue2}),
%         group_srv:update_member(role_api:get_user_data()),
%         game_info:update(Daily2),
%         notify(?GROUP_MALL_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% mall_list(#m__group__mall_list__c2s{}, Sender) ->
%     #game_info{daily=Daily} = role_api:get_user_data(),
%     Sender ! {send, #m__group__mall_list__s2c{list=Daily#daily.group_buy}}.


% tick(Now, #group_info{id=Id, info=Info, mstate=Mstate}=State) ->
%     #groups{title=Title, close_time=CTime} = Info,
%     case CTime /= 0 andalso CTime =< Now of
%         true ->
%             MRoleId = Info#groups.master_id,
%             [begin
%                 role_srv:send2role(RoleId, {group_api, close_by_other, [Id, MRoleId, Title]})
%             end || #group_state{role_id=RoleId} <- Mstate],
%             group_db:clean(Id),
%             group_boss_db:delete(Id),
%             gen_server:cast(group_master_srv, {srv_stop, Id}),
%             {stop, State};
%         false ->
%             {run, State}
%     end.

% add_value_callback(Num, Now, Sender) ->
%     #game_info{group_member=GroupMember} = role_api:get_user_data(),
%     ValueToday = GroupMember#group_member.value_today,
%     Value = GroupMember#group_member.value,
%     All = GroupMember#group_member.allvalue,
%     game_info:update(GroupMember#group_member{value=Value+Num, value_today=ValueToday+Num, value_time=Now, allvalue=All+Num}),
%     group_srv:update_member(role_api:get_user_data()),
%     Sender ! {send, #m__group__addvalue__s2c{value=Value+Num, value_today=ValueToday+Num, allvalue=All}}.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% title(Title) ->
%     Extension = string:concat(".s", util:to_list(goddess_env:server_id())),
%     S = string:concat(util:to_list(Title), util:to_list(Extension)),
%     erlang:list_to_binary(S).

% post_check(Post, Index, Sender) ->
%     Cfg = group_post_cfg:get(Post),
%     case element(Index, Cfg) of
%         0 -> throw({msg, ?GROUP_NO_LEGAL15, Sender});
%         _ -> ok
%     end.

% convert2p(#groups_ets{}=R) ->
%     #p_group_info{
%         groupid = R#groups_ets.id,
%         title = R#groups_ets.title,
%         level = R#groups_ets.level,
%         members = R#groups_ets.members,
%         rank = R#groups_ets.rank
%     }.

% convert2p2(#group_member_ets{}=R) ->
%     #p_group_member{
%         role_id = R#group_member_ets.role_id,
%         role_name = R#group_member_ets.role_name,
%         level = R#group_member_ets.level,
%         post = if R#group_member_ets.post == 0 -> ?POST_MEMBER; true -> R#group_member_ets.post end,
%         job = R#group_member_ets.job,
%         value_today = R#group_member_ets.value_today,
%         value = R#group_member_ets.value,
%         value_time = R#group_member_ets.value_time,
%         allvalue = R#group_member_ets.allvalue,
%         fight = R#group_member_ets.fight
%     }.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

