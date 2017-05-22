%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-define(POOL_ID, mysql_conn_pool).
-define(RECORD_FILENAME, "../../include/table_record.hrl").
-define(TMP_TABLE_PATH, "./tmp/").
-define(BEAM_PATH, "./").

-record(erlydb_field,
    {name, name_str, name_bin, type, modifier, erl_type,
     html_input_type,
     null, key,
     default, extra, attributes}).

-define(DATABASE_CONFIG, ["192.168.1.14", 3306, "root", "rekoo", "goddess_dev1", utf8]).
%% mysql数据表对应关系
-define(MYSQL_TABLES, [
        {accounts, account, "账号"},
        {roles, role, "角色"},
        {equips, equip, "装备"},
        {buffs, buff, "buff"},
        {quests, quest, "任务"},
        {daily_quests, daily_quest, "日常任务"},
        {items, item, "物品"},
        {missions, mission, "副本"},
        {packages, package, "背包"},
        {shops, shop, "随身商店"},
        {daily, daily, "每日限制"},
        {ban_chat, ban_chat, "禁言"},
        {spirits, spirit, "神格"},
        {spirit_slots, spirit_slot, "神格装备槽"},
        {spirit_npcs, spirit_npc, "神格npc"},
        {mails, mail, "邮件系统"},
        {skills, skill, "技能"},
        {arenas, arena, "竞技场"},
        {sys_arena_rank, sys_arena_rank, "竞技场排名"},
        {sys_arena_info, sys_arena_info, "竞技场数据"},
        {friends, friend, "好友"},
        {universes, universe, "四象"},
        {cultivate, cultivate, "培养"},
        {activity, activity, "活动"},
        {charm, charm_log, "魅力"},
        {feedback, feedback, "反馈"},
        {notice, notice, "系统公告"},
        {sign, sign, "每日签到"},
        {offline, offline, "离线数据"},
        {coin2exp, coin2exp, "名将点拨数据"},
        {boudoirs, boudoir, "神女阁"},
        {groups, groups, "groups"},
        {group_state, group_state, "group_state"},
        {group_member, group_member, "group_member"},
        {group_pool, group_pool, "group_pool"},
        {group_role_meeting, group_role_meeting, "group_role_meeting"},
        {group_trees, group_tree, "帮派神树"},
        {warrior, warrior, "武将"},
        {role_warrior, role_warrior, "武将相关"},
        {world_boss, world_boss, "世界boss"},
        {treasures, treasure, "宝藏"},
        {treasure_loot, loot_log, "宝藏"},
        {achievements, achievement, "成就"},
        {wings, wing, "翅膀"},
        {keygift, keygift, "keygift"},
        {contest, contest, "武斗大会"},
        {orders, order, "充值订单"},
        {titles, title, "称号"},
        {malls, mall, "商城"},
        {global_activity, global_activity, "全服活动开启时间表"}
]).
