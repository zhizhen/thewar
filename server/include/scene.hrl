-record(scene_slave, {pid}).
-record(scene_line, {lineid, enable=0, num=0}).
-record(scene_spec_id, {id}).

-define(SCENE_CITY_TYPE,     1).     % 保存位置的主城地图
-define(SCENE_SPECIAL_TYPE,  2).     % 特殊地图
-define(SCENE_MISSION_TYPE,  3).     % 副本地图

%% ===========================================================================
%% special
%% ===========================================================================
-define(SCENE_GROUP_POOL,            1).       %% 子系统标识
-define(SCENE_BOSS,                  2).       %% 子系统标识

-define(GROUP_POOL_SCENE,      21000).         %% 瑶池地图id


