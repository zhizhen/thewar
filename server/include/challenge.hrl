-define(CHALLENGE_TYPE_MISSION_LIFE, 21).      %% 副本通关时生命值百分比大于X
-define(CHALLENGE_TYPE_MISSION_TIME, 22).      %% 副本通关时间小于X
-define(CHALLENGE_TYPE_MISSION_SCORE, 23).     %% 副本通关评价为X
-define(CHALLENGE_TYPE_MISSION_SCORE_SSS, 24). %% 指定副本IDX通关评价SSS
-define(CHALLENGE_TYPE_MISSION_WAY, 25).       %% 手动通关
-define(CHALLENGE_TYPE_MISSION_ALONE, 26).     %% 没有出战武将或玩家通关
-define(CHALLENGE_TYPE_GEM_LEVEL, 27).         %% 合成等级为X的宝石
-define(CHALLENGE_TYPE_GEM_ID, 28).            %% 合成宝石IDX
-define(CHALLENGE_TYPE_CULTIVATE_PHYSIC_ATTACK, 29).     %% 培养获得的物理攻击达到X
-define(CHALLENGE_TYPE_CULTIVATE_SKILL_ATTACK, 30).      %% 培养获得的法术攻击达到X
-define(CHALLENGE_TYPE_CULTIVATE_PHYSIC_DEFENCE, 31).    %% 培养获得的物理防御达到X
-define(CHALLENGE_TYPE_CULTIVATE_SKILL_DEFENCE, 32).     % 培养获得的法术防御达到X
-define(CHALLENGE_TYPE_CULTIVATE_LIFE, 33).              %% 培养获得的破甲伤害达到X
-define(CHALLENGE_TYPE_CULTIVATE_PHYSIC_ATTACK_TODAY, 34).      %% 今日培养获得的物理攻击达到X
-define(CHALLENGE_TYPE_CULTIVATE_SKILL_ATTACK_TODAY, 35).       %% 今日培养获得的法术攻击达到X
-define(CHALLENGE_TYPE_CULTIVATE_PHYSIC_DEFENCE_TODAY, 36).     %% 今日培养获得的物理防御达到X
-define(CHALLENGE_TYPE_CULTIVATE_SKILL_DEFENCE_TODAY, 37).      %% 今日培养获得的法术防御达到X
-define(CHALLENGE_TYPE_CULTIVATE_LIFE_TODAY, 38).       %% 今日培养获得的破甲伤害达到X
-define(CHALLENGE_TYPE_UNIVERSE_ID, 39).                %% 点亮ID为X的四象点（X为索引那一列）
-define(CHALLENGE_TYPE_UNIVERSE_NUM_TODAY, 40).         %% 今日点亮四象点X个
-define(CHALLENGE_TYPE_SPIRIT_QUALITY, 41).             %% 获得精魂的品质为X
-define(CHALLENGE_TYPE_SPIRIT_NUM, 42).                 %% 今日获得精魂数量为X
-define(CHALLENGE_TYPE_SPIRIT_ID, 43).                  %% 获得指定ID的精魂
-define(CHALLENGE_TYPE_SPIRIT_LEVEL, 44).               %% 将精魂的等级提升到大于等于X级
-define(CHALLENGE_TYPE_GROUP_TREE_NUM, 45).             %% 帮会神树浇水X次
-define(CHALLENGE_TYPE_GROUP_MEETING_NUM, 46).          %% 帮会聚义X次
-define(CHALLENGE_TYPE_GROUP_BOSS_NUM, 47).             %% 与帮会BOSS战斗X次
-define(CHALLENGE_TYPE_GROUP_POOL_NUM, 48).             %% 帮会瑶池活动进入X次
-define(CHALLENGE_TYPE_FRIEND_NUM, 49).                 %% 好友数量大于等级X
-define(CHALLENGE_TYPE_FRIEND_NUM_TODAY, 50).           %% 今日新增好友数量大于等于X
-define(CHALLENGE_TYPE_WORLD_BOSS_NUM, 51).             %% 与世界BOSS战斗X次
-define(CHALLENGE_TYPE_COIN2EXP_NUM, 52).               %% 拜师X次
-define(CHALLENGE_TYPE_COIN2GOLD_NUM, 53).              %% 点金X次
-define(CHALLENGE_TYPE_SHENGYAN_NUM, 54).               %% 盛宴X次
-define(CHALLENGE_TYPE_CLIFFORD_NUM, 55).               %% 祈福X次
-define(CHALLENGE_TYPE_LIVING_VALUE, 56).               %% 活跃度大于等于X
-define(CHALLENGE_TYPE_BOUDOIR_GIRL, 57).               %% 女神X完全解封（X为封印归属）
-define(CHALLENGE_TYPE_ITEM_COLLECT, 58).               %% 收集物品

%% ===========================================================================
%% challenge & achievement
%% ===========================================================================
-define(REFRESH_CONSUME,  50).     % 刷新挑战任务消耗元宝

-define(TASK_UNCOMPLETED,  0).     % 挑战任务状态，0-未完成，1-已完成，2-已领取奖励
-define(TASK_COMPLETED,  1).
-define(TASK_AWARDED,  2).
