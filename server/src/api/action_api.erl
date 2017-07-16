%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(action_api).

-include("common.hrl").
-include("msg_code.hrl").
-include("logger.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("game_pb.hrl").

-compile(export_all).


% %%%===================================================================
% %%% API
% %%%===================================================================
sync(#m__action__sync__c2s{turn_id = TurnId, role_id = RoleId, action = Action}, Sender) ->
	#game_info{role_etc=RoleEtc} = role_api:get_user_data(),
	?INFO_MSG("role etc:~p~n", [{RoleEtc}]),
	RoleEtc#role_etc.other_pid ! {send, #m__action__sync__s2c{turn_id = TurnId, role_id = RoleId, action = Action}},
	ok.

noaction(#m__action__noaction__c2s{}, Sender) ->
	#game_info{role_etc=RoleEtc} = role_api:get_user_data(),
	?INFO_MSG("role etc:~p~n", [{RoleEtc}]),
	RoleEtc#role_etc.other_pid ! {send, #m__action__noaction__s2c{}},
	ok.