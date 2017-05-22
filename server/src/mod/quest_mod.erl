%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(quest_mod).

% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").

% %% API
% -export([
%     build_p_quests/1,
%     check_branch_quest_get/2,
%     check_main_quest_get/2,
%     add_quest_process/4
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% build_p_quests(#quests{all=Quests}) ->
%     Fun = fun(X) ->
%         #p_quest{
%             quest_id = X#quest.quest_id,
%             state = X#quest.state,
%             process = X#quest.process,
%             accept_time = X#quest.accept_time,
%             level = X#quest.level
%         }
%         end,
%         #p_all_quest{role_id="", complated=[X#quest.quest_id || X <- Quests, X#quest.state == ?QUEST_SUBMITED], quest=[Fun(X) || X <- Quests, X#quest.state /= ?QUEST_SUBMITED]}.

% check_main_quest_get(GameInfo, QuestId) ->
%     #game_info{role=Role, quest=Quest} = GameInfo,
%     Cfg = main_quest_cfg:get(QuestId),
%     case Cfg#main_quest_cfg.need_level > Role#role.level of                                % 检查级别
%         true -> false;
%         _ ->
%             ComplatedQuest = [X#quest.quest_id || X <- Quest#quests.all, X#quest.state==?QUEST_SUBMITED],
%             CheckTag = [lists:member(X, ComplatedQuest) || X <- Cfg#main_quest_cfg.pre_quest_id, X /= 0],
%             not lists:member(false, CheckTag)
%     end.

% check_branch_quest_get(GameInfo, QuestId) ->
%     #game_info{role=Role, quest=Quest} = GameInfo,
%     Cfg = branch_quest_cfg:get(QuestId),
%     case Cfg#branch_quest_cfg.need_level > Role#role.level of                                % 检查级别
%         true -> false;
%         _ ->
%             ComplatedQuest = [X#quest.quest_id || X <- Quest#quests.all, X#quest.state==?QUEST_SUBMITED],
%             CheckTag = [lists:member(X, ComplatedQuest) || X <- Cfg#branch_quest_cfg.pre_quest_id, X /= 0],
%             not lists:member(false, CheckTag)
%     end.

% %% @doc 判断如果事件符合增加任务进度并判断是否完成
% add_quest_process(Quest, EventType, Event, Value) ->
%     case quest_api:get_quest_cfg(Quest#quest.quest_id) of
%         false -> false;                                                             % 没找到配置 不管
%         {?MAIN_QUEST, #main_quest_cfg{process=MaxProcess, event_type=CheckEventType ,event=CheckEvent, check_tag=CheckTag, check_script=CheckScript}} ->     % 如果是主线
%             case CheckEvent == Event  andalso CheckEventType == EventType of                                             % 判断事件是否一样
%                 false -> false;
%                 true ->                                                             % 如果事件一样
%                     NewProcess = case util:to_atom(CheckTag) of
%                         add -> Quest#quest.process + Value;
%                         compare -> CheckScript()
%                     end,
%                     case NewProcess >= MaxProcess of                                % 判断是加进度还是完成
%                         true -> Quest#quest{process=NewProcess, state=?QUEST_COMPLATED};
%                         false -> Quest#quest{process=NewProcess}
%                     end
%             end;
%         {?BRANCH_QUEST, #branch_quest_cfg{process=MaxProcess, event_type=CheckEventType, event=CheckEvent, check_tag=CheckTag, check_script=CheckScript}} ->     % 如果是支线
%             case CheckEvent == Event  andalso CheckEventType == EventType of                                             % 判断事件是否一样
%                 false -> false;
%                 true ->
%                     NewProcess = case util:to_atom(CheckTag) of
%                         add -> Quest#quest.process + Value;
%                         compare -> CheckScript()
%                     end,
%                     case NewProcess >= MaxProcess of                                % 判断是加进度还是完成
%                         true -> Quest#quest{process=NewProcess, state=?QUEST_COMPLATED};
%                         false -> Quest#quest{process=NewProcess}
%                     end
%             end;
%         {?DAILY_QUEST, #daily_quest_cfg{process=MaxProcess, event_type=CheckEventType, event=CheckEvent}} ->
%             case CheckEvent == Event  andalso CheckEventType == EventType of                                             % 判断事件是否一样
%                 false -> false;
%                 true ->                                                             % 如果事件一样
%                     NewProcess = Quest#quest.process + Value,
%                     case NewProcess >= MaxProcess of                                % 判断是加进度还是完成
%                         true ->
%                             #daily_quest{
%                                 process=NewProcess,
%                                 state=?QUEST_COMPLATED,
%                                 role_id=Quest#quest.role_id,
%                                 quest_id=Quest#quest.quest_id,
%                                 accept_time=Quest#quest.accept_time,
%                                 level=Quest#quest.level
%                             };
%                         false ->
%                             #daily_quest{
%                                 process=NewProcess,
%                                 state=Quest#quest.state,
%                                 role_id=Quest#quest.role_id,
%                                 quest_id=Quest#quest.quest_id,
%                                 accept_time=Quest#quest.accept_time,
%                                 level=Quest#quest.level
%                             }
%                     end
%             end;

%         _ -> false
%     end.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
