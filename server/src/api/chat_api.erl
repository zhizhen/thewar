%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-6-3 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(chat_api).

% -include("game_pb.hrl").
% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% %% API
% -export([chat/2]).

% %% 玩家状态触发
% -export([chat_content_template/0]).

% %% call back
% -export([person_by_other/3]).
% -export([notice/2]).

% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %% @doc 聊天
% chat(#m__chat__chat__c2s{channel=Chan, content=Content, role_id=FRoleId, ids=Ids}, Sender) ->
%     F = fun() ->
%         len_guard(Content, Sender),
%         ItemList = item_infos(Ids, Sender),
%         case Chan of
%             ?CHAT_WORLD -> world(Content, ItemList, Sender);
%             ?CHAT_PERSON -> person(Content, ItemList, FRoleId, Sender);
%             ?CHAT_GROUP -> group(Content, ItemList);
%             ?CHAT_GUILD -> guild();
%             _ -> ok
%         end
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% handle
% %%%===================================================================

% % template id 根据配置 写死的

% %% @doc 世界
% world(Content, ItemList, Sender) ->
%     world_pre_handle(Sender),
%     ChatContent = chat_content_template(Content),
%     Msg = chat_mod:make_msg(?CHAT_WORLD, ItemList, ChatContent),
%     broadcast_api:server(Msg, Sender).

% %% @doc 私人
% person(Content, ItemList, FRoleId, Sender) ->
%     person_pre_handle(FRoleId, Sender),
%     ChatContent = chat_content_template(Content),
%     Msg = chat_mod:make_msg(?CHAT_PERSON, 3, ItemList, ChatContent),

%     RoleId = ChatContent#chat_content.role#chat_role.role_id,
%     role_srv:send2role(FRoleId, {?MODULE, person_by_other, [RoleId, Msg]}).

% %% @doc 公告回调
% notice({Type, Content}, Sender) ->
%     ChatContent = #chat_content{
%             content=Content
%     },
%     TmpId = Type,
%     Msg = chat_mod:make_msg(?CHAT_SYS, TmpId, [], ChatContent),
%     Sender ! {send, Msg}.


% %% @doc 帮派
% group(Content, ItemList) ->
% % 取当前队伍的role id 列表, 然后发送
%     #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%     case GroupMember#group_member.group_id of
%         0 -> ok;
%         Id ->
%             ChatContent = chat_content_template(Content),
%             Msg = chat_mod:make_msg(?CHAT_GROUP, 1, ItemList, ChatContent),
%             group_srv:chat(Id, Msg, Role#role.role_id)
%     end,
%     ok.

% %% @doc 帮会
% guild() ->
%     % 取帮会成员role id列表, 然后发送
%     ok.
% %%%===================================================================
% %%% pre handle
% %%%===================================================================

% %% 默认聊天模板初始化数据
% chat_content_template() ->
%     chat_content_template(<<"">>).
% chat_content_template(Content) ->
%     GameInfo = role_api:get_user_data(),
%     #role{role_id=RoleId, role_name=RoleName, vip=Vip} = GameInfo#game_info.role,
%     %% 初始化,随着广播内容的增加,这里需要进行修改
%     #chat_content{
%             content=Content,
%             role=#chat_role{role_name=RoleName, role_id=RoleId},
%             vip = Vip
%     }.

% %% 世界
% world_pre_handle(Sender) ->
%     ban_guard(Sender),
%     cd_guard(Sender),
% %%     case daily_check(?CHAT_WORLD_LIMIT) of
% %%         false ->
% %%             throw({msg, ?CHAT_WORLD_MAX, Sender}),
% %%             ok;  %% todo 消耗道具
% %%         true -> ok
% %%     end,
% %%     daily_update(),
%     chat_set_cd().

% %% 私人
% person_pre_handle(FRoleId, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Friends = GameInfo#game_info.friends,

%     % 不能给仇敌发消息
%     case friend_mod:is_enemy(Friends#friends.all, FRoleId) of
%         true -> throw({msg, ?CHAT_NO_LEGAL1, Sender});
%         false -> ok
%     end,

%     FProcName = goddess_misc:role_process_name(FRoleId),
%     case whereis(FProcName) of
%         undefined -> throw({msg, ?FRIEND_OFFLINE, Sender});
%         Pid ->
%             case is_process_alive(Pid) of
%                 false ->
%                     throw({msg, ?FRIEND_OFFLINE, Sender});
%                 true -> ok
%             end
%     end.

% %%%===================================================================
% %%% callback
% %%%===================================================================
% person_by_other(FRoleId, Msg, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Friends = GameInfo#game_info.friends,
%     case friend_mod:is_enemy(Friends#friends.all, FRoleId) of
%         true ->
%             % 收到仇敌的消息
%             ok;
%         false ->
%             Sender ! {send, Msg}
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% % 获取物品信息列表
% item_infos(Ids, Sender) ->
%     [begin
%         case item_api:get_info_by_id(Id, [?ITEM_AVAILABLE, ?ITEM_USE]) of
%             false -> throw({msg, ?CHAT_NO_LEGAL2, Sender});
%             ItemInfo ->
%                 ItemId = ItemInfo#item.item_id,
%                 #p_item2{id=Id, item_id=ItemId}
%         end
%     end || Id <- Ids].

% % 禁言
% ban_guard(Sender) ->
%     case ban_chat_api:is_banned() of
%         true -> throw({msg, ?CHAT_NO_LEGAL3, Sender});
%         false -> ok
%     end.

% % 冷却
% cd_guard(Sender) ->
%     case chat_is_cd() of
%         true -> throw({msg, ?CHAT_NO_LEGAL4, Sender});
%         false -> ok
%     end.

% % 长度
% len_guard(Content, Sender) ->
%     L = erlang:length(Content),
%     case L > 0 andalso L =< 90 of
%         false -> throw({msg, ?CHAT_NO_LEGAL5, Sender});
%         true -> ok
%     end.

% %% % 发言次数
% %% daily_check(Limit) ->
% %%     GameInfo = role_api:get_user_data(),
% %%     Daily = GameInfo#game_info.daily,
% %%     Daily#daily.chat < Limit.
% %%
% %% daily_update() ->
% %%     GameInfo = role_api:get_user_data(),
% %%     Daily = GameInfo#game_info.daily,
% %%     Chat = Daily#daily.chat,
% %%     Daily1 = Daily#daily{chat=Chat+1},
% %%     game_info:update(Daily1).

% %% cd
% chat_is_cd() ->
%     case cache:find_other(?MODULE, chat_cd) of
%         false -> false;
%         #chat_cd{time=T} ->
%             D = timer:now_diff(erlang:now(), T) / 1000,
%             if
%                 D > ?CHAT_CD ->
%                     false;
%                 true -> true
%             end
%     end.

% chat_set_cd() ->
%     cache:insert_other(?MODULE, #chat_cd{time=erlang:now()}).

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
