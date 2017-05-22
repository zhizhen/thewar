% 道具 state
-define(ITEM_USE,           2).                %% 物品使用状态
-define(ITEM_AVAILABLE,     1).                %% 物品正常状态
-define(ITEM_DELETE,        0).                %% 物品删除状态
%% 道具type
-define(ITEM_TYPE_UNDEFINED,    0).            %% 未指定
-define(ITEM_TYPE_EQUIP,        1).            %% 装备
-define(ITEM_TYPE_GEM,          2).            %% 宝石
-define(ITEM_TYPE_MATERIAL,     3).            %% 合成材料
-define(ITEM_TYPE_COIN,         4).            %% 代币
-define(ITEM_TYPE_QUEST,        5).            %% 任务物品
-define(ITEM_TYPE_GIFT,         6).            %% 礼包
-define(ITEM_TYPE_BOX,          7).            %% 宝箱
-define(ITEM_TYPE_GIRL,         8).            %% 女神
-define(ITEM_TYPE_CARD,         9).            %% 技能卡
-define(ITEM_TYPE_WARRIOR,      10).           %% 武将
-define(ITEM_TYPE_WING,         11).           %% 武将
-define(ITEM_TYPE_OTHER,        50).           %% 其他

%% 道具 sub_type
-define(ITEM_SUB_TYPE_WEAPON,   1).            %% 装备的槽
-define(ITEM_SUB_TYPE_HELM,     2).            %% 装备的槽
-define(ITEM_SUB_TYPE_ARMOR,    3).            %% 装备的槽
-define(ITEM_SUB_TYPE_BOOTS,    4).            %% 装备的槽
-define(ITEM_SUB_TYPE_RING,     5).            %% 装备的槽
-define(ITEM_SUB_TYPE_NECKLACE, 6).            %% 装备的槽

-define(NEWSLOTS, [1,0,0,0,0]).                    %% 武器槽

%% 装备
-define(EQUIP_QUALITY_USE_COIN, 2).            %% 元宝进阶

