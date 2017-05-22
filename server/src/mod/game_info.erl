%% Copyright
-module(game_info).
-include("table_etc.hrl").
-include("table_record.hrl").
-include("logger.hrl").
-include("common.hrl").

%% API
-export([update/1, update/2]).
-export([reset_update_flag/0]).
-export([hook/2, unhook/2]).
-export([update_online_ets/1, update_online_ets/2, delete_online_ets/1]).


update(Data) ->
    GameInfo = cache:find(game_info),

    Flag = erlang:element(1, Data),
    UpdateFlag2 = GameInfo#game_info.update_flag,
    case lists:member(Flag, UpdateFlag2) of
        true -> UpdateFlag = UpdateFlag2;
        false -> UpdateFlag = [Flag|UpdateFlag2]
    end,

    case Data of
        #role{level=L} when L /= GameInfo#game_info.role#role.level ->
            group_srv:update_member(GameInfo);
        _ -> ok
    end,

    GameInfo2 = GameInfo#game_info{update_flag = UpdateFlag},
    update1(GameInfo2, Data).


update1(G, #account{}=D) -> cache:update(G#game_info{account=D});
update1(G, #role{}=D) -> cache:update(G#game_info{role=D});
update1(G, #role_etc{}=D) -> cache:update(G#game_info{role_etc=D});
update1(G, #equip{}=D) -> cache:update(G#game_info{equip=D});
update1(G, #package{}=D) -> cache:update(G#game_info{package=D});
update1(G, #missions{}=D) -> cache:update(G#game_info{mission=D});
update1(G, #buffs{}=D) -> cache:update(G#game_info{buff=D});
update1(G, #quests{}=D) -> cache:update(G#game_info{quest=D});
update1(G, #items{}=D) -> cache:update(G#game_info{item=D});
update1(G, #shop{}=D) -> cache:update(G#game_info{shop=D});
update1(G, #daily{}=D) -> cache:update(G#game_info{daily=D});
update1(G, #ban_chat{}=D) -> cache:update(G#game_info{ban_chat=D});
update1(G, #mails{}=D) -> cache:update(G#game_info{mail=D});
update1(G, #skills{}=D) -> cache:update(G#game_info{skills=D});
update1(G, #spiritinfo{}=D) -> cache:update(G#game_info{spiritinfo=D});
update1(G, #arena{}=D) -> cache:update(G#game_info{arena=D});
update1(G, #friends{}=D) -> cache:update(G#game_info{friends=D});
update1(G, #friend_etc{}=D) -> cache:update(G#game_info{friends_etc=D});
update1(G, #follower_etc{}=D) -> cache:update(G#game_info{followers_etc=D});
update1(G, #universe{}=D) -> cache:update(G#game_info{universe=D});
update1(G, #cultivate{}=D) -> cache:update(G#game_info{cultivate=D});
update1(G, #cultivate_etc{}=D) -> cache:update(G#game_info{cultivate_etc=D});
update1(G, #sign{}=D) -> cache:update(G#game_info{sign=D});
update1(G, #golden_mission_etc{}=D) -> cache:update(G#game_info{golden_mission_etc=D});
update1(G, #offline{}=D) -> cache:update(G#game_info{offline=D});
update1(G, #acts{}=D) -> cache:update(G#game_info{acts=D});
update1(G, #coin2exp{}=D) -> cache:update(G#game_info{coin2exp=D});
update1(G, #boudoir{}=D) -> cache:update(G#game_info{boudoir=D});
update1(G, #group_member{}=D) -> cache:update(G#game_info{group_member=D});
update1(G, #group_state{}=D) -> cache:update(G#game_info{group_etc=D});
update1(G, #group_pool{}=D) -> cache:update(G#game_info{group_pool=D});
update1(G, #group_role_meeting{}=D) -> cache:update(G#game_info{group_role_meeting=D});
update1(G, #role_warrior{}=D) -> cache:update(G#game_info{role_warrior=D});
update1(G, #scene_etc{}=D) -> cache:update(G#game_info{scene_etc=D});
update1(G, #achievement{}=D) -> cache:update(G#game_info{achievements=D});
update1(G, #contest{}=D) -> cache:update(G#game_info{contest=D});
update1(G, #titles{}=D) -> cache:update(G#game_info{titles=D});
update1(G, #mall{} = D) -> cache:update(G#game_info{mall=D}).

reset_update_flag() ->
    GameInfo = cache:find(game_info),
    cache:update(GameInfo#game_info{update_flag=[]}).

update(Atom, Data) ->
    GameInfo = cache:find(game_info),
    update(Atom, GameInfo, Data).

update(hook, G, Data) -> cache:update(G#game_info{hook=Data});
update(warrior, G, Data) ->  cache:update(G#game_info{warrior=Data}).

%%%===================================================================
%%% hook
%%%===================================================================
%% send2role(PId, {game_info, hook, [self()]}).
hook(Pid, _Sender) ->
    case Pid == self() of
        true -> ok;
        _ ->
            #game_info{hook=Hook} = role_api:get_user_data(),
            case lists:member(Pid, Hook) of
                false ->
                    game_info:update(hook, [Pid|Hook]);
                true -> ok
            end
    end.

unhook(Pid, _Sender) ->
    #game_info{hook=Hook} = role_api:get_user_data(),
    game_info:update(hook, [Hook]--[Pid]).


%%%===================================================================
%%% etc
%%%===================================================================

update_online_ets(GameInfo) -> update_online_ets(GameInfo, [role, equip]).
update_online_ets(GameInfo, Flag) ->
    case lists:member(role, Flag) orelse lists:member(equip, Flag) of
        true ->
            Role = GameInfo#game_info.role,
            Equip = GameInfo#game_info.equip,

            Weapon = case Equip#equip.weapon of
                <<"0">> -> <<"0">>;
                WeaponId -> (item_api:get_info_by_id(WeaponId, [?ITEM_AVAILABLE, ?ITEM_USE]))#item.item_id
            end,
            Armor = case Equip#equip.armor of
                <<"0">> -> <<"0">>;
                ArmorId -> (item_api:get_info_by_id(ArmorId, [?ITEM_AVAILABLE, ?ITEM_USE]))#item.item_id
            end,

            Wing = case Role#role.wing of
                <<"0">> -> <<"0">>;
                _ -> case item_api:get_info_by_id(Role#role.wing, [?ITEM_AVAILABLE, ?ITEM_USE]) of
                         false -> 0;
                         Item -> Item#item.item_id
                     end
            end,

            NewEquip = Equip#equip{weapon = Weapon, armor = Armor},
            ets:insert(?ETS_ONLINE_PLAYER, #online{id=Role#role.role_id, role=Role, equip=NewEquip, wing=Wing});

        false -> ok
    end.

delete_online_ets(GameInfo) ->
    ets:delete(?ETS_ONLINE_PLAYER, GameInfo#game_info.role#role.role_id).
