%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(quest_api).

% -include("common.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").

% %% Client API
% -export([
%     info/2,
%     daily_quest_info/2,
%     get/2,
%     submit/2,
%     daily_quest_submit/2,
%     daily_quest_give_up/2,
%     daily_quest_pass/2,
%     daily_quest_refresh/2
% ]).

% %% Process API
% -export([
%     get_quest_cfg/1,
%     get_quest_type/1,
%     add_quest_process/3,
%     receive_daily_quest/1,
%     open_function/1
% ]).


% -define(SPECIAL_QUEST_TYPES, [?QUEST_EVENT_TYPE_WARRIOR_FIGHT, ?QUEST_EVENT_TYPE_WARRIOR_ATTACH]).
% %%%===================================================================
% %%% Client API
% %%%===================================================================
% info(#m__quest__info__c2s{}, ClientSender) ->
%     GameInfo = role_api:get_user_data(),
%     Info = quest_mod:build_p_quests(GameInfo#game_info.quest),
%     ClientSender ! {send, #m__quest__info__s2c{quest_info=Info}}.

% daily_quest_info(#m__quest__daily_quest_info__c2s{}, ClientSender) ->
%     #game_info{quest=Quests} = role_api:get_user_data(),

%     % 当打开每日任务面板的时候 判断如果限制到了的话就啥也不干，返回前端状态，如果限制没到清空昨天的，保留今天的（先判断限制是为了性能）
%     NewDailyQuest = build_daily_quest(Quests#quests.daily),
%     game_info:update(Quests#quests{daily = NewDailyQuest}),

%     Data = #m__quest__daily_quest_info__s2c{
%         quest = #p_quest{
%             quest_id = NewDailyQuest#daily_quest.quest_id,
%             state = NewDailyQuest#daily_quest.state,
%             process = NewDailyQuest#daily_quest.process,
%             accept_time = NewDailyQuest#daily_quest.accept_time,
%             level = NewDailyQuest#daily_quest.level
%         }
%     },
%     ClientSender ! {send, Data}.


% get(#m__quest__get__c2s{quest_type=QuestType, quest_id=QuestId}, ClientSender) ->
%     F = fun() ->
%         case lists:member(QuestType, [?MAIN_QUEST, ?BRANCH_QUEST]) of             % 验证任务类型
%             false -> throw({msg, ?QUEST_PARAMS_ERROR1, ClientSender});
%             true -> ok
%         end,

%         Cfg = case QuestType of                                                                 % 验证任务id
%             ?MAIN_QUEST -> main_quest_cfg:get(QuestId);
%             ?BRANCH_QUEST -> branch_quest_cfg:get(QuestId);
%             _ -> false
%         end,

%         if Cfg == false ->
%             throw({msg, ?QUEST_PARAMS_ERROR2, ClientSender});
%             true -> ok
%         end,
%         GameInfo = role_api:get_user_data(),
%         #game_info{quest=Quests, role=Role} = GameInfo,
%         QuestInfo = lists:keyfind(QuestId, #quest.quest_id, Quests#quests.all),                  % 已经领取过了还领取个蛋蛋啊
%         if QuestInfo /= false ->
%             throw({msg, ?QUEST_PARAMS_ERROR3, ClientSender});
%             true -> ok
%         end,

%         CheckValue = case QuestType of
%             ?MAIN_QUEST -> quest_mod:check_main_quest_get(GameInfo, QuestId);                    % 验证数值是否够领取
%             ?BRANCH_QUEST -> quest_mod:check_branch_quest_get(GameInfo, QuestId);
%             _ -> false
%         end,

%         if CheckValue == false ->
%             throw({msg, ?QUEST_PARAMS_ERROR4, ClientSender});
%             true -> ok
%         end,

%         NewQuest = #quest{
%             role_id=Role#role.role_id,
%             quest_id=QuestId,
%             state=?QUEST_ACCEPTED,
%             process=0,
%             accept_time=util:unixtime(),
%             level = 0
%         },
        
%         NewQuests = Quests#quests{all = Quests#quests.all ++ [NewQuest]},

%         %quest_db:update(NewQuest1),
%         game_info:update(NewQuests),                                                              % 更新内存
%         role_api:check_open_function(),

%         ClientSender ! {send, #m__system__notify__s2c{code = ?QUEST_GET_SUCCESS}},

%         case QuestType of                                                                         %设置初始化的进度
%             ?MAIN_QUEST ->
%                 add_quest_process(Cfg#main_quest_cfg.event_type, Cfg#main_quest_cfg.event, 0);
%             ?BRANCH_QUEST ->
%                 add_quest_process(Cfg#branch_quest_cfg.event_type, Cfg#branch_quest_cfg.event, 0);
%             _ -> false
%         end
%     end,
%     performer(F).


% submit(#m__quest__submit__c2s{quest_type=QuestType, quest_id=QuestId}, ClientSender) ->
%     F = fun() ->
%         case lists:member(QuestType, [?MAIN_QUEST, ?BRANCH_QUEST]) of               % 验证任务类型
%             false -> throw({msg, ?QUEST_PARAMS_ERROR5, ClientSender});
%             true -> ok
%         end,

%         Cfg = case QuestType of                                                                   % 验证任务id
%             ?MAIN_QUEST -> main_quest_cfg:get(QuestId);
%             ?BRANCH_QUEST -> branch_quest_cfg:get(QuestId);
%             _ -> false
%         end,

%         if Cfg == false ->
%             throw({msg, ?QUEST_PARAMS_ERROR6, ClientSender});
%             true -> ok
%         end,
%         GameInfo = role_api:get_user_data(),
%         #game_info{quest=Quests, role=Role} = GameInfo,
%         QuestInfo = lists:keyfind(QuestId, #quest.quest_id, Quests#quests.all),                   % 没有领取提交个蛋蛋啊
%         if QuestInfo == false ->
%             throw({msg, ?QUEST_PARAMS_ERROR7, ClientSender});
%             true -> ok
%         end,

%         if QuestInfo#quest.state /= ?QUEST_COMPLATED ->                                           % 不是完成状态还提交个叉叉啊
%             throw({msg, ?QUEST_PARAMS_ERROR8, ClientSender});
%             true -> ok
%         end,

%         NewQuest = QuestInfo#quest{state=?QUEST_SUBMITED, finish_time=util:unixtime()},
%         NewQuests = Quests#quests{all=lists:keyreplace(QuestId, #quest.quest_id, Quests#quests.all, NewQuest)},

%         case QuestType of
%             ?MAIN_QUEST ->
%                 AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%                 Awards = element(util:index_of(AwardTag, record_info(fields, main_quest_cfg))+1, Cfg),
%                 role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender);
%             ?BRANCH_QUEST ->
%                 AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%                 Awards = element(util:index_of(AwardTag, record_info(fields, branch_quest_cfg))+1, Cfg),
%                 role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender);
%             _ -> false
%         end,

%         game_info:update(NewQuests),                                                              % 更新内存
%         %quest_db:update(NewQuest),
%         role_api:check_open_function(),                                                           % 检测开启功能
%         ClientSender ! {send, #m__system__notify__s2c{code = ?QUEST_SUBMIT_SUCCESS}}
%     end,
%     performer(F).

% daily_quest_submit(#m__quest__daily_quest_submit__c2s{}, ClientSender) ->
%     #game_info{role=Role, quest=Quests} = role_api:get_user_data(),
%     F = fun() ->
%         DailyQuest = Quests#quests.daily,
%         if DailyQuest#daily_quest.state /= ?QUEST_COMPLATED ->
%             throw({msg, ?QUEST_PARAMS_ERROR9, ClientSender});
%             true -> ok
%         end,

%         NewDailyQuest = DailyQuest#daily_quest{
%             quest_id = 0,
%             state = ?QUEST_CAN_ACCEPTED,                        % 自动领取的状态
%             process = 0,
%             accept_time = 0,
%             level = 0
%         },

%         Cfg = daily_quest_cfg:get(DailyQuest#daily_quest.quest_id),
%         AwardCfg = daily_quest_award_cfg:get({Cfg#daily_quest_cfg.award_index, Role#role.level}),
%         AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%         Awards1 = element(util:index_of(AwardTag, record_info(fields, daily_quest_award_cfg))+1, AwardCfg),
%         Awards2 = [string:tokens(Item, "-") || Item <- Awards1],
%         Awards3 = [X++"-"++util:to_list(util:to_integer(util:to_integer(Y)*?DAILY_QUEST_LEVEL_ADD(DailyQuest#daily_quest.level))) || [X, Y] <- Awards2],
%         role_api:get_award(Awards3, ?CURR_MODE_FUNC, ClientSender),     % 发奖励
%         game_info:update(Quests#quests{daily=NewDailyQuest}),
%         %quest_db:update(NewDailyQuest),

%         ClientSender ! {send, #m__system__notify__s2c{code=?QUEST_DAILY_SUBMIT_SUCCESS}}

%     end,
%     performer(F).

% daily_quest_give_up(#m__quest__daily_quest_give_up__c2s{}, ClientSender) ->
%     #game_info{quest=Quests} = role_api:get_user_data(),
%     F = fun() ->
%         DailyQuest = Quests#quests.daily,
%         if DailyQuest#daily_quest.state == ?QUEST_COMPLATED ->
%             throw({msg, ?QUEST_PARAMS_ERROR10, ClientSender});
%             true -> ok
%         end,

%         NewDailyQuest = DailyQuest#daily_quest{
%             quest_id = 0,
%             state = ?QUEST_CAN_ACCEPTED,                        % 自动领取的状态
%             process = 0,
%             accept_time = 0,
%             level = 0
%         },
%         game_info:update(Quests#quests{daily=NewDailyQuest}),
%         %quest_db:update(NewDailyQuest),

%         ClientSender ! {send, #m__system__notify__s2c{code=?QUEST_DAILY_GIVE_UP_SUCCESS}}

%     end,
%     performer(F).

% daily_quest_pass(#m__quest__daily_quest_pass__c2s{}, ClientSender) ->
%     #game_info{role=Role, quest=Quests} = role_api:get_user_data(),
%     F = fun() ->
%         DailyQuest = Quests#quests.daily,
%         if DailyQuest#daily_quest.state /= ?QUEST_ACCEPTED ->
%             throw({msg, ?QUEST_PARAMS_ERROR11, ClientSender});
%             true -> ok
%         end,
%         Cfg = daily_quest_cfg:get(DailyQuest#daily_quest.quest_id),

%         if Cfg#daily_quest_cfg.auto_need_gold > Role#role.gold ->
%             throw({msg, ?QUEST_PARAMS_ERROR12, ClientSender});
%             true -> ok
%         end,

%         if Cfg#daily_quest_cfg.auto_need_coin > Role#role.coin ->
%             throw({msg, ?QUEST_PARAMS_ERROR13, ClientSender});
%             true -> ok
%         end,

%         NewDailyQuest = DailyQuest#daily_quest{
%             quest_id = 0,
%             state = ?QUEST_CAN_ACCEPTED,                        % 自动领取的状态
%             process = 0,
%             accept_time = 0,
%             level = 0
%         },

%         AwardCfg = daily_quest_award_cfg:get({Cfg#daily_quest_cfg.award_index, Role#role.level}),
%         AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%         Awards1 = element(util:index_of(AwardTag, record_info(fields, daily_quest_award_cfg))+1, AwardCfg),
%         Awards2 = [string:tokens(Item, "-") || Item <- Awards1],
%         Awards3 = [X++"-"++util:to_list(util:to_integer(util:to_integer(Y)*?DAILY_QUEST_LEVEL_ADD(DailyQuest#daily_quest.level))) || [X, Y] <- Awards2],
%         role_api:get_award(Awards3, ?CURR_MODE_FUNC, ClientSender),     % 发奖励
%         role_api:pay_gold(Cfg#daily_quest_cfg.auto_need_gold, ClientSender),
%         role_api:pay_coin(Cfg#daily_quest_cfg.auto_need_coin, #coin_cost{desc = ?CURR_MODE_FUNC}, ClientSender),

%         game_info:update(Quests#quests{daily=NewDailyQuest}),
%         %quest_db:update(NewDailyQuest),

%         ClientSender ! {send, #m__system__notify__s2c{code=?QUEST_DAILY_PASS_SUCCESS}}

%     end,
%     performer(F).

% daily_quest_refresh(#m__quest__daily_quest_refresh__c2s{}, ClientSender) ->
%     #game_info{role = Role, account=_Account, quest=Quests} = role_api:get_user_data(),
%     F = fun() ->
%         DailyQuest = Quests#quests.daily,
%         if DailyQuest#daily_quest.state /= ?QUEST_ACCEPTED ->
%             throw({msg, ?QUEST_PARAMS_ERROR11, ClientSender});
%             true -> ok
%         end,

%         if ?DAILY_QUEST_REFRESH_COIN > Role#role.coin ->
%             throw({msg, ?QUEST_PARAMS_ERROR13, ClientSender});
%             true -> ok
%         end,

%         NewDailyQuest = DailyQuest#daily_quest{level = random_daily_quest_level(DailyQuest#daily_quest.quest_id)},
%         game_info:update(Quests#quests{daily=NewDailyQuest}),
%         role_api:pay_coin(?DAILY_QUEST_REFRESH_COIN, #coin_cost{desc = ?CURR_MODE_FUNC}, ClientSender),
%         %quest_db:update(NewDailyQuest),

%         daily_quest_info(#m__quest__daily_quest_info__c2s{}, ClientSender)

%     end,
%     performer(F).
% %%%===================================================================
% %%% Process API
% %%%===================================================================
% add_quest_process(EventType, Event, Value) ->
%     add_daily_quest_process(EventType, Event, Value),
%     add_all_quest_process(EventType, Event, Value),
%     challenge_api:update_task_process(EventType, Event, Value).

% receive_daily_quest(QuestId) ->
%     #game_info{quest = Quests} = role_api:get_user_data(),
%     DailyQuest = Quests#quests.daily,
%     case DailyQuest#daily_quest.state == ?QUEST_CAN_ACCEPTED andalso find_can_daily_quest(QuestId) of
%         false -> false;
%         true ->
%             NewDailyQuest = DailyQuest#daily_quest{
%                 quest_id = QuestId,
%                 state = ?QUEST_ACCEPTED,                        % 自动领取的状态
%                 process = 0,
%                 accept_time = util:datetime_to_timestamp(erlang:localtime()),
%                 level = random_daily_quest_level(QuestId)
%             },
%             game_info:update(Quests#quests{daily = NewDailyQuest})
%     end.

% add_daily_quest_process(EventType, Event, Value) ->
%     #game_info{quest=Quests} = role_api:get_user_data(),
%     DailyQuest = Quests#quests.daily,
%     case DailyQuest#daily_quest.state == ?QUEST_ACCEPTED of
%         false -> false;
%         true ->
%             Quest = #quest{
%                 role_id = DailyQuest#daily_quest.role_id,
%                 quest_id = DailyQuest#daily_quest.quest_id,
%                 state = DailyQuest#daily_quest.state,
%                 process = DailyQuest#daily_quest.process,
%                 accept_time = DailyQuest#daily_quest.accept_time,
%                 finish_time = 0,
%                 level = DailyQuest#daily_quest.level
%             },
%             NewDailyQuest = quest_mod:add_quest_process(Quest, EventType, Event, Value),
%             case NewDailyQuest of
%                 false -> false;
%                 #daily_quest{} ->
%                     #game_info{quest=Quests} = role_api:get_user_data(),
%                     game_info:update(Quests#quests{daily=NewDailyQuest}),
%                     case NewDailyQuest#daily_quest.state of
%                         ?QUEST_COMPLATED ->
%                             Data = #m__quest__daily_quest_info__s2c{
%                                 quest = #p_quest{
%                                     quest_id = NewDailyQuest#daily_quest.quest_id,
%                                     state = NewDailyQuest#daily_quest.state,
%                                     process = NewDailyQuest#daily_quest.process,
%                                     accept_time = NewDailyQuest#daily_quest.accept_time,
%                                     level = NewDailyQuest#daily_quest.level
%                                 }
%                             },
%                             self() ! {send, Data};
%                         _ -> ok
%                     end,
%                     true
%             end
%     end.

% add_all_quest_process(EventType, Event, Value) ->
%     Fun = fun(Quest) ->
%         NewQuest = quest_mod:add_quest_process(Quest, EventType, Event, Value),
%         case NewQuest of
%             false -> false;
%             #quest{} ->
%                 #game_info{quest=Quests} = role_api:get_user_data(),
%                 NewQuests = Quests#quests{all=lists:keyreplace(NewQuest#quest.quest_id, #quest.quest_id, Quests#quests.all, NewQuest)},
%                 game_info:update(NewQuests),
%                 true
%         end
%     end,
%     #game_info{quest=Quests} = role_api:get_user_data(),
%     Result = [Fun(Q) || Q <- Quests#quests.all, Q#quest.state =:= ?QUEST_ACCEPTED],                 % 循环处理更新的任务

%     case lists:member(true, Result) of                                                             % 判断是否又更新有更新的话通知前端
%         true ->
%             GameInfo = role_api:get_user_data(),
%             Info = quest_mod:build_p_quests(GameInfo#game_info.quest),
%             self() ! {send, #m__quest__info__s2c{quest_info=Info}};
%         false -> ok
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% random_daily_quest_level(QuestId) ->
%     Cfg = daily_quest_cfg:get(QuestId),
%     Data = [string:tokens(X, "-") || X <- Cfg#daily_quest_cfg.level_list],
%     Data2 = [{util:to_integer(X), util:to_integer(Y)} || [X, Y] <- Data],
%     rand_srv:random_probability_list(Data2).

% build_daily_quest(#daily_quest{}=DailyQuest) ->
%     {AcceptDay, _} = util:timestamp_to_datetime(DailyQuest#daily_quest.accept_time),
%     {DT, _} = calendar:time_difference({AcceptDay, {0,0,0}}, erlang:localtime()),
%     case DT of
%         0 -> DailyQuest;
%         _ ->
%             DailyQuest#daily_quest{
%                 quest_id = 0,
%                 state = ?QUEST_CAN_ACCEPTED, 
%                 process = 0,
%                 accept_time = 0,
%                 level = 0
%             }
%     end.

% find_can_daily_quest(QuestId) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     Level = Role#role.level,
%     AllCfg = [daily_quest_cfg:get(X) || X <- daily_quest_cfg:get_all()],
%     CanAccept = [Cfg#daily_quest_cfg.quest_id || Cfg <- AllCfg, Cfg#daily_quest_cfg.min_level =< Level andalso Level =< Cfg#daily_quest_cfg.max_level],
%     lists:member(QuestId, CanAccept).

% get_quest_cfg(QuestId) ->
%     MainQuestCfg = main_quest_cfg:get(QuestId),
%     DailyQuestCfg = daily_quest_cfg:get(QuestId),
%     BranchQuestCfg = branch_quest_cfg:get(QuestId),
%     if
%         MainQuestCfg /= false -> {?MAIN_QUEST, MainQuestCfg};
%         DailyQuestCfg /= false -> {?DAILY_QUEST, DailyQuestCfg};
%         BranchQuestCfg /= false -> {?BRANCH_QUEST, BranchQuestCfg};
%         true -> false
%     end.

% get_quest_type(QuestId) ->
%     MainQuestCfg = main_quest_cfg:get(QuestId),
%     DailyQuestCfg = daily_quest_cfg:get(QuestId),
%     BranchQuestCfg = branch_quest_cfg:get(QuestId),
%     if
%         MainQuestCfg /= false -> ?MAIN_QUEST;
%         DailyQuestCfg /= false -> ?DAILY_QUEST;
%         BranchQuestCfg /= false -> ?BRANCH_QUEST;
%         true -> false
%     end.

% performer(F) ->
%     try
%         F()
%     catch
%         throw:Reason ->
%             handle_throw(Reason)
%     end.

% handle_throw(ignore) ->
%     ok;
% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
