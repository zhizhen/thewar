-define(MAIN_QUEST, 1).                        %% 主线任务类型
-define(BRANCH_QUEST, 2).                      %% 支线任务类型
-define(DAILY_QUEST, 3).                       %% 日常任务类型

-define(QUEST_EVENT_TYPE_TALK, 1).             %% 人物对话
-define(QUEST_EVENT_TYPE_MISSION, 2).          %% 通关副本,按照副本id算
-define(QUEST_EVENT_TYPE_ENEMY, 3).            %% 击杀怪物
-define(QUEST_EVENT_TYPE_UP_SKILL, 4).         %% 精炼招式
-define(QUEST_EVENT_TYPE_USE_SKILL, 5).        %% 使用技能
-define(QUEST_EVENT_TYPE_UP_EQUIP, 6).         %% 强化装备
-define(QUEST_EVENT_TYPE_USE_EQUIP, 7).        %% 使用装备
-define(QUEST_EVENT_TYPE_MULTI_KILL, 8).       %% 连续击杀
-define(QUEST_EVENT_TYPE_TEAM, 9).             %% 团队合作
-define(QUEST_EVENT_TYPE_USE_ITEM, 10).        %% 使用道具
-define(QUEST_EVENT_TYPE_GET_ITEM, 11).        %% 获得道具
-define(QUEST_EVENT_TYPE_ALL_MISSION, 12).     %% 通关副本,按照类型算
-define(QUEST_EVENT_TYPE_SUPER_KILL, 13).      %% 五星大绝杀
-define(QUEST_EVENT_TYPE_UP_ALL_SKILL, 14).    %% 精炼招式任意
-define(QUEST_EVENT_TYPE_UP_ALL_EQUIP, 15).    %% 强化任意装备
-define(QUEST_EVENT_TYPE_USE_ALL_EQUIP, 16).   %% 穿上任意装备
-define(QUEST_EVENT_TYPE_STUDY_SKILL, 17).     %% 学习指定技能
-define(QUEST_EVENT_TYPE_STUDY_ALL_SKILL, 18). %% 学习任意技能
-define(QUEST_EVENT_TYPE_IMPROVE_SKILL, 19).   %% 指定技能领悟
-define(QUEST_EVENT_TYPE_IMPROVE_ALL_SKILL, 20). %% 任意技能领悟
-define(QUEST_EVENT_TYPE_WARRIOR_FIGHT, 21). 	%% 武将出战
-define(QUEST_EVENT_TYPE_WARRIOR_ATTACH, 22). 	%% 武将附身

-define(QUEST_CAN_ACCEPTED, 0).                %% 可以接受(目前只有日常任务使用这个状态)
-define(QUEST_ACCEPTED, 1).                    %% 已经接受
-define(QUEST_COMPLATED, 2).                   %% 已经完成
-define(QUEST_SUBMITED, 3).                    %% 已经提交

-define(DAILY_QUEST_REFRESH_COIN, 5).     % 刷新等级

-define(DAILY_QUEST_LEVEL_ADD(Level),
    case Level of
        1 -> 1;
        2 -> 1.5;
        3 -> 2;
        4 -> 2.5;
        5 -> 3
    end
).

