-define(ETS_RANK, rank).                                %% 排行榜ets表

-define(RANK_MAX_NUM, 20).                              % 排行榜最大请求数量

-define(RANK_DEFAULT_FREQUENCY, 15*60*1000).            %% 默认刷新时间
-define(RANK_DEFAULT_NUM,       20).                    %% 默认上榜人数

-define(RANK_TYPE_LEVEL,    1).                         %% 等级榜
-define(LEVEL_FREQUENCY,    15*60*1000).                %% 等级榜刷新时间间隔 (ms)
-define(LEVEL_NUM,          100).                       %% 等级榜人数

-define(RANK_TYPE_FIGHT,    2).                         %% 战力榜
-define(FIGHT_FREQUENCY,    15*60*1000).                %% 战力榜刷新时间
-define(FIGHT_NUM,          100).                       %% 战力榜人数

-define(RANK_TYPE_ARENA,    3).                         %% 竞技榜
-define(ARENA_FREQUENCY,    5*60*1000).                 %% 竞技榜刷新时间
-define(ARENA_NUM,          20).                        %% 竞技榜人数

-define(RANK_TYPE_HONOR,    4).                         %% 荣誉榜
-define(HONOR_FREQUENCY,    15*60*1000).                %% 荣誉榜刷新时间
-define(HONOR_NUM,          100).                       %% 荣誉榜人数

-define(RANK_TYPE_CHARM,    5).                         %% 魅力榜
-define(CHARM_FREQUENCY,    15*60*1000).                %% 魅力榜刷新时间
-define(CHARM_NUM,          100).                       %% 魅力榜人数


