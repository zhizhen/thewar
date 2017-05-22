%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 女神系统
%%% @end
%%% Created : 2014-10-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(challenge_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([info/2, refresh/2, reset/2, cha_award/2, ach_award/2, get_award/2]).
% -export([get_completed_num/1, update_task_process/3, challenge_tasks_selector/0, handle_throw/1]).

% -define(CHALLENGE_TASK_NUM, 5).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 获取数据
% info(#m__challenge__info__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     AchInfo = GameInfo#game_info.achievements,
%     DailyInfo = GameInfo#game_info.daily,
    
%     C = get_challenge_datas(DailyInfo),
%     C1 = update_item_collect_task(C),

%     Challenges2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- C1],

%     Finished = [Item#challenge_item.item_id || Item <- AchInfo#achievement.info, Item#challenge_item.status =:= ?TASK_AWARDED],
%     Achievements2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- AchInfo#achievement.info, Process =/= 0 andalso Status =/= ?TASK_AWARDED],
    
%     % game_info:update(DailyInfo#daily{challenge=C1}),
%     Data = #m__challenge__info__s2c{
%             challenges = Challenges2C,
%             finished = Finished,
%             achievements = Achievements2C, 
%             reset_times = DailyInfo#daily.challenge_reset_times, 
%             challenge_award = DailyInfo#daily.challenge_award
%         },

%     Sender ! {send, Data}.

% send_challenge_info(Sender) -> 
%     GameInfo = role_api:get_user_data(),
%     AchInfo = GameInfo#game_info.achievements,
%     DailyInfo = GameInfo#game_info.daily,

%     Challenges2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- DailyInfo#daily.challenge],

%     Finished = [Item#challenge_item.item_id || Item <- AchInfo#achievement.info, Item#challenge_item.status =:= ?TASK_AWARDED],
%     Achievements2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- AchInfo#achievement.info, Process =/= 0 andalso Status =/= ?TASK_AWARDED],
    
%     Data = #m__challenge__info__s2c{
%             challenges = Challenges2C,
%             finished = Finished,
%             achievements = Achievements2C, 
%             reset_times = DailyInfo#daily.challenge_reset_times, 
%             challenge_award = DailyInfo#daily.challenge_award
%         },

%     Sender ! {send, Data}.

% %% @doc 花费元宝刷新挑战任务
% refresh(#m__challenge__refresh__c2s{}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         DailyInfo = GameInfo#game_info.daily,
%         NewTasks = 
%             case role_api:is_enough_coin(?REFRESH_CONSUME) of 
%                 false -> throw({msg, ?NO_MONEY, Sender});
%                 true -> challenge_tasks_selector()
%             end,
%         Challenges = DailyInfo#daily.challenge,
%         Old = lists:filter(fun(Item) -> Item#challenge_item.status =/= ?TASK_UNCOMPLETED end, Challenges),
%         Ids = [Item#challenge_item.item_id || Item <- Old, Item#challenge_item.status =/= ?TASK_UNCOMPLETED],
%         NewTasks2 = delete_repeate_task(Ids, NewTasks),
        
%         if length(Ids) =:= ?CHALLENGE_TASK_NUM ->
%             throw({msg, ?NO_LEGAL, Sender});
%             true -> ok
%         end,
        
%         NewChallenge = lists:sublist(Old ++ NewTasks2, ?CHALLENGE_TASK_NUM),
        
%         role_api:pay_coin(?REFRESH_CONSUME, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         NewDailyInfo = DailyInfo#daily{challenge = NewChallenge},
%         game_info:update(NewDailyInfo),

%         NewChallenge1 = update_item_collect_task(NewChallenge),
%         Challenges2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- NewChallenge1],
        
%         Sender ! {send, #m__challenge__refresh__s2c{challenges = Challenges2C}}
%     end,
%     ?PERFORM(F).

% %% @doc 花费元宝重置挑战任务
% reset(#m__challenge__reset__c2s{}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Daily = GameInfo#game_info.daily,
%         Vip = GameInfo#game_info.role#role.vip,
%         Cfg = viprelate_cfg:get(Vip),

%         if Cfg == false ->
%             throw({msg, ?CHALLENGE_RESET_ERROR, Sender});
%             true -> ok
%         end,

%         if Daily#daily.challenge_reset_times >= Cfg#viprelate_cfg.challenge_reset ->
%             throw({msg, ?CHALLENGE_RESET_ERROR, Sender});
%             true -> ok
%         end,
        
%         NewTasks = 
%             case role_api:is_enough_coin(?REFRESH_CONSUME) of 
%                 false -> throw({msg, ?NO_MONEY, Sender});
%                 true -> challenge_tasks_selector()
%             end,

%         role_api:pay_coin(?REFRESH_CONSUME, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         NewDailyInfo = Daily#daily{challenge = NewTasks, challenge_reset_times = Daily#daily.challenge_reset_times + 1, challenge_award = 0},
%         game_info:update(NewDailyInfo),

%         NewChallenge1 = update_item_collect_task(NewTasks),
%         Challenges2C = [{p_challenge, Id, Process, Status} || {challenge_item, Id, Process, Status} <- NewChallenge1],
        
%         Sender ! {send, #m__challenge__refresh__s2c{challenges = Challenges2C}}
%     end,
%     ?PERFORM(F).

% %% @doc 领取挑战奖励
% cha_award(#m__challenge__cha_award__c2s{task_id = TaskId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         DailyInfo = GameInfo#game_info.daily,
%        	ChaInfo = DailyInfo#daily.challenge,

%         case lists:keyfind(TaskId, #challenge_item.item_id, ChaInfo) of
%        		false -> throw({msg, ?CHALLENGE_TASK_NOT_EXIST, Sender});      % 任务不存在随机的列表里
%        		#challenge_item{} = Target ->
%                 Cfg = challenge_cfg:get(Target#challenge_item.item_id),
%                 case Cfg#challenge_cfg.event_type of
%                     ?CHALLENGE_TYPE_ITEM_COLLECT ->
%                         Num = item_api:get_num_by_item_id(Cfg#challenge_cfg.event),
%                         if Num < Cfg#challenge_cfg.process andalso Target#challenge_item.status =:= ?TASK_AWARDED ->
%                             throw({msg, ?CHALLENGE_TASK_NOT_COMPLETED, Sender});    % 任务未完成
%                             true -> 
%                                 List = item_api:remove_by_item_id(Cfg#challenge_cfg.event, Cfg#challenge_cfg.process),
%                                 RemoveList = [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- List],
%                                 Sender ! {send, #m__package__consume__s2c{items=RemoveList}}
%                         end;
%                     _ ->
%                         if Target#challenge_item.status =/= ?TASK_COMPLETED ->
%                             throw({msg, ?CHALLENGE_TASK_NOT_COMPLETED, Sender});    % 任务未完成
%                             true -> ok
%                         end
%                 end,
%                 role_api:get_award(Cfg#challenge_cfg.awards, ?CURR_MODE_FUNC, Sender),
                                
%                 New = Target#challenge_item{status = ?TASK_AWARDED},
%                 NewDailyInfo = DailyInfo#daily{challenge = lists:keyreplace(TaskId, #challenge_item.item_id, ChaInfo, New)},
%                 game_info:update(NewDailyInfo),

%                 notify(?CHALLENGE_CHA_AWAREDED_SUCCESS, Sender)
%        	end
%     end,
%     ?PERFORM(F).

% %% @doc 领取成就奖励
% ach_award(#m__challenge__ach_award__c2s{ach_id = AchId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Achievements = GameInfo#game_info.achievements,

%         case lists:keyfind(AchId, #challenge_item.item_id, Achievements#achievement.info) of
%             false -> throw({msg, ?CHALLENGE_TASK_NOT_EXIST, Sender});      % 不存在
%             #challenge_item{} = Target ->
%                 if Target#challenge_item.status =/= ?TASK_COMPLETED ->
%                     throw({msg, ?CHALLENGE_TASK_NOT_COMPLETED, Sender}); % 任务未完成
%                     true -> 
%                         Task = challenge_cfg:get(Target#challenge_item.item_id),
%                         Awards = Task#challenge_cfg.awards,
%                         role_api:get_award(Awards, ?CURR_MODE_FUNC, Sender),
                        
%                         New = Target#challenge_item{status = ?TASK_AWARDED},
%                         NewAchievements = Achievements#achievement{info = lists:keyreplace(AchId, #challenge_item.item_id, Achievements#achievement.info, New)},
%                         game_info:update(NewAchievements),

%                         notify(?CHALLENGE_ACH_AWAREDED_SUCCESS, Sender)
%                 end
%         end
%     end,
%     ?PERFORM(F).


% %% @doc 领取挑战完成宝箱奖励
% get_award(#m__challenge__get_award__c2s{}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         DailyInfo = GameInfo#game_info.daily,
%         ChaInfo = DailyInfo#daily.challenge,

%         CompletedNum = length([D || D <- ChaInfo, D#challenge_item.status =:= ?TASK_AWARDED]),

%         if CompletedNum =/= ?CHALLENGE_TASK_NUM orelse DailyInfo#daily.challenge_award =:= 1 ->
%             throw({msg, ?NO_LEGAL, Sender});
%             true -> ok
%         end,

%         Cfg = award_cfg:get(?MODULE),
%         if Cfg == false ->
%             throw({msg, ?NO_LEGAL, Sender});
%             true -> ok
%         end,

%         case role_api:get_award(Cfg#award_cfg.awards, ?CURR_MODE_FUNC, Sender) of
%             false -> throw({msg, ?CHALLENGE_GET_AWARD_FAILED, Sender});
%             true -> 
%                 game_info:update(DailyInfo#daily{challenge_award = 1}),
%                 notify(?CHALLENGE_GET_AWARD_SUCCESS, Sender)
%         end
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% get_completed_num(GameInfo) ->
%     AchInfo = GameInfo#game_info.achievements,
%     DailyInfo = GameInfo#game_info.daily,
%     AchievementsNum = length([D || D <- AchInfo#achievement.info, D#challenge_item.status =:= 1]),
%     case DailyInfo#daily.challenge of
%         [] -> AchievementsNum;
%         _ -> 
%             ChallengeNum = length([D || D <- DailyInfo#daily.challenge, D#challenge_item.status =:= 1]),
%             if ChallengeNum =:= 0 ->
%                 AchievementsNum;
%                 true -> ChallengeNum
%             end
%     end.

% update_item_collect_task(C) ->
%     F = fun(T) ->
%         case challenge_cfg:get(T#challenge_item.item_id) of
%             #challenge_cfg{} = Item ->
%                 if Item#challenge_cfg.event_type =:= ?CHALLENGE_TYPE_ITEM_COLLECT andalso T#challenge_item.status =/= ?TASK_AWARDED ->
%                     Num = item_api:get_num_by_item_id(Item#challenge_cfg.event),
%                     if Num >= Item#challenge_cfg.process ->
%                         T#challenge_item{process=Item#challenge_cfg.process, status=?TASK_COMPLETED};
%                         true -> T#challenge_item{process=Num, status=?TASK_UNCOMPLETED}
%                     end;
%                     true -> T
%                 end;
%             _ -> T
%         end
%     end,
%     lists:map(F, C).

% get_challenge_datas(DailyInfo) -> 
%     case DailyInfo#daily.challenge of
%         [] -> 
%             L = challenge_tasks_selector(),
%             NewDailyInfo = DailyInfo#daily{challenge = L},
%             game_info:update(NewDailyInfo),
%             L;
%         _ -> DailyInfo#daily.challenge
%     end.

% update_task_process(EventType, Event, Value) -> 
%     update_challenge_task_process(EventType, Event, Value),
%     update_achievement_task_process(EventType, Event, Value),

%     #game_info{role_etc = RoleEtc} = role_api:get_user_data(),
%     if RoleEtc#role_etc.need_send_challenge =:= 1 ->
%         send_challenge_info(self()),
%         change_need_send_challenge_status(0);
%         true -> ok
%     end.

% update_challenge_task_process(EventType, Event, Value) ->
%     Fun = fun(Task) ->
%         NewTask = update_each_task_process(Task, EventType, Event, Value),
%         case NewTask of
%             false -> false;
%             #challenge_item{} ->
%                 #game_info{daily = Daily1} = role_api:get_user_data(),
%                 NewDaily = Daily1#daily{challenge = lists:keyreplace(NewTask#challenge_item.item_id, #challenge_item.item_id, Daily1#daily.challenge, NewTask)},
%                 game_info:update(NewDaily)
%         end
%     end,
%     #game_info{daily=Daily} = role_api:get_user_data(),
%     Challenges = get_challenge_datas(Daily),
%     [Fun(T) || T <- Challenges, T#challenge_item.status =:= ?TASK_UNCOMPLETED].    %% 遍历挑战任务表，更新任务进度

% update_achievement_task_process(EventType, Event, Value) -> 
%     Fun = fun(Task) ->
%         NewTask = update_each_task_process(Task, EventType, Event, Value),
%         case NewTask of
%             false -> false;
%             #challenge_item{} ->
%                 #game_info{achievements = Achievements1} = role_api:get_user_data(),
%                 New = lists:keyreplace(NewTask#challenge_item.item_id, #challenge_item.item_id, Achievements1#achievement.info, NewTask),
%                 NewAchievements = Achievements1#achievement{info = New},
%                 game_info:update(NewAchievements)
%         end
%     end,
%     #game_info{achievements = Achievements} = role_api:get_user_data(),
%     [Fun(T) || T <- Achievements#achievement.info, T#challenge_item.status =:= ?TASK_UNCOMPLETED].    %% 遍历成就任务表，更新任务进度

% update_each_task_process(Task, EventType, Event, Value) ->
%     TaskCfg = challenge_cfg:get(Task#challenge_item.item_id),
%     CheckTag = util:to_atom(TaskCfg#challenge_cfg.check_tag),
%     case TaskCfg of
%         false -> false;                                                             % 没找到配置 不管
%         #challenge_cfg{} when CheckTag == add ->
%             case TaskCfg#challenge_cfg.event == Event andalso TaskCfg#challenge_cfg.event_type == EventType of  % 判断事件是否一样
%                 false -> false;
%                 true ->                                                          % 如果事件一样
%                     NewProcess = Task#challenge_item.process + Value,
%                     case NewProcess >= TaskCfg#challenge_cfg.process of                                % 判断是加进度还是完成
%                         true ->
%                             change_need_send_challenge_status(1),
%                             Task#challenge_item{process = TaskCfg#challenge_cfg.process, status = ?TASK_COMPLETED};
%                         false -> Task#challenge_item{process = NewProcess}
%                     end
%             end;
%         #challenge_cfg{} when CheckTag == compare ->
%             case TaskCfg#challenge_cfg.event_type == EventType of  % 判断事件是否一样
%                 false -> false;
%                 true ->
%                     case Event >= TaskCfg#challenge_cfg.event of             % 判断是否完成
%                         true ->
%                             change_need_send_challenge_status(1),
%                             Task#challenge_item{process = TaskCfg#challenge_cfg.process, status = ?TASK_COMPLETED};
%                         false -> 
%                             case TaskCfg#challenge_cfg.show of
%                                 1 -> Task#challenge_item{process = Event};
%                                 0 when TaskCfg#challenge_cfg.process =:= 1 -> Task#challenge_item{process = 0};
%                                 _ ->  Task#challenge_item{process = Task#challenge_item.process + 1}
%                             end
%                     end
%             end;
%         _ -> false
%     end.

% change_need_send_challenge_status(Status) ->
%     #game_info{role_etc = RoleEtc} = role_api:get_user_data(),
%     game_info:update(RoleEtc#role_etc{need_send_challenge = Status}).

% challenge_tasks_selector() ->
%     AvailableTasks = fetch_challenge_tasks(),
%     Count = erlang:min(length(AvailableTasks), ?CHALLENGE_TASK_NUM),
%     if Count =:= 0 ->
%         [];
%         true -> random_tasks(Count, [], AvailableTasks)
%     end.

% delete_repeate_task([], Tasks) -> Tasks;
% delete_repeate_task([H|T], Tasks) -> 
%     delete_repeate_task(T, lists:keydelete(H, #challenge_item.item_id, Tasks)).

% fetch_challenge_tasks() ->
%     All = challenge_cfg:get_all(),
%     [X || X <- All, is_available_tasks(X)].

% is_available_tasks(TaskID) ->
%     Task = challenge_cfg:get(TaskID),
%     FuncCheck = role_api:is_func_open(Task#challenge_cfg.func_id),
%     LevelCheck = role_api:is_enough_level(Task#challenge_cfg.min_level, Task#challenge_cfg.max_level),
%     if Task =/= false andalso Task#challenge_cfg.type =:= 1 andalso FuncCheck andalso LevelCheck ->
%         true;
%         true -> false
%     end.

% random_tasks(0, Tmp, List) -> 
%     [begin
%         Task = challenge_cfg:get(lists:nth(X, List)),
%         #challenge_item{item_id = Task#challenge_cfg.task_id}
%     end || X <- Tmp];
% random_tasks(Count, Tmp, List) ->
%     R = rand_srv:random(1, length(List)),
%     case lists:member(R, Tmp) of
%         true -> random_tasks(Count, Tmp, List);
%         false -> random_tasks(Count - 1, Tmp ++ [R], List)
%     end.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.