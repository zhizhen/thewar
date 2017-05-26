%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(role_mod).

-include("logger.hrl").
-include("common.hrl").
-include("game_pb.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").

%% API
-export([
    list/1,
    exists_role_name/1,
    account_exists_role/2,
    build_etc/1,
    check_role_repeat_login/1,
    enter_game/1,
    get_user_data_by_db/1,
    get_myself_data/1,
    get_other_data/1,
    leave_game/0,
    put_user_data/0,
    check_freeze/1
]).

-export([
    build_p_role/1
]).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc 进入游戏逻辑(加载并计算数据，计算离线经验，创建buff，计算功能开启列表，判断并处理每日上限)
enter_game(RoleId) ->
    GameInfo = get_myself_data(RoleId),
    NewGameInfo = enter_game_after(GameInfo),

    cache:update(NewGameInfo),
    role_db:save(NewGameInfo#game_info.role),
    game_info:update_online_ets(NewGameInfo),
    catch group_srv:update_member(NewGameInfo),

    role_api:check_open_function(),
    buff_api:start_buff().

enter_game_after(GameInfo) ->
    Role = GameInfo#game_info.role,

    {LoginDay, _} = util:timestamp_to_datetime(Role#role.login_time),
    {NowDay, _} = erlang:localtime(),

    NewRole = case calendar:time_difference({LoginDay, {0, 0, 0}}, {NowDay, {0, 0, 0}}) of
        {0, _} ->
            Role;
        {1, _} ->
            ?DAU_MSG(Role#role.account_id, Role#role.role_id),
            Role#role{login_days = Role#role.login_days+1, continuous_days = Role#role.continuous_days+1};
        {Num, _} when Num > 1 ->
            ?DAU_MSG(Role#role.account_id, Role#role.role_id),
            Role#role{login_days = Role#role.login_days+1, continuous_days = 1};
        _ ->
            Role
    end,
    NewRole2 = NewRole#role{login_time=?NOW, update_time=?NOW, online_state=?ONLINE},
    GameInfo#game_info{role = NewRole2}.

%% @doc 加载并计算数据
get_user_data_by_db(RoleId) ->
    Role = role_db:get(RoleId),
    Account = account_db:get(Role#role.account_id),
    Equip = equip_db:get(RoleId),
    Package = package_db:get(RoleId),
    Mission = mission_db:get(RoleId),
    Buff = buff_db:get(RoleId),
    Quest = quest_db:get(RoleId),
    Item = item_db:get(RoleId),
    Shop = shop_db:get(RoleId),
    Daily = daily_db:get(RoleId),
    BanChat = ban_chat_db:get(RoleId),
    SpiritInfo = spirit_db:get(RoleId),
    Mail = mail_db:get(RoleId),
    Skill = skill_db:get(RoleId),
    Arena = arena_db:get(RoleId),
    Friend = friend_db:get(RoleId),
    FriendEtc = friend_db:gets(Friend#friends.all),
    FollowerEtc = friend_db:get_follower(RoleId),
    Universe = universe_db:get(RoleId),
    Cultivate = cultivate_db:get(RoleId),
    Acts = act_db:gets(RoleId),
    Sign = sign_db:get(RoleId),
    Offline = offline_db:get(RoleId),
    Coin2exp = coin2exp_db:get(RoleId),
    Boudoir = boudoir_db:get(RoleId),

    GroupMember2 = group_db:get_member(Role#role.role_id),
    GroupEtc = group_db:get_role_state(Role#role.role_id),
    GroupMember = GroupMember2#group_member{group_id=GroupEtc#group_state.group_id},

    GroupPool = group_db:get_pool(RoleId),
    GroupMeeting = group_db:get_meeting(RoleId),
    Warrior = warrior_db:get(RoleId),
    RoleWarrior = warrior_db:get_role(RoleId),
    Achievements = achievement_db:get(RoleId),
    Contest = contest_db:get(RoleId),
    Title = title_db:get(RoleId),
    Mall = mall_db:get(RoleId),

    #game_info{
        account =   Account,
        role    =   Role,
        equip   =   Equip,
        package =   Package,
        mission =   Mission,
        buff    =   Buff,
        quest   =   Quest,
        item    =   Item,
        shop    =   Shop,
        daily   =   Daily,
        ban_chat =  BanChat,
        spiritinfo = SpiritInfo,
        mail    =   Mail,
        skills  =   Skill,
        arena   =   Arena,
        friends =   Friend,
        friends_etc = FriendEtc,
        followers_etc = FollowerEtc,
        universe =  Universe,
        cultivate = Cultivate,
        acts = Acts,
        sign = Sign,
        offline = Offline,
        coin2exp = Coin2exp,
        boudoir = Boudoir,
        group_member = GroupMember,
        group_etc = GroupEtc,
        group_pool = GroupPool,
        group_role_meeting = GroupMeeting,
        warrior = Warrior,
        role_warrior = RoleWarrior,
        achievements = Achievements,
        contest = Contest,
        titles = Title,
        mall = Mall
    }.

get_myself_data(RoleId) ->
    GameInfo = cache:find(game_info),
    case GameInfo of
        false ->
            BaseInfo = get_user_data_by_db(RoleId),
            NewGameInfo1 = build_data(BaseInfo),
            {_, NewGameInfo2} = update_fight(NewGameInfo1),
            cache:add(NewGameInfo1),
            NewGameInfo2;
        #game_info{} ->
            NewGameInfo = build_data(GameInfo),
            cache:update(NewGameInfo),
            NewGameInfo
    end.

% test_fight(RoleId) ->
%     BaseInfo = get_user_data_by_db(RoleId),
%     NewGameInfo1 = build_data(BaseInfo),
%     update_fight(NewGameInfo1),
%     ok.


get_other_data(RoleId) ->
    case role_db:check_role_id(RoleId) of
        false -> false;
        true ->
            get_user_data_by_db(RoleId)
    end.

%% @doc 离开游戏
leave_game() ->
    #game_info{role=Role} = role_api:get_user_data(),
    game_info:update(Role#role{online_state=?OFFLINE}),
    refresh_online_time(),
    put_user_data().

%% @doc 刷新今日在线时长
refresh_online_time() ->
    #game_info{role=Role, daily=Daily} = role_api:get_user_data(),
    NewOnlineTime = Daily#daily.online_time + (?NOW - Role#role.login_time),
    game_info:update(Daily#daily{online_time=NewOnlineTime}).

%% @doc 存储玩家数据
put_user_data() ->
    %% todo 发现数据变化了再存mysql
    GameInfo2 = role_api:get_user_data(),

    title_api:check_valid(GameInfo2#game_info.role, GameInfo2#game_info.titles),
    UpdateFlag2 = GameInfo2#game_info.update_flag,

    case update_fight(GameInfo2) of
        {true, GameInfo} ->
            % 如果战力发生变化, 保证role存库
            UpdateFlag = [role|UpdateFlag2];
        {false, GameInfo} ->
            UpdateFlag = UpdateFlag2
    end,

    %% 全局online表更新删除操作
    Role = GameInfo#game_info.role,
    
    case Role#role.online_state of
        ?ONLINE ->
            game_info:update_online_ets(GameInfo, UpdateFlag);
        ?OFFLINE ->
            game_info:delete_online_ets(GameInfo);
        Other ->
            ?ERROR_MSG("wrong online state: ~p~n", [Other])
    end,

    _SaveFun =
        fun({DbMod, Data}) when is_tuple(Data) ->
            Flag = erlang:element(1, Data),
            case lists:member(Flag, UpdateFlag) of
                true -> DbMod:save(Data);
                false -> ok
            end;
            ({DbMod, Data}) -> DbMod:save(Data)
        end,

    _SaveList = [
        {account_db, GameInfo#game_info.account},
        {role_db, GameInfo#game_info.role},
        {equip_db, GameInfo#game_info.equip},
        {package_db, GameInfo#game_info.package},
        {item_db, GameInfo#game_info.item},
        {mission_db, GameInfo#game_info.mission},
        {buff_db, GameInfo#game_info.buff},
        {shop_db, GameInfo#game_info.shop},
        {quest_db, GameInfo#game_info.quest},
        {daily_db, GameInfo#game_info.daily},
        {mail_db, GameInfo#game_info.mail},
        {skill_db, GameInfo#game_info.skills},
        {spirit_db, GameInfo#game_info.spiritinfo},
        {arena_db, GameInfo#game_info.arena},
        {universe_db, GameInfo#game_info.universe},
        {cultivate_db, GameInfo#game_info.cultivate},
        {gen_act, GameInfo#game_info.acts},
        {offline_db, GameInfo#game_info.offline},
        {boudoir_db, GameInfo#game_info.boudoir},
        {achievement_db, GameInfo#game_info.achievements},
        {contest_db, GameInfo#game_info.contest},
        {title_db, GameInfo#game_info.titles},
        {mall_db, GameInfo#game_info.mall}
    ],

    %% [ SaveFun(Elem) || Elem <- SaveList],

    % 更新了战斗力,以及update_flag
    game_info:reset_update_flag(),

    account_db:save(GameInfo#game_info.account),
    role_db:save(GameInfo#game_info.role),
    equip_db:save(GameInfo#game_info.equip),
    package_db:save(GameInfo#game_info.package),
    item_db:save(GameInfo#game_info.item),
    mission_db:save(GameInfo#game_info.mission),
    buff_db:save(GameInfo#game_info.buff),
    shop_db:save(GameInfo#game_info.shop),
    quest_db:save(GameInfo#game_info.quest),
    daily_db:save(GameInfo#game_info.daily),
    mail_db:save(GameInfo#game_info.mail),
    skill_db:save(GameInfo#game_info.skills),
    spirit_db:save(GameInfo#game_info.spiritinfo),
    arena_db:save(GameInfo#game_info.arena),
    universe_db:save(GameInfo#game_info.universe),
    cultivate_db:save(GameInfo#game_info.cultivate),
    gen_act:save(GameInfo#game_info.acts),
    offline_db:save(GameInfo#game_info.offline),
    coin2exp_db:save(GameInfo#game_info.coin2exp),
    boudoir_db:save(GameInfo#game_info.boudoir),
    group_db:update_member(GameInfo#game_info.group_member),
    group_db:save_pool(GameInfo#game_info.group_pool),
    group_db:save_meeting(GameInfo#game_info.group_role_meeting),
    warrior_db:save_list(GameInfo#game_info.warrior),
    warrior_db:save_role(GameInfo#game_info.role_warrior),
    achievement_db:save(GameInfo#game_info.achievements),
    friend_db:save(GameInfo#game_info.friends),
    contest_db:save(GameInfo#game_info.contest),
    title_db:save(GameInfo#game_info.titles),
    mall_db:save(GameInfo#game_info.mall),
    ok.

%% @doc 玩家角色列表
list(AccountId) ->
    Rows = role_db:list(AccountId),
    [begin
         [RoleId, RoleName, _, _, _] = Row,
         #p_role{
             id = util:to_list(RoleId)
             % name = util:to_list(RoleName),
             % job = Job,
             % level = Level,
             % state = State,
             % weapon = Weapon,
             % armor = Helm
         }

     end || Row <- Rows].

%% @doc 检测用户名是否存在
exists_role_name(Name) ->
    case role_db:get_role_by_name(Name) of
        null -> false;
        _ -> true
    end.

%% @doc 检测此角色中是否属于当前账号
account_exists_role(AccountId, RoleId) ->
    case role_db:get_role_by_account_id_and_role_id(AccountId, RoleId) of
        null -> false;
        _ -> true
    end.

check_freeze(RoleId) ->
    case role_db:get(RoleId) of
        null -> true;
        #role{} = Role when Role#role.state =:= ?ROLE_STATE_LOCK -> 
            case Role#role.state_time > ?NOW of
                true -> true;
                false -> 
                    %% 封禁已过期，修改玩家的状态置为正常
                    role_db:set(RoleId, "state", ?ROLE_STATE_NORMAL),
                    role_db:set(RoleId, "state_time", 0),
                    false
            end;
        _ -> false
    end.

%% @doc 玩家角色重复登录检测并处理已登录角色
%%      RoleId: 玩家角色ID
check_role_repeat_login(RoleId) ->
    case goddess_misc:get_role_pid(RoleId) of
        false -> ingore;
        RolePid ->
            RolePid ! {logout, role_repeat_login},
            try erlang:monitor(process, RolePid) of
                Ref ->
                    receive
                    {'DOWN', Ref, _, _, _} ->
                        erlang:demonitor(Ref)
                    end
            catch
                Class:Reason ->
                   ?DEBUG_MSG("check_role_repeat_login: ~p ~n", [Class, Reason])
            end
    end.

build_data(BaseInfo) ->
    BaseInfo1 = fix_data(BaseInfo),
    BaseInfo2 = build_etc(BaseInfo1),
    BaseInfo2.

fix_data(BaseInfo) ->
    % TODO 各种数据修正在这里实现 看我来个例子
    % #game_info{account=Account, role=Role, daily=Daily, titles = Titles} = BaseInfo,
    % NewRole = case Role#role.power >= ?MAX_POWER of
    %     true -> Role;
    %     false when Role#role.power_recover_time == 0 ->
    %         % 新用户,最后恢复时间取当前时间,体力默认满
    %         Role#role{power_recover_time=?NOW, power=?MAX_POWER};
    %     false ->
    %         LastRecoverTime = Role#role.power_recover_time,
    %         AddNum = util:to_integer((?NOW - LastRecoverTime) / ?POWER_RECOVER_TIME) * ?POWER_RECOVER_NUM,
    %         NewPower = erlang:min(Role#role.power + AddNum, ?MAX_POWER),
    %         case NewPower - Role#role.power of
    %             0 -> Role;
    %             RealyAddNum ->
    %                 AddTime = util:to_integer(RealyAddNum / ?POWER_RECOVER_NUM) * ?POWER_RECOVER_TIME,
    %                 NewRecoverTime = Role#role.power_recover_time + AddTime,
    %                 self() ! {send, #m__role__update_attr__s2c{attr_type = ?POWER, channel = ?ATTR_CHANNEL_QUIET, value = NewPower}},
    %                 Role#role{power = NewPower, power_recover_time = NewRecoverTime}
    %         end
    % end,
    % NewDaily = case calendar:time_difference(Daily#daily.today, erlang:localtime()) of     % 判断是否是同一天
    %     {0, _} -> Daily;
    %     _ ->
    %         ?DAU_MSG(Account#account.account_id, Role#role.role_id),
    %         self() ! {process, role_api, after_midnight, []},
    %         daily_db:build_new_data(Role#role.role_id)
    % end,
    % NewRole1 = case NewRole#role.title_id of 
    %             undefined -> NewRole#role{title_id = 0};
    %             _ -> NewRole
    %         end,
    % NewRole2 = 
    %     case title_api:check_valid1(NewRole1, Titles) of
    %         false -> NewRole1;
    %         true -> NewRole1#role{title_id = 0}
    %     end,

    % BaseInfo#game_info{role=NewRole2, daily=NewDaily}.
    BaseInfo.


%% @doc 构建二级属性
build_etc(BaseInfo) ->
    RoleEtc = #role_etc{
        mission_id = build_mission_id(BaseInfo),              % 当前所在副本
        mission_process = build_mission_process(BaseInfo),     % 当前所在副本进度
        clifford = build_clifford_last(BaseInfo),
        boss_id = build_boss_id(BaseInfo),
        need_send_challenge = build_challenge_tmp_status(BaseInfo)
    },
    GameInfo = BaseInfo#game_info{role_etc=RoleEtc},
    GameInfo.

build_p_role(Role) ->
    ValidTime = title_api:title_valid_time(Role#role.title_id),
    #p_role{
        id = Role#role.role_id
        % account_id = Role#role.account_id,
        % role_name =Role#role.role_name,
        % create_time = Role#role.create_time,
        % login_time = Role#role.login_time,
        % ol_time = Role#role.ol_time,
        % login_days = Role#role.login_days,
        % continuous_days = Role#role.continuous_days,
        % job = Role#role.job,
        % scene_id = Role#role.scene_id,
        % pos_x = Role#role.pos_x,
        % pos_y = Role#role.pos_y,
        % open_scene = Role#role.open_scene,
        % open_function = Role#role.open_function,
        % update_time = Role#role.update_time,
        % title = Role#role.title,
        % vip = Role#role.vip,
        % vip_exp = Role#role.vip_exp,
        % gold = Role#role.gold,
        % exp = Role#role.exp,
        % level = Role#role.level,
        % power = Role#role.power,
        % power_recover_time = Role#role.power_recover_time,
        % honor = Role#role.honor,
        % hot = Role#role.hot,
        % vigor = Role#role.vigor,
        % feats = Role#role.feats,
        % flower = Role#role.flower,
        % egg = Role#role.egg,
        % charm = Role#role.charm,
        % fight = Role#role.fight,
        % story = Role#role.story,
        % power2 = Role#role.power2,
        % wing = Role#role.wing,
        % title_id = Role#role.title_id,
        % title_hold_time = ValidTime
}.

%%%-------------------------------------------------------------
%%% property function
%%% I think it's all right. If you has the better, please 干它
%%%-------------------------------------------------------------
build_mission_id(BaseInfo) ->
    RoleEtc = BaseInfo#game_info.role_etc,
    case RoleEtc of
        undefined ->
            0;
        #role_etc{} ->
            RoleEtc#role_etc.mission_id
    end.

build_mission_process(BaseInfo) ->
    RoleEtc = BaseInfo#game_info.role_etc,
    case RoleEtc of
        undefined ->
            0;
        #role_etc{} ->
            RoleEtc#role_etc.mission_process
    end.

build_clifford_last(BaseInfo) ->
    RoleEtc = BaseInfo#game_info.role_etc,
    case RoleEtc of
        undefined ->
            0;
        #role_etc{} ->
            RoleEtc#role_etc.clifford
    end.

build_boss_id(BaseInfo) ->
    RoleEtc = BaseInfo#game_info.role_etc,
    case RoleEtc of
        undefined ->
            0;
        #role_etc{} ->
            RoleEtc#role_etc.boss_id
    end.

build_challenge_tmp_status(BaseInfo) ->
    RoleEtc = BaseInfo#game_info.role_etc,
    case RoleEtc of
        undefined ->
            0;
        #role_etc{} ->
            RoleEtc#role_etc.need_send_challenge
    end.

%% @doc 重新计算战斗力
update_fight(GameInfo) ->
    OldFight = GameInfo#game_info.role#role.fight,
    Fight = fight_mod:fight(GameInfo),
    Role = GameInfo#game_info.role,

    case OldFight /= Fight of
        true ->
            arena_srv:change_fight(Role#role.role_id, Fight),
            Role1 = Role#role{fight=Fight},
            {true, GameInfo#game_info{role=Role1}};
        false ->
            {false, GameInfo}
    end.
