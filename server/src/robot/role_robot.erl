%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(role_robot).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("robot.hrl").
% -export([
%         list/1,
%         create/1,
%         login/1,
%         update_attr/1,
%         logout/0
%     ]).

% list(#m__role__list__s2c{role_list=[]}) ->
%     ?PRINT("Oh ! none role, I will create one .~n"),
%     Name = util:to_list(robot:get_robot(account_id)),
%     Job = 10001,
%     Data = #m__role__create__c2s{job = Job, name = Name},
%     robot:send2server(robot:get_robot(pid), Data);

% list(#m__role__list__s2c{role_list=[#p_base_role{role_id = RoleId}|_Rest]}) ->
%     ?PRINT("Yes ! I will choose one role and login in!~n"),
%     Data = #m__role__login__c2s{role_id = RoleId},
%     robot:send2server(robot:get_robot(pid), Data).


% create(#m__role__create__s2c{role_id = RoleId}) ->
%     ?PRINT("Yes, roleId:~p was created, I will login in!~n",[RoleId]),
%     Data = #m__role__login__c2s{role_id = RoleId},
%     robot:send2server(robot:get_robot(pid), Data).

% login(#m__role__login__s2c{equip_info=EI,package_info = PI}) ->
%     robot:put_robot(equip, EI),
%     robot:put_robot(package, PI),
%     entry_map().

% logout() ->
%     Data = #m__role__logout__c2s{},
%     robot:send2server(robot:get_robot(pid), Data).


% entry_map() -> ok.
% %%     self() ! {scene_robot, handle, [try_entry]}.
% %    self() ! {scene_robot, handle, [try_walk]}.

% update_attr(_) ->
%     ok.
