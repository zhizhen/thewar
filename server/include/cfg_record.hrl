-record(spirit_pack_cfg, {
    slot_id,                      % 背包格子ID
    gold,                         % 消耗金钱
    coin                          % 消耗代币
}).

-record(spirit_slot_cfg, {
    slot,                         % 槽位
    level,                        % 开启等级
    friend_level,                 % 好友等级
    num                           % 好友个数
}).

-record(synthesis_stone_cfg, {
    item_id,                      % 目标物品
    need_item_id,                 % 消耗物品id
    need_num,                     % 所需数量
    fail_item_id,                 % 合成失败的物品
    fail_item_num,                % 失败道具数量
    gold,                         % 消耗金币
    chance,                       % 成功几率
    bonus_item,                   % 加成道具
    chance_add                    % 加成功率
}).

-record(spirit_group_cfg, {
    gold,                         % 神格金钱消费
    group_id                      % 启用概率组id
}).

-record(spirit_cfg, {
    spirit_id,                    % 神格模板ID
    type,                         % 类型,如'乾'
    quality,                      % 品质
    exp,                          % 携带经验
    gold,                         % 出售价格
    attr1idx,                     % 
    attr1num,                     % 
    attr2idx,                     % 
    attr2num                      % 
}).

-record(spirit_chance, {
    chance,                       % 获得几率
    spirit_id                     % 神格模板ID
}).

-record(spirit_npc_cfg, {
    npc_id,                       % 女神ID
    group_id,                     % 神格概率组模板ID
    gold,                         % 花费金钱
    coin,                         % 花费元宝
    chance,                       % 点亮几率
    spirit_chances                % 神格概率组
}).

-record(item_chance, {
    chance,                       % 获得几率
    item_id,                      % 物品ID
    num,                          % 数量
    notice                        % 是否公告
}).

-record(clifford_cfg, {
    id,                           % 祈福id
    consume,                      % 消费元宝
    discount,                     % 多次祈福消费折扣
    item_chances                  % 概率组
}).

-record(enemy_team_cfg, {
    id,                           % 主键
    enemies                       % 波次
}).

-record(enemy_info, {
    enemy_id,                     % 怪物id
    num                           % 数量
}).

-record(scene_cfg, {
    id,                           % 主键
    mission_list,                 % 副本列表
    accept_quest                  % 开启任务
}).

-record(package_cfg, {
    open_slot_num,                % 开启格子数
    need_time,                    % 格子开启所需时间
    need_gold,                    % 格子开启所需金币
    need_coin,                    % 格子开启所需代币
    need_item                     % 格子开启所需物品
}).

-record(award_cfg, {
    key,                          % 主键
    awards                        % 奖励
}).

-record(cultivate_cfg, {
    sumkey,                       % 级别
    gold,                         % 金币消耗
    coin,                         % 元宝消耗
    power2,                       % 精气
    attrs                         % 属性
}).

-record(cultivate_item_cfg, {
    max,                          % 上限
    l,                            % 峰值下限
    b,                            % 峰值上限
    gold_negative_chance,         % 普通负值出现几率
    coin_negative_chance          % 高级负值出现几率
}).

-record(quality_need_item, {
    item_id,                      % id
    num                           % 
}).

-record(quality_cfg, {
    type,                         % 类型
    star,                         % 星级
    max_instensify,               % 最高强化等级
    level_reduce,                 % 升品质降低级别
    need_item                     % 升级品质需要的材料
}).

-record(living2_cfg, {
    value,                        % 值
    award                         % 奖励
}).

-record(warrior_rand_cfg, {
    id,                           % id
    chance                        % 几率
}).

-record(warrior_quality_cfg, {
    id,                           % 编号
    level                         % level
}).

-record(main_character_cfg, {
    job,                          % 职业编号
    speed,                        % 移动速度
    base_critical_attack_chance,  % 基础暴击率
    base_critical_defense_chance, % 基础抗暴率
    base_resist_chance,           % 基础免伤率
    base_attack_chance,           % 基础伤害率
    base_penetration_chance,      % 基础穿透率
    physic_attack_factor,         % 职业物理攻击系数
    skill_attack_factor,          % 职业技能攻击系数
    physic_defence_factor,        % 职业物理防御系数
    skill_defence_factor          % 职业技能防御系数
}).

-record(treasure_count_cfg, {
    count,                        % 次数
    gold                          % 消耗金币
}).

-record(act_shengyan_cfg, {
    id,                           % 编号
    start1,                       % 开始1
    end1,                         % 结束1
    start2,                       % 开始2
    end2,                         % 结束2
    power1,                       % 
    power2                        % 
}).

-record(line_cfg, {
    id,                           % 主键
    max_line,                     % maxline
    can_switch,                   % can_switch
    busy,                         % busy
    full,                         % full
    close,                        % close
    strategy,                     % strategy
    namemod                       % namemod
}).

-record(wing_synthesis_cfg, {
    item_id,                      % 物品id
    rate,                         % 概率
    cost,                         % 消耗
    num                           % 数量
}).

-record(vip_recharge_cfg, {
    index,                        % 充值券号
    coin,                         % 充值元宝
    extra,                        % 附送元宝
    money                         % 消耗平台币
}).

-record(golden_cfg, {
    vip,                          % 编号
    dailylimit,                   % 每日限制次数
    time,                         % 战斗时间
    delay                         % 时间误差
}).

-record(group_boss_cfg, {
    boss_id,                      % boss id
    init_level                    % 初始化等级
}).

-record(role_skill_id, {
    skill_id                      % skill_id
}).

-record(role_skill_cfg, {
    job,                          % 职业
    level,                        % 级别
    skills                        % 领悟技能
}).

-record(world_boss_cfg, {
    boss_id,                      % boss_id
    init_level,                   % 初始登记
    daily_open_time               % 每日开启时间
}).

-record(intensify_critical_cfg, {
    vip,                          % vip等级
    chance,                       % 暴击率
    min,                          % 暴击范围最小值
    max                           % 暴击范围最大值
}).

-record(arena_add_times_cfg, {
    times,                        % 次数
    gold,                         % 所需金币
    coin                          % 所需代币
}).

-record(exp_cfg, {
    exp,                          % 经验区间
    level                         % 等级
}).

-record(living_cfg, {
    id,                           % key
    needcount,                    % 需要次数
    value                         % 增加的活跃度
}).

-record(synthesis_need_item, {
    item_id,                      % id
    num                           % 
}).

-record(synthesis_cfg, {
    item_id,                      % 物品id
    chance,                       % 几率
    gold,                         % 消耗代币
    need_item                     % 需要物品
}).

-record(group_post_cfg, {
    id,                           % 职位
    notice,                       % 公告栏
    close,                        % 解散
    transfer,                     % 转让帮主
    handle_request,               % 处理请求
    invite,                       % 邀请成员
    kick,                         % 踢出
    act,                          % 设置活动时间
    leave,                        % 离开
    appoint1,                     % 任命副帮主
    appoint2,                     % 任命干部
    appoint3,                     % 任命成员
    start_boss                    % 开启帮派boss
}).

-record(npc_cfg, {
    npc_id                        % 编号
}).

-record(gold_mission_cfg, {
    id,                           % id
    time,                         % 战斗时间
    pay                           % gold
}).

-record(contest_win_gift_cfg, {
    level,                        % 编号
    win_times,                    % 胜利场数条件
    items,                        % 物品
    honor_point,                  % 勇气点
    fight_point                   % 武斗点
}).

-record(daily_quest_cfg, {
    quest_id,                     % 主键
    func_id,                      % 对应功能id
    min_level,                    % 需要等级
    max_level,                    % 需要等级
    event_type,                   % 事件类型
    event,                        % 事件
    process,                      % 任务总进度
    auto_need_gold,               % 自动完成消耗金币
    auto_need_coin,               % 自动完成消耗代币
    award_index,                  % 奖励id
    level_list                    % 随机等级配置
}).

-record(broadcast_cfg, {
    id,                           % key
    con1,                         % 条件
    con2,                         % 条件
    con3,                         % 条件
    tmpid,                        % 模板id
    channel                       % 频道
}).

-record(scout_cfg, {
    cicle,                        % 圈数
    awards                        % 奖励id
}).

-record(mall_cfg, {
    title,                        % 标签
    item_id,                      % 物品模板id
    type,                         % 购买方式
    cost,                         % 售价
    daily_limit,                  % 限购数量
    job_limit,                    % 限购职业
    vip_limit,                    % 限购vip等级
    buy_limit                     % 终身限购次数
}).

-record(act_online_cfg, {
    id,                           % 编号
    cd,                           % cd time
    level,                        % 级别
    award                         % 奖励
}).

-record(box_item, {
    rate,                         % 
    item_id,                      % 
    num                           % 
}).

-record(box_cfg, {
    item_id,                      % 宝箱模板ID
    count,                        % 随机次数
    items                         % 物品
}).

-record(suit_cfg, {
    id,                           % job id
    sid,                          % suit id
    items,                        % 物品列表
    add2,                         % 
    add3,                         % 
    add4,                         % 
    add5,                         % 
    add6                          % 
}).

-record(warrior_level_cfg, {
    level,                        % 编号
    exp,                          % exp
    gold                          % gold
}).

-record(warrior_call1_cfg, {
    id,                           % 编号
    ids,                          % 武将们!
    chance,                       % chance
    s1,                           % 
    s2                            % 
}).

-record(warrior_call2_cfg, {
    type,                         % 编号
    qs,                           % 武将们!
    chance,                       % chance
    cd,                           % cd time
    gold,                         % gold
    coin,                         % coin
    s1,                           % s1
    s2                            % s2
}).

-record(consume, {
    gold,                         % 金币
    coin                          % 元宝
}).

-record(inlay_cfg, {
    type,                         % 类型
    max_punch,                    % 最大打孔数
    punch_consume,                % 打孔消费
    inlay_consume,                % 镶嵌消费
    gem_type1,                    % 凹槽1宝石类型限制
    gem_type2,                    % 凹槽2宝石类型限制
    gem_type3,                    % 凹槽3宝石类型限制
    gem_type4,                    % 凹槽4宝石类型限制
    gem_type5,                    % 凹槽5宝石类型限制
    gem_remove_cost               % 摘除消费
}).

-record(coin2exp_cfg, {
    master,                       % 名将
    follow_cost,                  % 拜师消耗
    speedup_coin,                 % 加速消耗代币
    speedup_item,                 % 加速消耗物品
    exp_rate,                     % 训练完获得等级经验百分比
    add_step,                     % 每12小时曾加完成度
    speed_step,                   % 加速增加完成度
    max_exp                       % 经验限制
}).

-record(boudoir_cfg, {
    floor_id,                     % 楼层
    id,                           % 封印ID
    upgrade_needs,                % 升级所需
    plus_attr                     % bonus
}).

-record(upgrade_need, {
    item_id,                      % 材料ID
    num                           % 数量
}).

-record(warrior_attr_range, {
    id,                           % 
    min,                          % 
    max                           % 
}).

-record(warrior_attr_cfg, {
    id,                           % 槽位
    level,                        % 开放等级
    blue,                         % 
    purple,                       % 
    consume_coin,                 % 
    consume_coin_when_lock,       % 
    consume_soul,                 % 
    consume_soul_when_lock,       % 
    consume_unlock2,              % 解封第二条消耗代币
    consume_unlock3,              % 解封消耗代币
    consume_unlock4,              % 解封消耗代币
    attr_pool,                    % 天赋池子
    attr_range                    % 
}).

-record(scout_buy_cfg, {
    count,                        % 次数区间
    coin                          % 每次元宝
}).

-record(scout_event_cfg, {
    step,                         % 位置
    event,                        % 事件MFA
    randoms                       % 
}).

-record(scout_item_cfg, {
    index,                        % 档
    award,                        % 奖励id
    rate                          % 概率权重
}).

-record(boss_action_tree_cfg, {
    action_id,                    % 动作编号
    action_time,                  % 技能施放时间
    probability,                  % 出现几率
    is_end,                       % 是否结束 0不结束 1结束，高于next_action判断
    next_action                   % 下一式ID
}).

-record(rank_award_cfg, {
    rank,                         % 排名区间
    gold,                         % 金币奖励
    honor,                        % 荣誉值
    exp                           % 经验
}).

-record(notice_item_cfg, {
    item_id                       % 物品id
}).

-record(group_value_cfg, {
    id,                           % id
    gold,                         % gold
    value,                        % value
    exp,                          % exp
    count                         % 每日限制次数
}).

-record(act_detail_cfg, {
    id,                           % 编号
    id2,                          % 编号
    award1,                       % 奖励
    award2,                       % 奖励
    award3,                       % 奖励
    max,                          % 
    conds                         % 
}).

-record(sign_cfg, {
    day,                          % key
    general_awards,               % 普通签到奖励
    vip_awards,                   % 豪华签到奖励
    request_charge                % 豪华签到所需元宝
}).

-record(world_boss_award_cfg, {
    boss_id,                      % boss_id
    rank,                         % rank
    base_award,                   % 基础奖励
    special_type,                 % 特殊类型
    base_value,                   % 基础奖励
    max_limit                     % 最大上限
}).

-record(charm_cfg, {
    object,                       % 1-鲜花 2-鸡蛋
    num,                          % 数量
    self_charm,                   % 活力值增加 -表示减
    charm,                        % 魅力值增加 -表示减
    gold,                         % 消耗金币
    coin                          % 消耗代币
}).

-record(group_pool_cfg, {
    level,                        % 等级
    starttime,                    % 开始时间
    endtime,                      % 开始时间
    count,                        % 次数
    levelup,                      % 改变形象的需要的次数
    max,                          % 最高变化次数
    palygain,                     % play gain
    interval,                     % send interval
    interval_count,               % count
    gain1,                        % gain
    gain2,                        % gain
    gain3,                        % gain
    gain4,                        % gain
    gain5                         % gain
}).

-record(quality_item_price_cfg, {
    item_id,                      % 材料Id
    coin                          % 价格
}).

-record(chat_template_cfg, {
    id,                           % 编号
    keys                          % keys
}).

-record(vip_cfg, {
    vip,                          % 等级
    exp                           % 经验
}).

-record(contest_robot_cfg, {
    level,                        % 等级
    robot_num                     % 机器人数量
}).

-record(group_level_cfg, {
    level,                        % 等级
    exp,                          % exp
    max                           % 人数限制
}).

-record(wing_cfg, {
    wing_id,                      % 翅膀id
    level,                        % 等级
    fail_lv,                      % 
    rate,                         % 
    attr1idx,                     % 
    attr1ratio,                   % 
    attr2idx,                     % 
    attr2ratio,                   % 
    attr3idx,                     % 
    attr3ratio,                   % 
    attr4idx,                     % 
    attr4ratio,                   % 
    attr5idx,                     % 
    attr5ratio,                   % 
    intensive_item,               % 强化消耗物品
    item_num,                     % 强化消耗物品数
    inc_rate_cost                 % 增加概率消耗
}).

-record(viprelate_cfg, {
    level,                        % 等级
    key_rape,                     % 一键征服
    force_rape,                   % 强行征服青龙女神
    quality_coin,                 % 元宝进阶
    guru_cultivate,               % 宗师培养
    friend_interactive,           % 好友交互次数
    areana_times,                 % 擂台购买次数
    coin2gold1,                   % 点金1次数
    coin2gold2,                   % 点金2次数
    golden_times,                 % 黄金迷阵每日次数
    coin2exp,                     % 加速次数
    clifford_free,                % 免费祈福次数
    clifford_pay,                 % 付费祈福次数
    expoffline_max_time,          % 离线经验最长积攒时间
    normal_overleap_level,        % 普通副本扫荡评价
    super_overleap_level,         % 精英副本扫荡评价
    ssuper_overleap_level,        % 魔王副本扫荡评价
    golden_time,                  % 黄金迷阵持续时间
    golden_delay,                 % 黄金迷阵延迟
    gift_id,                      % 每日礼包ID
    level_gift1,                  % 剑士等级礼包ID
    level_gift2,                  % 力士等级礼包ID
    level_gift3,                  % 刺客等级礼包ID
    scout_count,                  % 每日最大巡哨次数
    scout_h_count,                % 每日最大协助巡哨次数
    scout_b_count,                % 每日最大被协助巡哨次数
    buy_power_times,              % 每日最大购买体力次数
    send_flower_times,            % 每日最大送花次数
    scout_buy,                    % 每日最大购买巡哨次数
    treasure_explore,             % 每日最大宝藏探索次数
    collect_soul_times,           % 每日最大集魂收取次数
    super_mission_reset,          % 
    master_mission_reset,         % 
    challenge_reset,              % 每日挑战任务重置次数
    act1_mission_reset,           % 三英试炼重置次数
    act2_mission_reset,           % 星宿封印重置次数
    act3_mission_reset,           % 黄巾战场重置次数
    act4_mission_reset            % 秘境寻宝重置次数
}).

-record(arena_award_cfg, {
    level,                        % 等级区间
    win_gold,                     % 胜利金币奖励
    win_honor,                    % 胜利荣誉值
    win_exp,                      % 胜利经验值
    lose_gold,                    % 失败金币奖励
    lose_honor,                   % 失败荣誉值
    lose_exp                      % 失败经验值
}).

-record(treasure_cfg, {
    treasure_id,                  % 宝藏模板id
    treasure_type,                % 产出类型
    rate,                         % 概率
    hour,                         % 守护时间(小时)
    num,                          % 数量
    guard_type,                   % 据点类型
    loot_per,                     % 掠夺奖励百分比
    power                         % 掠夺消耗体力
}).

-record(date_cfg, {
    year,                         % 
    month,                        % 
    day,                          % 
    hour,                         % 
    minute,                       % 
    second                        % 
}).

-record(act_cfg, {
    act_id,                       % 活动id
    type,                         % 活动类型
    enable,                       % 是否开启
    version,                      % 版本
    level_required,               % 等级限制
    date1,                        % 操作有效开始结束时间
    date2,                        % 活动开始结束时间
    mod                           % 
}).

-record(waterings, {
    type,                         % 浇水类型
    consume,                      % 消耗
    award,                        % 奖励
    air_add                       % 神树灵气增长
}).

-record(group_tree_cfg, {
    level,                        % 帮派等级
    max_air,                      % 神树最大灵气
    watering_times,               % 每日可浇水次数
    waterings,                    % 浇水类型
    full_award,                   % 神树灵气满成员奖励贡献
    full_air_add                  % 神树灵气满帮派经验增加
}).

-record(coin2gold_cfg, {
    level,                        % 等级
    coin1,                        % 消耗代币1
    gold1,                        % 获取金币1
    coin2,                        % 消耗代币2
    gold2,                        % 获取金币2
    coin3,                        % 消耗代币3
    gold3                         % 获取金币3
}).

-record(daily_quest_award_cfg, {
    type,                         % 类型
    level,                        % 等级
    awards_10001,                 % 奖励id
    awards_10002,                 % 奖励id
    awards_10003                  % 奖励id
}).

-record(spell_random, {
    id,                           % 属性或技能
    value                         % 值或等级
}).

-record(skill_cfg, {
    skill_id,                     % 技能ID
    level,                        % 领悟次数or 等级
    job,                          % 职业
    max,                          % 最大领悟次数
    cost,                         % 消耗战功
    gold,                         % 消耗代币
    spells                        % 领悟招式
}).

-record(gift_item, {
    item_id,                      % 
    num                           % 
}).

-record(gift_cfg, {
    item_id,                      % 礼包模板ID
    items                         % 物品
}).

-record(warrior_base_cfg, {
    type,                         % type
    level,                        % level
    life,                         % 
    attack,                       % 
    magic_attack,                 % 
    defense,                      % 
    magic_defense,                % 
    force,                        % 
    intelligence,                 % 
    penetrate,                    % 
    reduce                        % 
}).

-record(group_meeting_cfg, {
    level,                        % 等级
    count,                        % 可领奖次数
    value,                        % 获得贡献
    rolecount,                    % 聚义人数
    cd,                           % cd秒
    exp                           % group exp
}).

-record(function_cfg, {
    id,                           % 主键
    type,                         % 条件检测方式(0与 1或)
    need_level,                   % 需要等级
    need_mission,                 % 完成副本
    need_submit_quest,            % 完成任务
    need_accept_quest,            % 接受任务
    need_story,                   % 完成剧情
    tag                           % 功能标志
}).

-record(warrior_chance_cfg, {
    id,                           % id
    id2,                          % 功能分类
    count_type,                   % 
    chance,                       % 
    add_chance,                   % 
    set_zero,                     % 
    ws                            % 
}).

-record(title_cfg, {
    title_id,                     % 主键
    quality,                      % 品质
    kind,                         % 称号分类
    status,                       % 时间状态
    valid_time,                   % 有效时间
    attr1idx,                     % 
    attr1num,                     % 
    attr2idx,                     % 
    attr2num,                     % 
    attr3idx,                     % 
    attr3num,                     % 
    attr4idx,                     % 
    attr4num,                     % 
    attr5idx,                     % 
    attr5num,                     % 
    script,                       % 脚本
    check_script,                 % 完成的检测标准
    check_fight,                  % 
    type                          % 
}).

-record(group_mall_cfg, {
    guildlevel,                   % 帮会等级
    itemid,                       % 物品id
    value,                        % 需要贡献值
    count                         % 每日限量
}).

-record(group_tree_award_cfg, {
    group_level,                  % 帮派等级
    rank,                         % 浇水排名
    awards                        % 奖励
}).

-record(group_training_cfg, {
    id,                           % 属性
    level,                        % 级别
    group_level,                  % group_level
    num,                          % num
    value                         % value
}).

-record(expoffline_cfg, {
    level,                        % 等级
    exp,                          % 经验
    time                          % 时间
}).

-record(contest_award_cfg, {
    type,                         % 类别
    times,                        % 次数
    consume_point,                % 花费点数
    items                         % 物品
}).

-record(equip_need_item, {
    item_id,                      % id
    num                           % 
}).

-record(equip_cfg, {
    id,                           % key
    job,                          % needjob
    level,                        % level required
    vip,                          % vip free
    gold,                         % 
    coin,                         % 
    soul1,                        % 
    soul2,                        % 
    consume                       % 消耗
}).

-record(spirit_level_cfg, {
    quality,                      % quality
    level,                        % level
    attr1ratio,                   % 
    attr1num,                     % 
    attr2ratio,                   % 
    attr2num,                     % 
    exp                           % exp
}).

-record(warrior_collect_cfg, {
    count,                        % 集魂次数
    consume_type,                 % 消耗类型
    consume,                      % 消耗
    succ_chance,                  % 
    produc_range                  % 产出范围
}).

-record(mission_reset_cfg, {
    type,                         % 
    count,                        % 
    cost                          % 
}).

-record(challenge_cfg, {
    type,                         % 类型,1-挑战任务,2-成就任务
    task_id,                      % 挑战或成就任务ID
    func_id,                      % 对应功能id
    min_level,                    % 需要等级
    max_level,                    % 需要等级
    event_type,                   % 事件类型
    event,                        % 事件
    check_tag,                    % 判定方式
    process,                      % 任务总进度
    awards,                       % 奖励配置
    show                          % 进度显示规则
}).

-record(universe_cfg, {
    id,                           % 索引
    next,                         % 升级后的索引
    star,                         % 星宿id
    level,                        % 星宿等级
    universe,                     % 星宿所归属的四象id
    vigor,                        % 星宿升级所需活力值
    gold,                         % 星宿升级所需金币
    coin,                         % 星宿升级所需代币
    plus_attr,                    % bonus
    attack,                       % 物理攻击加成总和
    skill_attack,                 % 技能攻击加成总和
    defence,                      % 物理防御加成总和
    skill_defence,                % 技能防御加成总和
    health                        % 生命加成总和
}).

-record(shop_cfg, {
    level,                        % 等级
    gold,                         % 消耗金币
    all_cfg                       % 
}).

-record(shop_item_cfg, {
    item_id,                      % 物品id
    num,                          % 数量
    slot,                         % 格子
    max_buy,                      % 最大购买次数
    rate                          % 概率权重
}).

-record(role_family_name_cfg, {
    id,                           % 编号
    char                          % 名字
}).

-record(main_quest_cfg, {
    id,                           % 主键
    need_level,                   % 需要等级
    pre_quest_id,                 % 前置任务
    next_quest_id,                % 下一个任务
    start_npc,                    % 开始npc
    end_npc,                      % 结束npc
    process,                      % 任务总进度
    event_type,                   % 事件类型
    event,                        % 事件
    check_tag,                    % 完成检测类型
    check_script,                 % 初始进度
    awards_10001,                 % 奖励id
    awards_10002,                 % 奖励id
    awards_10003                  % 奖励id
}).

-record(group_boss_award_cfg, {
    boss_id,                      % boss_id
    rank,                         % rank
    base_award,                   % 基础奖励
    special_type,                 % 特殊类型
    base_value,                   % 基础奖励
    max_limit                     % 最大上限
}).

-record(warrior_strengthen_cfg, {
    id,                           % slot
    level,                        % slot
    consume,                      % gold
    s1,                           % 
    s2,                           % 
    attr_id1,                     % 
    attr_v1,                      % 
    attr_id2,                     % 
    attr_v2                       % 
}).

-record(boss_cfg, {
    boss_id,                      % boss_id
    level,                        % level
    scene_id,                     % 场景编号
    max_hp,                       % 最大血量
    pos_x,                        % 初始化X坐标
    pos_y,                        % 初始化Y坐标
    road,                         % 选用的路点信息
    max_x,                        % 单次移动的最远距离x
    max_y,                        % 单次移动的最远距离y
    move_speed,                   % 单位距离内的移动耗时
    action_wait,                  % 动作结束后的等待时间
    first_action                  % 起手式ID
}).

-record(mission_box_item, {
    chance,                       % 获得几率
    awards                        % 奖励列表
}).

-record(mission_box_cfg, {
    mission_id,                   % 主键
    star,                         % 主键
    groups                        % 概率组
}).

-record(branch_quest_cfg, {
    id,                           % 主键
    need_level,                   % 需要等级
    pre_quest_id,                 % 前置任务
    next_quest_id,                % 下一个任务
    start_npc,                    % 开始npc
    end_npc,                      % 结束npc
    process,                      % 任务总进度
    event_type,                   % 事件类型
    event,                        % 事件
    check_tag,                    % 完成检测类型
    check_script,                 % 初始进度
    awards_10001,                 % 奖励id
    awards_10002,                 % 奖励id
    awards_10003                  % 奖励id
}).

-record(mission_cfg, {
    mission_id,                   % 主键
    type,                         % 副本类型
    need_level,                   % 需要等级
    need_mission,                 % 前置副本
    need_power,                   % 需要体力
    daily_times,                  % 每日次数限制
    awards_a,                     % 奖励列表
    awards_b,                     % 奖励列表
    awards_c,                     % 奖励列表
    awards_d,                     % 奖励列表
    awards_e,                     % 奖励列表
    awards_f,                     % 奖励列表
    warrior_exp,                  % 武将经验
    open_week_day,                % 开放日
    start_time,                   % 开放时间
    end_time                      % 结束时间
}).

-record(intensify_cfg, {
    type,                         % 类型
    level,                        % 等级
    attr1idx,                     % 属性1索引
    attr1ratio,                   % 属性1系数
    attr1num,                     % 属性1数值
    attr2idx,                     % 属性2索引
    attr2ratio,                   % 属性2系数
    attr2num,                     % 属性2数值
    require_level,                % 需要等级
    gold1,                        % 品质1消耗
    gold2,                        % 
    gold3,                        % 
    gold4,                        % 
    gold5,                        % 
    gold6,                        % 
    gold7                         % 
}).

-record(arena_virtual_role_cfg, {
    job,                          % 职业
    level                         % 等级
}).

-record(role_cfg, {
    job,                          % 主键1
    level,                        % 主键2
    base_force,                   % 基础武力
    base_intelligence,            % 基础智力
    base_life,                    % 基础生命值
    base_attack,                  % 基础物理攻击
    base_magic_attack,            % 基础技能攻击
    base_defense,                 % 基础物理防御
    base_magic_defense,           % 基础技能防御
    base_defense_a,               % 基础金防
    base_defense_b,               % 基础木防
    base_defense_c,               % 基础水防
    base_defense_d,               % 基础火防
    base_defense_e,               % 基础土防
    base_defense_f,               % 基础光防
    base_defense_g                % 基础暗防
}).

-record(role_name_cfg, {
    id,                           % 编号
    char                          % 名字
}).

-record(warrior_cfg, {
    id,                           % 编号
    wlevel,                       % level
    nextid,                       % nextid
    type,                         % 1可以出战 2不能出战
    hasexp,                       % 被吞噬提供的经验
    quality,                      % 
    warrior_name,                 % name
    level,                        % 
    soul_type,                    % 消耗魂魄类型
    consume_soul,                 % 
    consume_item,                 % 
    cancall,                      % 能否召唤
    force_factor,                 % 
    intelligence_factor,          % 
    life_factor,                  % 
    attack_factor,                % 
    magic_attack_factor,          % 
    defense_factor,               % 
    magic_defense_factor,         % 
    penetrate_factor,             % 
    reduce_factor,                % 
    attach_factor,                % attach_factor
    soul,                         % 
    gold1,                        % 升级消耗
    coin,                         % 
    gold,                         % 
    s1,                           % 
    s2,                           % 
    items,                        % 
    wids                          % 
}).

-record(plus_attr, {
    type,                         % 附加属性类型
    value                         % 值
}).

-record(item_cfg, {
    item_id,                      % 主键
    sub_type,                     % 物品子类型
    quality,                      % 品质
    stack_num,                    % 最大叠加数量
    needlevel,                    % 需要等级
    needjob,                      % 需要职业
    gold,                         % 金币价格
    coin,                         % 代币价格
    sellprice,                    % 卖出价格
    useable,                      % 能否使用
    can_intensify,                % 能否强化
    can_inlay,                    % 能否镶嵌
    reuse,                        % 能否回收
    can_quality,                  % 能否升阶
    sellable,                     % 能否出售
    tradeable,                    % 能否交易
    next,                         % 升级品质后的物品
    script,                       % 脚本
    plus_attr,                    % 附加属性
    skill_id,                     % 携带技能
    type,                         % 物品类型
    level                         % 等级
}).

-record(spell_cfg, {
    id,                           % 编号
    slot,                         % 系, 对应宝珠颜色, 装备位置
    level,                        % 技能等级
    require_level,                % 升级需要等级
    levelup_consume_gold,         % 升级消耗
    levelup_consume_feat          % 升级消耗
}).

