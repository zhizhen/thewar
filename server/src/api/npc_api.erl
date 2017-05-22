%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(npc_api).

% -include("logger.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").

% %% API
% -export([talk/2, open_function/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% 任务npc的对话
% %% @end
% %%--------------------------------------------------------------------
% talk(#m__npc__talk__c2s{npc_id=NpcId}, _Sender) ->
%     case npc_cfg:get(NpcId) of
%         false -> false;
%         _ -> quest_api:add_quest_process(?QUEST_EVENT_TYPE_TALK, NpcId, 1)
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

% open_function(_FuncId) ->
%     ok.
