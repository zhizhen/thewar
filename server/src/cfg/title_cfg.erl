-module(title_cfg).
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("common.hrl").
-export([get/1]).
-export([get_all/0]).

get(1001) ->
    #title_cfg{
        title_id=1001,
        quality=2,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=5,
        attr1num=100,
        attr2idx=6,
        attr2num=100,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="fight1",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Fight = __Role#role.fight, 
__Fight >= 50000
 end,
        check_fight=50000,
        type=1};

get(1002) ->
    #title_cfg{
        title_id=1002,
        quality=3,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=5,
        attr1num=200,
        attr2idx=6,
        attr2num=200,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="fight2",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Fight = __Role#role.fight,
__Fight >= 100000  end,
        check_fight=100000,
        type=1};

get(1003) ->
    #title_cfg{
        title_id=1003,
        quality=2,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=3,
        attr1num=30,
        attr2idx=4,
        attr2num=30,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="level_value1",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Level = __Role#role.level,
__Level >=20 end,
        check_fight=0,
        type=2};

get(1004) ->
    #title_cfg{
        title_id=1004,
        quality=3,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=3,
        attr1num=100,
        attr2idx=4,
        attr2num=100,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="level_value2",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Level = __Role#role.level,
__Level >=40 end,
        check_fight=0,
        type=2};

get(1005) ->
    #title_cfg{
        title_id=1005,
        quality=4,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=3,
        attr1num=200,
        attr2idx=4,
        attr2num=200,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="level_value3",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Level = __Role#role.level,
__Level >= 60 end,
        check_fight=0,
        type=2};

get(1006) ->
    #title_cfg{
        title_id=1006,
        quality=3,
        kind=1,
        status=0,
        valid_time=0,
        attr1idx=7,
        attr1num=500,
        attr2idx=0,
        attr2num=0,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="misson_SSS_changan",
        check_script=fun() -> #game_info{ mission = __Mission } = role_api:get_user_data(),
__Missions = __Mission#missions.all,
__Result = lists:map(
    fun(E) -> 
          __Missn = lists:keyfind(E, 3, __Missions),
          if __Missn == false -> false;
            true ->
                __Score = __Missn#mission.score,
                __Star = ?BUILD_BATTLE_STAR(__Score),
                if
                    __Star == 6 -> true;
                    __Star =/= 6 -> false
                end
           end
      end,
     [32000,32001,32002]
 ),
__Is_SSS = lists:member(false, __Result),
__Is_SSS end,
        check_fight=0,
        type=3};

get(1007) ->
    #title_cfg{
        title_id=1007,
        quality=4,
        kind=1,
        status=0,
        valid_time=0,
        attr1idx=7,
        attr1num=1000,
        attr2idx=0,
        attr2num=0,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="misson_SSS_henei",
        check_script=fun() -> #game_info{ mission = __Mission } = role_api:get_user_data(),
  __Missions = __Mission#missions.all,
  __Result = lists:map(
      fun(E) -> 
            __Missn = lists:keyfind(E, 3, __Missions),
            if __Missn == false -> false;
            true ->
                __Score = __Missn#mission.score,
                __Star = ?BUILD_BATTLE_STAR(__Score),
                if
                    __Star == 6 -> true;
                    __Star =/= 6 -> false
                end
           end
        end,
       [32003,32004,32005]
   ),
  Is_SSS = lists:member(false, __Result),
  Is_SSS end,
        check_fight=0,
        type=3};

get(1008) ->
    #title_cfg{
        title_id=1008,
        quality=5,
        kind=1,
        status=0,
        valid_time=0,
        attr1idx=7,
        attr1num=2000,
        attr2idx=0,
        attr2num=0,
        attr3idx=0,
        attr3num=0,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="misson_SSS_runan",
        check_script=fun() -> #game_info{ mission = __Mission } = role_api:get_user_data(),
__Missions = __Mission#missions.all,
__Result = lists:map(
    fun(E) -> 
          __Missn = lists:keyfind(E, 3, __Missions),
          if __Missn == false -> false;
            true ->
                __Score = __Missn#mission.score,
                __Star = ?BUILD_BATTLE_STAR(__Score),
                if
                    __Star == 6 -> true;
                    __Star =/= 6 -> false
                end
           end
      end,
    [32006,32007,32008,32009, 32010,32011]),
__Is_SSS = lists:member(false, __Result),
__Is_SSS end,
        check_fight=0,
        type=3};

get(1009) ->
    #title_cfg{
        title_id=1009,
        quality=3,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=3,
        attr1num=100,
        attr2idx=4,
        attr2num=100,
        attr3idx=7,
        attr3num=1000,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="vip_value4",
        check_script=fun() -> #game_info{ role = __Role } = role_api:get_user_data(),
__Vip = __Role#role.vip,
__Vip >=4  end,
        check_fight=0,
        type=4};

get(1010) ->
    #title_cfg{
        title_id=1010,
        quality=4,
        kind=5,
        status=0,
        valid_time=0,
        attr1idx=3,
        attr1num=300,
        attr2idx=4,
        attr2num=300,
        attr3idx=7,
        attr3num=2000,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="vip_value10",
        check_script=fun() ->  #game_info{ role = __Role } = role_api:get_user_data(),
 __Vip = __Role#role.vip,
 __Vip >= 10  end,
        check_fight=0,
        type=4};

get(1011) ->
    #title_cfg{
        title_id=1011,
        quality=5,
        kind=4,
        status=1,
        valid_time=86400,
        attr1idx=1,
        attr1num=30,
        attr2idx=2,
        attr2num=30,
        attr3idx=62,
        attr3num=200,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=5};

get(1012) ->
    #title_cfg{
        title_id=1012,
        quality=4,
        kind=4,
        status=1,
        valid_time=86400,
        attr1idx=1,
        attr1num=20,
        attr2idx=2,
        attr2num=20,
        attr3idx=62,
        attr3num=100,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=5};

get(1013) ->
    #title_cfg{
        title_id=1013,
        quality=5,
        kind=4,
        status=1,
        valid_time=86400,
        attr1idx=3,
        attr1num=300,
        attr2idx=4,
        attr2num=300,
        attr3idx=63,
        attr3num=150,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=6};

get(1015) ->
    #title_cfg{
        title_id=1015,
        quality=6,
        kind=4,
        status=0,
        valid_time=0,
        attr1idx=1,
        attr1num=40,
        attr2idx=2,
        attr2num=40,
        attr3idx=7,
        attr3num=5000,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=0};

get(1016) ->
    #title_cfg{
        title_id=1016,
        quality=5,
        kind=4,
        status=0,
        valid_time=0,
        attr1idx=1,
        attr1num=30,
        attr2idx=2,
        attr2num=30,
        attr3idx=7,
        attr3num=4000,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=0};

get(1017) ->
    #title_cfg{
        title_id=1017,
        quality=5,
        kind=4,
        status=0,
        valid_time=0,
        attr1idx=1,
        attr1num=25,
        attr2idx=2,
        attr2num=25,
        attr3idx=7,
        attr3num=3000,
        attr4idx=0,
        attr4num=0,
        attr5idx=0,
        attr5num=0,
        script="",
        check_script=fun() -> util:to_integer(0) end,
        check_fight=0,
        type=0};

get(_) -> false.

get_all() ->
    [1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1015,1016,1017].

