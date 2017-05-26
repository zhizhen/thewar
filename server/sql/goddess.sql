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
--  Table structure for `roles`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(64) NOT NULL DEFAULT 0 COMMENT '角色编号',
  `role_name` varchar(64) DEFAULT '' COMMENT '角色名字',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='玩家属性表';

call addField("roles", "account_id", "varchar(64)", "NOT NULL", "DEFAULT ''", "平台id");
call addField("roles", "create_time", "int(11)", "", "DEFAULT '0'", "角色创建时间");
call addField("roles", "login_time", "int(11)", "", "DEFAULT '0'", "角色登陆时间");


DROP PROCEDURE IF EXISTS `addField`;
DROP PROCEDURE IF EXISTS `executeSql`;
SET FOREIGN_KEY_CHECKS = 1;


