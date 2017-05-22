%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(gm_api).

% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").

% %% API
% -compile([export_all]).

% open_function(_FuncId) ->
%     ok.

% %%%===================================================================
% %%% TCP API
% %%%===================================================================
% handle(#m__gm__handle__c2s{packet=Packet}, _Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     case Role#role.role_type of
%         ?PLAYER -> false;
%         ?GM ->
%             try
%                 case get_cmd_parm(socket, Packet) of
%                     [Cmd, Param] ->
%                         handle_socket(util:to_atom(Cmd), Param, _Sender);
%                     _ ->
%                         _Sender ! {send, #m__system__notify__s2c{code=?PARAMS_ERROR}}
%                 end
%             catch
%                 throw:Reason ->
%                     ?DEBUG_MSG("Throw out the Shit Reason!:~p~n", [Reason]),
%                     Reason
%             end
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% %%--------------------------------------------------------------------
% %% @doc
% %% 解析出协议和参数
% %% @end
% %%--------------------------------------------------------------------
% get_cmd_parm(socket, Packet) ->
%     PacketList = string:to_lower(util:to_list(Packet)),
%     case string:str(PacketList, " ") of
%         0 ->
%             no_cmd;
%         N ->
%             [string:substr(PacketList, 1, N-1), string:substr(PacketList, N+1)]
%     end.

% handle_socket(Cmd, Param, Sender) ->
%     Parms = util:trans_http_parms(Param),
%     apply(gm_api, Cmd, [Parms, Sender]).

% %%-----------------socket gm-------------------------------------------------------

% gm_item(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     ItemId = util:to_integer(util:get_field(Param, "item_id")),
%     Num = util:to_integer(util:get_field(Param, "num", 1)),
%     Quality = util:to_integer(util:get_field(Param, "quality", 1)),
%     Level = util:to_integer(util:get_field(Param, "level", 1)),
%     Item = #item{role_id=RoleId, item_id=ItemId, num=Num, quality=Quality, level=Level},
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, item_api, add_items, [[Item]]}
%     end.

% gm_skill(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     SkillId = util:to_integer(util:get_field(Param, "skill_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, skill_api, add, [SkillId]}
%     end.

% gm_value(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     Type = util:to_integer(util:get_field(Param, "type")),
%     Num = util:to_integer(util:get_field(Param, "num")),
%     case get_mod_func(Type) of
%         false -> false;
%         {Mod, Func} ->
%             case goddess_misc:get_role_pid(RoleId) of
%                 false -> false;
%                 PidName -> PidName ! {process, Mod, Func, [Num]}
%             end
%     end.

% get_mod_func(?EXP)      -> {role_api, add_exp};
% get_mod_func(?GOLD)     -> {role_api, add_gold};
% get_mod_func(?COIN)     -> {role_api, add_coin};
% get_mod_func(?POWER)    -> {role_api, add_power};
% get_mod_func(?VIP_EXP)  -> {role_api, add_vip_exp};
% get_mod_func(?HONOR)    -> {role_api, add_honor};
% get_mod_func(?VIGOR)    -> {role_api, add_vigor};
% get_mod_func(?FEATS)    -> {role_api, add_feats};
% get_mod_func(?POWER2)   -> {role_api, change_power2};
% get_mod_func(?WARRIOR_SOUL1)-> {warrior_api, add_soul1};
% get_mod_func(?WARRIOR_SOUL2)-> {warrior_api, add_soul2};
% get_mod_func(_)         -> false.

% open_function(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     FuncId = util:to_integer(util:get_field(Param, "func_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, role_api, gm_open_function, [FuncId]}
%     end.

% gm_scene(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     SceneId = util:to_integer(util:get_field(Param, "scene_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, role_api, gm_open_scene, [SceneId]}
%     end.

% jump_mission(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     MissionId = util:to_integer(util:get_field(Param, "mission_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, role_api, gm_jump_mission, [{RoleId, MissionId}]}
%     end.

% quest_submit(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     QuestType = util:to_integer(util:get_field(Param, "quest_type")),
%     QuestId = util:to_integer(util:get_field(Param, "quest_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, role_api, gm_quest_submit, [{QuestType, QuestId}]}
%     end.

% change_story(Param, _Sender) ->
%     RoleId = util:to_list(util:get_field(Param, "role_id")),
%     StoryId = util:to_integer(util:get_field(Param, "story_id")),
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         PidName -> PidName ! {process, role_api, gm_change_story, [StoryId]}
%     end.
