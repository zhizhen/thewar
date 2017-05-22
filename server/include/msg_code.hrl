%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc 返回码
%%% @date 2013-04-09 18:54:55
%%% 
%%% @end
%%%-------------------------------------------------------------------

%%%===================================================================
%%% 10000-19999 系统相关
%%% 20000-29999 账号相关
%%% 30000-39999 角色相关
%%%===================================================================
-define(PARAMS_ERROR,               10001).                             % 前端有bug换句话说参数不够专业,自己查去吧
-define(GM_MSG,                     10002).                             % 有GM命令了
-define(I_SEE,                      10003).                             % 哦
-define(MODULE_NOT_OPEN,            10004).                             % 功能没开启，别瞎JB请求
%%----------------------------------------------------------------------------------------------------------------------
-define(AUTH_FAIL,                  20001).                             % 验证失败
-define(AUTH_EXPIRED,               20002).                             % 验证过期
%%----------------------------------------------------------------------------------------------------------------------
-define(ERROR_ROLE_CREATE_FAIL,     30001).                             % 创建角色失败
-define(ROLE_NAME_REPEAT,           30002).                             % 角色名重复
-define(ROLE_LOGIN_FAIL,            30003).                             % 角色登录失败
-define(ROLE_JOB_ERROR,             30004).                             % 职业类型错误
-define(SENSITIVE_WORDS,            30005).                             % 敏感词
-define(NO_MONEY,                   30006).                             % 余额不足
-define(REQUIRE_LEVEL,              30007).                             % 等级不足
-define(NO_LEGAL,                   30008).                             % 非法操作
-define(ROLE_FREEZE,                30009).                             % 账号冻结
%%----------------------------------------------------------------------------------------------------------------------
-define(ITEM_NOT_EXIST,             40001).                             % 道具不存在
-define(ITEM_MOVE_SUCCESS,          40002).                             % 移动物品成功
-define(ITEM_NOT_ENOUGH,            40003).                             % 道具数量不够
-define(ITEM_DELETE_SUCCESS,        40004).                             % 物品删除成功
-define(ITEM_DELETE_FAILED,         40005).                             % 物品删除失败
-define(ITEM_USE_SUCCESS,           40006).                             % 物品使用成功
-define(ITEM_USE_FAILED,            40007).                             % 物品使用失败
-define(ITEM_MOVE_FAILED,           40008).                             % 移动物品失败
-define(SLOT_NOT_ENOUGH,            40009).                             % 格子不够
-define(PACKAGE_PARAMS_ERROR1,      40010).                             % 前端bug
-define(PACKAGE_PARAMS_ERROR2,      40011).                             % 前端bug
-define(PACKAGE_PARAMS_ERROR3,      40012).                             % 前端bug
-define(PACKAGE_PARAMS_ERROR4,      40013).                             % 前端bug
-define(PACKAGE_PARAMS_ERROR5,      40014).                             % 前端bug
-define(PACKAGE_PARAMS_ERROR6,      40015).                             % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(EQUIP_DRESS_SUCC,           50000).                             % 穿成功
-define(EQUIP_UNDRESS_SUCC,         50001).                             % 脱成功
-define(EQUIP_INTENSIFY_SUCC,       50002).                             % 强化成功
-define(EQUIP_QUALITY_SUCC,         50003).                             % 生品质
-define(EQUIP_PUNCH_SUCC,           50004).                             % 打孔
-define(EQUIP_INLAY_SUCC,           50005).                             % 镶嵌
-define(EQUIP_INLAYOFF_SUCC,        50006).                             % 逆镶嵌
-define(EQUIP_INLAYOFF_FAIL,        50007).                             % 逆镶嵌
-define(EQUIP_SYNTHESIS_SUCC,       50008).                             % 合成
-define(EQUIP_SYNTHESIS_FAIL,       50009).                             % 合成 失败
-define(EQUIP_SYNTHESIS_STONE_FAIL, 50010).                             % 合成宝石失败
-define(EQUIP_SYNTHESIS_STONE_SUCC, 50011).                             % 合成宝石成功
-define(EQUIP_NO_LEGAL1,            50012).                             % 宝石类型不对
-define(EQUIP_NO_LEGAL2,            50013).                             % 强化等级最高
-define(EQUIP_NO_LEGAL3,            50014).                             % 玩家等级不够
-define(EQUIP_NO_LEGAL4,            50015).                             % 不能升阶
-define(EQUIP_NO_LEGAL5,            50016).                             % 等级不足
-define(EQUIP_NO_LEGAL6,            50017).                             % 不能打孔
-define(EQUIP_NO_LEGAL7,            50018).                             % 孔都打开了
-define(EQUIP_NO_LEGAL8,            50019).                             % 没这个孔
-define(EQUIP_NO_LEGAL9,            50020).                             % 不能镶嵌
-define(EQUIP_NO_LEGAL10,           50021).                             % 覆盖操作失败
-define(EQUIP_NO_LEGAL11,           50022).                             % 宝石类型不对
-define(EQUIP_NO_LEGAL12,           50023).                             % 非法
-define(EQUIP_NO_LEGAL13,           50024).                             % 穿装备 职业或等级不够
-define(EQUIP_NO_LEGAL14,           50025).                             % 装备类型不对
-define(EQUIP_NO_LEGAL15,           50026).                             % 装备类型不对
-define(EQUIP_NO_LEGAL16,           50027).                             % 非法

-define(EQUIP_UNLOCK_SUCC,           50028).                             % 成功
-define(EQUIP_UNLOCK_FAIL,           50029).                             % 非法
-define(GEM_REMOVE_SUCCESS,          50030).                            %宝石摘除成功

%%----------------------------------------------------------------------------------------------------------------------
-define(SKILL_LEVELUP_SUCC,         60001).                             % 招式精修成功
-define(SKILL_LEARN_SUCC,           60002).                             % 技能领悟成功
-define(SKILL_NO_LEGAL1,            60003).                             % 非法
-define(SKILL_NO_LEGAL2,            60004).                             % 非法
-define(SKILL_NO_LEGAL3,            60005).                             % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(FRIEND_DEL_SUCC,            70001).                             % 好友删除成功
-define(FRIEND_BE_ENEMY_SUCC,       70002).                             % 仇敌添加成功
-define(FRIEND_INTERACT_SUCC,       70003).                             % 交互成功
-define(FRIEND_OFFLINE,             70004).                             % 不在线
-define(FRIEND_ADD_SUCC,            70005).                             % 好友添加成功
-define(FRIEND_NOT_LEGAL,           70006).                             % 添加人不存在
-define(FRIEND_NO_LEGAL1,           70007).                             % 非法
-define(FRIEND_NO_LEGAL2,           70008).                             % 非法
-define(FRIEND_NO_LEGAL3,           70009).                             % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(CHAT_WORLD_MAX,             80001).                             % 喊话次数上限
-define(CHAT_NO_LEGAL1,             80002).                             % 非法
-define(CHAT_NO_LEGAL2,             80003).                             % 非法
-define(CHAT_NO_LEGAL3,             80004).                             % 非法
-define(CHAT_NO_LEGAL4,             80005).                             % 非法
-define(CHAT_NO_LEGAL5,             80006).                             % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(SLOT_UNLOCK_SUCCESS,        90001).                             % 格子开启成功
-define(SLOT_UNLOCK_FAILED,         90002).                             % 格子开启失败
%%----------------------------------------------------------------------------------------------------------------------
-define(ENTER_MISSION,              100001).                            % 进入副本成功
-define(LEAVE_MISSION,              100002).                            % 离开副本成功
-define(NOT_IN_MISSION,             100003).                            % 不再副本里
-define(MISSION_BATTLE_SUCCESS,     100004).                            % 成功
-define(MISSION_OVERLEAP_SUCESS,    100005).                            % 开始扫荡成功
-define(MISSION_OVERLEAP_STOP,      100006).                            % 开始扫荡结束
-define(MISSION_PARAMS_ERROR1,      100007).                            % 前端bug
-define(MISSION_PARAMS_ERROR2,      100008).                            % 前端bug
-define(MISSION_PARAMS_ERROR3,      100009).                            % 前端bug
-define(MISSION_PARAMS_ERROR4,      100010).                            % 前端bug
-define(MISSION_PARAMS_ERROR5,      100011).                            % 前端bug
-define(MISSION_PARAMS_ERROR6,      100012).                            % 前端bug
-define(MISSION_PARAMS_ERROR7,      100013).                            % 前端bug
-define(MISSION_PARAMS_ERROR8,      100014).                            % 前端bug
-define(MISSION_PARAMS_ERROR9,      100015).                            % 前端bug
-define(MISSION_PARAMS_ERROR10,     100016).                            % 前端bug
-define(MISSION_PARAMS_ERROR11,     100018).                            % 活动副本条件不满足
-define(MISSION_RESET_SUCC,         100017).                            % 副本次数重置成功
%%----------------------------------------------------------------------------------------------------------------------
-define(LEAVE_SCENE,                110001).                            % 离开场景
-define(ENTER_SCENE,                110002).                            % 进入场景
-define(SCENE_FAIL,                 110003).                            % 进场景失败
-define(SWITCH_FAIL,                110004).                            % 切线失败
-define(SWITCH_SUCC,                110005).                            % 切线成功
-define(TRANSFER_SUCC,              110006).                            % 传送成功
%%----------------------------------------------------------------------------------------------------------------------
-define(SHOP_BUY_SUCCESS,           120001).                            % 随身商店购买成功
-define(SHOP_BUY_FAILED,            120002).                            % 随身商店购买失败
-define(SHOP_RETRIEVE_SUCCESS,      120003).                            % 随身商店购回物品成功
-define(SHOP_RETRIEVE_FAILED,       120004).                            % 随身商店购回物品失败
%%----------------------------------------------------------------------------------------------------------------------
-define(QUEST_GET_SUCCESS,          130001).                            % 任务领取成功
-define(QUEST_SUBMIT_SUCCESS,       130002).                            % 任务提交成功
-define(QUEST_DAILY_SUBMIT_SUCCESS, 130003).                            % 每日任务提交成功
-define(QUEST_DAILY_GIVE_UP_SUCCESS,130004).                            % 每日任务放弃
-define(QUEST_DAILY_PASS_SUCCESS,   130005).                            % 每日任务自动完成
-define(QUEST_DAILY_AWARD_SUCCESS,  130006).                            % 最终大奖
-define(QUEST_PARAMS_ERROR1,        130007).                            % 前端bug
-define(QUEST_PARAMS_ERROR2,        130008).                            % 前端bug
-define(QUEST_PARAMS_ERROR3,        130009).                            % 前端bug
-define(QUEST_PARAMS_ERROR4,        130010).                            % 前端bug
-define(QUEST_PARAMS_ERROR5,        130011).                            % 前端bug
-define(QUEST_PARAMS_ERROR6,        130012).                            % 前端bug
-define(QUEST_PARAMS_ERROR7,        130013).                            % 前端bug
-define(QUEST_PARAMS_ERROR8,        130014).                            % 前端bug
-define(QUEST_PARAMS_ERROR9,        130015).                            % 前端bug
-define(QUEST_PARAMS_ERROR10,       130016).                            % 前端bug
-define(QUEST_PARAMS_ERROR11,       130017).                            % 前端bug
-define(QUEST_PARAMS_ERROR12,       130018).                            % 前端bug
-define(QUEST_PARAMS_ERROR13,       130019).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(SOUL_MAIN_EQUIP_FAILED,     140001).                            % 主将启用失败
-define(SOUL_MAIN_EQUIP_SUCCESS,    140002).                            % 主将启用成功
-define(SOUL_SUB_EQUIP_FAILED,      140003).                            % 副将装备失败
-define(SOUL_SUB_EQUIP_SUCCESS,     140004).                            % 副将装备成功
-define(SOUL_SLOT_OPEN_FAILED,      140005).                            % 副将魂槽开启失败
-define(SOUL_SLOT_OPEN_SUCCESS,     140006).                            % 副将魂槽开启成功
-define(SOUL_EAT_FAILED,            140007).                            % 将魂吞噬失败
-define(SOUL_EAT_SUCCESS,           140008).                            % 将魂吞噬成功
-define(SOUL_MAIN_UNDRESS_FAILED,   140009).                            % 主将停用失败
-define(SOUL_MAIN_UNDRESS_SUCCESS,  140010).                            % 主将停用成功
-define(SOUL_SUB_TAKEOFF_FAILED,    140011).                            % 副将脱下失败
-define(SOUL_SUB_TAKEOFF_SUCCESS,   140012).                            % 副将脱下成功
-define(SOUL_SUB_THROW_FAILED,      140013).                            % 副将丢弃失败
-define(SOUL_SUB_THROW_SUCCESS,     140014).                            % 副将丢弃成功
%%----------------------------------------------------------------------------------------------------------------------
-define(ARENA_AWARD_SUCCESS,        150001).                            % 竞技场奖励领取成功
-define(ARENA_AWARD_FAIL,           150002).                            % 竞技场奖励领取失败
-define(ARENA_IN_BATTLE,            150003).                            % 角色战斗进行时
-define(ARENA_START_BATTLE_SUCCESS, 150004).                            % 开始战斗成功
-define(ARENA_ADD_TIMES_SUCCESS,    150005).                            % 增加次数成功
-define(ARENA_ADD_TIMES_FAIL,       150006).                            % 增加次数失败
-define(ARENA_PARAMS_ERROR1,        150007).                            % 前端bug
-define(ARENA_PARAMS_ERROR2,        150008).                            % 前端bug
-define(ARENA_PARAMS_ERROR3,        150009).                            % 前端bug
-define(ARENA_PARAMS_ERROR4,        150010).                            % 前端bug
-define(ARENA_PARAMS_ERROR5,        150011).                            % 前端bug
-define(ARENA_PARAMS_ERROR6,        150012).                            % 前端bug
-define(ARENA_PARAMS_ERROR7,        150013).                            % 前端bug
-define(ARENA_PARAMS_ERROR8,        150014).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(UNIVERSE_UPGRADE_FAILED,    160001).                            % 四象升级失败
-define(UNIVERSE_UPGRADE_SUCCESS,   160002).                            % 四象升级成功
%%----------------------------------------------------------------------------------------------------------------------
-define(MAILING_READ_SUCESS,        170001).                            % 邮件读取成功
-define(MAILING_GET_ATTACHMENT,     170002).                            % 附件获取成功
-define(MAILING_DELETE_SUCESS,      170003).                            % 邮件删除成功
-define(MAILING_HAS_NEW,            170004).                            % 您有新消息了
-define(MAIL_PARAMS_ERROR1,         170005).                            % 前端bug
-define(MAIL_PARAMS_ERROR2,         170006).                            % 前端bug
-define(MAIL_PARAMS_ERROR3,         170007).                            % 前端bug
-define(MAIL_PARAMS_ERROR4,         170008).                            % 前端bug
-define(MAIL_PARAMS_ERROR5,         170009).                            % 前端bug
-define(MAIL_PARAMS_ERROR6,         170010).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(SPIRIT_NOT_EXIST,           180001).                            % 神格不存在
-define(SPIRIT_NOT_EQUIPED,         180002).                            % 装备的神格不存在
-define(SPIRIT_NOT_IN_PACK,         180003).                            % 神格未在背包中
-define(SPIRIT_ARG_ILLEGAL,         180004).                            % 神格参数不合法
-define(SPIRIT_TYPE_ERROR,          180005).                            % 神格类型不相符
-define(SPIRIT_NPC_NOT_EXIST,       180006).                            % 女神不存在
-define(SPIRIT_NPC_NOT_ACTIVE,      180007).                            % 女神未激活
-define(SPIRIT_SLOT_NOT_AVAILABLE,  180008).                            % 格子不可用
-define(SPIRIT_PACKSLOT_OPENED,     180009).                            % 格子已开启
-define(SPIRIT_ALREADY_COLLECT,     180010).                            % 神格已拾取
-define(SPIRIT_COLLECT_SUCC,        180011).                            % 神格拾取成功
-define(SPIRIT_OPENPACK_SUCC,       180012).                            % 神格背包格子开启成功
-define(SPIRIT_SLOT_NOT_EXIST,      180013).                            % 神格装备槽不存在
-define(SPIRIT_SLOT_NOT_OPENED,     180014).                            % 神格装备槽未开启
-define(SPIRIT_SLOT_EQUIPED,        180015).                            % 神格装备槽已装备
-define(SPIRIT_EQUIP_SUCC,          180016).                            % 神格装备成功
-define(SPIRIT_OFF_SUCC,            180017).                            % 神格脱下成功
-define(SPIRIT_MOVE_SUCC,           180018).                            % 神格移动成功
-define(SPIRIT_SAME_TYPE,           180019).                            % 已装备相同类型神格
-define(SPIRIT_NO_LEGAL1,           180020).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(CULTIVATE_SAVE_SUCC,        190000).                            % 培养保存成功
-define(CULTIVATE_NO_LEGAL1,        190001).                            % 非法
-define(CULTIVATE_NO_LEGAL2,        190002).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(CHARM_SEND_SUCCESS,         200000).                            % 赠送成功
-define(CHARM_SEND_FAILED,          200001).                            % 失败
-define(CHARM_PARAMS_ERROR1,        200002).                            % 前端bug
-define(CHARM_PARAMS_ERROR2,        200003).                            % 前端bug
-define(CHARM_PARAMS_ERROR3,        200004).                            % 前端bug
-define(CHARM_PARAMS_ERROR4,        200005).                            % 前端bug
-define(CHARM_PARAMS_ERROR5,        200006).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(OFFLINE_GET_EXP_SUCC,       210001).                            % 领取离线经验成功
-define(OFFLINE_TIME_WAIT,          210002).                            % 急个甚
-define(OFFLINE_PARAMS_ERROR1,      210003).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR2,      210004).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR3,      210005).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR4,      210006).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR5,      210007).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR6,      210008).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR7,      210009).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR8,      210010).                            % 前端bug
-define(OFFLINE_PARAMS_ERROR9,      210011).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(RANK_NUM_TOO_HIGH,          220001).                            % 长度牛逼的太狠了
%%----------------------------------------------------------------------------------------------------------------------
-define(ACT_GET_SUCC,               230000).                            % 在线领取成功
-define(ACT_GET_FAIL1,              230001).                            % 已经领了
-define(ACT_GET_FAIL2,              230002).                            % 冷却时间未过
-define(SIGN_PAY_SUCC,              230003).                            % 补签成功
-define(SIGN_PAY_FAIL,              230004).                            % 补签失败
-define(SIGN_GET_SUCC,              230005).                            % 签到成功
-define(SIGN_GET_FAIL,              230006).                            % 签到失败
%%----------------------------------------------------------------------------------------------------------------------
-define(COIN2GOLD_GET_SUCC,         240004).                            % 点金成功
-define(COIN2GOLD_GET_FAIL,         240005).                            % 点金失败
-define(COIN2GOLD_PARAMS_ERROR1,    240006).                            % 前端bug
-define(COIN2GOLD_PARAMS_ERROR2,    240007).                            % 前端bug
-define(COIN2GOLD_PARAMS_ERROR3,    240008).                            % 前端bug
-define(COIN2GOLD_PARAMS_ERROR4,    240009).                            % 前端bug
-define(COIN2GOLD_PARAMS_ERROR5,    240010).                            % 前端bug
-define(COIN2GOLD_PARAMS_ERROR6,    240011).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(CLIFFORD_MAX_ERROR,         250000).                            % 祈福次数已达上限
-define(CLIFFORD_NO_LEGAL1,         250001).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(COIN2EXP_FOLLOW_SUCC,       260006).                            % 拜师成功
-define(COIN2EXP_FOLLOW_FAIL,       260007).                            % 拜师失败
-define(COIN2EXP_SPEEDUP_SUCC,      260008).                            % 加速训练成功
-define(COIN2EXP_SPEEDUP_FAIL,      260009).                            % 加速训练失败
-define(COIN2EXP_FINISH_SUCC,       260010).                            % 出师成功
-define(COIN2EXP_FINISH_FAIL,       260011).                            % 出师失败
-define(COIN2EXP_PARAMS_ERROR1,     260012).                            % 前端bug
-define(COIN2EXP_PARAMS_ERROR2,     260013).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(GOLDEN_DELAY_SUCC,          270000).                            % 延时成功
-define(GOLDEN_DELAY_FAIL,          270001).                            % 延时失败
-define(GOLDEN_MISSION_NO_LEGAL1,   270002).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(BOUDOIR_OPEN_SUCCESS,       280000).                            % 封印开启成功
-define(BOUDOIR_SEAL_OPENED,        280001).                            % 封印已开启

%%----------------------------------------------------------------------------------------------------------------------
-define(MALL_BUY_SUCCESS,           290000).                            % 商城购买成功
-define(MALL_BUY_FAILED,            290001).                            % 商城购买失败
-define(MALL_PARAMS_ERROR1,         290002).                            % 前端bug
-define(MALL_PARAMS_ERROR2,         290003).                            % 前端bug
-define(MALL_PARAMS_ERROR3,         290004).                            % 前端bug
-define(MALL_PARAMS_ERROR4,         290005).                            % 前端bug
-define(MALL_PARAMS_ERROR5,         290006).                            % 前端bug
%%----------------------------------------------------------------------------------------------------------------------
-define(GROUP_FULL,                 300000).                            % 人满
-define(GROUP_CREATE_FAIL,          300001).                            % 创建失败
-define(GROUP_SEARCH_NONE,          300002).                            % 搜索空
-define(GROUP_REPLY_SUCC,           300003).                            % 回复成功
-define(GROUP_REPLY_FAIL,           300004).                            % 回复成功
-define(GROUP_LEAVE_SUCC,           300005).                            % 离开成功
-define(GROUP_APPOINT_SUCC,         300006).                            % 任命成功
-define(GROUP_APPOINT_FAIL,         300007).                            % 任命失败
-define(GROUP_CLOSE_SUCC,           300008).                            % 关闭成功
-define(GROUP_CLOSE_FAIL,           300009).                            % 关闭失败
-define(GROUP_SKIPCD_SUCC,          300010).                            % skipcd succ
-define(GROUP_INVITE_SUCC,          300011).                            % skipcd succ
-define(GROUP_TRAIN_SUCC,           300012).                            % 训练成功
-define(GROUP_MALL_SUCC,            300013).                            % 购买成功
-define(GROUP_ID_FAIL,              300014).                            % 没有帮会
-define(GROUP_NO_LEGAL1,            300015).                            % 非法
-define(GROUP_NO_LEGAL2,            300016).                            % 非法
-define(GROUP_NO_LEGAL3,            300017).                            % 非法
-define(GROUP_NO_LEGAL4,            300018).                            % 非法
-define(GROUP_NO_LEGAL5,            300019).                            % 非法
-define(GROUP_NO_LEGAL6,            300020).                            % 非法
-define(GROUP_NO_LEGAL7,            300021).                            % 非法
-define(GROUP_NO_LEGAL8,            300022).                            % 非法
-define(GROUP_NO_LEGAL9,            300023).                            % 非法
-define(GROUP_NO_LEGAL10,           300024).                            % 非法
-define(GROUP_NO_LEGAL11,           300025).                            % 非法
-define(GROUP_NO_LEGAL12,           300026).                            % 非法
-define(GROUP_NO_LEGAL13,           300027).                            % 非法
-define(GROUP_NO_LEGAL14,           300028).                            % 非法
-define(GROUP_NO_LEGAL15,           300029).                            % 非法
-define(GROUP_NO_LEGAL16,           300030).                            % 非法
-define(GROUP_JOIN_SUCC,            300031).                            % 申请成功
-define(GROUP_T_SUCC,               300032).                            % 转让成功
-define(GROUP_T_FAIL,               300033).                            % 转让失败
-define(GROUP_T_BYOTHER,            300034).                            % 被转让副帮主

-define(GROUP_POOL_JOIN_FAIL,       301001).                            % 进入
-define(GROUP_POOL_JOIN_SUCC,       301002).                            % 进入
-define(GROUP_POOL_SYNC_FAIL,       301003).                            % 同步失败
-define(GROUP_POOL_SYNC_SUCC,       301004).                            % 同步成功
-define(GROUP_POOL_MAX,             301005).                            % 达到最大次数
-define(GROUP_POOL_NO_LEGAL1,       301006).                            % 非法
-define(GROUP_POOL_PLAY_SUCC,       301007).                            % 成功

-define(GROUP_MEETING_SUCC,         302001).                            % 聚义参加
-define(GROUP_MEETING_FAIL,         302002).                            % 聚义失败
-define(GROUP_VALUE_FAIL,           302003).                            % 捐献失败
-define(GROUP_VALUE_SUCC,           302004).                            % 捐献成功
-define(GROUP_MEETING_SUCC2,        302005).                            % 帮会聚义完成了
-define(GROUP_METTING_NO_LEGAL1,    302006).                            % 非法

-define(GROUP_BOSS_OPENED,          303001).                            % 帮派boss开启了
%%----------------------------------------------------------------------------------------------------------------------
-define(VIP_DAILY_GIFT_ALREADY_GOT, 310000).                            %% vip礼包已领取
-define(VIP_DAILY_GIFT_GOT_ERROR,   310001).                            %% vip礼包领取失败
-define(VIP_DAILY_GIFT_GOT_SUCC,    310002).                            %% vip每日礼包领取成功
-define(VIP_LEVEL_TOO_LOW,          310003).                            %% vip等级不够
-define(VIP_LEVEL_GIFT_GOT_ERROR,   310004).                            %% vip等级礼包领取失败
-define(VIP_LEVEL_GIFT_GOT_SUCC,    310005).                            %% vip等级礼包领取成功
-define(VIP_LEVEL_GIFT_ALREADY_GOT, 310006).                            %% vip等级礼包已经领取
%%----------------------------------------------------------------------------------------------------------------------
-define(GROUP_TREE_TIMES_USE_UP,    320000).                            %% 浇水次数已达上限
-define(GROUP_TREE_SUCCESS,         320001).                            %% 浇水成功
-define(GROUP_TREE_FULL,            320002).                            %% 神树灵气值已满
-define(GROUP_TREE_FAIL,            320003).                            %% 浇水失败
-define(GROUP_TREE_SHAKE_SUCCESS,   320004).                            %% 摇树成功
-define(GROUP_TREE_SHAKE_FAIL,      320005).                            %% 摇树失败
-define(GROUP_TREE_NOT_FULL,        320006).                            %% 神树灵气值未满
-define(GROUP_TREE_HAVE_SHAKED,     320007).                            %% 今日已摇
%%----------------------------------------------------------------------------------------------------------------------
-define(BOSS_NOT_OPEN,              330001).
-define(BOSS_NOT_IN,                330002).                            % 不再boss场景中
-define(BOSS_START_SUCESS,          330003).
-define(BOSS_JOIN_SUCESS,           330004).
-define(BOSS_LEAVE_SUCESS,          330005).
-define(BOSS_ID_FAIL,               330006).                            % BOSSID错误
-define(BOSS_ALREADY_END,           330007).                            % 今天已经打过了
-define(BOSS_YOU_ARE_DEAD,          330008).                            % 你死了
-define(BOSS_YOU_ARE_NOT_DEAD,      330009).                            % 你没死
%%----------------------------------------------------------------------------------------------------------------------
-define(WARRIOR_FIGHT_FAIL,         340001).
-define(WARRIOR_FIGHT_SUCC,         340002).
-define(WARRIOR_COLLECT_PAY_FAIL,   340003).
-define(WARRIOR_COLLECT_SAVE_SUCC,  340004).
-define(WARRIOR_COLLECT_SAVE_FAIL,  340005).
-define(WARRIOR_CALL_LEVEL,         340006).
-define(WARRIOR_CALL_ITEM,          340007).
-define(WARRIOR_CALL_SOUL,          340008).
-define(WARRIOR_CALL_SUCC,          340009).
-define(WARRIOR_CALL_FAIL,          340010).
-define(WARRIOR_BUILD_FAIL,         340011).
-define(WARRIOR_BUILD_SUCC,         340012).
-define(WARRIOR_STRENGTH_SUCC,      340013).
-define(WARRIOR_STRENGTH_FAIL,      340014).
-define(WARRIOR_UNLOCK_FAIL,        340015).
-define(WARRIOR_WASH_FAIL,          340016).
-define(WARRIOR_SUCC1,              340017).
-define(WARRIOR_SUCC2,              340018).
-define(WARRIOR_SUCC3,              340019).
-define(WARRIOR_SUCC4,              340020).
-define(WARRIOR_COLLECT_FAIL,       340021).

-define(WARRIOR_NO_LEGAL1,          340030).
-define(WARRIOR_NO_LEGAL2,          340031).
-define(WARRIOR_NO_LEGAL3,          340032).
-define(WARRIOR_NO_LEGAL4,          340034).
-define(WARRIOR_NO_LEGAL5,          340035).
-define(WARRIOR_NO_LEGAL6,          340036).
-define(WARRIOR_NO_LEGAL7,          340037).
-define(WARRIOR_NO_LEGAL8,          340038).

%%----------------------------------------------------------------------------------------------------------------------
-define(SCOUT_QUEST_NOT_FINISH,     350001).
-define(SCOUT_AWARD_SUCCESS,        350002).
-define(SCOUT_PARAMS_ERROR1,        350003).                            % 前端bug
-define(SCOUT_PARAMS_ERROR2,        350004).                            % 前端bug
-define(SCOUT_PARAMS_ERROR3,        350005).                            % 前端bug
-define(SCOUT_PARAMS_ERROR4,        350006).                            % 前端bug
-define(SCOUT_PARAMS_ERROR5,        350007).                            % 前端bug
-define(SCOUT_PARAMS_ERROR6,        350008).                            % 前端bug
-define(SCOUT_PARAMS_ERROR7,        350009).                            % 前端bug
-define(SCOUT_PARAMS_ERROR8,        350010).                            % 前端bug
-define(SCOUT_PARAMS_ERROR9,        350011).                            % 前端bug
-define(SCOUT_BUY_FAILED,           350012).
-define(SCOUT_BUY_SUCCESS,          350013).
-define(SCOUT_HELP_SUCCESS,         350014).                            % 协助巡哨成功
-define(SCOUT_HELP_FAILED_ERROR1,   350015).                            % 已协助过此玩家
-define(SCOUT_HELP_FAILED_ERROR2,   350016).                            % 被协助次数不足
%%----------------------------------------------------------------------------------------------------------------------
-define(LIVING_NO_LEGAL1,           360001).                            % 非法
-define(LIVING_NO_LEGAL2,           360002).                            % 非法
-define(LIVING_NO_LEGAL3,           360003).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(ACT_NO_LEGAL1,              370001).                            % 非法
%%----------------------------------------------------------------------------------------------------------------------
-define(FEEDBACK_SUBMIT_SUCC,       380001).                            % 反馈成功
-define(FEEDBACK_SUBMIT_FAIL,       380002).                            % 反馈失败
%%----------------------------------------------------------------------------------------------------------------------
-define(ROLE_POWER_TIMES_USE_UP,    390001).                            % 购买体力次数已用完
-define(ROLE_POWER_BUY_SUCCESS,     390002).                            % 购买成功

-define(TREASURE_EXPLORE_FAILED,    400001).
-define(TREASURE_CAN_LOOT,          400003).
-define(TREASURE_CANNOT_LOOT,       400004).
-define(TREASURE_LOOT_COMMIT_SUCCESS, 400006).
-define(TREASURE_LOOT_COMMIT_FAILED, 400007).
-define(TREASURE_GUARD_FAILED,      400008).
-define(TREASURE_GUARD_SUCCESS,     400009).
-define(TREASURE_CHANGE_FAILED,     400010).
-define(TREASURE_CHANGE_SUCCESS,    400011).
-define(TREASURE_RETREAT_FAILED,    400012).
-define(TREASURE_RETREAT_SUCCESS,   400013).
-define(TREASURE_ASK_FAILED,        400014).
-define(TREASURE_ASK_SUCCESS,       400015).
-define(TREASURE_HELP_FAILED,       400016).
-define(TREASURE_HELP_SUCCESS,      400017).

%%----------------------------------------------------------------------------------------------------------------------
-define(ACT_COMPLEX_GET_FAIL1,   			401000). % 活动不存在
-define(ACT_COMPLEX_GET_FAIL2,      		401001). % 条件不足
-define(ACT_COMPLEX_GET_FAIL3,      		401002). % 达到上限
-define(ACT_COMPLEX_GET_SUCC,       		401003). % 成功
-define(ACT_COMPLEX_GET_REPEATED,       	401004). % 重复领取

-define(ACTSHENGYAN_GET_FAIL,      402001).
-define(ACTSHENGYAN_GET_SUCC,      402002).
%%----------------------------------------------------------------------------------------------------------------------
-define(CHALLENGE_TASK_NOT_EXIST,		403001).   	% 挑战任务不存在
-define(CHALLENGE_TASK_NOT_COMPLETED,   403002).	% 挑战任务未完成
-define(CHALLENGE_CHA_AWAREDED_SUCCESS, 403003).	% 挑战任务领奖成功
-define(CHALLENGE_ACH_AWAREDED_SUCCESS, 403004).	% 成就任务领奖成功
-define(CHALLENGE_RESET_ERROR,   		403005).	% 次数已用完
-define(CHALLENGE_GET_AWARD_SUCCESS, 	403006).	% 挑战宝箱领取成功
-define(CHALLENGE_GET_AWARD_FAILED, 	403007). 	% 挑战宝箱领取失败

-define(LIVING_GET_VALUE_SUCC,          403008).
-define(LIVING_GET_VALUE_FAIL,          403009).

-define(WING_DRESS_SUCC,                404001).    % 翅膀穿戴成功
-define(WING_INC_RATE_SUCC,             404002).    % 翅膀强化概率增加成功
-define(WING_SYNTHESIS_SUCC,            404003).    % 翅膀合成成功

-define(KEYGIFT_GET_SUCC,               405001).
-define(KEYGIFT_ALREADY_GET,            405002).
-define(KEYGIFT_USED,                   405003).
-define(KEYGIFT_NOT_EXIST,              405004).

%%----------------------------------------------------------------------------------------------------------------------
-define(CONTEST_FIGHT_TIMES_DONE,       	406001).   	% 武斗大会次数已用尽
-define(CONTEST_START_BATTLE_SUCCESS,   	406002).	% 挑战成功
-define(CONTEST_FINISH_BATTLE_SUCCESS,  	406003). 	% 挑战结算成功  
-define(CONTEST_GIFT_CONDITION_NOT_ENOUGH, 	406004).	% 领取条件不满足
-define(CONTEST_RECEIVE_GIFT_SUCCESS, 		406005).	% 领取胜场礼包成功
-define(CONTEST_POINT_NOT_ENOUGH, 			406006).	% 点数不足
-define(CONTEST_CFG_ERROR,					406007). 	% 配置错误
-define(CONTEST_ENEMY_NOT_EXIST, 			406008).	% 对手不存在
-define(CONTEST_GIFT_HAS_RECEIVED, 			406009).	% 奖励已经被领取
-define(CONTEST_ENEMY_HAS_BATTLED, 			406010). 	% 该对手已经挑战过了
-define(CONTEST_ENEMY_NOT_IN_BATTLED, 		406011).	% 挑战的对手错误

%%----------------------------------------------------------------------------------------------------------------------
-define(TITLE_EQUIP_FAILED,                 407001).    %称号装备失败
-define(TITLE_EQUIP_SUCCESS,                407002).    %称号装备成功
-define(TITLE_INVALID,                      407003).    %称号失效 


%%----------------------------------------------------------------------------------------------------------------------
-define(RECHARGE_CFG_ERROR,                 408001).    % 充值配置不存在

