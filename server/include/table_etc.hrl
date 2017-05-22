%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc 
%%% @date 2013-04-16 10:37:25
%%% 用户数据模型，程序使用的，根据数据库和配置计算出来的的完整数据
%%% @end
%%%-------------------------------------------------------------------
%%

-record(process_global_info, {
    role_id
}).

-record(scene_etc, {
    current_scene_id = 0,
    need_save = 0,
    line_id = 1,
    target_x = 0,
    target_y = 0
}).

%% @doc
%% 角色扩展数据
%% @end
-record(game_info, {
    account,
    role,
    role_etc,
    equip,
    package,
    mission,
    buff,
    quest,
    item,
    shop,
    daily,
    ban_chat,
    mail,
    skills,
    spiritinfo,
    arena,
    friends,
    friends_etc,
    followers_etc,         % 加我为好友，并且不是我的仇敌
    universe,
    cultivate,
    cultivate_etc,         % 临时培养信息存储, 不存库
    acts,
    sign,
    golden_mission_etc,
    offline,
    coin2exp,
    boudoir,
    group_member,
    group_etc,
    group_pool,
    group_role_meeting,
    warrior,
    role_warrior,
    scene_etc = #scene_etc{},
    update_flag = [],      % 更新标记
    hook = [],
    achievements,
    wings,
    contest,
    titles,
    mall
}).

-record(role_etc, {
    mission_id = 0,              % 当前所在副本
    mission_process = 0,         % 副本进度  未进入副本,进入副本,战斗完毕,宝箱领取完毕
    clifford = 0,                % 上次祈福获得物品ID
    boss_id = 0,                 % 当前所在的boss_id
    need_send_challenge = 0      % 是否需要向前端推送最新的成就数据，用于挑战成就有新的达成时，更新前端的达成任务数字显示
}).

-record(sys_arena, {
    rank,
    info,
    in_battle = []         % 战斗中的人物名次
}).

-record(arena_log, {
    type,
    success,
    pk_time,
    my_rank,
    my_level,
    rival_role_id,
    rival_role_name,
    rival_rank,
    rival_job
}).

-record(world_bosses, {
    all = []
}).

-record(missions, {
    all = []
}).

-record(quests, {
    daily,
    all = []
}).

-record(items, {
    all = []
}).

-record(notices, {
    all = []
}).

-record(mails, {
    all = []
}).

-record(buffs, {
    all = []
}).

-record(shop_item, {
    item_id,
    num,
    state
}).

-record(throw_item, {
    items = []
}).

-record(skills, {
    all = []
}).

-record(spell, {
    skill_id,
    spell_id,
    level
}).

-record(spiritinfo, {
    spirits = [],
    spiritslots = [],
    spiritnpc
}).

-record(friends, {
    all = []
}).

-record(friend_etc, {
    all = [] % f_role
}).

-record(f_role, {
    role_name,
    role_id,
    level,
    job,
    online_state
}).

-record(follower_etc, {
    all = []
}).

-record(cultivate_etc, {
    cultivate
}).

-record(acts, {
    all
}).

-record(golden_mission_etc, {
    start,
    delay
}).

-record(titles, {
    all = []
}).

%%%===================================================================
%%% chat
%%%===================================================================

-record(chat_cd, {
    time=0
}).

-record(chat_role, {
    role_name,
    role_id
}).

-record(chat_item, {
    item_id,
    id
}).

-record(chat_group, {
    title,
    id
}).

-record(chat_content, {
    content,
    role = #chat_role{},
    mission,
    item = #chat_item{},
    gold,
    coin,
    monster,
    exp,
    group = #chat_group{},
    vip = 0,
    num,
    str,
    role2 = #chat_role{},
    treasure = #chat_item{},
    warrior,
    spirit_id,
    role3 = #chat_role{}
}).

-record(rank, {
    role_id,
    role_name,
    level,
    fight,
    title,
    honor,
    charm
}).
%%%===================================================================
%%% ets
%%%===================================================================
-record(role_conn, {role_id, account_id, role_pid, sender, sock}).
-record(account_conn, {account_id='_', receiverid='_', sock='_', role_pid='_'}).

%%%===================================================================
%%% clifford
%%%===================================================================
-record(clifford_item, {item_id, num}).


%%%===================================================================
%%% clifford
%%%===================================================================
-record(groups_ets, {
    id = 0,                                   %% 帮会id
    title ,                                   %% 名字
    gold = 0,                                 %% 金币
    exp = 0,                                  %% 经验
    members = 1,                              %% 人数
    notice = "",                              %% 公告
    level = 0,
    level_time = 0,                           %% 升级时间
    creat_time = 0,                           %% 创建时间
    creator_id = "",                          %% 帮主id
    creator_name = "",                        %% 名字
    master_id = "",                           %% 帮主id
    master_name = "",                         %% 名字
    close_time = 0,                           %% 解散时间
    rank = 0
}).

-record(group_member_ets, {
    role_id,
    role_name,
    group_id,
    state,
    level,
    post,
    job,
    value_today,
    value,
    value_time,
    allvalue,
    time,
    fight
}).

-record(group_meeting, {
    time = 0,
    roles = [],
    cd = 0
}).

-record(group_act_ets, {
    id,                     % 帮会id
    pool_pid=0,
    pool_time=0,
    meeting=#group_meeting{},
    tree,
    boss
}).


-record(group_tree_info, {
    group_id,
    air,
    members,
    logs,
    last_save_time=0
}).

-record(group_tree_member, {
    role_id,
    air_devote,
    last_rank,
    last_water
}).

-record(group_tree_log, {
    role_id,
    time,
    group_level,
    type
}).

-record(group_info, {
    id,
    info,
    mstate,
    invites=[],
    ets
}).

-record(group_boss, {
    group_id,
    info,
    start_time = 0,
    state = 0,              % 帮派boss状态 是否开始什么的
    last_save_time = 0,
    last_tick_time = 0
}).

-record(boss_info, {
    type,
    master,              %% 开启boss的进程
    members = [],
    state = 0,
    start_time = 0,
    kill_role_id = "",
    kill_role_name = "",
    boss_id = 0,
    boss_level = 0,
    boss_hurt = 0,
    pos_x = 0,
    pos_y = 0,
    scene_pid = 0
}).

-record(boss_member, {
    role_id,
    role_name,
    hurt = 0,
    dead_time=0,
    hp=0,
    life=0,        % 0或者, 1over 生命状态
    state = 0      % 0在战场中 1在战场外
}).

-record(online, {
    id,
    role,
    equip,
    wing
}).


%%-----------scene_info---------------------
-record(scene_info_cfg, {
    id,
    type,
    width,
    height,
    tower_width,
    tower_height,
    born_x,
    born_y,
    info
}).

-record(scene_road_info, {
    type,
    left,
    top,
    right,
    bottom,
    road
}).

%%-------------treasure---------------------
-record(explore, {
    treasure,
    is_loot
}).
-record(treasure_guarder, {
    role_id = "",
    role_name = "",
    level = 0,
    idx = 0,
    start = 0
}).

%%-------------mall---------------------
-record(mall_item, {
    item_id,
    num
}).
%%----------challenge & achievement---------
-record(challenge_item, {
    item_id,
    process = 0,
    status = 0
}).
-record(kv, {k=0, v=0}).

-define(COLLECT_INIT, [#kv{}]).
-define(STRENGTHEN_INIT, [#kv{k=1},#kv{k=2},#kv{k=3},#kv{k=4},#kv{k=5},#kv{k=6}]).
