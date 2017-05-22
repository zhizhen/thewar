%% ===========================================================================
%% BOSS
%% ===========================================================================
-define(BOSS_WAIT_START_TIME, 30).          %% 这个按照秒来, 等待开始的倒计时时间
-define(BOSS_ALL_TIME, 60*10).              %% 这个按照秒来, 一场战斗总时间

-define(BOSS_ME_IN,   0).                   %% 人物不在boss场景中
-define(BOSS_ME_OUT,  1).                   %% 人物在boss场景中

-define(BOSS_ME_LIVE, 0).                   %% 人物正常
-define(BOSS_ME_DEAD, 1).                   %% 人物死亡中

-define(BOSS_DEAD_TIME, 30).

-define(BOSS_CLOSE,      0).                %% boss关闭状态
-define(BOSS_WAIT_START, 1).                %% boss等待开始
-define(BOSS_FIGHT,      2).                %% boss战斗状态
-define(BOSS_END,        3).                %% boss结束状态

-define(BOSS_AWARK_COST_COIN, 5).           %% boss复活消耗金币

%% ===========================================================================
%% WORLD BOSS
%% ===========================================================================
-define(WORLD_BOSS_STATE_READY, 0).
-define(WORLD_BOSS_STATE_RUN, 1).