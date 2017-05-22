-module(warrior_attr_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #warrior_attr_cfg{
        id=1,
        level=15,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=50,max=375},#warrior_attr_range{id=4,min=40,max=300},#warrior_attr_range{id=5,min=60,max=450},#warrior_attr_range{id=6,min=60,max=450},#warrior_attr_range{id=7,min=250,max=1875},#warrior_attr_range{id=62,min=20,max=75},#warrior_attr_range{id=63,min=20,max=75}]};

get(2) ->
    #warrior_attr_cfg{
        id=2,
        level=35,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=100,max=750},#warrior_attr_range{id=4,min=80,max=600},#warrior_attr_range{id=5,min=120,max=900},#warrior_attr_range{id=6,min=120,max=900},#warrior_attr_range{id=7,min=500,max=3750},#warrior_attr_range{id=62,min=30,max=150},#warrior_attr_range{id=63,min=30,max=150}]};

get(3) ->
    #warrior_attr_cfg{
        id=3,
        level=55,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=150,max=1125},#warrior_attr_range{id=4,min=120,max=900},#warrior_attr_range{id=5,min=180,max=1350},#warrior_attr_range{id=6,min=180,max=1350},#warrior_attr_range{id=7,min=750,max=5625},#warrior_attr_range{id=62,min=40,max=225},#warrior_attr_range{id=63,min=40,max=225}]};

get(4) ->
    #warrior_attr_cfg{
        id=4,
        level=75,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=250,max=1500},#warrior_attr_range{id=4,min=200,max=1200},#warrior_attr_range{id=5,min=300,max=1800},#warrior_attr_range{id=6,min=300,max=1800},#warrior_attr_range{id=7,min=1250,max=7500},#warrior_attr_range{id=62,min=50,max=300},#warrior_attr_range{id=63,min=50,max=300}]};

get(5) ->
    #warrior_attr_cfg{
        id=5,
        level=95,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=350,max=1875},#warrior_attr_range{id=4,min=280,max=1500},#warrior_attr_range{id=5,min=420,max=2250},#warrior_attr_range{id=6,min=420,max=2250},#warrior_attr_range{id=7,min=1750,max=9375},#warrior_attr_range{id=62,min=60,max=375},#warrior_attr_range{id=63,min=60,max=375}]};

get(6) ->
    #warrior_attr_cfg{
        id=6,
        level=95,
        blue=3,
        purple=4,
        consume_coin=20,
        consume_coin_when_lock=5,
        consume_soul=10,
        consume_soul_when_lock=5,
        consume_unlock2=10,
        consume_unlock3=30,
        consume_unlock4=50,
        attr_pool=[3, 4, 5, 6, 7, 62, 63],
        attr_range=[#warrior_attr_range{id=3,min=450,max=2250},#warrior_attr_range{id=4,min=360,max=1800},#warrior_attr_range{id=5,min=540,max=2700},#warrior_attr_range{id=6,min=540,max=2700},#warrior_attr_range{id=7,min=2250,max=11250},#warrior_attr_range{id=62,min=70,max=450},#warrior_attr_range{id=63,min=70,max=450}]};

get(_) -> false.


