%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(account_robot).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("robot.hrl").
% -export([
%         get_role_list/0
%     ]).

% get_role_list() ->
%     AccountId = robot:get_robot(account_id),
%     {MegaSecs, Secs, _MicroSecs} = erlang:now(),
%     NowTime = util:to_list(MegaSecs * 1000000 + Secs),
%     HashStr = io_lib:format("~s~s~s", [")7yt4e!#)gcy&amp;#0^hlme-+082=s!b!$8+h$+(j0bucx0+nu%pe", util:to_list(AccountId), util:to_atom(NowTime)]),
%     Ticket = io_lib:format("~s~s", [util:to_atom(NowTime), util:md5_to_hex(HashStr)]),
%     Data = #m__account__login__c2s{account_id=AccountId, ticket=Ticket, platform=?PLATFORM, server_id=?SERVERID, version=?VERSION},
%     ?PRINT("get role list send data: ~p~n", [Data]),
%     robot:send2server(robot:get_robot(pid), Data).
