-module(treasure_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #treasure_cfg{
        treasure_id=1,
        treasure_type=4,
        rate=300,
        hour=8,
        num=9000,
        guard_type=1,
        loot_per=10,
        power=20};

get(2) ->
    #treasure_cfg{
        treasure_id=2,
        treasure_type=5,
        rate=100,
        hour=8,
        num=10,
        guard_type=1,
        loot_per=10,
        power=20};

get(3) ->
    #treasure_cfg{
        treasure_id=3,
        treasure_type=14,
        rate=200,
        hour=8,
        num=10,
        guard_type=1,
        loot_per=10,
        power=20};

get(4) ->
    #treasure_cfg{
        treasure_id=4,
        treasure_type=4,
        rate=150,
        hour=10,
        num=9000,
        guard_type=2,
        loot_per=10,
        power=20};

get(5) ->
    #treasure_cfg{
        treasure_id=5,
        treasure_type=5,
        rate=100,
        hour=10,
        num=15,
        guard_type=2,
        loot_per=10,
        power=20};

get(6) ->
    #treasure_cfg{
        treasure_id=6,
        treasure_type=14,
        rate=150,
        hour=10,
        num=15,
        guard_type=2,
        loot_per=10,
        power=20};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6].

