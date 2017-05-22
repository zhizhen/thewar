% 游戏中玩家数值 type
-define(EXP, 1).
-define(LEVEL, 2).
-define(VIP, 3).
-define(GOLD, 4).
-define(COIN, 5).
-define(POWER, 6).
-define(VIP_EXP, 7).
-define(HONOR, 8).                             %% 荣誉
-define(VIGOR, 9).                             %% 活力
-define(CHARM, 10).                            %% 魅力
-define(FEATS, 12).                            %% 功勋
-define(SKILL, 13).                            %% 技能
-define(POWER2, 14).                           %% 精气
-define(GROUP_VALUE, 15).                      %% 帮会贡献
-define(WARRIOR_SOUL1, 16).                    %% 蓝魂
-define(WARRIOR_SOUL2, 17).                    %% 紫魂

-define(AWARD_TYPE_VALUE_LIST, [
        ?VIP_EXP,
        ?EXP,
        ?GOLD,
        ?COIN,
        ?POWER,
        ?VIGOR,
        ?HONOR,
        ?FEATS,
        ?POWER2,
        ?WARRIOR_SOUL1,
        ?WARRIOR_SOUL2
    ]).

% 游戏中玩家属性数值 type
-define(FORCE, 1).                             %% 武力
-define(INTELLIGENCE, 2).                      %% 智力
-define(ATTACK, 3).                            %% 物理攻击
-define(STUNT_ATTACK, 4).                      %% 技能攻击
-define(DEFENSE, 5).                           %% 物理防御
-define(STUNT_DEFENSE, 6).                     %% 技能防御
-define(LIFE, 7).                              %% 生命值
-define(LIFE_RESTORE, 8).                      %% 生命恢复速度
-define(PENETRATE, 22).                        %% 物理穿透
-define(STUNT_PENETRATE, 23).                  %% 技能穿透

% 用户 state
-define(ROLE_STATE_NORMAL, 0).     % 用户状态正常
-define(ROLE_STATE_LOCK, 1).       % 用户状态锁定
-define(ROLE_STATE_DELETE, 2).     % 用户删除状态

% 游戏角色职业
-define(ROLE_JOB_SWORD, 10001).         % 剑客
-define(ROLE_JOB_AXE, 10002).           % 力士
-define(ROLE_JOB_ASSASSIN, 10003).      % 刺客

-define(ROLE_TICK_TIME, 100).      % 玩家tick时间

-define(POWER_RECOVER_TIME, 1800).             %% 体力恢复间隔
-define(POWER_RECOVER_NUM, 5).                 %% 体力恢复数量

-define(POWER_ADD_ONE_BUY, 40).                %% 一次购买体力值

-define(BATTLE_WIN, 1).                        %% 战斗胜利
-define(BATTLE_LOSE, 0).                       %% 战斗失败

-define(ROLE_MAX_LEVEL, 60).                   %% 人物最大等级

-define(ARENA_COMPUTER_INIT_LEVEL, 30).        %% 竞技场初始机器人等级

%% ===========================================================================
%% VIP
%% ===========================================================================
-define(VIP_GIFT_GOT,              1).           %% vip礼包已领取
-define(VIP_FUNCTION_NOT_OPEN,     0).           %% vip涉及的功能未开启
-define(VIP_MAX_LEVEL,            10).           %% vip最高等级

-define(ACCOUNT_NOT_PASS,    0).     % 帐号验证未通过
-define(ACCOUNT_PASSED,      1).     % 帐号验证通过
-define(ROLE_PASSED,         2).     % 角色验证通过
-define(CLIENT_FRONT,        0).     % 客户端前台运行状态
-define(CLIENT_BACK,         1).     % 客户端后台运行状态

-define(GM, 1).
-define(PLAYER, 0).
-define(ONLINE, 1).
-define(OFFLINE, 0).

-define(ATTR_CHANNEL_NORMAL, 0).     % 狂弹
-define(ATTR_CHANNEL_QUIET,  1).     % 安静模式


-define(OVERLEAP_STATE_STOP, 0).   % 扫荡停止
-define(OVERLEAP_STATE_RUN, 1).    % 扫荡ing

-define(NO, 0).
-define(YES, 1).

%% 订单状态0-未生效1-未使用2-已使用
-define(ORDER_PREPARE,      0).
-define(ORDER_AVAILABLE,    1).
-define(ORDER_USED,         2).