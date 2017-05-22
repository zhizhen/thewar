%% Copyright
-module(group_pool_api).

% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("common.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").


% %% API
% -export([join/2, play/2, leave/2]).
% -export([gift/3]).
% -export([tick/3]).
% -export([scene_name/1, scene_name/2]).

% -export([handle_throw/1]).

% %% 进入瑶池的流程
% %%
% %% 普通地图id   20001
% %% 瑶池地图id   30001 固定
% %%
% %% m__group_pool__join__c2s   成功后往下走
% %% m__scene__enter__c2s 21000 进入瑶池场景
% %% 场景同步使用和普通场景同样的api
% %% m__group_pool__leave__c2s  离开瑶池
% %% m__scene__enter__c2s 30001 进去普通场景



% %% @doc 进入
% join(#m__group_pool__join__c2s{}, Sender) ->
%     #game_info{role=Role, group_member=GroupMember, group_pool=GroupPool} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,

%     intime(GroupId, Sender),

%     #group_act_ets{pool_time=PoolTime1} = group_master_srv:act_info(GroupId),

%     PoolTime = util:to_binary(PoolTime1),
%     case PoolTime /= GroupPool#group_pool.pool_id of
%         true ->
%             GroupPool2 = GroupPool#group_pool{pool_id=PoolTime, num=0},
%             game_info:update(GroupPool2);
%         false->
%             GroupPool2 = GroupPool
%     end,

%     case catch group_pool_srv:join(GroupId, Role#role.role_id) of
%         true ->
%             %% 更新挑战成就任务 帮会瑶池活动进入X次
%             challenge_api:update_task_process(?CHALLENGE_TYPE_GROUP_POOL_NUM, 0, 1), 
%             Sender ! {send, #m__group_pool__join__s2c{count=GroupPool2#group_pool.num}};
%         Other ->
%             ?DEBUG_MSG("===================~p ~n", [Other]),
%             notify(?GROUP_POOL_JOIN_FAIL, Sender)
%     end.

% play(#m__group_pool__play__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role=Role, group_member=GroupMember, group_pool=GroupPool} = role_api:get_user_data(),
%         #group_member{group_id=GroupId} = GroupMember,
%         Cfg = intime(GroupId, Sender),
%         #group_act_ets{pool_time=PoolTime1} = group_master_srv:act_info(GroupId),
%         PoolTime = util:to_binary(PoolTime1),
%         case PoolTime /= GroupPool#group_pool.pool_id of
%             true ->
%                 GroupPool2 = GroupPool#group_pool{pool_id=PoolTime, num=0};
%             false->
%                 GroupPool2 = GroupPool
%         end,
%         Num = GroupPool2#group_pool.num + 1,
%         case Num > Cfg#group_pool_cfg.count of
%             true ->
%                 Sender ! {send, #m__system__notify__s2c{code=?GROUP_POOL_MAX}};
%             false ->
%                 Power = Cfg#group_pool_cfg.palygain,
%                 case group_pool_srv:play(GroupId, Role#role.role_id) of
%                     true ->
%                         game_info:update(GroupPool2#group_pool{num=Num}),
%                         role_api:add_power(Power, Sender),
%                         Sender ! {send, #m__system__notify__s2c{code=?GROUP_POOL_PLAY_SUCC}};
%                     false ->
%                         Sender ! {send, #m__system__notify__s2c{code=?GROUP_POOL_NO_LEGAL1}}
%                 end
%         end
%     end,
%     ?PERFORM(F).

% leave(#m__group_pool__leave__c2s{}, Sender) ->
%     F = fun() ->
%     #game_info{role=Role, group_member=GroupMember} = role_api:get_user_data(),
%     #group_member{group_id=GroupId} = GroupMember,
%     _ = intime(GroupId, Sender),
%     group_pool_srv:leave(GroupId, Role#role.role_id)
%     end,
%     ?PERFORM(F).

% gift(power, Power, Sender) ->
%     ?DEBUG_MSG("add power !!!!!!!!!!!!!!!!!!~n"),
%     role_api:add_power(Power, Sender).


% intime(Id, Sender) ->
%     #groups_ets{level=Level} = group_master_srv:get_info(Id),
%     Cfg = group_pool_cfg:get(Level),
%     case group_mod:intime(Cfg#group_pool_cfg.starttime, Cfg#group_pool_cfg.endtime) of
%         false -> throw({msg, ?GROUP_POOL_NO_LEGAL1, Sender});
%         _ -> Cfg
%     end.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.


% tick(Act, Info, _Now) ->
% %%     ?DEBUG_MSG("~p : tick ==============", [?MODULE]),
%     PoolPid = Act#group_act_ets.pool_pid,
%     catch PoolPid ! tick,



%     Cfg = group_pool_cfg:get(Info#groups.level),
%     case group_mod:intime(Cfg#group_pool_cfg.starttime, Cfg#group_pool_cfg.endtime) of
%         true ->
%             case PoolPid == 0 orelse (not erlang:is_process_alive(PoolPid)) of
%                 true ->
%                     Gid = Act#group_act_ets.id,
%                     {ok, PoolPid2} = group_pool_srv:start_link(Gid),
%                     PoolTime = pre_date(Cfg#group_pool_cfg.starttime),

%                     {true, Act#group_act_ets{pool_pid=PoolPid2, pool_time=PoolTime}};
%                 false ->
%                     {false, Act}
%             end;
%         false ->
%             case PoolPid /= 0 andalso erlang:is_process_alive(PoolPid) of
%                 true ->
%                     case erlang:is_process_alive(PoolPid) of
%                         true -> PoolPid ! gameover;
%                         _ -> ok
%                     end,
%                     {true, Act#group_act_ets{pool_pid=0, pool_time=0}};
%                 false ->
%                     {false, Act}
%             end
%     end.

% scene_name(SceneId) ->
%     #game_info{group_member=G} = role_api:get_user_data(),
%     Gid = G#group_member.group_id,
%     scene_name(Gid, SceneId).

% scene_name(GroupId, SceneId) ->
%     erlang:list_to_atom("group_pool_" ++ util:to_list(GroupId) ++ util:to_list(SceneId)).

% pre_date(Str) ->
%     {Y, M, D} = erlang:date(),
%     lists:flatten(io_lib:format("~p-~p-~p ~p", [Y, M, D, Str])).
