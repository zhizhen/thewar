%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(role_api).

-include("common.hrl").
-include("msg_code.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("game_pb.hrl").

-compile(export_all).
%%%===================================================================
%%% Client API
%%%===================================================================

%% @doc 玩家角色创建API
-spec create(string(), tuple()) -> {error, integer()} | {ok, integer()}.
create(AccountId, #m__role__create__c2s{name=BaseName}) ->
    ?DEBUG_MSG("role create name:~ts~n", [util:to_list(BaseName)]),
    Extension = string:concat(".s", util:to_list(goddess_env:server_id())),
    Name = string:concat(util:to_list(BaseName), util:to_list(Extension)),
    HasSensitive = sensitive_srv:check_words(BaseName),
    % RoleCfg = role_cfg:get({Job, 1}),
    NameRepeat = role_mod:exists_role_name(Name),
    if
        HasSensitive ->
            {error, ?SENSITIVE_WORDS};
        % RoleCfg =:= false ->
        %     {error, ?ROLE_JOB_ERROR};
        NameRepeat ->
            {error, ?ROLE_NAME_REPEAT};
        true ->
            RoleId = id_srv:gen_role_id(),
            role_db:create(RoleId, AccountId, Name),
            % equip_db:create(RoleId),
            % package_db:create(RoleId),
            % quest_db:create(RoleId),
            % shop_db:create(RoleId),
            % mall_db:create(RoleId),
            % daily_db:create(RoleId),
            % ban_chat_db:create(RoleId),
            % spirit_db:create(RoleId),
            % arena_db:create(RoleId),
            % universe_db:create(RoleId),
            % cultivate_db:create(RoleId),
            % offline_db:create(RoleId),
            % coin2exp_db:create(RoleId),
            % boudoir_db:create(RoleId),
            % achievement_db:create(RoleId),
            % item_db:free_get(RoleId, Job),
            % equip_db:equip(RoleId),
            case account_db:get(AccountId) of
                null ->
                    account_db:create(AccountId);
                _ ->
                    ok
            end,
            {ok, RoleId}
    end.

%% @doc 玩家角色列表API
-spec list(string()) -> {ok, #m__role__list__s2c{}}.
list(AccountId) ->
    RoleList = role_mod:list(AccountId),
    {ok, #m__role__list__s2c{role_list=RoleList}}.

%% @doc 玩家角色登录API
-spec login(string(), tuple()) -> {error, integer()} | {ok, integer()}.
login(#m__role__login__c2s{}, Sender) ->
    Sender ! {send, #m__system__notify__s2c{code = ?PARAMS_ERROR}};
login(AccountId, #m__role__login__c2s{id=RoleId}) ->
    case role_mod:account_exists_role(AccountId, RoleId) of
        true ->
            % case role_mod:check_freeze(RoleId) of
            %     true -> 
            %         {error, ?ROLE_FREEZE};
            %     false ->
            %         role_mod:check_role_repeat_login(RoleId),
            %         {ok, RoleId}
            % end;
            {ok, RoleId};
        false ->

            {error, ?ROLE_LOGIN_FAIL}
    end.

%% @doc 玩家角色登出API
-spec logout(pid(), term()) -> term().
logout(Pid, Reason) when is_pid(Pid) ->
    gen_server:call(Pid, {logout, Reason}, infinity).

info(#m__role__info__c2s{id=RoleId}, Sender) ->
    case role_mod:get_other_data(RoleId) of
        false -> notify(?CONTEST_ENEMY_NOT_EXIST, Sender);
        #game_info{} = GameInfo ->
            Data = build_role_sample_info(GameInfo),
            Sender ! {send, Data}
    end.

% story_continue(#m__role__story_continue__c2s{story_id=StoryId}, _Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     case lists:member(StoryId, Role#role.story) of
%         false ->
%             game_info:update(Role#role{story = Role#role.story ++ [StoryId]}),
%             check_open_function();
%         true ->
%             ok
%     end.

% guide_continue(#m__role__guide_continue__c2s{guide_id=Guide}, _Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     case lists:member(Guide, Role#role.guide) of
%         false -> game_info:update(Role#role{guide = Role#role.guide ++ [Guide]});
%         true -> ok
%     end.

% %% 登陆后的一些操作
% after_login(Sender) ->
%     GameInfo = role_api:get_user_data(),
%     friend_api:online(Sender),
%     group_api:list(Sender),
%     gen_act:trigger_level_acts(GameInfo#game_info.role#role.level, Sender),
%     gen_act:trigger_login_acts(Sender),
%     vip_api:login_refresh(Sender),
%     Sender ! {send, warrior_api:show_info(GameInfo)},
%     ok.

% after_midnight(Sender) ->
%     gen_act:trigger_login_acts(Sender),
%     ok.

% role_locked(State, StateTime) ->
%     %% 更改玩家的角色状态，1-被封禁 0-正常
%     case State of
%         1 -> 
%             #game_info{role=Role} = role_api:get_user_data(),
%             game_info:update(Role#role{state = State, state_time = StateTime}),
%             self() ! {logout, role_locked},
%             ok;
%         0 -> ok
%     end.

% % delete(AccountId, #m__role__delete__c2s{role_id=RoleId}) ->
% %     case role_mod:account_exists_role(AccountId, RoleId) of
% %         true ->
% %             role_mod:check_role_repeat_login(RoleId),
% %             role_db:set(RoleId, "state", ?ROLE_STATE_DELETE),
% %             list(AccountId);
% %         false ->
% %             false
% %     end.

% % buy_power(#m__role__buy_power__c2s{}, Sender) ->
% %     F = fun() ->
% %         GameInfo = role_api:get_user_data(),
% %         #game_info{daily=DailyInfo, role=RoleInfo} = GameInfo,
        
% %         AddTimes = DailyInfo#daily.power_times,
% %         VipLevel = RoleInfo#role.vip,

% %         Cfg = viprelate_cfg:get(VipLevel),
% %         case Cfg of
% %             false -> throw({msg, ?PARAMS_ERROR, Sender});
% %             _ -> ok
% %         end,

% %         case AddTimes >= Cfg#viprelate_cfg.buy_power_times of
% %             true -> throw({msg, ?ROLE_POWER_TIMES_USE_UP, Sender});
% %             false -> ok
% %         end,

% %         CostCoin = round((AddTimes + 1) / 2) * 20,
% %         pay_coin(CostCoin, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
% %         add_power(?POWER_ADD_ONE_BUY, Sender),

% %         game_info:update(DailyInfo#daily{power_times=AddTimes + 1}),
% %         notify(?ROLE_POWER_BUY_SUCCESS, Sender)
% %     end,
% %     ?PERFORM(F).


% %%%===================================================================
% %%%===================================================================
handle_throw({msg, Code, ClientSender}) ->
    notify(Code, ClientSender);
handle_throw(Reason) ->
    throw(Reason).

notify(Code, ClientSender) ->
    ClientSender ! {send, #m__system__notify__s2c{code=Code}}.

% %%%===================================================================
% %%% Process API
% %%%===================================================================
% get_user_data() ->
%     #process_global_info{role_id=RoleId} = cache:find(process_global_info),
%     role_mod:get_myself_data(RoleId).

% build_login_s2c() ->
%     GameInfo = role_api:get_user_data(),
%     RoleInfo = role_mod:build_p_role(GameInfo#game_info.role),
%     % AccountInfo = account_mod:build_p_account(GameInfo#game_info.account, GameInfo#game_info.role#role.coin),
%     % EquipInfo = equip_mod:build_p_equip(GameInfo#game_info.equip),
%     % PackageInfo = package_mod:build_p_package(all, GameInfo#game_info.package, GameInfo#game_info.item),
%     % QuestInfo = quest_mod:build_p_quests(GameInfo#game_info.quest),
%     % SkillInfo = skill_mod:build_p_skills(GameInfo#game_info.skills),
%     % SpiritInfo = spirit_mod:build_p_spiritinfo(GameInfo#game_info.spiritinfo),
%     % UniverseInfo = universe_mod:build_p_universe(GameInfo#game_info.universe),
%     % CultivateInfo = cultivate_mod:build_p_cultivate(GameInfo#game_info.cultivate),
%     % Offline = offline_mod:build_p_offline(GameInfo#game_info.offline, GameInfo#game_info.buff, GameInfo#game_info.daily),
%     % BoudoirInfo = boudoir_mod:build_p_boudoir(GameInfo#game_info.boudoir),
%     % GroupInfo = group_api:role_group(GameInfo),
%     % % WarriorInfo1 = warrior_api:warrior_info(GameInfo,1),
%     % [WarriorInfo2]= warrior_api:warrior_info(GameInfo,2),
%     % DailyInfo = daily_mod:build_daily_info(GameInfo#game_info.daily),
%     % ChallengeNum = challenge_api:get_completed_num(GameInfo),

%     #m__role__login__s2c{
%         % account_info = AccountInfo,
%         role_info = RoleInfo
%         % equip_info = EquipInfo,
%         % package_info = PackageInfo,
%         % quest_info = QuestInfo,
%         % skill_info = SkillInfo,
%         % spirit_info = SpiritInfo,
%         % universe_info = UniverseInfo,
%         % cultivate_info = CultivateInfo,
%         % offline = Offline,
%         % boudoir_info = BoudoirInfo,
%         % group_info = GroupInfo,
%         % warrior_len = warrior_api:warrior_len(GameInfo#game_info.warrior),
%         % warrior_info = [],
%         % warrior_info2 = WarriorInfo2,
%         % daily_info = DailyInfo,
%         % challenge_num = ChallengeNum
%     }.

build_role_sample_info(GameInfo) ->
    RoleInfo = role_mod:build_p_role(GameInfo#game_info.role),
    % EquipInfo = equip_mod:build_p_equip(GameInfo#game_info.equip),
    % PackageInfo = package_mod:build_p_package(sample, GameInfo#game_info.package, GameInfo#game_info.item),
    % SkillInfo = skill_mod:build_p_skills(GameInfo#game_info.skills),
    % UniverseInfo = universe_mod:build_p_universe(GameInfo#game_info.universe),
    % BoudoirInfo = boudoir_mod:build_p_boudoir(GameInfo#game_info.boudoir),
    % SpiritInfo = spirit_mod:build_p_spiritinfo(GameInfo#game_info.spiritinfo),
    % CultivateInfo = cultivate_mod:build_p_cultivate(GameInfo#game_info.cultivate),

    #m__role__info__s2c{
        role_info=RoleInfo
        % equip_info=EquipInfo,
        % package_info=PackageInfo,
        % skill_info=SkillInfo,
        % universe_info = UniverseInfo,
        % boudoir_info = BoudoirInfo,
        % spirit_info = SpiritInfo,
        % cultivate_info = CultivateInfo
    }.

% get_open_function_tag(Role) ->
% %%     #game_info{role=Role} = role_api:get_user_data(),
%     F = fun(FuncId) ->
%         Fun = function_cfg:get(FuncId),
%         case Fun of
%             false -> false;
%             _ -> Fun#function_cfg.tag
%         end
%     end,
%     AllFunc = [F(Func) ||  Func <- Role#role.open_function],
%     [util:to_atom(string:concat(util:to_list(X), "_api")) || X <- AllFunc, X /= false].

% is_enough_gold(Gold) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.gold >= Gold.

% is_enough_coin(Coin) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.coin >= Coin.
% %%     Account = GameInfo#game_info.account,
% %%     Account#account.coin >= Coin.

% is_enough_feats(Value) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.feats >= Value.

% is_enough_vigor(Vigor) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.vigor >= Vigor.

% is_enough_honor(Value) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.honor >= Value.

% is_enough_level(MinLevel, MaxLevel) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     if MaxLevel =:= 0 ->
%         Role#role.level >= MinLevel;
%         true -> Role#role.level >= MinLevel andalso Role#role.level =< MaxLevel
%     end.

% is_func_open(FuncId) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     lists:member(FuncId, Role#role.open_function).

% %% @doc 加经验
% add_exp(_Exp, _ClientSender) ->
%     ExpFinal = erlang:abs(util:to_integer(_Exp)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,

%     case Role#role.level >= ?ROLE_MAX_LEVEL of
%         true -> ok;
%         false ->
%             NewExp = Role#role.exp + ExpFinal,
%             NewLevelCfg = exp_cfg:get(lists:max([X || X <- exp_cfg:get_all(), X =< NewExp])),
%             NewLevel = NewLevelCfg#exp_cfg.level,

%             NewRole = Role#role{exp = NewExp, level=NewLevel},
%             game_info:update(NewRole),
%             Data = build_update_attr(?EXP, NewExp, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data},
%             case Role#role.level /= NewLevel of
%                 true ->
%                     change_level(Role#role.level, NewLevel, _ClientSender);
%                 false -> ok
%             end
%     end.

% %% @doc 加经验
% add_exp(_Exp, _ClientSender, quiet) ->
%     ExpFinal = erlang:abs(util:to_integer(_Exp)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,

%     case Role#role.level >= ?ROLE_MAX_LEVEL of
%         true -> ok;
%         false ->
%             NewExp = Role#role.exp + ExpFinal,
%             NewLevelCfg = exp_cfg:get(lists:max([X || X <- exp_cfg:get_all(), X =< NewExp])),
%             NewLevel = NewLevelCfg#exp_cfg.level,

%             NewRole = Role#role{exp = NewExp, level=NewLevel},
%             game_info:update(NewRole),
%             Data = build_update_attr(?EXP, NewExp, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data},
%             case Role#role.level /= NewLevel of
%                 true ->
%                     change_level(Role#role.level, NewLevel, _ClientSender, quiet);
%                 false -> ok
%             end
%     end.

% %% @doc 加vip经验
% add_vip_exp(_Exp, _ClientSender) ->
%     ExpFinal = erlang:abs(util:to_integer(_Exp)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,

%     NewExp = Role#role.vip_exp + ExpFinal,
%     NewVipCfg = vip_cfg:get(lists:max([X || X <- vip_cfg:get_all(), X =< NewExp])),
%     NewVip = NewVipCfg#vip_cfg.vip,

%     NewRole = Role#role{vip_exp = NewExp, vip=NewVip},
%     game_info:update(NewRole),
%     Data = build_update_attr(?VIP_EXP, NewExp, ?ATTR_CHANNEL_NORMAL),
%     _ClientSender ! {send, Data},
%     case Role#role.vip /= NewVip of
%         true ->
%             change_vip(Role#role.vip, NewVip, _ClientSender);
%             %% todo title trigger
%         false -> ok
%     end.

% %% @doc 加vip经验
% add_vip_exp(_Exp, _ClientSender, quiet) ->
%     ExpFinal = erlang:abs(util:to_integer(_Exp)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,

%     NewExp = Role#role.vip_exp + ExpFinal,
%     NewVipCfg = vip_cfg:get(lists:max([X || X <- vip_cfg:get_all(), X =< NewExp])),
%     NewVip = NewVipCfg#vip_cfg.vip,

%     NewRole = Role#role{vip_exp = NewExp, vip=NewVip},
%     game_info:update(NewRole),
%     Data = build_update_attr(?VIP_EXP, NewExp, ?ATTR_CHANNEL_QUIET),
%     _ClientSender ! {send, Data},
%     case Role#role.vip /= NewVip of
%         true ->
%             change_vip(Role#role.vip, NewVip, _ClientSender, quiet);
%         false -> ok
%     end.

% %% @doc 加金币
% add_gold(_Gold, _ClientSender) ->
%     GoldFinal = erlang:abs(util:to_integer(_Gold)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{gold = Role#role.gold + GoldFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?GOLD, NewRole#role.gold, ?ATTR_CHANNEL_NORMAL),
%     _ClientSender ! {send, Data}.

% %% @doc 加金币
% add_gold(_Gold, _ClientSender, quiet) ->
%     GoldFinal = erlang:abs(util:to_integer(_Gold)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{gold = Role#role.gold + GoldFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?GOLD, NewRole#role.gold, ?ATTR_CHANNEL_QUIET),
%     _ClientSender ! {send, Data}.

% %% @doc 金币付费
% pay_gold(_Gold, _ClientSender) ->
%     GoldFinal = erlang:abs(util:to_integer(_Gold)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewGold = Role#role.gold - GoldFinal,
%     case NewGold < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{gold=NewGold},
%             game_info:update(NewRole),
%             Data = build_update_attr(?GOLD, NewRole#role.gold, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data}
%     end.

% %% @doc 金币付费
% pay_gold(_Gold, _ClientSender, quiet) ->
%     GoldFinal = erlang:abs(util:to_integer(_Gold)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewGold = Role#role.gold - GoldFinal,
%     case NewGold < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{gold=NewGold},
%             game_info:update(NewRole),
%             Data = build_update_attr(?GOLD, NewRole#role.gold, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data}
%     end.

% %% @doc 加体力
% add_power(_Power, _ClientSender) ->
%     PowerFinal = erlang:abs(util:to_integer(_Power)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{power = Role#role.power + PowerFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?POWER, NewRole#role.power, ?ATTR_CHANNEL_NORMAL),
%     _ClientSender ! {send, Data}.

% %% @doc 加体力
% add_power(_Power, _ClientSender, quiet) ->
%     PowerFinal = erlang:abs(util:to_integer(_Power)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{power = Role#role.power + PowerFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?POWER, NewRole#role.power, ?ATTR_CHANNEL_QUIET),
%     _ClientSender ! {send, Data}.

% minus_power(_Power, _ClientSender) ->
%     PowerFinal = erlang:abs(util:to_integer(_Power)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewPower = Role#role.power - PowerFinal,
%     case NewPower < 0 of
%         true -> false;
%         _ ->
%             PowerRecoverTime = case NewPower < ?MAX_POWER andalso Role#role.power >= ?MAX_POWER of
%                 false -> Role#role.power_recover_time;
%                 true ->  util:unixtime()
%             end,
%             NewRole = Role#role{power=NewPower, power_recover_time=PowerRecoverTime},
%             game_info:update(NewRole),
%             Data = build_update_attr(?POWER, NewRole#role.power, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data}
%     end.

% minus_power(_Power, _ClientSender, quiet) ->
%     PowerFinal = erlang:abs(util:to_integer(_Power)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewPower = Role#role.power - PowerFinal,
%     case NewPower < 0 of
%         true -> false;
%         _ ->
%             PowerRecoverTime = case NewPower < ?MAX_POWER andalso Role#role.power >= ?MAX_POWER of
%                                    false -> Role#role.power_recover_time;
%                                    true ->  util:unixtime()
%                                end,
%             NewRole = Role#role{power=NewPower, power_recover_time=PowerRecoverTime},
%             game_info:update(NewRole),
%             Data = build_update_attr(?POWER, NewRole#role.power, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data}
%     end.

% %% add_coin(_Coin, _ClientSender) ->
% %%     CoinFinal = erlang:abs(util:to_integer(_Coin)),
% %%     GameInfo = role_api:get_user_data(),
% %%     Account = GameInfo#game_info.account,
% %%     NewAccount = Account#account{coin = Account#account.coin + CoinFinal},
% %%     game_info:update(NewAccount),
% %%     account_db:save(NewAccount),
% %%     Data = build_update_attr(?COIN, NewAccount#account.coin, ?ATTR_CHANNEL_NORMAL),
% %%     _ClientSender ! {send, Data}.
% %%
% %% add_coin(_Coin, _ClientSender, quiet) ->
% %%     CoinFinal = erlang:abs(util:to_integer(_Coin)),
% %%     GameInfo = role_api:get_user_data(),
% %%     Account = GameInfo#game_info.account,
% %%     NewAccount = Account#account{coin = Account#account.coin + CoinFinal},
% %%     game_info:update(NewAccount),
% %%     account_db:save(NewAccount),
% %%     Data = build_update_attr(?COIN, NewAccount#account.coin, ?ATTR_CHANNEL_QUIET),
% %%     _ClientSender ! {send, Data}.
% %%
% %% %% @doc 代币付费
% %% pay_coin(Coin, Tag, _ClientSender) ->
% %%     CoinFinal = erlang:abs(util:to_integer(Coin)),
% %%     #game_info{account=Account, role=Role} = role_api:get_user_data(),
% %%     NewCoin = Account#account.coin - CoinFinal,
% %%     case NewCoin < 0 of
% %%         true -> false;
% %%         _ ->
% %%             NewAccount= Account#account{coin=NewCoin},
% %%             game_info:update(NewAccount),
% %%             account_db:save(NewAccount),
% %%
% %%             if CoinFinal > 0 ->
% %%                 ?CONSUMPTION_MSG(Account#account.account_id, Role#role.role_id, Coin, Tag);
% %%                 true -> ok
% %%             end,
% %%
% %%             Data = build_update_attr(?COIN, NewAccount#account.coin, ?ATTR_CHANNEL_NORMAL),
% %%             _ClientSender ! {send, Data}
% %%     end.
% %%
% %% %% @doc 代币付费
% %% pay_coin(Coin, Tag, _ClientSender, quiet) ->
% %%     CoinFinal = erlang:abs(util:to_integer(Coin)),
% %%     #game_info{account=Account, role=Role} = role_api:get_user_data(),
% %%     NewCoin = Account#account.coin - CoinFinal,
% %%     case NewCoin < 0 of
% %%         true -> false;
% %%         _ ->
% %%             NewAccount= Account#account{coin=NewCoin},
% %%             game_info:update(NewAccount),
% %%             account_db:save(NewAccount),
% %%
% %%             if CoinFinal > 0 ->
% %%                 ?CONSUMPTION_MSG(Account#account.account_id, Role#role.role_id, Coin, Tag);
% %%                 true -> ok
% %%             end,
% %%
% %%             Data = build_update_attr(?COIN, NewAccount#account.coin, ?ATTR_CHANNEL_QUIET),
% %%             _ClientSender ! {send, Data}
% %%     end.
% add_coin(_Coin, _ClientSender) ->
%     add_coin(_Coin, ?CURR_MODE_FUNC, _ClientSender).

% %% @doc 加金币
% add_coin(_Coin, _Tag, _ClientSender) ->
%     CoinFinal = erlang:abs(util:to_integer(_Coin)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{coin = Role#role.coin + CoinFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?COIN, NewRole#role.coin, ?ATTR_CHANNEL_NORMAL),
%     if CoinFinal > 0 ->
%         ?RECHARGE_MSG(GameInfo#game_info.account#account.account_id, Role#role.role_id, _Coin, _Tag);
%         true -> ok
%     end,
%     _ClientSender ! {send, Data}.

% %% @doc 加金币
% add_coin(_Coin, _Tag, _ClientSender, quiet) ->
%     CoinFinal = erlang:abs(util:to_integer(_Coin)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{coin = Role#role.coin + CoinFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?COIN, NewRole#role.coin, ?ATTR_CHANNEL_QUIET),
%     if CoinFinal > 0 ->
%         ?RECHARGE_MSG(GameInfo#game_info.account#account.account_id, Role#role.role_id, _Coin, _Tag);
%         true -> ok
%     end,
%     _ClientSender ! {send, Data}.

% %% @doc 代币付费
% pay_coin(Coin, ItemConsum, _ClientSender) ->
%     CoinFinal = erlang:abs(util:to_integer(Coin)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Account = GameInfo#game_info.account,
%     NewCoin = Role#role.coin - CoinFinal,
%     case NewCoin < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{coin=NewCoin},
%             game_info:update(NewRole),

%             if CoinFinal > 0 ->
%                 act_recharge_api:trigger(?CONSUME_TRIGGER, CoinFinal, _ClientSender),
%                 ?CONSUMPTION_MSG(Account#account.account_id, Role#role.role_id, Coin, ItemConsum);
%                 true -> ok
%             end,

%             Data = build_update_attr(?COIN, NewRole#role.coin, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data}
%     end.

% %% @doc 代币付费
% pay_coin(Coin, ItemConsum, _ClientSender, quiet) ->
%     CoinFinal = erlang:abs(util:to_integer(Coin)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Account = GameInfo#game_info.account,
%     NewCoin = Role#role.coin - CoinFinal,

%     case NewCoin < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{coin=NewCoin},
%             game_info:update(NewRole),

%             if CoinFinal > 0 ->
%                 act_recharge_api:trigger(?CONSUME_TRIGGER, CoinFinal, _ClientSender),
%                 ?CONSUMPTION_MSG(Account#account.account_id, Role#role.role_id, Coin, ItemConsum);
%                 true -> ok
%             end,

%             Data = build_update_attr(?COIN, NewRole#role.coin, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data}
%     end.


% %% 精气
% change_power2(Power2, _ClientSender) ->
%     PowerFinal = util:to_integer(Power2),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     V = Role#role.power2 + PowerFinal,
%     case V >= 0 of
%         false -> false;
%         true ->
%             NewRole = Role#role{power2 = V},
%             game_info:update(NewRole),
%             Data = build_update_attr(?POWER2, NewRole#role.power2, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data},
%             true
%     end.

% add_honor(_Honor, _ClientSender) ->
%     HonorFinal = erlang:abs(util:to_integer(_Honor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{honor = Role#role.honor + HonorFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?HONOR, NewRole#role.honor, ?ATTR_CHANNEL_NORMAL),
%     _ClientSender ! {send, Data}.

% add_honor(_Honor, _ClientSender, quiet) ->
%     HonorFinal = erlang:abs(util:to_integer(_Honor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{honor = Role#role.honor + HonorFinal},
%     game_info:update(NewRole),
%     Data = build_update_attr(?HONOR, NewRole#role.honor, ?ATTR_CHANNEL_QUIET),
%     _ClientSender ! {send, Data}.

% add_vigor(Num, Sender) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{vigor = Role#role.vigor + Final},
%     game_info:update(NewRole),
%     Data = build_update_attr(?VIGOR, NewRole#role.vigor, ?ATTR_CHANNEL_NORMAL),
%     Sender ! {send, Data}.

% add_vigor(Num, Sender, quiet) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{vigor = Role#role.vigor + Final},
%     game_info:update(NewRole),
%     Data = build_update_attr(?VIGOR, NewRole#role.vigor, ?ATTR_CHANNEL_QUIET),
%     Sender ! {send, Data}.

% add_feats(Num, Sender) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{feats = Role#role.feats + Final},
%     game_info:update(NewRole),
%     Data = build_update_attr(?FEATS, NewRole#role.feats, ?ATTR_CHANNEL_NORMAL),
%     Sender ! {send, Data}.

% add_feats(Num, Sender, quiet) ->
%     Final = erlang:abs(util:to_integer(Num)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{feats = Role#role.feats + Final},
%     game_info:update(NewRole),
%     Data = build_update_attr(?FEATS, NewRole#role.feats, ?ATTR_CHANNEL_QUIET),
%     Sender ! {send, Data}.

% minus_honor(_Honor, _ClientSender) ->
%     HonorFinal = erlang:abs(util:to_integer(_Honor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewHonor = Role#role.honor - HonorFinal,
%     case NewHonor < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{honor=NewHonor},
%             game_info:update(NewRole),
%             Data = build_update_attr(?HONOR, NewRole#role.honor, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data}
%     end.

% minus_honor(_Honor, _ClientSender, quiet) ->
%     HonorFinal = erlang:abs(util:to_integer(_Honor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewHonor = Role#role.honor - HonorFinal,
%     case NewHonor < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{honor=NewHonor},
%             game_info:update(NewRole),
%             Data = build_update_attr(?HONOR, NewRole#role.honor, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data}
%     end.

% minus_feats(Value, _ClientSender) ->
%     ValueFinal = erlang:abs(util:to_integer(Value)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewValue = Role#role.feats - ValueFinal,
%     case NewValue < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{feats=NewValue},
%             game_info:update(NewRole),
%             Data = build_update_attr(?FEATS, NewRole#role.feats, ?ATTR_CHANNEL_NORMAL),
%             _ClientSender ! {send, Data}
%     end.

% minus_feats(Value, _ClientSender, quiet) ->
%     ValueFinal = erlang:abs(util:to_integer(Value)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewValue = Role#role.feats - ValueFinal,
%     case NewValue < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{feats=NewValue},
%             game_info:update(NewRole),
%             Data = build_update_attr(?FEATS, NewRole#role.feats, ?ATTR_CHANNEL_QUIET),
%             _ClientSender ! {send, Data}
%     end.

% minus_vigor(Vigor, ClientSender) ->
%     VigorFinal = erlang:abs(util:to_integer(Vigor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewVigor = Role#role.vigor - VigorFinal,
%     case NewVigor < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{vigor = NewVigor},
%             game_info:update(NewRole),
%             Data = build_update_attr(?VIGOR, NewRole#role.vigor, ?ATTR_CHANNEL_NORMAL),
%             ClientSender ! {send, Data}
%     end.

% minus_vigor(Vigor, ClientSender, quiet) ->
%     VigorFinal = erlang:abs(util:to_integer(Vigor)),
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewVigor = Role#role.vigor - VigorFinal,
%     case NewVigor < 0 of
%         true -> false;
%         _ ->
%             NewRole = Role#role{vigor = NewVigor},
%             game_info:update(NewRole),
%             Data = build_update_attr(?VIGOR, NewRole#role.vigor, ?ATTR_CHANNEL_QUIET),
%             ClientSender ! {send, Data}
%     end.

% %% add_hot(Value, Sender) ->
% %%     GameInfo = role_api:get_user_data(),
% %%     Role = GameInfo#game_info.role,
% %%     NewRole = Role#role{hot = erlang:max(0, Role#role.hot + Value)},
% %%     game_info:update(NewRole),
% %%     Data = build_update_attr(?HOT, NewRole#role.hot),
% %%     Sender ! {send, Data}.

% add_charm_with_limit(Value, Limit, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     case GameInfo#game_info.daily of
%         #daily{charm=Charm} = FDaily  ->
%             Role = GameInfo#game_info.role,
%             Charm2 = erlang:max(0, erlang:min(Limit, Charm + Value)),
%             Add = Charm2 - Charm,
%            NewRole = Role#role{charm = Role#role.charm+Add},
%             game_info:update(NewRole),
%             game_info:update(FDaily#daily{charm=Charm2}),
%             Data = build_update_attr(?CHARM, NewRole#role.charm, ?ATTR_CHANNEL_NORMAL),
%             Sender ! {send, Data};
%         _ -> ok
%     end.

% add_charm_with_limit(Value, Limit, Sender, quiet) ->
%     GameInfo = role_api:get_user_data(),
%     case GameInfo#game_info.daily of
%         #daily{charm=Charm} = FDaily  ->
%             Role = GameInfo#game_info.role,
%             Charm2 = erlang:max(0, erlang:min(Limit, Charm + Value)),
%             Add = Charm2 - Charm,
%             NewRole = Role#role{charm = Role#role.charm+Add},
%             game_info:update(NewRole),
%             game_info:update(FDaily#daily{charm=Charm2}),
%             Data = build_update_attr(?CHARM, NewRole#role.charm, ?ATTR_CHANNEL_QUIET),
%             Sender ! {send, Data};
%         _ -> ok
%     end.

% add_charm(Value, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{charm = erlang:max(0, Role#role.charm + Value)},
%     game_info:update(NewRole),
%     Data = build_update_attr(?CHARM, NewRole#role.charm, ?ATTR_CHANNEL_NORMAL),
%     Sender ! {send, Data}.

% add_charm(Value, Sender, quiet) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NewRole = Role#role{charm = erlang:max(0, Role#role.charm + Value)},
%     game_info:update(NewRole),
%     Data = build_update_attr(?CHARM, NewRole#role.charm, ?ATTR_CHANNEL_QUIET),
%     Sender ! {send, Data}.


% change_level(_, NewLevel, ClientSender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     arena_srv:change_level(Role#role.role_id, NewLevel),
%     Data = build_update_attr(?LEVEL, NewLevel, ?ATTR_CHANNEL_NORMAL),
%     ClientSender ! {send, Data},

%     gen_act:check_release_act(ClientSender),
%     gen_act:trigger_level_acts(NewLevel, ClientSender),
%     check_active(2,ClientSender),
%     check_open_function().

% change_level(_, NewLevel, ClientSender, quiet) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     arena_srv:change_level(Role#role.role_id, NewLevel),
%     Data = build_update_attr(?LEVEL, NewLevel, ?ATTR_CHANNEL_QUIET),
%     ClientSender ! {send, Data},

%     gen_act:check_release_act(ClientSender),
%     gen_act:trigger_level_acts(NewLevel, ClientSender),
%     check_active(2,ClientSender),
%     check_open_function().

% change_vip(_, NewVip, _ClientSender) ->
%     Data = build_update_attr(?VIP, NewVip, ?ATTR_CHANNEL_NORMAL),
%     _ClientSender ! {send, Data},
%     check_active(4, _ClientSender),
%     check_open_function().

% change_vip(_, NewVip, _ClientSender, quiet) ->
%     Data = build_update_attr(?VIP, NewVip, ?ATTR_CHANNEL_QUIET),
%     _ClientSender ! {send, Data},
%     check_active(4, _ClientSender),
%     check_open_function().

% get_all_ol_time() ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     NowTime = util:unixtime(),
%     NowTime - Role#role.update_time + Role#role.ol_time.
% get_role_id() ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Role#role.role_id.

% check_open_function() ->
%     % FuncIds = function_cfg:get_all(),

%     % Fun = fun(FuncId) ->
%     %     #game_info{role=Role, mission=Mission, quest=Quest} = role_api:get_user_data(),

%     %     case lists:member(FuncId, Role#role.open_function) of
%     %         true -> false;
%     %         false ->
%     %             Level = Role#role.level,
%     %             Story = Role#role.story,

%     %             % 副本必须通关才生效, change by yz at 4/21/14
%     %             MissionList = [X#mission.mission_id || X <- Mission#missions.all, X#mission.state==?MISSION_COMPLATED],
%     %             SubmitQuestList = [X#quest.quest_id || X <- Quest#quests.all, X#quest.state == ?QUEST_SUBMITED],
%     %             AcceptQuestList = [X#quest.quest_id || X <- Quest#quests.all, X#quest.state == ?QUEST_ACCEPTED],

%     %             Cfg = function_cfg:get(FuncId),
%     %             HasLevel = Level >= Cfg#function_cfg.need_level,
%     %             HasStory = lists:member(Cfg#function_cfg.need_story, Story),

%     %             HasMission = case Cfg#function_cfg.need_mission == 0 of
%     %                 true -> true;
%     %                 false -> lists:member(Cfg#function_cfg.need_mission, MissionList)
%     %             end,
%     %             HasSubmitQuest = case Cfg#function_cfg.need_submit_quest == 0 of
%     %                 true -> true;
%     %                 false -> lists:member(Cfg#function_cfg.need_submit_quest, SubmitQuestList)
%     %             end,
%     %             HasAcceptQuest = case Cfg#function_cfg.need_accept_quest == 0 of
%     %                 true -> true;
%     %                 false -> lists:member(Cfg#function_cfg.need_accept_quest, AcceptQuestList)
%     %             end,

%     %             case function_cfg:get(FuncId) of
%     %                 Cfg when Cfg#function_cfg.type == 0 andalso HasLevel andalso HasMission andalso HasSubmitQuest andalso HasAcceptQuest andalso HasStory ->
%     %                     NewRole = Role#role{open_function=Role#role.open_function++[FuncId]},
%     %                     game_info:update(NewRole),
%     %                     FuncName = string:concat(Cfg#function_cfg.tag, "_api"),
%     %                     safe_apply(util:to_atom(FuncName), 'open_function', [FuncId]),
%     %                     FuncId;
%     %                 Cfg when Cfg#function_cfg.type == 1 andalso (HasLevel orelse HasMission orelse HasSubmitQuest orelse HasAcceptQuest orelse HasStory) ->
%     %                     NewRole = Role#role{open_function=Role#role.open_function++[FuncId]},
%     %                     game_info:update(NewRole),
%     %                     FuncName = string:concat(Cfg#function_cfg.tag, "_api"),
%     %                     safe_apply(util:to_atom(FuncName), 'open_function', [FuncId]),
%     %                     FuncId;
%     %                 _ -> false
%     %             end
%     %     end
%     % end,
%     % Results = [Fun(FuncId) || FuncId <- FuncIds],
%     % OpenFuncIds = [Result || Result <- Results, Result /= false],
%     % case OpenFuncIds of
%     %     [] -> ok;
%     %     _ -> self() ! {send, #m__system__function__s2c{funcIds=OpenFuncIds}}
%     % end,
%     check_open_scene().

% check_open_scene() ->
%     % AllSceneId = scene_cfg:get_all(),
%     % #game_info{role=Role, quest=Quests} = cache:find(game_info),
%     % AcceptQuest = [X#quest.quest_id || X <- Quests#quests.all, X#quest.state == ?QUEST_ACCEPTED],

%     % Fun = fun(SceneId) ->
%     %     case lists:member(SceneId, Role#role.open_scene) of
%     %         true -> false;
%     %         false ->
%     %             Cfg = scene_cfg:get(SceneId),
%     %             case lists:member(Cfg#scene_cfg.accept_quest, AcceptQuest++[0]) of
%     %                 true -> SceneId;
%     %                 false -> false
%     %             end
%     %     end
%     % end,
%     % OpenScene = [Fun(SceneId) || SceneId <- AllSceneId],        % 增加默认开启
%     % OpenSceneIds = [Id || Id <- OpenScene, Id /= false],
%     % case OpenSceneIds of
%     %     [] -> ok;
%     %     _ ->
%     %         game_info:update(Role#role{open_scene=Role#role.open_scene ++ OpenSceneIds}),
%     %         self() ! {send, #m__system__town__s2c{town_ids = OpenSceneIds}}
%     % end,
%     ok.

% get_award(Ids, _Tag, Sender) ->
%     Cfgs = [ re:split(X, "-", [{return, list}]) || X <- Ids],
%     D = [{util:to_integer(X), util:to_integer(Y)}||[X, Y]<-Cfgs],
%     D1 = [T || T = {_, Y} <- D, Y =/= 0],
%     Check = check_add_award(D1, Sender),
%     if  Check =:= false -> false;
%         true ->
%             [add_award(X, Y, _Tag, Sender) || {X, Y} <- D, Y /= 0],
%             true
%     end.

% get_award(Ids, _Tag, Sender, quiet) ->
%     Cfgs = [ re:split(X, "-", [{return, list}]) || X <- Ids],
%     D = [{util:to_integer(X), util:to_integer(Y)}||[X, Y]<-Cfgs],
%     D1 = [T || T = {_, Y} <- D, Y =/= 0],
%     Check = check_add_award(D1, Sender),
%     if  Check =:= false -> false;
%         true ->
%             [add_award(X, Y, _Tag, Sender, quiet) || {X, Y} <- D, Y /= 0],
%             true
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% update_role_info(GameInfo, _Sender) ->
%     cache:update(GameInfo).

% show_role_info(_, _Sender) ->
%     io:format("~p~n", [cache:find(game_info)]).

% open_function(_FuncId) ->
%     ok.

% build_update_attr(Type, Value, Channel) ->
%     % #m__role__update_attr__s2c{
%     %     attr_type = Type,
%     %     channel = Channel,
%     %     value = Value
%     % },
%     ok.

% check_add_award(L, Sender) ->
%     I = [{Type, Num} || {Type, Num} <- L, not lists:member(Type, ?AWARD_TYPE_VALUE_LIST)],
%     case package_api:check_slots_enough(length(I)) of
%         false ->
%             Sender ! {send, #m__system__notify__s2c{code=?SLOT_NOT_ENOUGH}},
%             false;
%         true -> check_add_award1(L)
%     end.

% check_add_award1([]) -> true;
% check_add_award1([{_X, Y}|_]) when Y < 0 -> false;
% check_add_award1([{X, _Y}|R]) ->
%     case lists:member(X, ?AWARD_TYPE_VALUE_LIST) of
%         true -> check_add_award1(R);
%         false ->
%             case item_cfg:get(X) of
%                 false ->
%                     case skill_cfg:get({X, 1, 10001}) of
%                         false ->
%                             case skill_cfg:get({X, 1, 10002}) of
%                                 false ->
%                                     case skill_cfg:get({X, 1, 10003}) of
%                                         false -> 
%                                             false;
%                                         true -> 
%                                             check_add_award1(R)
%                                     end;
%                                 true ->
%                                     check_add_award1(R)
%                             end;
%                         true ->
%                             check_add_award1(R)
%                     end;
%                 _ -> check_add_award1(R)
%             end
%     end.

% add_award(?EXP, Num, _Tag, Sender) ->
%     role_api:add_exp(Num, Sender);
% add_award(?GOLD, Num, _Tag, Sender) ->
%     role_api:add_gold(Num, Sender);
% add_award(?COIN, Num, _Tag, Sender) ->
%     role_api:add_coin(Num, _Tag, Sender);
% add_award(?POWER, Num, _Tag, Sender) ->
%     role_api:add_power(Num, Sender);
% add_award(?VIP_EXP, Num, _Tag, Sender) ->
%     role_api:add_vip_exp(Num, Sender);
% add_award(?HONOR, Num, _Tag, Sender) ->
%     role_api:add_honor(Num, Sender);
% add_award(?VIGOR, Num, _Tag, Sender) ->
%     role_api:add_vigor(Num, Sender);
% add_award(?FEATS, Num, _Tag, Sender) ->
%     role_api:add_feats(Num, Sender);
% add_award(?SKILL, SkillId, _Tag, Sender) ->
%     skill_api:add(SkillId, Sender);
% add_award(?POWER2, Num, _Tag, Sender) ->
%     role_api:change_power2(Num, Sender);
% add_award(?WARRIOR_SOUL1, Num, _Tag, Sender) ->
%     warrior_api:add_soul1(Num, Sender);
% add_award(?WARRIOR_SOUL2, Num, _Tag, Sender) ->
%     warrior_api:add_soul2(Num, Sender);
% add_award(ItemId, Num, _Tag, Sender) ->
%     Cfg = item_cfg:get(ItemId),
%     RoleId = role_api:get_role_id(),
%     Items =
%         case Cfg#item_cfg.stack_num < Num of
%             true ->
%                 [#item{role_id=RoleId, item_id=ItemId, num=1, slots=?NEWSLOTS} || _ <- lists:seq(1, Num)];
%             false ->
%                 [#item{role_id = role_api:get_role_id(), item_id = ItemId, num = Num, slots = ?NEWSLOTS}]
%         end,
%     item_api:add_items(Items, Sender).

% add_award(?EXP, Num, _Tag, Sender, quiet) ->
%     role_api:add_exp(Num, Sender, quiet);
% add_award(?GOLD, Num, _Tag, Sender, quiet) ->
%     role_api:add_gold(Num, Sender, quiet);
% add_award(?COIN, Num, _Tag, Sender, quiet) ->
%     role_api:add_coin(Num, _Tag, Sender, quiet);
% add_award(?POWER, Num, _Tag, Sender, quiet) ->
%     role_api:add_power(Num, Sender, quiet);
% add_award(?HONOR, Num, _Tag, Sender, quiet) ->
%     role_api:add_honor(Num, Sender, quiet);
% add_award(?VIGOR, Num, _Tag, Sender, quiet) ->
%     role_api:add_vigor(Num, Sender, quiet);
% add_award(?FEATS, Num, _Tag, Sender, quiet) ->
%     role_api:add_feats(Num, Sender, quiet);
% add_award(?SKILL, SkillId, _Tag, Sender, quiet) ->
%     skill_api:add(SkillId, Sender);
% add_award(ItemId, Num, _Tag, Sender, quiet) ->
%     Cfg = item_cfg:get(ItemId),
%     RoleId = role_api:get_role_id(),
%     Items =
%     case Cfg#item_cfg.stack_num < Num of
%         true ->
%             [#item{role_id=RoleId, item_id=ItemId, num=1, slots=?NEWSLOTS} || _ <- lists:seq(1, Num)];
%         false ->
%             [#item{role_id = role_api:get_role_id(), item_id = ItemId, num = Num, slots = ?NEWSLOTS}]
%     end,
%     item_api:add_items(Items, Sender, quiet).


% safe_apply(M, F, A) ->
%     try
%         apply(M, F, A)
%     catch
%         Class:Reason ->
%             ?DEBUG_MSG("safe apply {~p, ~p, ~p}, class: ~p reason:~p ~n", [M, F, A, Class, Reason])

%     end.

% %%     case code:is_loaded(M) of
% %%         false -> code:load_file(M);
% %%         _ -> ok
% %%     end,
% %%     case erlang:function_exported(M, F, length(A)) of
% %%         true -> apply(M, F, A);
% %%         _ -> ok
% %%     end.

% %% ===============================
% %% admin functions
% %% ===============================
% admin_add_exp(Num, Sender) ->
%     add_exp(Num, Sender),
%     ok.

% admin_add_gold(Num, Sender) ->
%     add_gold(Num, Sender),
%     ok.

% admin_add_coin(Num, Sender) ->
%     add_coin(Num, ?CURR_MODE_FUNC, Sender),
%     ok.

% admin_add_power(Num, Sender) ->
%     add_power(Num, Sender),
%     ok.

% admin_add_vip_exp(Num, Sender) ->
%     add_vip_exp(Num, Sender),
%     ok.

% admin_add_honor(Num, Sender) ->
%     add_honor(Num, Sender),
%     ok.

% admin_add_vigor(Num, Sender) ->
%     add_vigor(Num, Sender),
%     ok.

% admin_add_feats(Num, Sender) ->
%     add_feats(Num, Sender),
%     ok.

% admin_change_power2(Num, Sender) ->
%     change_power2(Num, Sender),
%     ok.

% %% ===============================
% %% gm functions
% %% ===============================
% % gm_open_function(FuncId, Sender) ->
% %     #game_info{role=Role} = role_api:get_user_data(),
% %     Cfg = function_cfg:get(FuncId),
% %     NewRole = Role#role{open_function=Role#role.open_function++[FuncId]},
% %     game_info:update(NewRole),
% %     FuncName = string:concat(Cfg#function_cfg.tag, "_api"),
% %     safe_apply(util:to_atom(FuncName), 'open_function', [FuncId]),
% %     Sender ! {send, #m__system__function__s2c{funcIds=[FuncId]}}.

% gm_open_scene(SceneId, _Sender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     NewRole = Role#role{open_scene=Role#role.open_scene++[SceneId]},
%     game_info:update(NewRole).

% gm_jump_mission({RoleId, MissionId}, _Sender) ->
%     #game_info{mission=Missions} = role_api:get_user_data(),
%     NewMissions = case lists:keyfind(MissionId, #mission.mission_id, Missions#missions.all) of
%         false ->
%             New = #mission{mission_id=MissionId, role_id=RoleId, state=?MISSION_COMPLATED,score=100},
%             Missions#missions{all=lists:keyreplace(MissionId, #mission.mission_id, Missions#missions.all, New)};
%         Mission ->
%             New = Mission#mission{score=100, state=?MISSION_COMPLATED},
%             Missions#missions{all=Missions#missions.all ++ [New]}
%     end,
%     game_info:update(NewMissions).

% gm_change_story(StoryId, _Sender) ->
%   #game_info{role=Role} = role_api:get_user_data(),
%   game_info:update(Role#role{story = StoryId}),
%   role_api:check_open_function().

% gm_quest_submit({QuestType, QuestId}, ClientSender) ->
%     Cfg = case QuestType of                                                                   % 验证任务id
%       ?MAIN_QUEST -> main_quest_cfg:get(QuestId);
%       ?BRANCH_QUEST -> branch_quest_cfg:get(QuestId);
%       _ -> false
%     end,

%     GameInfo = role_api:get_user_data(),
%     #game_info{quest=Quests, role=Role} = GameInfo,
%     QuestInfo = lists:keyfind(QuestId, #quest.quest_id, Quests#quests.all),                   % 没有领取提交个蛋蛋啊

%     NewQuest = QuestInfo#quest{state=?QUEST_SUBMITED, finish_time=util:unixtime()},
%     NewQuests = Quests#quests{all=lists:keyreplace(QuestId, #quest.quest_id, Quests#quests.all, NewQuest)},

%     case QuestType of
%       ?MAIN_QUEST ->
%         AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%         Awards = element(util:index_of(AwardTag, record_info(fields, main_quest_cfg))+1, Cfg),
%         role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender);
%       ?BRANCH_QUEST ->
%         AwardTag = util:to_atom("awards_" ++  util:to_list(Role#role.job)),
%         Awards = element(util:index_of(AwardTag, record_info(fields, branch_quest_cfg))+1, Cfg),
%         role_api:get_award(Awards, ?CURR_MODE_FUNC, ClientSender);
%       _ -> false
%     end,

%     game_info:update(NewQuests),                                                              % 更新内存
%     role_api:check_open_function(),                                                           % 检测开启功能
%     ClientSender ! {send, #m__system__notify__s2c{code = ?QUEST_SUBMIT_SUCCESS}}.

% check_active(Type, Sender) ->
%     TitleIds = title_cfg:get_all(),
%     LevelTitleIds = lists:map(fun(Id) -> Cfg = title_cfg:get(Id), if Cfg#title_cfg.type =:= Type -> Id; true -> ok end end, TitleIds),
%     Ids = [X|| X <- LevelTitleIds, X =/= ok],
%     lists:map(
%         fun(Id) -> 
%            TitleCfg = title_cfg:get(Id),
%            CheckScript = TitleCfg#title_cfg.check_script,
%             case CheckScript() of
%                 true -> title_api:add(Id, Sender);
%                 false -> ok
%             end
%         end,
%     Ids).

