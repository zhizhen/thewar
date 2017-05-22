%% Copyright
-module(group_meeting_api).
-author("snow").

% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("common.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% %% API
% -export([info/2, join/2, succ/2]).
% -export([tick/3]).

% -export([handle_throw/1]).

% info(#m__group_meeting__info__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{group_member=GroupMember, group_role_meeting=GroupRoleMeeting} = role_api:get_user_data(),
%         #group_member{group_id=GroupId} = GroupMember,
%         if GroupId == <<"0">> -> throw({msg, ?GROUP_ID_FAIL, Sender}); true -> ok end,

%         #groups_ets{level=Level} = group_master_srv:get_info(GroupId),
%         Cfg = group_meeting_cfg:get(Level),

%         case GroupId of
%             0 -> notify(?GROUP_ID_FAIL, Sender);
%             _ ->
%                 #group_act_ets{meeting=Meeting} = group_master_srv:act_info(GroupId),
%                 case Meeting#group_meeting.cd of
%                     0 -> Cd = 0;
%                     O -> Cd = O + Cfg#group_meeting_cfg.cd
%                 end,
%                 Sender ! {send, #m__group_meeting__info__s2c{
%                         cd=Cd,
%                         gift_count = GroupRoleMeeting#group_role_meeting.gift,
%                         role_ids=Meeting#group_meeting.roles}}
%         end
%     end,
%     ?PERFORM(F).

% join(#m__group_meeting__join__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%         #group_member{group_id=GroupId} = GroupMember,
%         if GroupId == 0 -> throw({msg, ?GROUP_METTING_NO_LEGAL1, Sender}); true -> ok end,

%         #groups_ets{level=Level} = group_master_srv:get_info(GroupId),
%         Cfg = group_meeting_cfg:get(Level),

%         #group_act_ets{meeting=Meeting} = group_master_srv:act_info(GroupId),

%         % still cd
%         case Meeting#group_meeting.cd /=0 andalso ?NOW < Meeting#group_meeting.cd+Cfg#group_meeting_cfg.cd of
%             true ->
%                 throw({msg, ?GROUP_MEETING_FAIL, Sender});
%             false -> ok
%         end,

%         case group_srv:join_meeting(GroupId, Role#role.role_id) of
%             true2 ->
%                 %% 更新挑战成就任务 帮会聚义X
%                 challenge_api:update_task_process(?CHALLENGE_TYPE_GROUP_MEETING_NUM, 0, 1),
%                 ok;
%             true ->
%                 challenge_api:update_task_process(?CHALLENGE_TYPE_GROUP_MEETING_NUM, 0, 1), 
%                 notify(?GROUP_MEETING_SUCC, Sender);
%             _Other ->
%                 notify(?GROUP_MEETING_FAIL, Sender)
%         end
%     end,
%     ?PERFORM(F).


% succ(meeting_succ, Sender) ->
%     notify(?GROUP_MEETING_SUCC2, Sender),
%     #game_info{group_member=GroupMember, group_role_meeting=RoleMeeting} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,
%     #groups_ets{level=Level} = group_master_srv:get_info(GroupId),
%     Cfg = group_meeting_cfg:get(Level),
%     Gift = RoleMeeting#group_role_meeting.gift,
%     case Gift >= Cfg#group_meeting_cfg.count of
%         true ->
%             ok;
%         false ->
%             Now = ?NOW,
%             group_api:add_value_callback(Cfg#group_meeting_cfg.value, Now, Sender),
%             game_info:update(RoleMeeting#group_role_meeting{gift=Gift+1, times=Now})
%     end.


% tick(Act, Info, Now) ->
% %%     ?DEBUG_MSG("~p : tick ==============", [?MODULE]),
%     Cfg = group_meeting_cfg:get(Info#groups.level),
%     Meeting = Act#group_act_ets.meeting,

%     Cd = Meeting#group_meeting.cd,

%     case Cd /= 0 andalso Cd + Cfg#group_meeting_cfg.cd < Now of
%         true ->
%             {true, Act#group_act_ets{meeting=#group_meeting{}}};
%         false ->
%             case Cd == 0 of
%                 true ->
%                     {false, Act};
%                 false ->
%                     case util:is_today(Cd) of
%                         true -> {false, Act};
%                         false ->
%                             {true, Act#group_act_ets{meeting=#group_meeting{}}}
%                     end
%             end
%     end.


% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
