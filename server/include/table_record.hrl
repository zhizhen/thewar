%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc 从数据库生成，勿手动修改，手动改此文件者木有小JJ !!!!
%%% @date 2015-04-08 15:53:25
%%% 
%%% @end
%%%-------------------------------------------------------------------
%%

-record(account, {
    account_id = "",                          %% 角色编号
    create_time = 0,                          %% 注册时间
    login_time = 0                            %% 登录时间
}).

-define(select_account_sql, <<"select * from accounts where account_id='~ts'">>).
-define(update_account_sql, <<"insert into accounts(account_id,create_time,login_time) values('~ts',~p,~p) on duplicate key update account_id=values(account_id),create_time=values(create_time),login_time=values(login_time)">>).

-record(role, {
    role_id = "",                             %% 角色编号
    role_name = "",                           %% 角色名字
    account_id = "",                          %% 平台id
    create_time = 0,                          %% 角色创建时间
    login_time = 0,                           %% 角色登陆时间
    ol_time = 0,                              %% 在线时长
    login_days = 1,                           %% 总登陆天数
    continuous_days = 1,                      %% 连续登录天数
    job = 0,                                  %% 职业类型
    scene_id = 0,                             %% 当前所在地图编号
    pos_x = 0,                                %% 地图位置
    pos_y = 0,                                %% 地图位置
    open_scene = "",                          %% 开启的场景
    open_function = "",                       %% 开启的功能
    update_time = 0,                          %% 数据更新时间
    online_state = 0,                         %% 登录状态 0离线 1在线
    role_type = 0,                            %% 角色类型 0普通用户 1GM
    state = 0,                                %% 角色状态(正常、锁定、删除)
    state_time = 0,                           %% 用户状态的附属字段，记录状态相关的时间
    title = 0,                                %% 职称
    vip = 0,                                  %% vip等级，根据经验算的
    vip_exp = 0,                              %% vip经验
    gold = 0,                                 %% 角色金币数
    exp = 0,                                  %% 经验
    level = 1,                                %% 等级根据经验算的,
    power = 0,                                %% 体力值
    power_recover_time = 0,                   %% 上次的体力回复时间
    honor = 0,                                %% 荣誉值
    hot = 0,                                  %% 人气值
    vigor = 0,                                %% 活力值
    feats = 0,                                %% 功勋
    flower = 0,                               %% 鲜花
    egg = 0,                                  %% 鸡蛋
    charm = 0,                                %% 魅力值
    fight = 0,                                %% 战斗力
    story ,                                   %% 剧情进度
    group_cd = 0,                             %% 帮派冷却结束时间
    power2 = 0,                               %% 精气
    is_loot = 0,                              %% 是否掠夺
    treasure ,                                %% 宝藏信息
    wing = <<"0">>,                           %% 翅膀
    coin = 0,                                 %% 元宝
    guide ,                                   %% 引导进度
    title_id = 0                              %% 称号标识
}).

-define(select_role_sql, <<"select * from roles where role_id='~ts'">>).
-define(update_role_sql, <<"insert into roles(role_id,role_name,account_id,create_time,login_time,ol_time,login_days,continuous_days,job,scene_id,pos_x,pos_y,open_scene,open_function,update_time,online_state,role_type,state,state_time,title,vip,vip_exp,gold,exp,level,power,power_recover_time,honor,hot,vigor,feats,flower,egg,charm,fight,story,group_cd,power2,is_loot,treasure,wing,coin,guide,title_id) values('~ts','~ts','~ts',~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts','~ts',~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p,'~ts','~ts',~p,'~ts',~p) on duplicate key update role_id=values(role_id),role_name=values(role_name),account_id=values(account_id),create_time=values(create_time),login_time=values(login_time),ol_time=values(ol_time),login_days=values(login_days),continuous_days=values(continuous_days),job=values(job),scene_id=values(scene_id),pos_x=values(pos_x),pos_y=values(pos_y),open_scene=values(open_scene),open_function=values(open_function),update_time=values(update_time),online_state=values(online_state),role_type=values(role_type),state=values(state),state_time=values(state_time),title=values(title),vip=values(vip),vip_exp=values(vip_exp),gold=values(gold),exp=values(exp),level=values(level),power=values(power),power_recover_time=values(power_recover_time),honor=values(honor),hot=values(hot),vigor=values(vigor),feats=values(feats),flower=values(flower),egg=values(egg),charm=values(charm),fight=values(fight),story=values(story),group_cd=values(group_cd),power2=values(power2),is_loot=values(is_loot),treasure=values(treasure),wing=values(wing),coin=values(coin),guide=values(guide),title_id=values(title_id)">>).

-record(equip, {
    role_id = "",                             %% 角色编号
    weapon = <<"0">>,                         %% 武器
    helm = <<"0">>,                           %% 头盔
    armor = <<"0">>,                          %% 盔甲
    boots = <<"0">>,                          %% 靴子
    ring = <<"0">>,                           %% 戒指
    necklace = <<"0">>,                       %% 项链
    fashionable_dress = <<"0">>               %% 时装
}).

-define(select_equip_sql, <<"select * from equips where role_id='~ts'">>).
-define(update_equip_sql, <<"insert into equips(role_id,weapon,helm,armor,boots,ring,necklace,fashionable_dress) values('~ts','~ts','~ts','~ts','~ts','~ts','~ts','~ts') on duplicate key update role_id=values(role_id),weapon=values(weapon),helm=values(helm),armor=values(armor),boots=values(boots),ring=values(ring),necklace=values(necklace),fashionable_dress=values(fashionable_dress)">>).

-record(buff, {
    role_id = "",                             %% 用户id
    buff_id = 0,                              %% buff id
    created_at = 0,                           %% 出现时间
    last_time = 0,                            %% 上次生效时间
    run_times = 0,                            %% 执行次数
    info = ""                                 %% buff数据
}).

-define(select_buff_sql, <<"select * from buffs where role_id='~ts' and buff_id=~p">>).
-define(update_buff_sql, <<"insert into buffs(role_id,buff_id,created_at,last_time,run_times,info) values('~ts',~p,~p,~p,~p,'~ts') on duplicate key update role_id=values(role_id),buff_id=values(buff_id),created_at=values(created_at),last_time=values(last_time),run_times=values(run_times),info=values(info)">>).

-record(quest, {
    role_id = "",                             %% 用户id
    quest_id = 0,                             %% 任务id
    state = 0,                                %% 任务状态
    process = 0,                              %% 任务计数
    accept_time = 0,                          %% 接受时间
    finish_time = 0,                          %% 完成时间
    level = 0                                 %% 任务等级
}).

-define(select_quest_sql, <<"select * from quests where role_id='~ts' and quest_id=~p">>).
-define(update_quest_sql, <<"insert into quests(role_id,quest_id,state,process,accept_time,finish_time,level) values('~ts',~p,~p,~p,~p,~p,~p) on duplicate key update role_id=values(role_id),quest_id=values(quest_id),state=values(state),process=values(process),accept_time=values(accept_time),finish_time=values(finish_time),level=values(level)">>).

-record(daily_quest, {
    role_id = "",                             %% 用户id
    quest_id = 0,                             %% 任务id
    state = 0,                                %% 任务状态
    process = 0,                              %% 任务计数
    accept_time = 0,                          %% 接受时间
    level = 0                                 %% 任务等级
}).

-define(select_daily_quest_sql, <<"select * from daily_quests where role_id='~ts'">>).
-define(update_daily_quest_sql, <<"insert into daily_quests(role_id,quest_id,state,process,accept_time,level) values('~ts',~p,~p,~p,~p,~p) on duplicate key update role_id=values(role_id),quest_id=values(quest_id),state=values(state),process=values(process),accept_time=values(accept_time),level=values(level)">>).

-record(item, {
    id = <<"0">>,                             %% 物品自增id
    role_id = "",                             %% 用户id
    item_id = 0,                              %% 物品模板id
    level = 1,                                %% 强化等级
    num = 0,                                  %% 数量
    slot = 0,                                 %% 位置
    created_at = 0,                           %% 出现时间
    state = 0,                                %% 物品状态已使用,未使用,
    quality = 1,                              %% 品质
    slots = <<"1-0-0-0-0">>,                  %% 第一个孔 1代表已打孔 宝石id
    rune = 0,                                 %% 符文id
    star = 0,                                 %% 符文id
    wing_rate = 0                             %% 1-翅膀强化必然成功，我去你大爷
}).

-define(select_item_sql, <<"select * from items where id='~ts'">>).
-define(update_item_sql, <<"insert into items(id,role_id,item_id,level,num,slot,created_at,state,quality,slots,rune,star,wing_rate) values('~ts','~ts',~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p) on duplicate key update id=values(id),role_id=values(role_id),item_id=values(item_id),level=values(level),num=values(num),slot=values(slot),created_at=values(created_at),state=values(state),quality=values(quality),slots=values(slots),rune=values(rune),star=values(star),wing_rate=values(wing_rate)">>).

-record(mission, {
    role_id = "",                             %% 角色id
    mission_id = 0,                           %% 副本id
    state = 0,                                %% 副本状态
    score = 0                                 %% 副本评分
}).

-define(select_mission_sql, <<"select * from missions where role_id='~ts' and mission_id=~p">>).
-define(update_mission_sql, <<"insert into missions(role_id,mission_id,state,score) values('~ts',~p,~p,~p) on duplicate key update role_id=values(role_id),mission_id=values(mission_id),state=values(state),score=values(score)">>).

-record(package, {
    role_id = "",                             %% 角色编号
    slots = ""                                %% 已开启格子列表
}).

-define(select_package_sql, <<"select * from packages where role_id='~ts'">>).
-define(update_package_sql, <<"insert into packages(role_id,slots) values('~ts','~ts') on duplicate key update role_id=values(role_id),slots=values(slots)">>).

-record(shop, {
    role_id = "",                             %% 用户ID
    latest_point = 0,                         %% 最后刷新时间
    shop_items = ""                           %% 随身商店刷新物品
}).

-define(select_shop_sql, <<"select * from shops where role_id='~ts'">>).
-define(update_shop_sql, <<"insert into shops(role_id,latest_point,shop_items) values('~ts',~p,'~ts') on duplicate key update role_id=values(role_id),latest_point=values(latest_point),shop_items=values(shop_items)">>).

-record(daily, {
    role_id = "",                             %% 用户ID
    today = "",                               %% 日期
    chat = 0,                                 %% 计数
    mission ,                                 %% 副本通关次数记录
    arena_challenge = 0,                      %% 竞技场挑战次数
    arena_add_times = 0,                      %% 竞技场增加挑战次数
    interact ,                                %% 交互好友id列表
    spirit_gold = 0,                          %% 玩家每日神格消费钱数
    flower = 0,                               %% 每日赠送鲜花
    egg = 0,                                  %% 每日扔鸡蛋
    clifford_free = 0,                        %% 每日免费祈福计数
    clifford_count = 0,                       %% 每日消费祈福计数
    clifford ,                                %% 每日祈福物品记录
    coin2gold1 = 0,                           %% 每日点金1次数
    coin2gold2 = 0,                           %% 每日点金2次数
    live_value = 0,                           %% 活跃度
    live_kv ,                                 %% 每日活跃记录
    live_got = "",                            %% 每日领取奖励记录
    golden_mission = 0,                       %% 黄金迷阵进入次数
    coin2exp = 0,                             %% 每日名将点拨加速次数
    mall_buy ,                                %% 商城购买道具数记录
    vip_gift = 0,                             %% vip礼包领取状态:1-已领取，0-未领取
    group_buy ,                               %% 帮会购买
    group_tree_water = 0,                     %% 帮会神树活动浇水次数
    group_tree_shake = 0,                     %% 帮会神树活动摇树
    charm ,                                   %% 魅力值
    warrior_collect = 0,                      %% 集魂
    scout_cicle = 0,                          %% 已巡哨圈数
    scout_step = 1,                           %% 当前所在哨点
    scout_help_log ,                          %% 协助过我的人列表
    scout_count = 0,                          %% 已巡哨次数
    scout_h_count = 0,                        %% 已协助巡哨次数
    scout_b_count = 0,                        %% 已被协助巡哨次数
    scout_a_count = 0,                        %% 增加的巡哨次数
    scout_award = 0,                          %% 已领取的巡哨奖励
    power_times = 0,                          %% 当前购买体力次数
    shop_buy ,                                %% 商店购买物品记录
    scout_buy = 0,                            %% 购买巡哨操作次数
    scout_buy_count = 0,                      %% 购买增加的巡哨次数
    treasure_explore = 0,                     %% 宝藏探索次数
    warrior_call = 0,                         %% 祭坛招募
    warrior_call_cd = 0,                      %% 祭坛招募cd
    charge = 0,                               %% 今日充值金额
    sign_general = 1,                         %% 今日普通签到状态
    sign_vip = 1,                             %% 今日豪华签到状态
    shengyan1 = 0,                            %% 
    shengyan2 = 0,                            %% 
    challenge ,                               %% 当日挑战任务信息
    collectsave = 0,                          %% 收割次数
    online_time = 0,                          %% 今日在线时长
    challenge_reset_times = 0,                %% 每日挑战重置次数
    challenge_award = 0,                      %% 每日挑战宝箱领取状态
    scout_me_help_log                         %% 我协助过的人列表
}).

-define(select_daily_sql, <<"select * from daily where role_id='~ts'">>).
-define(update_daily_sql, <<"insert into daily(role_id,today,chat,mission,arena_challenge,arena_add_times,interact,spirit_gold,flower,egg,clifford_free,clifford_count,clifford,coin2gold1,coin2gold2,live_value,live_kv,live_got,golden_mission,coin2exp,mall_buy,vip_gift,group_buy,group_tree_water,group_tree_shake,charm,warrior_collect,scout_cicle,scout_step,scout_help_log,scout_count,scout_h_count,scout_b_count,scout_a_count,scout_award,power_times,shop_buy,scout_buy,scout_buy_count,treasure_explore,warrior_call,warrior_call_cd,charge,sign_general,sign_vip,shengyan1,shengyan2,challenge,collectsave,online_time,challenge_reset_times,challenge_award,scout_me_help_log) values('~ts','~ts',~p,'~ts',~p,~p,'~ts',~p,~p,~p,~p,~p,'~ts',~p,~p,~p,'~ts','~ts',~p,~p,'~ts',~p,'~ts',~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p,~p,~p,~p,~p,~p,~p,~p,'~ts',~p,~p,~p,~p,'~ts') on duplicate key update role_id=values(role_id),today=values(today),chat=values(chat),mission=values(mission),arena_challenge=values(arena_challenge),arena_add_times=values(arena_add_times),interact=values(interact),spirit_gold=values(spirit_gold),flower=values(flower),egg=values(egg),clifford_free=values(clifford_free),clifford_count=values(clifford_count),clifford=values(clifford),coin2gold1=values(coin2gold1),coin2gold2=values(coin2gold2),live_value=values(live_value),live_kv=values(live_kv),live_got=values(live_got),golden_mission=values(golden_mission),coin2exp=values(coin2exp),mall_buy=values(mall_buy),vip_gift=values(vip_gift),group_buy=values(group_buy),group_tree_water=values(group_tree_water),group_tree_shake=values(group_tree_shake),charm=values(charm),warrior_collect=values(warrior_collect),scout_cicle=values(scout_cicle),scout_step=values(scout_step),scout_help_log=values(scout_help_log),scout_count=values(scout_count),scout_h_count=values(scout_h_count),scout_b_count=values(scout_b_count),scout_a_count=values(scout_a_count),scout_award=values(scout_award),power_times=values(power_times),shop_buy=values(shop_buy),scout_buy=values(scout_buy),scout_buy_count=values(scout_buy_count),treasure_explore=values(treasure_explore),warrior_call=values(warrior_call),warrior_call_cd=values(warrior_call_cd),charge=values(charge),sign_general=values(sign_general),sign_vip=values(sign_vip),shengyan1=values(shengyan1),shengyan2=values(shengyan2),challenge=values(challenge),collectsave=values(collectsave),online_time=values(online_time),challenge_reset_times=values(challenge_reset_times),challenge_award=values(challenge_award),scout_me_help_log=values(scout_me_help_log)">>).

-record(ban_chat, {
    role_id = "",                             %% 用户ID
    end_time = 0                              %% 禁言结束时间
}).

-define(select_ban_chat_sql, <<"select * from ban_chat where role_id='~ts'">>).
-define(update_ban_chat_sql, <<"insert into ban_chat(role_id,end_time) values('~ts',~p) on duplicate key update role_id=values(role_id),end_time=values(end_time)">>).

-record(spirit, {
    id = <<"0">>,                             %% 神格唯一id
    role_id = "",                             %% 玩家ID
    spirit_id = 0,                            %% 神格模板id
    exp = 0,                                  %% 经验
    slot_id = 0,                              %% 神格背包中的位置，背包格子
    state = 0                                 %% 神格状态0-不可用1-可用2-装备
}).

-define(select_spirit_sql, <<"select * from spirits where id='~ts'">>).
-define(update_spirit_sql, <<"insert into spirits(id,role_id,spirit_id,exp,slot_id,state) values('~ts','~ts',~p,~p,~p,~p) on duplicate key update id=values(id),role_id=values(role_id),spirit_id=values(spirit_id),exp=values(exp),slot_id=values(slot_id),state=values(state)">>).

-record(spirit_slot, {
    role_id = "",                             %% 角色ID
    slot_id = 0,                              %% 神格槽类型ID，如1-‘乾’，2-‘坤’
    id = <<"0">>,                             %% 装备的神格唯一ID
    state = 0                                 %% 神格槽状态0-不可用1-可用,
}).

-define(select_spirit_slot_sql, <<"select * from spirit_slots where role_id='~ts' and slot_id=~p">>).
-define(update_spirit_slot_sql, <<"insert into spirit_slots(role_id,slot_id,id,state) values('~ts',~p,'~ts',~p) on duplicate key update role_id=values(role_id),slot_id=values(slot_id),id=values(id),state=values(state)">>).

-record(spirit_npc, {
    role_id = "",                             %% 角色ID
    npcs = 1                                  %% 已点亮的女神ID位移总和
}).

-define(select_spirit_npc_sql, <<"select * from spirit_npcs where role_id='~ts'">>).
-define(update_spirit_npc_sql, <<"insert into spirit_npcs(role_id,npcs) values('~ts',~p) on duplicate key update role_id=values(role_id),npcs=values(npcs)">>).

-record(mail, {
    id = <<"0">>,                             %% 邮寄系统的自增id
    role_id = "",                             %% 角色id
    state = 0,                                %% 邮件状态
    type = 0,                                 %% 邮件类型
    title = "",                               %% 标题
    msg = "",                                 %% 邮件内容
    attachments = "",                         %% 附件
    create_time = 0,                          %% 创建时间
    read_time = 0                             %% 读取时间
}).

-define(select_mail_sql, <<"select * from mails where id='~ts'">>).
-define(update_mail_sql, <<"insert into mails(id,role_id,state,type,title,msg,attachments,create_time,read_time) values('~ts','~ts',~p,~p,'~ts','~ts','~ts',~p,~p) on duplicate key update id=values(id),role_id=values(role_id),state=values(state),type=values(type),title=values(title),msg=values(msg),attachments=values(attachments),create_time=values(create_time),read_time=values(read_time)">>).

-record(skill, {
    role_id = "",                             %% 玩家ID
    skill_id = 0,                             %% 技能ID
    level = 0,                                %% 技能级别
    slot = 0,                                 %% 技能位置 0为未装备,
    affix ,                                   %% 领悟所得属性
    skills                                    %% 当前技能下所领悟的招式以及等级
}).

-define(select_skill_sql, <<"select * from skills where role_id='~ts' and skill_id=~p">>).
-define(update_skill_sql, <<"insert into skills(role_id,skill_id,level,slot,affix,skills) values('~ts',~p,~p,~p,'~ts','~ts') on duplicate key update role_id=values(role_id),skill_id=values(skill_id),level=values(level),slot=values(slot),affix=values(affix),skills=values(skills)">>).

-record(arena, {
    role_id = "",                             %% 角色ID
    last_pk_time = 0,                         %% 上次pk的时间
    pk_logs                                   %% 战斗日志
}).

-define(select_arena_sql, <<"select * from arenas where role_id='~ts'">>).
-define(update_arena_sql, <<"insert into arenas(role_id,last_pk_time,pk_logs) values('~ts',~p,'~ts') on duplicate key update role_id=values(role_id),last_pk_time=values(last_pk_time),pk_logs=values(pk_logs)">>).

-record(sys_arena_rank, {
    rank = 0,                                 %% 排名
    role_id = "",                             %% 角色ID
    role_name = "",                           %% 角色名字
    job = 0,                                  %% 职业
    level = 0,                                %% 等级
    fight = 0,                                %% 战斗力
    type = 0,                                 %% 角色类型，虚拟or真人
    total_gold = 0,                           %% 积累的金币
    total_honor = 0,                          %% 积累的荣誉值
    total_exp = 0,                            %% 积累经验
    armor = 0                                 %% 衣服物品id
}).

-define(select_sys_arena_rank_sql, <<"select * from sys_arena_rank where rank=~p">>).
-define(update_sys_arena_rank_sql, <<"insert into sys_arena_rank(rank,role_id,role_name,job,level,fight,type,total_gold,total_honor,total_exp,armor) values(~p,'~ts','~ts',~p,~p,~p,~p,~p,~p,~p,~p) on duplicate key update rank=values(rank),role_id=values(role_id),role_name=values(role_name),job=values(job),level=values(level),fight=values(fight),type=values(type),total_gold=values(total_gold),total_honor=values(total_honor),total_exp=values(total_exp),armor=values(armor)">>).

-record(sys_arena_info, {
    id = 0,                                   %% 竞技场数据编号(无用)
    last_award_time = 0                       %% 上次发放奖励时间
}).

-define(select_sys_arena_info_sql, <<"select * from sys_arena_info where id=~p">>).
-define(update_sys_arena_info_sql, <<"insert into sys_arena_info(id,last_award_time) values(~p,~p) on duplicate key update id=values(id),last_award_time=values(last_award_time)">>).

-record(friend, {
    role_id = "",                             %% 玩家ID
    friend_id = "",                           %% 玩家ID
    state = 0,                                %% 关系状态
    created_at = 0                            %% 关系建立时间
}).

-define(select_friend_sql, <<"select * from friends where role_id='~ts' and friend_id='~ts'">>).
-define(update_friend_sql, <<"insert into friends(role_id,friend_id,state,created_at) values('~ts','~ts',~p,~p) on duplicate key update role_id=values(role_id),friend_id=values(friend_id),state=values(state),created_at=values(created_at)">>).

-record(universe, {
    role_id = "",                             %% 角色编号
    id = 0                                    %% 当前已开启星宿
}).

-define(select_universe_sql, <<"select * from universes where role_id='~ts'">>).
-define(update_universe_sql, <<"insert into universes(role_id,id) values('~ts',~p) on duplicate key update role_id=values(role_id),id=values(id)">>).

-record(cultivate, {
    role_id = "",                             %% 角色编号
    attack = 0,                               %% 物攻
    life = 0,                                 %% 生命
    skill_defense = 0,                        %% 技能防御
    skill_attack = 0,                         %% 技能攻击
    defense = 0                               %% 物防
}).

-define(select_cultivate_sql, <<"select * from cultivate where role_id='~ts'">>).
-define(update_cultivate_sql, <<"insert into cultivate(role_id,attack,life,skill_defense,skill_attack,defense) values('~ts',~p,~p,~p,~p,~p) on duplicate key update role_id=values(role_id),attack=values(attack),life=values(life),skill_defense=values(skill_defense),skill_attack=values(skill_attack),defense=values(defense)">>).

-record(activity, {
    role_id = "",                             %% 角色编号
    act_id = 0,                               %% 活动id
    act_data                                  %% 活动数据
}).

-define(select_activity_sql, <<"select * from activity where role_id='~ts' and act_id=~p">>).
-define(update_activity_sql, <<"insert into activity(role_id,act_id,act_data) values('~ts',~p,'~ts') on duplicate key update role_id=values(role_id),act_id=values(act_id),act_data=values(act_data)">>).

-record(charm_log, {
    sender = "",                              %% 赠送者id
    time ,                                    %% 调戏时间
    sender_name = "",                         %% 接收人名
    sender_job = 0,                           %% 接收人职业
    receiver = "",                            %% 接收人id
    object = 0,                               %% 1-鲜花 2-鸡蛋
    num = 0,                                  %% 赠送数量
    state = 0                                 %% 0-未通知 1-已通知
}).

-define(select_charm_log_sql, <<"select * from charm where sender='~ts' and time=~p">>).
-define(update_charm_log_sql, <<"insert into charm(sender,time,sender_name,sender_job,receiver,object,num,state) values('~ts',~p,'~ts',~p,'~ts',~p,~p,~p) on duplicate key update sender=values(sender),time=values(time),sender_name=values(sender_name),sender_job=values(sender_job),receiver=values(receiver),object=values(object),num=values(num),state=values(state)">>).

-record(feedback, {
    id ,                                      %% 问题ID
    type ,                                    %% 问题类型(1-Bug/2-建议/3-其它)
    server_id ,                               %% 服务器ID
    role_id = "",                             %% 角色ID
    role_name = "",                           %% 角色名字
    content ,                                 %% 内容
    time = 0,                                 %% 问题提问时间戳
    date = "",                                %% 问题提问日期时间戳
    state = 0,                                %% 状态 0-未回复 1-已回复
    reply_content = "",                       %% 回复内容
    reply_time = 0                            %% 回复时间
}).

-define(select_feedback_sql, <<"select * from feedback where id=~p">>).
-define(update_feedback_sql, <<"insert into feedback(id,type,server_id,role_id,role_name,content,time,date,state,reply_content,reply_time) values(~p,~p,~p,'~ts','~ts','~ts',~p,'~ts',~p,'~ts',~p) on duplicate key update id=values(id),type=values(type),server_id=values(server_id),role_id=values(role_id),role_name=values(role_name),content=values(content),time=values(time),date=values(date),state=values(state),reply_content=values(reply_content),reply_time=values(reply_time)">>).

-record(notice, {
    id = "",                                  %% 消息编号
    type = 0,                                 %% 公告类型
    created_at = 0,                           %% 公告创建时间
    started_at = 0,                           %% 公告生效时间
    expired_at = 0,                           %% 公告过期时间
    title = <<"0">>,                          %% 公告标题
    msg ,                                     %% 公告内容
    show_interval = 0                         %% 间隔
}).

-define(select_notice_sql, <<"select * from notice where id='~ts'">>).
-define(update_notice_sql, <<"insert into notice(id,type,created_at,started_at,expired_at,title,msg,show_interval) values('~ts',~p,~p,~p,~p,'~ts','~ts',~p) on duplicate key update id=values(id),type=values(type),created_at=values(created_at),started_at=values(started_at),expired_at=values(expired_at),title=values(title),msg=values(msg),show_interval=values(show_interval)">>).

-record(sign, {
    role_id = "",                             %% 角色编号
    general = 0,                              %% 普通签到
    vip = 0                                   %% 豪华签到
}).

-define(select_sign_sql, <<"select * from sign where role_id='~ts'">>).
-define(update_sign_sql, <<"insert into sign(role_id,general,vip) values('~ts',~p,~p) on duplicate key update role_id=values(role_id),general=values(general),vip=values(vip)">>).

-record(offline, {
    role_id = "",                             %% 角色编号
    offexp_time = 0,                          %% 最后一次领取离线经验时间
    overleap_logs                             %% 扫荡日志
}).

-define(select_offline_sql, <<"select * from offline where role_id='~ts'">>).
-define(update_offline_sql, <<"insert into offline(role_id,offexp_time,overleap_logs) values('~ts',~p,'~ts') on duplicate key update role_id=values(role_id),offexp_time=values(offexp_time),overleap_logs=values(overleap_logs)">>).

-record(coin2exp, {
    role_id = "",                             %% 角色编号
    master = 0,                               %% 所拜名将id
    follow_time = 0,                          %% 拜师时间
    speedup_count = 0                         %% 加速次数
}).

-define(select_coin2exp_sql, <<"select * from coin2exp where role_id='~ts'">>).
-define(update_coin2exp_sql, <<"insert into coin2exp(role_id,master,follow_time,speedup_count) values('~ts',~p,~p,~p) on duplicate key update role_id=values(role_id),master=values(master),follow_time=values(follow_time),speedup_count=values(speedup_count)">>).

-record(boudoir, {
    role_id = "",                             %% 角色编号
    floor = 1,                                %% 当前楼层
    opened_seals = 0                          %% 当前楼层已开启的封印
}).

-define(select_boudoir_sql, <<"select * from boudoirs where role_id='~ts'">>).
-define(update_boudoir_sql, <<"insert into boudoirs(role_id,floor,opened_seals) values('~ts',~p,~p) on duplicate key update role_id=values(role_id),floor=values(floor),opened_seals=values(opened_seals)">>).

-record(groups, {
    id = <<"0">>,                             %% 帮会id
    title ,                                   %% 名字
    gold = 0,                                 %% 金币
    exp = 0,                                  %% 经验
    members = 1,                              %% 人数
    notice = "",                              %% 公告
    level = 1,                                %% 等级
    level_time = 0,                           %% 升级时间
    creat_time = 0,                           %% 创建时间
    creator_id = "",                          %% 帮主id
    creator_name = "",                        %% 名字
    master_id = "",                           %% 帮主id
    master_name = "",                         %% 名字
    close_time = 0                            %% 解散时间
}).

-define(select_groups_sql, <<"select * from groups where id='~ts'">>).
-define(update_groups_sql, <<"insert into groups(id,title,gold,exp,members,notice,level,level_time,creat_time,creator_id,creator_name,master_id,master_name,close_time) values('~ts','~ts',~p,~p,~p,'~ts',~p,~p,~p,'~ts','~ts','~ts','~ts',~p) on duplicate key update id=values(id),title=values(title),gold=values(gold),exp=values(exp),members=values(members),notice=values(notice),level=values(level),level_time=values(level_time),creat_time=values(creat_time),creator_id=values(creator_id),creator_name=values(creator_name),master_id=values(master_id),master_name=values(master_name),close_time=values(close_time)">>).

-record(group_state, {
    role_id ,                                 %% 角色编号
    group_id = <<"0">>,                       %% 帮会id
    state = 0,                                %% 0-发起请求 1-正式成员,
    post = 0,                                 %% 职务
    time = 0                                  %% 申请时间
}).

-define(select_group_state_sql, <<"select * from group_state where role_id='~ts' and group_id='~ts'">>).
-define(update_group_state_sql, <<"insert into group_state(role_id,group_id,state,post,time) values('~ts','~ts',~p,~p,~p) on duplicate key update role_id=values(role_id),group_id=values(group_id),state=values(state),post=values(post),time=values(time)">>).

-record(group_member, {
    role_id ,                                 %% 角色编号
    group_id = <<"0">>,                       %% 帮会id
    value_today = 0,                          %% 今日贡献
    value = 0,                                %% 贡献
    value_time = 0,                           %% 贡献时间
    attr_list = "",                           %% 属性
    value_count = 0,                          %% 次数
    allvalue = 0                              %% 贡献总值
}).

-define(select_group_member_sql, <<"select * from group_member where role_id='~ts'">>).
-define(update_group_member_sql, <<"insert into group_member(role_id,group_id,value_today,value,value_time,attr_list,value_count,allvalue) values('~ts','~ts',~p,~p,~p,'~ts',~p,~p) on duplicate key update role_id=values(role_id),group_id=values(group_id),value_today=values(value_today),value=values(value),value_time=values(value_time),attr_list=values(attr_list),value_count=values(value_count),allvalue=values(allvalue)">>).

-record(group_pool, {
    role_id ,                                 %% 角色编号
    pool_id = "",                             %% pool id
    num = 0                                   %% 调戏次数
}).

-define(select_group_pool_sql, <<"select * from group_pool where role_id='~ts'">>).
-define(update_group_pool_sql, <<"insert into group_pool(role_id,pool_id,num) values('~ts','~ts',~p) on duplicate key update role_id=values(role_id),pool_id=values(pool_id),num=values(num)">>).

-record(group_role_meeting, {
    role_id ,                                 %% 角色编号
    gift = 0,                                 %% 领取次数
    times = 0                                 %% 时间
}).

-define(select_group_role_meeting_sql, <<"select * from group_role_meeting where role_id='~ts'">>).
-define(update_group_role_meeting_sql, <<"insert into group_role_meeting(role_id,gift,times) values('~ts',~p,~p) on duplicate key update role_id=values(role_id),gift=values(gift),times=values(times)">>).

-record(group_tree, {
    group_id = <<"0">>,                       %% 帮会id
    air = 0,                                  %% 神树灵气值
    members ,                                 %% 帮派成员神树活动信息
    logs                                      %% 浇水记录
}).

-define(select_group_tree_sql, <<"select * from group_trees where group_id='~ts'">>).
-define(update_group_tree_sql, <<"insert into group_trees(group_id,air,members,logs) values('~ts',~p,'~ts','~ts') on duplicate key update group_id=values(group_id),air=values(air),members=values(members),logs=values(logs)">>).

-record(warrior, {
    role_id ,                                 %% 角色编号
    idx ,                                     %% 槽位
    warrior_id = 0,                           %% id
    exp = 0,                                  %% 经验
    state = 0,                                %% 状态
    attr1 = "",                               %% 培养
    attr2 = "",                               %% 培养
    attr3 = "",                               %% 培养
    attr4 = "",                               %% 培养
    attr5 = "",                               %% 培养
    attr6 = ""                                %% 培养
}).

-define(select_warrior_sql, <<"select * from warrior where role_id='~ts' and idx=~p">>).
-define(update_warrior_sql, <<"insert into warrior(role_id,idx,warrior_id,exp,state,attr1,attr2,attr3,attr4,attr5,attr6) values('~ts',~p,~p,~p,~p,'~ts','~ts','~ts','~ts','~ts','~ts') on duplicate key update role_id=values(role_id),idx=values(idx),warrior_id=values(warrior_id),exp=values(exp),state=values(state),attr1=values(attr1),attr2=values(attr2),attr3=values(attr3),attr4=values(attr4),attr5=values(attr5),attr6=values(attr6)">>).

-record(role_warrior, {
    role_id ,                                 %% 角色编号
    warrior_id = <<"0">>,                     %% 出战武将
    warrior_attach_id = 0,                    %% 出战武将
    soul1 = 0,                                %% 武魂
    soul2 = 0,                                %% 武魂
    consume_type = 0,                         %% 消耗类型
    consume_num = 0,                          %% 消耗数量
    ccount = 0,                               %% 收集次数
    collects = "",                            %% 收集数量
    strength = "",                            %% 强化
    cd = 0,                                   %% 冷却
    callcount = 0,                            %% 计数1
    callcount1 = 0,                           %% 计数2
    called ,                                  %% 召过的
    rands = <<"0,0,0,0">>,                    %% 刷新武将
    rand_counts = <<"0,0">>,                  %% 刷新武将计数
    collect_flag = 0                          %% 集魂
}).

-define(select_role_warrior_sql, <<"select * from role_warrior where role_id='~ts'">>).
-define(update_role_warrior_sql, <<"insert into role_warrior(role_id,warrior_id,warrior_attach_id,soul1,soul2,consume_type,consume_num,ccount,collects,strength,cd,callcount,callcount1,called,rands,rand_counts,collect_flag) values('~ts','~ts',~p,~p,~p,~p,~p,~p,'~ts','~ts',~p,~p,~p,'~ts','~ts','~ts',~p) on duplicate key update role_id=values(role_id),warrior_id=values(warrior_id),warrior_attach_id=values(warrior_attach_id),soul1=values(soul1),soul2=values(soul2),consume_type=values(consume_type),consume_num=values(consume_num),ccount=values(ccount),collects=values(collects),strength=values(strength),cd=values(cd),callcount=values(callcount),callcount1=values(callcount1),called=values(called),rands=values(rands),rand_counts=values(rand_counts),collect_flag=values(collect_flag)">>).

-record(world_boss, {
    boss_id ,                                 %% BOSS编号
    level = 0                                 %% boss等级
}).

-define(select_world_boss_sql, <<"select * from world_boss where boss_id=~p">>).
-define(update_world_boss_sql, <<"insert into world_boss(boss_id,level) values(~p,~p) on duplicate key update boss_id=values(boss_id),level=values(level)">>).

-record(treasure, {
    id = "",                                  %% 宝藏自增id
    role_id = "",                             %% 所属者角色id
    helper_id = "",                           %% 协助守护人角色id
    treasure_id ,                             %% 宝藏模板id
    explore_time = 0,                         %% 开始守护时间
    guarders ,                                %% 守护者
    del = 0                                   %% 是否删除
}).

-define(select_treasure_sql, <<"select * from treasures where id='~ts'">>).
-define(update_treasure_sql, <<"insert into treasures(id,role_id,helper_id,treasure_id,explore_time,guarders,del) values('~ts','~ts','~ts',~p,~p,'~ts',~p) on duplicate key update id=values(id),role_id=values(role_id),helper_id=values(helper_id),treasure_id=values(treasure_id),explore_time=values(explore_time),guarders=values(guarders),del=values(del)">>).

-record(loot_log, {
    belooter = "",                            %% 被掠夺人角色id
    time ,                                    %% 时间
    looter_name = "",                         %% 掠夺者名字
    start_time = 0,                           %% 宝藏开始守护时间
    treasure_id = 0,                          %% 宝藏模板id
    result = 0                                %% 宝藏守护结果
}).

-define(select_loot_log_sql, <<"select * from treasure_loot where belooter='~ts' and time=~p">>).
-define(update_loot_log_sql, <<"insert into treasure_loot(belooter,time,looter_name,start_time,treasure_id,result) values('~ts',~p,'~ts',~p,~p,~p) on duplicate key update belooter=values(belooter),time=values(time),looter_name=values(looter_name),start_time=values(start_time),treasure_id=values(treasure_id),result=values(result)">>).

-record(achievement, {
    role_id = "",                             %% 角色编号
    info                                      %% 当前已经达成的成就
}).

-define(select_achievement_sql, <<"select * from achievements where role_id='~ts'">>).
-define(update_achievement_sql, <<"insert into achievements(role_id,info) values('~ts','~ts') on duplicate key update role_id=values(role_id),info=values(info)">>).

-record(keygift, {
    code_id = "",                             %% 码
    items = "",                               %% 物品
    role_id = ""                              %% 角色编号
}).

-define(select_keygift_sql, <<"select * from keygift where code_id='~ts'">>).
-define(update_keygift_sql, <<"insert into keygift(code_id,items,role_id) values('~ts','~ts','~ts') on duplicate key update code_id=values(code_id),items=values(items),role_id=values(role_id)">>).

-record(contest, {
    role_id = "",                             %% 角色编号
    enemy ,                                   %% 对手列表
    fight_times = 0,                          %% 挑战次数
    gift_state = 0,                           %% 胜利礼包状态
    honor_point = 0,                          %% 勇气点数
    fight_point = 0,                          %% 武斗点数
    last_reset = 0,                           %% 上次重置时间戳
    last_fight = 0,                           %% 上次挑战时间戳
    honor_gtimes = 0,                         %% 勇气领奖次数
    fight_gtimes = 0                          %% 武斗领奖次数
}).

-define(select_contest_sql, <<"select * from contest where role_id='~ts'">>).
-define(update_contest_sql, <<"insert into contest(role_id,enemy,fight_times,gift_state,honor_point,fight_point,last_reset,last_fight,honor_gtimes,fight_gtimes) values('~ts','~ts',~p,~p,~p,~p,~p,~p,~p,~p) on duplicate key update role_id=values(role_id),enemy=values(enemy),fight_times=values(fight_times),gift_state=values(gift_state),honor_point=values(honor_point),fight_point=values(fight_point),last_reset=values(last_reset),last_fight=values(last_fight),honor_gtimes=values(honor_gtimes),fight_gtimes=values(fight_gtimes)">>).

-record(order, {
    orderid = "",                             %% 订单号
    role_id = "",                             %% 角色编号
    account_id = "",                          %% 账号
    num = 0,                                  %% 金额元,
    time = 0,                                 %% 订单生成时间
    state = 0                                 %% 订单状态0-未生效 1-未生成 2-已使用
}).

-define(select_order_sql, <<"select * from orders where orderid='~ts' and role_id='~ts'">>).
-define(update_order_sql, <<"insert into orders(orderid,role_id,account_id,num,time,state) values('~ts','~ts','~ts',~p,~p,~p) on duplicate key update orderid=values(orderid),role_id=values(role_id),account_id=values(account_id),num=values(num),time=values(time),state=values(state)">>).

-record(title, {
    role_id = "",                             %% 角色编号
    title_id = 0,                             %% 称号标识
    hold_time = 0,                            %% 称号持有时间
    status = 0                                %% 称号的状态
}).

-define(select_title_sql, <<"select * from titles where role_id='~ts' and title_id=~p">>).
-define(update_title_sql, <<"insert into titles(role_id,title_id,hold_time,status) values('~ts',~p,~p,~p) on duplicate key update role_id=values(role_id),title_id=values(title_id),hold_time=values(hold_time),status=values(status)">>).

-record(mall, {
    role_id = "",                             %% 用户ID
    logs                                      %% 购买记录
}).

-define(select_mall_sql, <<"select * from malls where role_id='~ts'">>).
-define(update_mall_sql, <<"insert into malls(role_id,logs) values('~ts','~ts') on duplicate key update role_id=values(role_id),logs=values(logs)">>).

-record(global_activity, {
    act_id = 0,                               %% 活动id
    expire_state = 0,                         %% 0-未到期 1-有效期 2-已过期
    open_state = 0,                           %% 0-未开启 1-进行中 2-已结束
    start_time = 0,                           %% 活动展示开启时间
    end_time = 0,                             %% 活动展示结束时间
    begin_time = 0,                           %% 活动动作有效开启时间
    expired_time = 0,                         %% 活动动作有效结束时间
    remark                                    %% 备注
}).

-define(select_global_activity_sql, <<"select * from global_activity where act_id=~p">>).
-define(update_global_activity_sql, <<"insert into global_activity(act_id,expire_state,open_state,start_time,end_time,begin_time,expired_time,remark) values(~p,~p,~p,~p,~p,~p,~p,'~ts') on duplicate key update act_id=values(act_id),expire_state=values(expire_state),open_state=values(open_state),start_time=values(start_time),end_time=values(end_time),begin_time=values(begin_time),expired_time=values(expired_time),remark=values(remark)">>).

