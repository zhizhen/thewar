%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 魅力值系统
%%% @end
%%% Created : 2013-8-26 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(charm_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% %% PROTO API
% -export([self/2, info/2, interact/2, interactinfo/2]).
% %% PROCESS API
% -export([interact/5, interacted/5, handle_throw/1, open_function/1]).

% -define(OBJECTS, [?CHARM_FLOWER, ?CHARM_EGG]).
% %%%===================================================================
% %%% PROTO API
% %%%===================================================================
% self(#m__charm__self__c2s{}, Sender) ->
%     #game_info{role = Role} = role_api:get_user_data(),
%     RoleId = Role#role.role_id,
%     Flower = Role#role.flower,
%     Egg = Role#role.egg,

%     Flogs = charm_db:get(RoleId, ?CHARM_FLOWER),
%     Elogs = charm_db:get(RoleId, ?CHARM_EGG),

%     Pflower = charm_mod:build_p_charm(Flower, Flogs),
%     Pegg = charm_mod:build_p_charm(Egg, Elogs),
%     Data = #m__charm__self__s2c{flower = Pflower, egg = Pegg},
%     Sender ! {send, Data}.

% info(#m__charm__info__c2s{role_id = RoleId, object = Object}, Sender) ->
%     F = fun() ->
%         #game_info{role = _SelfRole} = role_api:get_user_data(),
%         GameInfo = role_mod:get_other_data(RoleId),
%         common_guard(GameInfo, ?CHARM_PARAMS_ERROR1, "", Sender),

%         #game_info{role = Role} = GameInfo,

%         P = lists:member(Object, ?OBJECTS),
%         common_guard(P, ?CHARM_PARAMS_ERROR2, "", Sender),

%         #game_info{daily = Daily} = role_api:get_user_data(),
%         {Total, Limit} = case Object of
%             ?CHARM_FLOWER -> {Role#role.flower, Daily#daily.flower < 1};
%             ?CHARM_EGG -> {Role#role.egg, Daily#daily.egg < 1}
%         end,
%         Logs = charm_db:get(RoleId, Object),
%         PLog = charm_mod:build_p_charm(Total, Logs),
%         State = case Limit of
%             false -> 0;
%             true -> 1
%         end,
%         Data = #m__charm__info__s2c{
%             role_id = RoleId, 
%             role_name = Role#role.role_name, 
%             job = Role#role.job, 
%             state = State, 
%             object = PLog
%         },
%         Sender ! {send, Data}
%     end,
%     ?PERFORM(F).

% interact(#m__charm__interact__c2s{role_id = RoleId, object = Object, num = Num}, Sender) ->
%     F = fun() ->
%         #game_info{role = My, daily = Daily} = role_api:get_user_data(),
%         P = util:to_integer(My#role.role_id) =/= util:to_integer(RoleId) andalso lists:member(Object, ?OBJECTS),
%         common_guard(P, ?CHARM_PARAMS_ERROR3, "", Sender),

%         Limit = case Object of
%             ?CHARM_FLOWER -> 
%                 VipCfg = viprelate_cfg:get(My#role.vip),
%                 Daily#daily.flower < VipCfg#viprelate_cfg.send_flower_times;
%             ?CHARM_EGG -> Daily#daily.egg < 1
%         end,
%         Err2 = "charm daily limit !",
%         common_guard(Limit, ?CHARM_PARAMS_ERROR4, Err2, Sender),

%         Cfg = charm_cfg:get({Object, Num}),
%         Err3 = "charm cfg not found!",
%         common_guard(Cfg, ?CHARM_PARAMS_ERROR5, Err3, Sender),

%         Gcheck = role_api:is_enough_gold(Cfg#charm_cfg.gold),
%         Ccheck = role_api:is_enough_coin(Cfg#charm_cfg.coin),
%         Consume = Gcheck andalso Ccheck,
%         common_guard(Consume, ?NO_MONEY, "", Sender),

%         case goddess_misc:get_role_pid(RoleId) of
%             false -> interact(Object, Num, Cfg, My, RoleId);
%             Pid -> Pid ! {process, charm_api, interacted, [Object, Num, Cfg, My]}
%         end,

%         RoleName = role_db:get_role_name_by_id(RoleId),
%         case Object of
%             ?CHARM_FLOWER ->
%                 Flower = Daily#daily.flower + 1,
%                 case Num == 9 orelse Num == 99 of
%                     true ->
%                         broadcast(My#role.role_id, My#role.role_name, RoleId, RoleName, Num);
%                     false -> ok
%                 end,
%                 game_info:update(Daily#daily{flower = Flower});
%             ?CHARM_EGG ->
%                 Egg = Daily#daily.egg + 1,
%                 game_info:update(Daily#daily{egg = Egg})
%         end,

%         role_api:pay_gold(Cfg#charm_cfg.gold, Sender),
%         role_api:pay_coin(Cfg#charm_cfg.coin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         role_api:add_charm(Cfg#charm_cfg.self_charm, Sender),

%         notify(?CHARM_SEND_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).


% broadcast(RoleId, RoleName, RoleId2, RoleName2, Num) ->
%     TmpId = 11,
%     Content = #chat_content{
%             content = <<"">>,
%             role = #chat_role{role_id=RoleId, role_name=RoleName},
%             role2 = #chat_role{role_id=RoleId2, role_name=RoleName2},
%             num = Num
%     },
%     Msg = chat_mod:make_msg(?CHAT_SYS, TmpId, [], Content),
%     broadcast_api:server(Msg).

% interactinfo(#m__charm__interactinfo__c2s{}, Sender) ->
%     #game_info{role = Role} = role_api:get_user_data(),
%     RoleId = Role#role.role_id,
%     F = Role#role.flower,
%     E = Role#role.egg,
%     Logs = charm_db:getinfo(RoleId, ?CHARM_LOG_NOT_INFO),
%     Plogs = charm_mod:build_p_charm_log(Logs),
%     Data = #m__charm__interact__s2c{flower = F, egg = E, logs = Plogs},
%     Sender ! {send, Data},
    
%     charm_db:update(Logs),
%     charm_db:clear(RoleId).
% %%%===================================================================
% %%% PROCESS API
% %%%===================================================================
% interact(Object, Num, Cfg, My, RoleId) ->

%     CharmLog = #charm_log{
%         sender=My#role.role_id,
%         time=util:unixtime(),
%         receiver=RoleId,
%         sender_name=My#role.role_name,
%         sender_job=My#role.job,
%         object=Object,
%         num=Num,
%         state=?CHARM_LOG_NOT_INFO
%     },
%     charm_db:create(CharmLog),
%     role_db:incr(RoleId, charm, Cfg#charm_cfg.charm),

%     case Object of
%         ?CHARM_FLOWER -> role_db:incr(RoleId, flower, Num);
%         ?CHARM_EGG -> role_db:incr(RoleId, egg, Num)
%     end.

% interacted(Object, Num, Cfg, Role, Sender) ->
%     #game_info{role = My} = role_api:get_user_data(),
%     case Object of
%         ?CHARM_FLOWER ->
%             Flower = My#role.flower + Num,
% %%             Charm = My#role.charm + Cfg#charm_cfg.charm,
%             game_info:update(My#role{flower = Flower}),
%             role_api:add_charm(Cfg#charm_cfg.charm, Sender);
%         ?CHARM_EGG ->
%             Egg = My#role.egg + Num,
%             Charm = erlang:max(0, My#role.charm + Cfg#charm_cfg.charm),
%             game_info:update(My#role{egg = Egg, charm = Charm})
%     end,

%     #game_info{role = MyFinal} = role_api:get_user_data(),
%     #role{flower = F, egg = E} = MyFinal,

%     CharmLog = #charm_log{
%         sender=Role#role.role_id,
%         time=util:unixtime(),
%         receiver=My#role.role_id,
%         sender_name=Role#role.role_name,
%         sender_job=Role#role.job,
%         object=Object,
%         num=Num,
%         state=?CHARM_LOG_INFOED
%     },
%     charm_db:create(CharmLog),
    
%     Logs = [#p_charm_log{
%             role_id = Role#role.role_id,
%             role_name = Role#role.role_name,
%             job = Role#role.job,
%             time = util:unixtime(),
%             object = Object,
%             num = Num
%         }],
%     Data = #m__charm__interact__s2c{flower = F, egg = E, logs = Logs},
%     Sender ! {send, Data}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) -> ok.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({shop_guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({charm_guard_error, Reason}) ->
%     ?ERROR_MSG("charm_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
