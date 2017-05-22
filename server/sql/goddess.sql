SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

DROP PROCEDURE IF EXISTS `addField`;
delimiter ;;
CREATE PROCEDURE `addField`(
  IN tableName char(255), 
  IN fieldName char(255),
  IN fieldType char(255),
  IN isNull char(255),
  IN defaultValue char(255),
  IN comment char(255)
)
BEGIN

  DECLARE num int(11);
  set @checkstr = CONCAT("DESCRIBE ", tableName, " ", fieldName);
  call executeSql(@checkstr);
  SELECT FOUND_ROWS() INTO num;
  
  IF num <= 0 THEN
    set @sqlcmd = CONCAT("ALTER TABLE ", tableName, " add ", fieldName, " ", fieldType, " ", isNull, " ", defaultValue, " COMMENT '", comment, "'");
    call executeSql(@sqlcmd);
  ELSE
    set @sqlcmd = CONCAT("ALTER TABLE ", tableName, " change ", fieldName, " ", fieldName, " ", fieldType, " ", isNull, " ", defaultValue, " COMMENT '", comment, "'");
    call executeSql(@sqlcmd);
  END IF;
END
 ;;
delimiter ;

-- ----------------------------
--  Procedure structure for `executeSql`
-- ----------------------------
DROP PROCEDURE IF EXISTS `executeSql`;
delimiter ;;
CREATE PROCEDURE `executeSql`(
  IN sqlcmd VARCHAR(1023)
)
BEGIN
  SET @Sql = sqlcmd;
  PREPARE xiaolei FROM @Sql;
  EXECUTE xiaolei;
  DEALLOCATE PREPARE xiaolei;
END
 ;;
delimiter ;

-- ------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------

-- ----------------------------
--  Table structure for `accounts`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账号基本信息';

call addField("accounts", "create_time", "int(11)", "", "DEFAULT '0'", "注册时间");
call addField("accounts", "login_time", "int(11)", "", "DEFAULT '0'", "登录时间");

-- ----------------------------
--  Table structure for `activity`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `activity` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  `act_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`role_id`,`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动';

call addField("activity", "act_data", "blob", "", "", "活动数据");

-- ----------------------------
--  Table structure for `global_activity`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `global_activity` (
  `act_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器活动开启表';

call addField("global_activity", "expire_state", "int(11)", "NOT NULL", "DEFAULT '0'", "0-未到期 1-有效期 2-已过期");
call addField("global_activity", "open_state", "int(11)", "NOT NULL", "DEFAULT '0'", "0-未开启 1-进行中 2-已结束");
call addField("global_activity", "start_time", "int(11)", "NOT NULL", "DEFAULT '0'", "活动展示开启时间");
call addField("global_activity", "end_time", "int(11)", "NOT NULL", "DEFAULT '0'", "活动展示结束时间");
call addField("global_activity", "begin_time", "int(11)", "NOT NULL", "DEFAULT '0'", "活动动作有效开启时间");
call addField("global_activity", "expired_time", "int(11)", "NOT NULL", "DEFAULT '0'", "活动动作有效结束时间");
call addField("global_activity", "remark", "blob", "", "", "备注");

-- ----------------------------
--  Table structure for `arenas`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `arenas` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

call addField("arenas", "last_pk_time", "int(11)", "", "DEFAULT '0'", "上次pk的时间");
call addField("arenas", "pk_logs", "blob", "", "", "战斗日志");

-- ----------------------------
--  Table structure for `ban_chat`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ban_chat` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='禁言';

call addField("ban_chat", "end_time", "int(11)", "NOT NULL", "DEFAULT '0'", "禁言结束时间");

-- ----------------------------
--  Table structure for `buffs`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `buffs` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  `buff_id` int(11) NOT NULL DEFAULT '0' COMMENT 'buff id',
  PRIMARY KEY (`role_id`,`buff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户buff';

call addField("buffs", "created_at", "int(16)", "NOT NULL", "DEFAULT '0'", "出现时间");
call addField("buffs", "last_time", "int(16)", "NOT NULL", "DEFAULT '0'", "上次生效时间");
call addField("buffs", "run_times", "int(16)", "NOT NULL", "DEFAULT '0'", "执行次数");
call addField("buffs", "info", "varchar(255)", "", "DEFAULT ''", "buff数据");

-- ----------------------------
--  Table structure for `charm`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `charm` (
  `sender` varchar(64) NOT NULL DEFAULT '' COMMENT '赠送者id',
  `time` int(11) NOT NULL COMMENT '调戏时间',
  PRIMARY KEY (`sender`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='魅力值系统鲜花鸡蛋记录表';

call addField("charm", "sender_name", "varchar(64)", "NOT NULL", "DEFAULT ''", "接收人名");
call addField("charm", "sender_job", "int(11)", "NOT NULL", "DEFAULT '0'", "接收人职业");
call addField("charm", "receiver", "varchar(64)", "NOT NULL", "DEFAULT ''", "接收人id");
call addField("charm", "object", "int(11)", "NOT NULL", "DEFAULT '0'", "1-鲜花 2-鸡蛋");
call addField("charm", "num", "int(11)", "NOT NULL", "DEFAULT '0'", "赠送数量");
call addField("charm", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "0-未通知 1-已通知");

-- ----------------------------
--  Table structure for `cultivate`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `cultivate` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培养表';

call addField("cultivate", "attack", "int(11)", "", "DEFAULT '0'", "物攻");
call addField("cultivate", "life", "int(11)", "", "DEFAULT '0'", "生命");
call addField("cultivate", "skill_defense", "int(11)", "", "DEFAULT '0'", "技能防御");
call addField("cultivate", "skill_attack", "int(11)", "", "DEFAULT '0'", "技能攻击");
call addField("cultivate", "defense", "int(11)", "", "DEFAULT '0'", "物防");

-- ----------------------------
--  Table structure for `daily`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `daily` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日限制计数表';

call addField("daily", "today", "varchar(64)", "", "DEFAULT ''", "日期");
call addField("daily", "chat", "int(11)", "", "DEFAULT '0'", "计数");
call addField("daily", "mission", "blob", "", "", "副本通关次数记录");
call addField("daily", "arena_challenge", "int(11)", "", "DEFAULT '0'", "竞技场挑战次数");
call addField("daily", "arena_add_times", "int(11)", "", "DEFAULT '0'", "竞技场增加挑战次数");
call addField("daily", "interact", "blob", "", "", "交互好友id列表");
call addField("daily", "spirit_gold", "int(11)", "", "DEFAULT '0'", "玩家每日神格消费钱数");
call addField("daily", "flower", "int(11)", "", "DEFAULT '0'", "每日赠送鲜花");
call addField("daily", "egg", "int(11)", "", "DEFAULT '0'", "每日扔鸡蛋");
call addField("daily", "clifford_free", "int(11)", "", "DEFAULT '0'", "每日免费祈福计数");
call addField("daily", "clifford_count", "int(11)", "", "DEFAULT '0'", "每日消费祈福计数");
call addField("daily", "clifford", "blob", "", "",  "每日祈福物品记录");
call addField("daily", "coin2gold1", "int(11)", "", "DEFAULT '0'", "每日点金1次数");
call addField("daily", "coin2gold2", "int(11)", "", "DEFAULT '0'", "每日点金2次数");
call addField("daily", "live_value", "int(11)", "", "DEFAULT '0'", "活跃度");
call addField("daily", "live_kv", "blob", "", "", "每日活跃记录");
call addField("daily", "live_got", "varchar(64)", "", "DEFAULT ''", "每日领取奖励记录");
call addField("daily", "golden_mission", "int(11)", "", "DEFAULT '0'", "黄金迷阵进入次数");
call addField("daily", "coin2exp", "int(11)", "", "DEFAULT '0'", "每日名将点拨加速次数");
call addField("daily", "mall_buy", "blob", "", "", "商城购买道具数记录");
call addField("daily", "vip_gift", "int(11)", "", "DEFAULT '0'", "vip礼包领取状态:1-已领取，0-未领取");
call addField("daily", "group_buy", "blob", "", "", "帮会购买");
call addField("daily", "group_tree_water", "int(11)", "", "DEFAULT '0'", "帮会神树活动浇水次数");
call addField("daily", "group_tree_shake", "int(11)", "", "DEFAULT '0'", "帮会神树活动摇树");
call addField("daily", "charm", "int(11)", "", "", "魅力值");
call addField("daily", "warrior_collect", "int(11)", "", "DEFAULT '0'", "集魂");
call addField("daily", "scout_cicle", "int(11)", "", "DEFAULT '0'", "已巡哨圈数");
call addField("daily", "scout_step", "int(11)", "", "DEFAULT '1'", "当前所在哨点");
call addField("daily", "scout_help_log", "blob", "", "", "协助过我的人列表");
call addField("daily", "scout_count", "int(11)", "", "DEFAULT '0'", "已巡哨次数");
call addField("daily", "scout_h_count", "int(11)", "", "DEFAULT '0'", "已协助巡哨次数");
call addField("daily", "scout_b_count", "int(11)", "", "DEFAULT '0'", "已被协助巡哨次数");
call addField("daily", "scout_a_count", "int(11)", "", "DEFAULT '0'", "增加的巡哨次数");
call addField("daily", "scout_award", "int(11)", "", "DEFAULT '0'", "已领取的巡哨奖励");
call addField("daily", "power_times", "int(11)", "", "DEFAULT '0'", "当前购买体力次数");
call addField("daily", "shop_buy", "blob", "", "", "商店购买物品记录");
call addField("daily", "scout_buy", "int(11)", "", "DEFAULT '0'", "购买巡哨操作次数");
call addField("daily", "scout_buy_count", "int(11)", "", "DEFAULT '0'", "购买增加的巡哨次数");
call addField("daily", "treasure_explore", "int(11)", "", "DEFAULT '0'", "宝藏探索次数");
call addField("daily", "warrior_call", "int(11)", "", "DEFAULT '0'", "祭坛招募");
call addField("daily", "warrior_call_cd", "int(11)", "", "DEFAULT '0'", "祭坛招募cd");
call addField("daily", "charge", "int(11)", "", "DEFAULT '0'", "今日充值金额");
call addField("daily", "sign_general", "int(11)", "", "DEFAULT '1'", "今日普通签到状态");
call addField("daily", "sign_vip", "int(11)", "", "DEFAULT '1'", "今日豪华签到状态");
call addField("daily", "shengyan1", "int(11)", "", "DEFAULT '0'", "");
call addField("daily", "shengyan2", "int(11)", "", "DEFAULT '0'", "");
call addField("daily", "challenge", "blob", "", "",  "当日挑战任务信息");
call addField("daily", "collectsave", "int(11)", "", "DEFAULT '0'", "收割次数");
call addField("daily", "online_time", "int(11)", "", "DEFAULT '0'", "今日在线时长");
call addField("daily", "challenge_reset_times", "int(11)", "", "DEFAULT '0'", "每日挑战重置次数");
call addField("daily", "challenge_award", "int(11)", "", "DEFAULT '0'", "每日挑战宝箱领取状态");
call addField("daily", "scout_me_help_log", "blob", "", "", "我协助过的人列表");
-- ----------------------------
--  Table structure for `daily_quests`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `daily_quests` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务数据';

call addField("daily_quests", "quest_id", "int(11)", "NOT NULL", "DEFAULT '0'", "任务id");
call addField("daily_quests", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "任务状态");
call addField("daily_quests", "process", "int(11)", "NOT NULL", "DEFAULT '0'", "任务计数");
call addField("daily_quests", "accept_time", "int(11)", "", "DEFAULT '0'", "接受时间");
call addField("daily_quests", "level", "int(11)", "", "DEFAULT '0'", "任务等级");

-- ----------------------------
--  Table structure for `equips`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `equips` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色装备表， 装备id映射到items表';

call addField("equips", "weapon", "varchar(64)", "", "DEFAULT '0'", "武器");
call addField("equips", "helm", "varchar(64)", "", "DEFAULT '0'", "头盔");
call addField("equips", "armor", "varchar(64)", "", "DEFAULT '0'", "盔甲");
call addField("equips", "boots", "varchar(64)", "", "DEFAULT '0'", "靴子");
call addField("equips", "ring", "varchar(64)", "", "DEFAULT '0'", "戒指");
call addField("equips", "necklace", "varchar(64)", "", "DEFAULT '0'", "项链");
call addField("equips", "fashionable_dress", "varchar(64)", "", "DEFAULT '0'", "时装");

-- ----------------------------
--  Table structure for `feedback`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈';

call addField("feedback", "type", "tinyint(3)", "NOT NULL", "", "问题类型(1-Bug/2-建议/3-其它)");
call addField("feedback", "server_id", "int(11)", "NOT NULL", "", "服务器ID");
call addField("feedback", "role_id", "varchar(64)", "", "DEFAULT ''", "角色ID");
call addField("feedback", "role_name", "varchar(64)", "", "DEFAULT ''", "角色名字");
call addField("feedback", "content", "varchar(255)", "NOT NULL", "", "内容");
call addField("feedback", "time", "int(11)", "NOT NULL", "DEFAULT '0'", "问题提问时间戳");
call addField("feedback", "date", "varchar(32)", "NOT NULL", "DEFAULT ''", "问题提问日期时间戳");
call addField("feedback", "state", "tinyint(1) unsigned", "", "DEFAULT '0'", "状态 0-未回复 1-已回复");
call addField("feedback", "reply_content", "varchar(1024)", "", "DEFAULT ''", "回复内容");
call addField("feedback", "reply_time", "int(11)", "", "DEFAULT '0'", "回复时间");

-- ----------------------------
--  Table structure for `friends`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `friends` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `friend_id` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家ID',
  PRIMARY KEY (`role_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友关系表';

call addField("friends", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "关系状态");
call addField("friends", "created_at", "int(11)", "NOT NULL", "DEFAULT '0'", "关系建立时间");

-- ----------------------------
--  Table structure for `items`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `items` (
  `id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物品自增id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家一生中所有物品记录';

call addField("items", "role_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "用户id");
call addField("items", "item_id", "int(11)", "NOT NULL", "DEFAULT '0'", "物品模板id");
call addField("items", "level", "int(11)", "NOT NULL", "DEFAULT '1'", "强化等级");
call addField("items", "num", "int(11)", "NOT NULL", "DEFAULT '0'", "数量");
call addField("items", "slot", "int(11)", "NOT NULL", "DEFAULT '0'", "位置");
call addField("items", "created_at", "int(11)", "NOT NULL", "DEFAULT '0'", "出现时间");
call addField("items", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "物品状态,已使用,未使用");
call addField("items", "quality", "int(11)", "NOT NULL", "DEFAULT '1'", "品质");
call addField("items", "slots", "varchar(64)", "NOT NULL", "DEFAULT '1-0-0-0-0'", "第一个孔 1代表已打孔 宝石id");
call addField("items", "rune", "int(11)", "NOT NULL", "DEFAULT '0'", "符文id");
call addField("items", "star", "int(11)", "NOT NULL", "DEFAULT '0'", "符文id");
call addField("items", "wing_rate", "int(11)", "NOT NULL", "DEFAULT '0'", "1-翅膀强化必然成功，我去你大爷");

-- ----------------------------
--  Table structure for `mails`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `mails` (
  `id` varchar(64) NOT NULL DEFAULT '0' COMMENT '邮寄系统的自增id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件寄售系统';

call addField("mails", "role_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "角色id");
call addField("mails", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "邮件状态");
call addField("mails", "type", "int(11)", "NOT NULL", "DEFAULT '0'", "邮件类型");
call addField("mails", "title", "varchar(255)", "", "DEFAULT ''", "标题");
call addField("mails", "msg", "varchar(255)", "", "DEFAULT ''", "邮件内容");
call addField("mails", "attachments", "varchar(255)", "", "DEFAULT ''", "附件");
call addField("mails", "create_time", "int(11)", "NOT NULL", "DEFAULT '0'", "创建时间");
call addField("mails", "read_time", "int(11)", "", "DEFAULT '0'", "读取时间");

-- ----------------------------
--  Table structure for `missions`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `missions` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色id',
  `mission_id` int(11) NOT NULL DEFAULT '0' COMMENT '副本id',
  PRIMARY KEY (`role_id`,`mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='副本信息';

call addField("missions", "state", "int(11)", "", "DEFAULT '0'", "副本状态");
call addField("missions", "score", "int(11)", "", "DEFAULT '0'", "副本评分");

-- ----------------------------
--  Table structure for `notice`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `notice` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '消息编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统滚屏公告';

call addField("notice", "type", "int(11)", "", "DEFAULT '0'", "公告类型");
call addField("notice", "created_at", "int(11)", "", "DEFAULT '0'", "公告创建时间");
call addField("notice", "started_at", "int(11)", "", "DEFAULT '0'", "公告生效时间");
call addField("notice", "expired_at", "int(11)", "", "DEFAULT '0'", "公告过期时间");
call addField("notice", "title", "varchar(255)", "", "DEFAULT '0'", "公告标题");
call addField("notice", "msg", "blob", "", "", "公告内容");
call addField("notice", "show_interval", "int(11)", "", "DEFAULT '0'", "间隔");

-- ----------------------------
--  Table structure for `packages`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `packages` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包裹信息表';

call addField("packages", "slots", "varchar(255)", "", "DEFAULT ''", "已开启格子列表");

-- ----------------------------
--  Table structure for `quests`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `quests` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  `quest_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  PRIMARY KEY (`role_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务数据';

call addField("quests", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "任务状态");
call addField("quests", "process", "int(11)", "NOT NULL", "DEFAULT '0'", "任务计数");
call addField("quests", "accept_time", "int(11)", "", "DEFAULT '0'", "接受时间");
call addField("quests", "finish_time", "int(11)", "", "DEFAULT '0'", "完成时间");
call addField("quests", "level", "int(11)", "", "DEFAULT '0'", "任务等级");

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  `role_name` varchar(64) DEFAULT '' COMMENT '角色名字',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家属性表';

call addField("roles", "account_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "平台id");
call addField("roles", "create_time", "int(11)", "", "DEFAULT '0'", "角色创建时间");
call addField("roles", "login_time", "int(11)", "", "DEFAULT '0'", "角色登陆时间");
call addField("roles", "ol_time", "int(11)", "", "DEFAULT '0'", "在线时长");
call addField("roles", "login_days", "int(11)", "", "DEFAULT '1'", "总登陆天数");
call addField("roles", "continuous_days", "int(11)", "", "DEFAULT '1'", "连续登录天数");
call addField("roles", "job", "int(11)", "", "DEFAULT '0'", "职业类型");
call addField("roles", "scene_id", "int(11)", "", "DEFAULT '0'", "当前所在地图编号");
call addField("roles", "pos_x", "int(11)", "", "DEFAULT '0'", "地图位置");
call addField("roles", "pos_y", "int(11)", "", "DEFAULT '0'", "地图位置");
call addField("roles", "open_scene", "varchar(255)", "", "DEFAULT ''", "开启的场景");
call addField("roles", "open_function", "varchar(1023)", "", "DEFAULT ''", "开启的功能");
call addField("roles", "update_time", "int(11)", "", "DEFAULT '0'", "数据更新时间");
call addField("roles", "online_state", "int(11)", "", "DEFAULT '0'", "登录状态 0离线 1在线");
call addField("roles", "role_type", "int(11)", "", "DEFAULT '0'", "角色类型 0普通用户 1GM");
call addField("roles", "state", "int(11)", "", "DEFAULT '0'", "角色状态(正常、锁定、删除)");
call addField("roles", "state_time", "int(11)", "", "DEFAULT '0'", "用户状态的附属字段，记录状态相关的时间");
call addField("roles", "title", "int(11)", "", "DEFAULT '0'", "职称");
call addField("roles", "vip", "int(11)", "", "DEFAULT '0'", "vip等级，根据经验算的");
call addField("roles", "vip_exp", "int(11)", "", "DEFAULT '0'", "vip经验");
call addField("roles", "gold", "int(11)", "", "DEFAULT '0'", "角色金币数");
call addField("roles", "exp", "int(11)", "", "DEFAULT '0'", "经验");
call addField("roles", "level", "int(11)", "", "DEFAULT '1'", "等级,根据经验算的");
call addField("roles", "power", "int(11)", "", "DEFAULT '0'", "体力值");
call addField("roles", "power_recover_time", "int(11)", "", "DEFAULT '0'", "上次的体力回复时间");
call addField("roles", "honor", "int(11)", "", "DEFAULT '0'", "荣誉值");
call addField("roles", "hot", "int(11)", "", "DEFAULT '0'", "人气值");
call addField("roles", "vigor", "int(11)", "", "DEFAULT '0'", "活力值");
call addField("roles", "feats", "int(11)", "", "DEFAULT '0'", "功勋");
call addField("roles", "flower", "int(11)", "", "DEFAULT '0'", "鲜花");
call addField("roles", "egg", "int(11)", "", "DEFAULT '0'", "鸡蛋");
call addField("roles", "charm", "int(11)", "", "DEFAULT '0'", "魅力值");
call addField("roles", "fight", "int(32)", "", "DEFAULT '0'", "战斗力");
call addField("roles", "story", "blob", "", "", "剧情进度");
call addField("roles", "group_cd", "int(11)", "", "DEFAULT '0'", "帮派冷却结束时间");
call addField("roles", "power2", "int(11)", "", "DEFAULT '0'", "精气");
call addField("roles", "is_loot", "int(11)", "", "DEFAULT '0'", "是否掠夺");
call addField("roles", "treasure", "blob", "", "", "宝藏信息");
call addField("roles", "wing", "varchar(64)", "", "DEFAULT '0'", "翅膀");
call addField("roles", "coin", "int(11)", "", "DEFAULT '0'", "元宝");
call addField("roles", "guide", "blob", "", "", "引导进度");
call addField("roles", "title_id", "int(11)", "", "DEFAULT '0'", "称号标识");

-- ----------------------------
--  Table structure for `shops`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `shops` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家随身商店表';

call addField("shops", "latest_point", "int(11)", "", "DEFAULT '0'", "最后刷新时间");
call addField("shops", "shop_items", "varchar(255)", "NOT NULL", "DEFAULT ''", "随身商店刷新物品");

-- ----------------------------
--  Table structure for `mall`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `malls` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家商城购买限购物品日志表';

call addField("malls", "logs", "blob", "", "", "购买记录");

-- ----------------------------
--  Table structure for `skills`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `skills` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '玩家ID',
  `skill_id` int(11) NOT NULL DEFAULT '0' COMMENT '技能ID',
  PRIMARY KEY (`role_id`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家技能表';

call addField("skills", "level", "int(11)", "NOT NULL", "DEFAULT '0'", "技能级别");
call addField("skills", "slot", "int(11)", "NOT NULL", "DEFAULT '0'", "技能位置, 0为未装备");
call addField("skills", "affix", "blob", "", "", "领悟所得属性");
call addField("skills", "skills", "blob", "", "", "当前技能下所领悟的招式以及等级");

-- ----------------------------
--  Table structure for `spirit_npcs`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `spirit_npcs` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家神格商店表';

call addField("spirit_npcs", "npcs", "int(11)", "NOT NULL", "DEFAULT '1'", "已点亮的女神ID位移总和");

-- ----------------------------
--  Table structure for `spirit_slots`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `spirit_slots` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色ID',
  `slot_id` int(32) NOT NULL DEFAULT '0' COMMENT '神格槽类型ID，如1-‘乾’，2-‘坤’',
  PRIMARY KEY (`role_id`,`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家神格装备表';

call addField("spirit_slots", "id", "varchar(64)", "NOT NULL", "DEFAULT '0'", "装备的神格唯一ID");
call addField("spirit_slots", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "神格槽状态,0-不可用1-可用");

-- ----------------------------
--  Table structure for `spirits`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `spirits` (
  `id` varchar(64) NOT NULL DEFAULT '0' COMMENT '神格唯一id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家神格表';

call addField("spirits", "role_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "玩家ID");
call addField("spirits", "spirit_id", "int(11)", "NOT NULL", "DEFAULT '0'", "神格模板id");
call addField("spirits", "exp", "int(11)", "NOT NULL", "DEFAULT '0'", "经验");
call addField("spirits", "slot_id", "int(11)", "NOT NULL", "DEFAULT '0'", "神格背包中的位置，背包格子");
call addField("spirits", "state", "int(11)", "NOT NULL", "DEFAULT '0'", "神格状态0-不可用1-可用2-装备");

-- ----------------------------
--  Table structure for `sys_arena_info`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_arena_info` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '竞技场数据编号(无用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

call addField("sys_arena_info", "last_award_time", "int(11)", "", "DEFAULT '0'", "上次发放奖励时间");

-- ----------------------------
--  Table structure for `sys_arena_rank`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_arena_rank` (
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排名',
  PRIMARY KEY (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

call addField("sys_arena_rank", "role_id", "varchar(64)", "", "DEFAULT ''", "角色ID");
call addField("sys_arena_rank", "role_name", "varchar(64)", "", "DEFAULT ''", "角色名字");
call addField("sys_arena_rank", "job", "int(11)", "", "DEFAULT '0'", "职业");
call addField("sys_arena_rank", "level", "int(11)", "", "DEFAULT '0'", "等级");
call addField("sys_arena_rank", "fight", "int(11)", "", "DEFAULT '0'", "战斗力");
call addField("sys_arena_rank", "type", "int(11)", "", "DEFAULT '0'", "角色类型，虚拟or真人");
call addField("sys_arena_rank", "total_gold", "int(11)", "", "DEFAULT '0'", "积累的金币");
call addField("sys_arena_rank", "total_honor", "int(11)", "", "DEFAULT '0'", "积累的荣誉值");
call addField("sys_arena_rank", "total_exp", "int(11)", "", "DEFAULT '0'", "积累经验");
call addField("sys_arena_rank", "armor", "int(11)", "", "DEFAULT '0'", "衣服物品id");

-- ----------------------------
--  Table structure for `universes`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `universes` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='四象激活表';

call addField("universes", "id", "int(11)", "", "DEFAULT '0'", "当前已开启星宿");



CREATE TABLE IF NOT EXISTS `sign` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日签到';

call addField("sign", "general", "int(11)", "", "DEFAULT '0'", "普通签到");
call addField("sign", "vip", "int(11)", "", "DEFAULT '0'", "豪华签到");

-- ----------------------------
--  Table structure for `offline`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `offline` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='离线功能数据表';

call addField("offline", "offexp_time", "int(11)", "", "DEFAULT '0'", "最后一次领取离线经验时间");
call addField("offline", "overleap_logs", "blob", "", "", "扫荡日志");

-- ----------------------------
--  Table structure for `coin2exp`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `coin2exp` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名将点拨功能数据表';

call addField("coin2exp", "master", "int(11)", "", "DEFAULT '0'", "所拜名将id");
call addField("coin2exp", "follow_time", "int(11)", "", "DEFAULT '0'", "拜师时间");
call addField("coin2exp", "speedup_count", "int(11)", "", "DEFAULT '0'", "加速次数");

-- ----------------------------
--  Table structure for `group`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `groups` (
  `id` varchar(64) NOT NULL DEFAULT '0' COMMENT '帮会id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮会';

call addField("groups", "title", "varchar(64)", "NOT NULL", "", "名字");
call addField("groups", "gold", "bigint", "", "DEFAULT 0", "金币");
call addField("groups", "exp", "int", "", "DEFAULT 0", "经验");
call addField("groups", "members", "int", "", "DEFAULT 1", "人数");
call addField("groups", "notice", "varchar(128)", "", "DEFAULT ''", "公告");
call addField("groups", "level", "int", "", "DEFAULT '1'", "等级");
call addField("groups", "level_time", "int", "", "DEFAULT '0'", "升级时间");
call addField("groups", "creat_time", "int", "", "DEFAULT '0'", "创建时间");
call addField("groups", "creator_id", "varchar(64)", "", "DEFAULT ''", "帮主id");
call addField("groups", "creator_name", "varchar(64)", "", "DEFAULT ''", "名字");
call addField("groups", "master_id", "varchar(64)", "", "DEFAULT ''", "帮主id");
call addField("groups", "master_name", "varchar(64)", "", "DEFAULT ''", "名字");
call addField("groups", "close_time", "int", "", "DEFAULT '0'", "解散时间");


CREATE TABLE IF NOT EXISTS `group_state` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `group_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '帮会id',
  `state` int NOT NULL DEFAULT '0' COMMENT '0-发起请求, 1-正式成员',
  PRIMARY KEY (`role_id`, `group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮会成员';

call addField("group_state", "post", "int", "", "DEFAULT 0", "职务");
call addField("group_state", "time", "int", "", "DEFAULT 0", "申请时间");


-- 帮会成员表
CREATE TABLE IF NOT EXISTS `group_member` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `group_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '帮会id',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮会成员';

call addField("group_member", "value_today", "int", "", "DEFAULT 0", "今日贡献");
call addField("group_member", "value", "int", "", "DEFAULT 0", "贡献");
call addField("group_member", "value_time", "int", "", "DEFAULT 0", "贡献时间");
call addField("group_member", "attr_list", "varchar(128)", "", "DEFAULT ''", "属性");
call addField("group_member", "value_count", "int", "", "DEFAULT 0", "次数");
call addField("group_member", "allvalue", "int", "", "DEFAULT 0", "贡献总值");

CREATE TABLE IF NOT EXISTS `group_pool` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `pool_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'pool id',
  `num` int NOT NULL DEFAULT '0' COMMENT '调戏次数',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮会成员';

CREATE TABLE IF NOT EXISTS `group_role_meeting` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聚义';
call addField("group_role_meeting", "gift", "int", "", "DEFAULT 0", "领取次数");
call addField("group_role_meeting", "times", "int", "", "DEFAULT 0", "时间");

-- ----------------------------
--  Table structure for `boudoir`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `boudoirs` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='神女阁数据表';

call addField("boudoirs", "floor", "int(11)", "", "DEFAULT '1'", "当前楼层");
call addField("boudoirs", "opened_seals", "int(11)", "", "DEFAULT '0'", "当前楼层已开启的封印");

-- ----------------------------
--  Table structure for `group_trees`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `group_trees` (
  `group_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '帮会id',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='神树活动数据表';

call addField("group_trees", "air", "int", "", "DEFAULT 0", "神树灵气值");
call addField("group_trees", "members", "blob", "", "", "帮派成员神树活动信息");
call addField("group_trees", "logs", "blob", "", "", "浇水记录");


CREATE TABLE IF NOT EXISTS `group_boss` (
  `group_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '帮会id',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='神树活动数据表';

call addField("group_boss", "info", "varchar(255)", "", "DEFAULT ''", "boss信息boss_id-level");
call addField("group_boss", "start_time", "int(11)", "", "DEFAULT '0'", "开始时间");


-- ----------------------------
--  Table structure for `warrior`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `warrior` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `idx` int(11) NOT NULL COMMENT '槽位',
  PRIMARY KEY (`role_id`, `idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='武将';

call addField("warrior", "warrior_id", "int(11)", "", "DEFAULT '0'", "id");
call addField("warrior", "exp", "int(11)", "", "DEFAULT '0'", "经验");
call addField("warrior", "state", "int(11)", "", "DEFAULT '0'", "状态");
call addField("warrior", "attr1", "varchar(255)", "", "DEFAULT ''", "培养");
call addField("warrior", "attr2", "varchar(255)", "", "DEFAULT ''", "培养");
call addField("warrior", "attr3", "varchar(255)", "", "DEFAULT ''", "培养");
call addField("warrior", "attr4", "varchar(255)", "", "DEFAULT ''", "培养");
call addField("warrior", "attr5", "varchar(255)", "", "DEFAULT ''", "培养");
call addField("warrior", "attr6", "varchar(255)", "", "DEFAULT ''", "培养");


-- ----------------------------
--  Table structure for `role_warrior`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `role_warrior` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色武将相关';

call addField("role_warrior", "warrior_id", "varchar(255)", "", "DEFAULT '0'", "出战武将");
call addField("role_warrior", "warrior_attach_id", "int(11)", "", "DEFAULT '0'", "出战武将");
call addField("role_warrior", "soul1", "int(11)", "", "DEFAULT '0'", "武魂");
call addField("role_warrior", "soul2", "int(11)", "", "DEFAULT '0'", "武魂");
call addField("role_warrior", "consume_type", "int(11)", "", "DEFAULT '0'", "消耗类型");
call addField("role_warrior", "consume_num", "int(11)", "", "DEFAULT '0'", "消耗数量");
call addField("role_warrior", "ccount", "int(11)", "", "DEFAULT '0'", "收集次数");
call addField("role_warrior", "collects", "varchar(255)", "", "DEFAULT ''", "收集数量");
call addField("role_warrior", "strength", "varchar(255)", "", "DEFAULT ''", "强化");
call addField("role_warrior", "cd", "int(11)", "", "DEFAULT '0'", "冷却");
call addField("role_warrior", "callcount", "int(11)", "", "DEFAULT '0'", "计数1");
call addField("role_warrior", "callcount1", "int(11)", "", "DEFAULT '0'", "计数2");
call addField("role_warrior", "called", "blob", "", "DEFAULT ''", "召过的");
call addField("role_warrior", "rands", "varchar(255)", "", "DEFAULT '0,0,0,0'", "刷新武将");
call addField("role_warrior", "rand_counts", "varchar(255)", "", "DEFAULT '0,0'", "刷新武将计数");
call addField("role_warrior", "collect_flag", "int(11)", "", "DEFAULT '0'", "集魂");



-- ----------------------------
--  Table structure for `world_boss`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `world_boss` (
  `boss_id` int(11) NOT NULL COMMENT 'BOSS编号',
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='世界boss';

call addField("world_boss", "level", "int(11)", "", "DEFAULT '0'", "boss等级");

-- ----------------------------
--  Table structure for `treasures`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `treasures` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '宝藏自增id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全服务器被守护的宝藏';
call addField("treasures", "role_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "所属者角色id");
call addField("treasures", "helper_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "协助守护人角色id");
call addField("treasures", "treasure_id", "int(11)", "", "", "宝藏模板id");
call addField("treasures", "explore_time", "int(11)", "", "DEFAULT '0'", "开始守护时间");
call addField("treasures", "guarders", "blob", "", "DEFAULT ''", "守护者");
call addField("treasures", "del", "int(11)", "", "DEFAULT '0'", "是否删除");

-- ----------------------------
--  Table structure for `treasures`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `explores` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色id',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家探索的宝藏';
call addField("explores", "is_loot", "int(11)", "", "DEFAULT '0'", "是否掠夺");
call addField("explores", "treasure", "blob", "", "", "宝藏信息");

-- ----------------------------
--  Table structure for `treasure_loot`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `treasure_loot` (
  `belooter` varchar(64) NOT NULL DEFAULT '' COMMENT '被掠夺人角色id',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`belooter`, `time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='掠夺记录';
call addField("treasure_loot", "looter_name", "varchar(64)", "", "DEFAULT ''", "掠夺者名字");
call addField("treasure_loot", "start_time", "int(11)", "", "DEFAULT 0", "宝藏开始守护时间");
call addField("treasure_loot", "treasure_id", "int(11)", "", "DEFAULT 0", "宝藏模板id");
call addField("treasure_loot", "result", "int(11)", "", "DEFAULT 0", "宝藏守护结果");

-- ----------------------------
--  Table structure for `achievements`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `achievements` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成就达成表';
call addField("achievements", "info", "blob", "", "", "当前已经达成的成就");

-- ----------------------------
--  Table structure for `contest`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `contest` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成就达成表';

call addField("contest", "enemy", "blob", "", "", "对手列表");
call addField("contest", "fight_times", "int(11)", "", "DEFAULT 0", "挑战次数");
call addField("contest", "gift_state", "int(11)", "", "DEFAULT 0", "胜利礼包状态");
call addField("contest", "honor_point", "int(11)", "", "DEFAULT 0", "勇气点数");
call addField("contest", "fight_point", "int(11)", "", "DEFAULT 0", "武斗点数");
call addField("contest", "last_reset", "int(11)", "", "DEFAULT 0", "上次重置时间戳");
call addField("contest", "last_fight", "int(11)", "", "DEFAULT 0", "上次挑战时间戳");
call addField("contest", "honor_gtimes", "int(11)", "", "DEFAULT 0", "勇气领奖次数");
call addField("contest", "fight_gtimes", "int(11)", "", "DEFAULT 0", "武斗领奖次数");


-- ----------------------------
--  Table structure for `titles`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `titles`(
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  `title_id` int(11) NOT NULL DEFAULT '0' COMMENT '称号ID',
  PRIMARY KEY (`role_id`,`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='称号表';

call addField("titles", "title_id", "int(11)", "", "DEFAULT '0'", "称号标识");
call addField("titles", "hold_time", "int(11)", "", "DEFAULT '0'", "称号持有时间");
call addField("titles", "status", "int(11)", "", "DEFAULT '0'", "称号的状态");

-- ----------------------------
--  Table structure for `keygift`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `keygift` (
  `code_id` varchar(64) NOT NULL DEFAULT '' COMMENT '码',
  `items`   varchar(64) NOT NULL DEFAULT '' COMMENT '物品',
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='keygift';

-- ----------------------------
--  Table structure for `orders`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色编号',
  `account_id` varchar(64) NOT NULL DEFAULT '' COMMENT '账号',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '金额,元',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '订单生成时间',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '订单状态0-未生效 1-未生成 2-已使用',
  PRIMARY KEY (`orderid`, `role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单';

DROP PROCEDURE IF EXISTS `addField`;
DROP PROCEDURE IF EXISTS `executeSql`;
SET FOREIGN_KEY_CHECKS = 1;


