-module(group_pool_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #group_pool_cfg{
        level=1,
        starttime="21:00",
        endtime="21:11",
        count=1,
        levelup=5,
        max=4,
        palygain=10,
        interval=120,
        interval_count=5,
        gain1=3,
        gain2=4,
        gain3=5,
        gain4=6,
        gain5=7};

get(2) ->
    #group_pool_cfg{
        level=2,
        starttime="21:00",
        endtime="21:11",
        count=1,
        levelup=5,
        max=4,
        palygain=10,
        interval=120,
        interval_count=5,
        gain1=4,
        gain2=5,
        gain3=7,
        gain4=8,
        gain5=9};

get(3) ->
    #group_pool_cfg{
        level=3,
        starttime="21:00",
        endtime="21:11",
        count=2,
        levelup=5,
        max=4,
        palygain=10,
        interval=120,
        interval_count=5,
        gain1=5,
        gain2=7,
        gain3=8,
        gain4=10,
        gain5=11};

get(4) ->
    #group_pool_cfg{
        level=4,
        starttime="21:00",
        endtime="21:11",
        count=2,
        levelup=5,
        max=4,
        palygain=10,
        interval=120,
        interval_count=5,
        gain1=6,
        gain2=8,
        gain3=10,
        gain4=11,
        gain5=13};

get(5) ->
    #group_pool_cfg{
        level=5,
        starttime="21:00",
        endtime="21:11",
        count=3,
        levelup=5,
        max=4,
        palygain=10,
        interval=120,
        interval_count=5,
        gain1=7,
        gain2=9,
        gain3=11,
        gain4=13,
        gain5=15};

get(_) -> false.


