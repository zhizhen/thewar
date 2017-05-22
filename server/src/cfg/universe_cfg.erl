-module(universe_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(0) ->
    #universe_cfg{
        id=0,
        next=1,
        star=1,
        level=0,
        universe=1,
        vigor=10,
        gold=100,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=20}],
        attack=0,
        skill_attack=0,
        defence=0,
        skill_defence=0,
        health=0};

get(1) ->
    #universe_cfg{
        id=1,
        next=2,
        star=1,
        level=1,
        universe=1,
        vigor=24,
        gold=251,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=15}],
        attack=20,
        skill_attack=0,
        defence=0,
        skill_defence=0,
        health=0};

get(2) ->
    #universe_cfg{
        id=2,
        next=3,
        star=1,
        level=2,
        universe=1,
        vigor=35,
        gold=353,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=30}],
        attack=20,
        skill_attack=10,
        defence=0,
        skill_defence=0,
        health=0};

get(3) ->
    #universe_cfg{
        id=3,
        next=4,
        star=1,
        level=3,
        universe=1,
        vigor=46,
        gold=454,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=30}],
        attack=20,
        skill_attack=10,
        defence=30,
        skill_defence=0,
        health=0};

get(4) ->
    #universe_cfg{
        id=4,
        next=5,
        star=1,
        level=4,
        universe=1,
        vigor=57,
        gold=556,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=200}],
        attack=20,
        skill_attack=10,
        defence=30,
        skill_defence=30,
        health=0};

get(5) ->
    #universe_cfg{
        id=5,
        next=6,
        star=1,
        level=5,
        universe=1,
        vigor=68,
        gold=657,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=20}],
        attack=20,
        skill_attack=10,
        defence=30,
        skill_defence=30,
        health=200};

get(6) ->
    #universe_cfg{
        id=6,
        next=7,
        star=1,
        level=6,
        universe=1,
        vigor=79,
        gold=759,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=15}],
        attack=40,
        skill_attack=10,
        defence=30,
        skill_defence=30,
        health=200};

get(7) ->
    #universe_cfg{
        id=7,
        next=8,
        star=1,
        level=7,
        universe=1,
        vigor=90,
        gold=860,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=30}],
        attack=40,
        skill_attack=25,
        defence=30,
        skill_defence=30,
        health=200};

get(8) ->
    #universe_cfg{
        id=8,
        next=9,
        star=1,
        level=8,
        universe=1,
        vigor=101,
        gold=962,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=30}],
        attack=40,
        skill_attack=25,
        defence=60,
        skill_defence=30,
        health=200};

get(9) ->
    #universe_cfg{
        id=9,
        next=10,
        star=2,
        level=1,
        universe=1,
        vigor=112,
        gold=1063,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=200}],
        attack=40,
        skill_attack=25,
        defence=60,
        skill_defence=60,
        health=200};

get(10) ->
    #universe_cfg{
        id=10,
        next=11,
        star=2,
        level=2,
        universe=1,
        vigor=133,
        gold=1264,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=22}],
        attack=40,
        skill_attack=25,
        defence=60,
        skill_defence=60,
        health=400};

get(11) ->
    #universe_cfg{
        id=11,
        next=12,
        star=2,
        level=3,
        universe=1,
        vigor=154,
        gold=1466,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=17}],
        attack=62,
        skill_attack=25,
        defence=60,
        skill_defence=60,
        health=400};

get(12) ->
    #universe_cfg{
        id=12,
        next=13,
        star=2,
        level=4,
        universe=1,
        vigor=175,
        gold=1667,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=33}],
        attack=62,
        skill_attack=42,
        defence=60,
        skill_defence=60,
        health=400};

get(13) ->
    #universe_cfg{
        id=13,
        next=14,
        star=2,
        level=5,
        universe=1,
        vigor=196,
        gold=1869,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=33}],
        attack=62,
        skill_attack=42,
        defence=93,
        skill_defence=60,
        health=400};

get(14) ->
    #universe_cfg{
        id=14,
        next=15,
        star=2,
        level=6,
        universe=1,
        vigor=218,
        gold=2070,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=220}],
        attack=62,
        skill_attack=42,
        defence=93,
        skill_defence=93,
        health=400};

get(15) ->
    #universe_cfg{
        id=15,
        next=16,
        star=2,
        level=7,
        universe=1,
        vigor=239,
        gold=2272,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=22}],
        attack=62,
        skill_attack=42,
        defence=93,
        skill_defence=93,
        health=620};

get(16) ->
    #universe_cfg{
        id=16,
        next=17,
        star=2,
        level=8,
        universe=1,
        vigor=260,
        gold=2473,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=17}],
        attack=84,
        skill_attack=42,
        defence=93,
        skill_defence=93,
        health=620};

get(17) ->
    #universe_cfg{
        id=17,
        next=18,
        star=3,
        level=1,
        universe=1,
        vigor=281,
        gold=2675,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=33}],
        attack=84,
        skill_attack=59,
        defence=93,
        skill_defence=93,
        health=620};

get(18) ->
    #universe_cfg{
        id=18,
        next=19,
        star=3,
        level=2,
        universe=1,
        vigor=302,
        gold=2876,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=33}],
        attack=84,
        skill_attack=59,
        defence=126,
        skill_defence=93,
        health=620};

get(19) ->
    #universe_cfg{
        id=19,
        next=20,
        star=3,
        level=3,
        universe=1,
        vigor=323,
        gold=3078,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=220}],
        attack=84,
        skill_attack=59,
        defence=126,
        skill_defence=126,
        health=620};

get(20) ->
    #universe_cfg{
        id=20,
        next=21,
        star=3,
        level=4,
        universe=1,
        vigor=354,
        gold=3379,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=24}],
        attack=84,
        skill_attack=59,
        defence=126,
        skill_defence=126,
        health=840};

get(21) ->
    #universe_cfg{
        id=21,
        next=22,
        star=3,
        level=5,
        universe=1,
        vigor=385,
        gold=3681,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=18}],
        attack=108,
        skill_attack=59,
        defence=126,
        skill_defence=126,
        health=840};

get(22) ->
    #universe_cfg{
        id=22,
        next=23,
        star=3,
        level=6,
        universe=1,
        vigor=416,
        gold=3982,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=36}],
        attack=108,
        skill_attack=77,
        defence=126,
        skill_defence=126,
        health=840};

get(23) ->
    #universe_cfg{
        id=23,
        next=24,
        star=3,
        level=7,
        universe=1,
        vigor=447,
        gold=4284,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=36}],
        attack=108,
        skill_attack=77,
        defence=162,
        skill_defence=126,
        health=840};

get(24) ->
    #universe_cfg{
        id=24,
        next=25,
        star=3,
        level=8,
        universe=1,
        vigor=478,
        gold=4585,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=240}],
        attack=108,
        skill_attack=77,
        defence=162,
        skill_defence=162,
        health=840};

get(25) ->
    #universe_cfg{
        id=25,
        next=26,
        star=4,
        level=1,
        universe=1,
        vigor=509,
        gold=4887,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=24}],
        attack=108,
        skill_attack=77,
        defence=162,
        skill_defence=162,
        health=1080};

get(26) ->
    #universe_cfg{
        id=26,
        next=27,
        star=4,
        level=2,
        universe=1,
        vigor=540,
        gold=5188,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=18}],
        attack=132,
        skill_attack=77,
        defence=162,
        skill_defence=162,
        health=1080};

get(27) ->
    #universe_cfg{
        id=27,
        next=28,
        star=4,
        level=3,
        universe=1,
        vigor=571,
        gold=5490,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=36}],
        attack=132,
        skill_attack=95,
        defence=162,
        skill_defence=162,
        health=1080};

get(28) ->
    #universe_cfg{
        id=28,
        next=29,
        star=4,
        level=4,
        universe=1,
        vigor=602,
        gold=5791,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=36}],
        attack=132,
        skill_attack=95,
        defence=198,
        skill_defence=162,
        health=1080};

get(29) ->
    #universe_cfg{
        id=29,
        next=30,
        star=4,
        level=5,
        universe=1,
        vigor=633,
        gold=6093,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=240}],
        attack=132,
        skill_attack=95,
        defence=198,
        skill_defence=198,
        health=1080};

get(30) ->
    #universe_cfg{
        id=30,
        next=31,
        star=4,
        level=6,
        universe=1,
        vigor=684,
        gold=6595,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=29}],
        attack=132,
        skill_attack=95,
        defence=198,
        skill_defence=198,
        health=1320};

get(31) ->
    #universe_cfg{
        id=31,
        next=32,
        star=4,
        level=7,
        universe=1,
        vigor=735,
        gold=7096,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=21}],
        attack=161,
        skill_attack=95,
        defence=198,
        skill_defence=198,
        health=1320};

get(32) ->
    #universe_cfg{
        id=32,
        next=33,
        star=4,
        level=8,
        universe=1,
        vigor=786,
        gold=7598,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=43}],
        attack=161,
        skill_attack=116,
        defence=198,
        skill_defence=198,
        health=1320};

get(33) ->
    #universe_cfg{
        id=33,
        next=34,
        star=5,
        level=1,
        universe=1,
        vigor=837,
        gold=8099,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=43}],
        attack=161,
        skill_attack=116,
        defence=241,
        skill_defence=198,
        health=1320};

get(34) ->
    #universe_cfg{
        id=34,
        next=35,
        star=5,
        level=2,
        universe=1,
        vigor=888,
        gold=8601,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=286}],
        attack=161,
        skill_attack=116,
        defence=241,
        skill_defence=241,
        health=1320};

get(35) ->
    #universe_cfg{
        id=35,
        next=36,
        star=5,
        level=3,
        universe=1,
        vigor=939,
        gold=9102,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=26}],
        attack=161,
        skill_attack=116,
        defence=241,
        skill_defence=241,
        health=1606};

get(36) ->
    #universe_cfg{
        id=36,
        next=37,
        star=5,
        level=4,
        universe=1,
        vigor=990,
        gold=9604,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=20}],
        attack=187,
        skill_attack=116,
        defence=241,
        skill_defence=241,
        health=1606};

get(37) ->
    #universe_cfg{
        id=37,
        next=38,
        star=5,
        level=5,
        universe=1,
        vigor=1041,
        gold=10105,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=39}],
        attack=187,
        skill_attack=136,
        defence=241,
        skill_defence=241,
        health=1606};

get(38) ->
    #universe_cfg{
        id=38,
        next=39,
        star=5,
        level=6,
        universe=1,
        vigor=1092,
        gold=10607,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=39}],
        attack=187,
        skill_attack=136,
        defence=280,
        skill_defence=241,
        health=1606};

get(39) ->
    #universe_cfg{
        id=39,
        next=40,
        star=5,
        level=7,
        universe=1,
        vigor=1143,
        gold=11109,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=260}],
        attack=187,
        skill_attack=136,
        defence=280,
        skill_defence=280,
        health=1606};

get(40) ->
    #universe_cfg{
        id=40,
        next=41,
        star=5,
        level=8,
        universe=1,
        vigor=1194,
        gold=11610,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=28}],
        attack=187,
        skill_attack=136,
        defence=280,
        skill_defence=280,
        health=1866};

get(41) ->
    #universe_cfg{
        id=41,
        next=42,
        star=6,
        level=1,
        universe=1,
        vigor=1245,
        gold=12112,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=21}],
        attack=215,
        skill_attack=136,
        defence=280,
        skill_defence=280,
        health=1866};

get(42) ->
    #universe_cfg{
        id=42,
        next=43,
        star=6,
        level=2,
        universe=1,
        vigor=1346,
        gold=13113,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=42}],
        attack=215,
        skill_attack=157,
        defence=280,
        skill_defence=280,
        health=1866};

get(43) ->
    #universe_cfg{
        id=43,
        next=44,
        star=6,
        level=3,
        universe=1,
        vigor=1447,
        gold=14115,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=42}],
        attack=215,
        skill_attack=157,
        defence=322,
        skill_defence=280,
        health=1866};

get(44) ->
    #universe_cfg{
        id=44,
        next=45,
        star=6,
        level=4,
        universe=1,
        vigor=1548,
        gold=15117,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=280}],
        attack=215,
        skill_attack=157,
        defence=322,
        skill_defence=322,
        health=1866};

get(45) ->
    #universe_cfg{
        id=45,
        next=46,
        star=6,
        level=5,
        universe=1,
        vigor=1649,
        gold=16118,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=31}],
        attack=215,
        skill_attack=157,
        defence=322,
        skill_defence=322,
        health=2146};

get(46) ->
    #universe_cfg{
        id=46,
        next=47,
        star=6,
        level=6,
        universe=1,
        vigor=1750,
        gold=17120,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=23}],
        attack=246,
        skill_attack=157,
        defence=322,
        skill_defence=322,
        health=2146};

get(47) ->
    #universe_cfg{
        id=47,
        next=48,
        star=6,
        level=7,
        universe=1,
        vigor=1851,
        gold=18122,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=46}],
        attack=246,
        skill_attack=180,
        defence=322,
        skill_defence=322,
        health=2146};

get(48) ->
    #universe_cfg{
        id=48,
        next=49,
        star=6,
        level=8,
        universe=1,
        vigor=1952,
        gold=19123,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=46}],
        attack=246,
        skill_attack=180,
        defence=368,
        skill_defence=322,
        health=2146};

get(49) ->
    #universe_cfg{
        id=49,
        next=50,
        star=7,
        level=1,
        universe=1,
        vigor=2054,
        gold=20125,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=308}],
        attack=246,
        skill_attack=180,
        defence=368,
        skill_defence=368,
        health=2146};

get(50) ->
    #universe_cfg{
        id=50,
        next=51,
        star=7,
        level=2,
        universe=1,
        vigor=2155,
        gold=21126,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=30}],
        attack=246,
        skill_attack=180,
        defence=368,
        skill_defence=368,
        health=2454};

get(51) ->
    #universe_cfg{
        id=51,
        next=52,
        star=7,
        level=3,
        universe=1,
        vigor=2256,
        gold=22128,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=23}],
        attack=276,
        skill_attack=180,
        defence=368,
        skill_defence=368,
        health=2454};

get(52) ->
    #universe_cfg{
        id=52,
        next=53,
        star=7,
        level=4,
        universe=1,
        vigor=2357,
        gold=23130,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=45}],
        attack=276,
        skill_attack=203,
        defence=368,
        skill_defence=368,
        health=2454};

get(53) ->
    #universe_cfg{
        id=53,
        next=54,
        star=7,
        level=5,
        universe=1,
        vigor=2458,
        gold=24131,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=45}],
        attack=276,
        skill_attack=203,
        defence=413,
        skill_defence=368,
        health=2454};

get(54) ->
    #universe_cfg{
        id=54,
        next=55,
        star=7,
        level=6,
        universe=1,
        vigor=2559,
        gold=25133,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=300}],
        attack=276,
        skill_attack=203,
        defence=413,
        skill_defence=413,
        health=2454};

get(55) ->
    #universe_cfg{
        id=55,
        next=56,
        star=7,
        level=7,
        universe=1,
        vigor=2660,
        gold=26135,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=30}],
        attack=276,
        skill_attack=203,
        defence=413,
        skill_defence=413,
        health=2754};

get(56) ->
    #universe_cfg{
        id=56,
        next=57,
        star=7,
        level=8,
        universe=1,
        vigor=2761,
        gold=27136,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=23}],
        attack=306,
        skill_attack=203,
        defence=413,
        skill_defence=413,
        health=2754};

get(57) ->
    #universe_cfg{
        id=57,
        next=58,
        star=1,
        level=1,
        universe=2,
        vigor=2862,
        gold=28138,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=45}],
        attack=306,
        skill_attack=226,
        defence=413,
        skill_defence=413,
        health=2754};

get(58) ->
    #universe_cfg{
        id=58,
        next=59,
        star=1,
        level=2,
        universe=2,
        vigor=2963,
        gold=29140,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=45}],
        attack=306,
        skill_attack=226,
        defence=458,
        skill_defence=413,
        health=2754};

get(59) ->
    #universe_cfg{
        id=59,
        next=60,
        star=1,
        level=3,
        universe=2,
        vigor=3064,
        gold=30142,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=300}],
        attack=306,
        skill_attack=226,
        defence=458,
        skill_defence=458,
        health=2754};

get(60) ->
    #universe_cfg{
        id=60,
        next=61,
        star=1,
        level=4,
        universe=2,
        vigor=3165,
        gold=31143,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=35}],
        attack=306,
        skill_attack=226,
        defence=458,
        skill_defence=458,
        health=3054};

get(61) ->
    #universe_cfg{
        id=61,
        next=62,
        star=1,
        level=5,
        universe=2,
        vigor=3266,
        gold=32145,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=26}],
        attack=341,
        skill_attack=226,
        defence=458,
        skill_defence=458,
        health=3054};

get(62) ->
    #universe_cfg{
        id=62,
        next=63,
        star=1,
        level=6,
        universe=2,
        vigor=3367,
        gold=33147,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=53}],
        attack=341,
        skill_attack=252,
        defence=458,
        skill_defence=458,
        health=3054};

get(63) ->
    #universe_cfg{
        id=63,
        next=64,
        star=1,
        level=7,
        universe=2,
        vigor=3468,
        gold=34148,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=53}],
        attack=341,
        skill_attack=252,
        defence=511,
        skill_defence=458,
        health=3054};

get(64) ->
    #universe_cfg{
        id=64,
        next=65,
        star=1,
        level=8,
        universe=2,
        vigor=3569,
        gold=35150,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=352}],
        attack=341,
        skill_attack=252,
        defence=511,
        skill_defence=511,
        health=3054};

get(65) ->
    #universe_cfg{
        id=65,
        next=66,
        star=2,
        level=1,
        universe=2,
        vigor=3670,
        gold=36152,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=32}],
        attack=341,
        skill_attack=252,
        defence=511,
        skill_defence=511,
        health=3406};

get(66) ->
    #universe_cfg{
        id=66,
        next=67,
        star=2,
        level=2,
        universe=2,
        vigor=3771,
        gold=37154,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=24}],
        attack=373,
        skill_attack=252,
        defence=511,
        skill_defence=511,
        health=3406};

get(67) ->
    #universe_cfg{
        id=67,
        next=68,
        star=2,
        level=3,
        universe=2,
        vigor=3872,
        gold=38155,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=48}],
        attack=373,
        skill_attack=276,
        defence=511,
        skill_defence=511,
        health=3406};

get(68) ->
    #universe_cfg{
        id=68,
        next=69,
        star=2,
        level=4,
        universe=2,
        vigor=3973,
        gold=39157,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=48}],
        attack=373,
        skill_attack=276,
        defence=559,
        skill_defence=511,
        health=3406};

get(69) ->
    #universe_cfg{
        id=69,
        next=70,
        star=2,
        level=5,
        universe=2,
        vigor=4074,
        gold=40159,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=320}],
        attack=373,
        skill_attack=276,
        defence=559,
        skill_defence=559,
        health=3406};

get(70) ->
    #universe_cfg{
        id=70,
        next=71,
        star=2,
        level=6,
        universe=2,
        vigor=4175,
        gold=41161,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=34}],
        attack=373,
        skill_attack=276,
        defence=559,
        skill_defence=559,
        health=3726};

get(71) ->
    #universe_cfg{
        id=71,
        next=72,
        star=2,
        level=7,
        universe=2,
        vigor=4276,
        gold=42162,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=26}],
        attack=407,
        skill_attack=276,
        defence=559,
        skill_defence=559,
        health=3726};

get(72) ->
    #universe_cfg{
        id=72,
        next=73,
        star=2,
        level=8,
        universe=2,
        vigor=4377,
        gold=43164,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=51}],
        attack=407,
        skill_attack=302,
        defence=559,
        skill_defence=559,
        health=3726};

get(73) ->
    #universe_cfg{
        id=73,
        next=74,
        star=3,
        level=1,
        universe=2,
        vigor=4478,
        gold=44166,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=51}],
        attack=407,
        skill_attack=302,
        defence=610,
        skill_defence=559,
        health=3726};

get(74) ->
    #universe_cfg{
        id=74,
        next=75,
        star=3,
        level=2,
        universe=2,
        vigor=4579,
        gold=45168,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=340}],
        attack=407,
        skill_attack=302,
        defence=610,
        skill_defence=610,
        health=3726};

get(75) ->
    #universe_cfg{
        id=75,
        next=76,
        star=3,
        level=3,
        universe=2,
        vigor=4680,
        gold=46170,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=37}],
        attack=407,
        skill_attack=302,
        defence=610,
        skill_defence=610,
        health=4066};

get(76) ->
    #universe_cfg{
        id=76,
        next=77,
        star=3,
        level=4,
        universe=2,
        vigor=4782,
        gold=47171,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=28}],
        attack=444,
        skill_attack=302,
        defence=610,
        skill_defence=610,
        health=4066};

get(77) ->
    #universe_cfg{
        id=77,
        next=78,
        star=3,
        level=5,
        universe=2,
        vigor=4883,
        gold=48173,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=56}],
        attack=444,
        skill_attack=330,
        defence=610,
        skill_defence=610,
        health=4066};

get(78) ->
    #universe_cfg{
        id=78,
        next=79,
        star=3,
        level=6,
        universe=2,
        vigor=4984,
        gold=49175,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=56}],
        attack=444,
        skill_attack=330,
        defence=666,
        skill_defence=610,
        health=4066};

get(79) ->
    #universe_cfg{
        id=79,
        next=80,
        star=3,
        level=7,
        universe=2,
        vigor=5085,
        gold=50177,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=374}],
        attack=444,
        skill_attack=330,
        defence=666,
        skill_defence=666,
        health=4066};

get(80) ->
    #universe_cfg{
        id=80,
        next=81,
        star=3,
        level=8,
        universe=2,
        vigor=5186,
        gold=51179,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=36}],
        attack=444,
        skill_attack=330,
        defence=666,
        skill_defence=666,
        health=4440};

get(81) ->
    #universe_cfg{
        id=81,
        next=82,
        star=4,
        level=1,
        universe=2,
        vigor=5287,
        gold=52181,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=27}],
        attack=480,
        skill_attack=330,
        defence=666,
        skill_defence=666,
        health=4440};

get(82) ->
    #universe_cfg{
        id=82,
        next=83,
        star=4,
        level=2,
        universe=2,
        vigor=5388,
        gold=53182,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=54}],
        attack=480,
        skill_attack=357,
        defence=666,
        skill_defence=666,
        health=4440};

get(83) ->
    #universe_cfg{
        id=83,
        next=84,
        star=4,
        level=3,
        universe=2,
        vigor=5489,
        gold=54184,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=54}],
        attack=480,
        skill_attack=357,
        defence=720,
        skill_defence=666,
        health=4440};

get(84) ->
    #universe_cfg{
        id=84,
        next=85,
        star=4,
        level=4,
        universe=2,
        vigor=5590,
        gold=55186,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=360}],
        attack=480,
        skill_attack=357,
        defence=720,
        skill_defence=720,
        health=4440};

get(85) ->
    #universe_cfg{
        id=85,
        next=86,
        star=4,
        level=5,
        universe=2,
        vigor=5691,
        gold=56188,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=36}],
        attack=480,
        skill_attack=357,
        defence=720,
        skill_defence=720,
        health=4800};

get(86) ->
    #universe_cfg{
        id=86,
        next=87,
        star=4,
        level=6,
        universe=2,
        vigor=5792,
        gold=57190,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=27}],
        attack=516,
        skill_attack=357,
        defence=720,
        skill_defence=720,
        health=4800};

get(87) ->
    #universe_cfg{
        id=87,
        next=88,
        star=4,
        level=7,
        universe=2,
        vigor=5893,
        gold=58192,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=54}],
        attack=516,
        skill_attack=384,
        defence=720,
        skill_defence=720,
        health=4800};

get(88) ->
    #universe_cfg{
        id=88,
        next=89,
        star=4,
        level=8,
        universe=2,
        vigor=5994,
        gold=59194,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=54}],
        attack=516,
        skill_attack=384,
        defence=774,
        skill_defence=720,
        health=4800};

get(89) ->
    #universe_cfg{
        id=89,
        next=90,
        star=5,
        level=1,
        universe=2,
        vigor=6095,
        gold=60196,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=360}],
        attack=516,
        skill_attack=384,
        defence=774,
        skill_defence=774,
        health=4800};

get(90) ->
    #universe_cfg{
        id=90,
        next=91,
        star=5,
        level=2,
        universe=2,
        vigor=6196,
        gold=61198,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=42}],
        attack=516,
        skill_attack=384,
        defence=774,
        skill_defence=774,
        health=5160};

get(91) ->
    #universe_cfg{
        id=91,
        next=92,
        star=5,
        level=3,
        universe=2,
        vigor=6297,
        gold=62199,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=31}],
        attack=558,
        skill_attack=384,
        defence=774,
        skill_defence=774,
        health=5160};

get(92) ->
    #universe_cfg{
        id=92,
        next=93,
        star=5,
        level=4,
        universe=2,
        vigor=6398,
        gold=63201,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=63}],
        attack=558,
        skill_attack=415,
        defence=774,
        skill_defence=774,
        health=5160};

get(93) ->
    #universe_cfg{
        id=93,
        next=94,
        star=5,
        level=5,
        universe=2,
        vigor=6499,
        gold=64203,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=63}],
        attack=558,
        skill_attack=415,
        defence=837,
        skill_defence=774,
        health=5160};

get(94) ->
    #universe_cfg{
        id=94,
        next=95,
        star=5,
        level=6,
        universe=2,
        vigor=6600,
        gold=65205,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=418}],
        attack=558,
        skill_attack=415,
        defence=837,
        skill_defence=837,
        health=5160};

get(95) ->
    #universe_cfg{
        id=95,
        next=96,
        star=5,
        level=7,
        universe=2,
        vigor=6701,
        gold=66207,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=42}],
        attack=558,
        skill_attack=415,
        defence=837,
        skill_defence=837,
        health=5578};

get(96) ->
    #universe_cfg{
        id=96,
        next=97,
        star=5,
        level=8,
        universe=2,
        vigor=6802,
        gold=67209,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=31}],
        attack=600,
        skill_attack=415,
        defence=837,
        skill_defence=837,
        health=5578};

get(97) ->
    #universe_cfg{
        id=97,
        next=98,
        star=6,
        level=1,
        universe=2,
        vigor=6904,
        gold=68211,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=63}],
        attack=600,
        skill_attack=446,
        defence=837,
        skill_defence=837,
        health=5578};

get(98) ->
    #universe_cfg{
        id=98,
        next=99,
        star=6,
        level=2,
        universe=2,
        vigor=7005,
        gold=69213,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=63}],
        attack=600,
        skill_attack=446,
        defence=900,
        skill_defence=837,
        health=5578};

get(99) ->
    #universe_cfg{
        id=99,
        next=100,
        star=6,
        level=3,
        universe=2,
        vigor=7106,
        gold=70215,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=418}],
        attack=600,
        skill_attack=446,
        defence=900,
        skill_defence=900,
        health=5578};

get(100) ->
    #universe_cfg{
        id=100,
        next=101,
        star=6,
        level=4,
        universe=2,
        vigor=7207,
        gold=71217,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=48}],
        attack=600,
        skill_attack=446,
        defence=900,
        skill_defence=900,
        health=5996};

get(101) ->
    #universe_cfg{
        id=101,
        next=102,
        star=6,
        level=5,
        universe=2,
        vigor=7308,
        gold=72219,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=36}],
        attack=648,
        skill_attack=446,
        defence=900,
        skill_defence=900,
        health=5996};

get(102) ->
    #universe_cfg{
        id=102,
        next=103,
        star=6,
        level=6,
        universe=2,
        vigor=7409,
        gold=73221,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=72}],
        attack=648,
        skill_attack=482,
        defence=900,
        skill_defence=900,
        health=5996};

get(103) ->
    #universe_cfg{
        id=103,
        next=104,
        star=6,
        level=7,
        universe=2,
        vigor=7510,
        gold=74223,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=72}],
        attack=648,
        skill_attack=482,
        defence=972,
        skill_defence=900,
        health=5996};

get(104) ->
    #universe_cfg{
        id=104,
        next=105,
        star=6,
        level=8,
        universe=2,
        vigor=7611,
        gold=75225,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=480}],
        attack=648,
        skill_attack=482,
        defence=972,
        skill_defence=972,
        health=5996};

get(105) ->
    #universe_cfg{
        id=105,
        next=106,
        star=7,
        level=1,
        universe=2,
        vigor=7712,
        gold=76227,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=48}],
        attack=648,
        skill_attack=482,
        defence=972,
        skill_defence=972,
        health=6476};

get(106) ->
    #universe_cfg{
        id=106,
        next=107,
        star=7,
        level=2,
        universe=2,
        vigor=7813,
        gold=77229,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=36}],
        attack=696,
        skill_attack=482,
        defence=972,
        skill_defence=972,
        health=6476};

get(107) ->
    #universe_cfg{
        id=107,
        next=108,
        star=7,
        level=3,
        universe=2,
        vigor=7914,
        gold=78231,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=72}],
        attack=696,
        skill_attack=518,
        defence=972,
        skill_defence=972,
        health=6476};

get(108) ->
    #universe_cfg{
        id=108,
        next=109,
        star=7,
        level=4,
        universe=2,
        vigor=8015,
        gold=79233,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=72}],
        attack=696,
        skill_attack=518,
        defence=1044,
        skill_defence=972,
        health=6476};

get(109) ->
    #universe_cfg{
        id=109,
        next=110,
        star=7,
        level=5,
        universe=2,
        vigor=8116,
        gold=80235,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=480}],
        attack=696,
        skill_attack=518,
        defence=1044,
        skill_defence=1044,
        health=6476};

get(110) ->
    #universe_cfg{
        id=110,
        next=111,
        star=7,
        level=6,
        universe=2,
        vigor=8217,
        gold=81238,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=60}],
        attack=696,
        skill_attack=518,
        defence=1044,
        skill_defence=1044,
        health=6956};

get(111) ->
    #universe_cfg{
        id=111,
        next=112,
        star=7,
        level=7,
        universe=2,
        vigor=8318,
        gold=82240,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=45}],
        attack=756,
        skill_attack=518,
        defence=1044,
        skill_defence=1044,
        health=6956};

get(112) ->
    #universe_cfg{
        id=112,
        next=113,
        star=7,
        level=8,
        universe=2,
        vigor=8419,
        gold=83242,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=90}],
        attack=756,
        skill_attack=563,
        defence=1044,
        skill_defence=1044,
        health=6956};

get(113) ->
    #universe_cfg{
        id=113,
        next=114,
        star=1,
        level=1,
        universe=3,
        vigor=8520,
        gold=84244,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=90}],
        attack=756,
        skill_attack=563,
        defence=1134,
        skill_defence=1044,
        health=6956};

get(114) ->
    #universe_cfg{
        id=114,
        next=115,
        star=1,
        level=2,
        universe=3,
        vigor=8622,
        gold=85246,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=601}],
        attack=756,
        skill_attack=563,
        defence=1134,
        skill_defence=1134,
        health=6956};

get(115) ->
    #universe_cfg{
        id=115,
        next=116,
        star=1,
        level=3,
        universe=3,
        vigor=8723,
        gold=86248,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=55}],
        attack=756,
        skill_attack=563,
        defence=1134,
        skill_defence=1134,
        health=7557};

get(116) ->
    #universe_cfg{
        id=116,
        next=117,
        star=1,
        level=4,
        universe=3,
        vigor=8824,
        gold=87250,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=41}],
        attack=811,
        skill_attack=563,
        defence=1134,
        skill_defence=1134,
        health=7557};

get(117) ->
    #universe_cfg{
        id=117,
        next=118,
        star=1,
        level=5,
        universe=3,
        vigor=8925,
        gold=88252,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=82}],
        attack=811,
        skill_attack=604,
        defence=1134,
        skill_defence=1134,
        health=7557};

get(118) ->
    #universe_cfg{
        id=118,
        next=119,
        star=1,
        level=6,
        universe=3,
        vigor=9026,
        gold=89255,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=82}],
        attack=811,
        skill_attack=604,
        defence=1216,
        skill_defence=1134,
        health=7557};

get(119) ->
    #universe_cfg{
        id=119,
        next=120,
        star=1,
        level=7,
        universe=3,
        vigor=9127,
        gold=90257,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=546}],
        attack=811,
        skill_attack=604,
        defence=1216,
        skill_defence=1216,
        health=7557};

get(120) ->
    #universe_cfg{
        id=120,
        next=121,
        star=1,
        level=8,
        universe=3,
        vigor=9228,
        gold=91259,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=62}],
        attack=811,
        skill_attack=604,
        defence=1216,
        skill_defence=1216,
        health=8103};

get(121) ->
    #universe_cfg{
        id=121,
        next=122,
        star=2,
        level=1,
        universe=3,
        vigor=9329,
        gold=92261,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=46}],
        attack=873,
        skill_attack=604,
        defence=1216,
        skill_defence=1216,
        health=8103};

get(122) ->
    #universe_cfg{
        id=122,
        next=123,
        star=2,
        level=2,
        universe=3,
        vigor=9430,
        gold=93263,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=92}],
        attack=873,
        skill_attack=650,
        defence=1216,
        skill_defence=1216,
        health=8103};

get(123) ->
    #universe_cfg{
        id=123,
        next=124,
        star=2,
        level=3,
        universe=3,
        vigor=9531,
        gold=94266,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=92}],
        attack=873,
        skill_attack=650,
        defence=1308,
        skill_defence=1216,
        health=8103};

get(124) ->
    #universe_cfg{
        id=124,
        next=125,
        star=2,
        level=4,
        universe=3,
        vigor=9632,
        gold=95268,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=616}],
        attack=873,
        skill_attack=650,
        defence=1308,
        skill_defence=1308,
        health=8103};

get(125) ->
    #universe_cfg{
        id=125,
        next=126,
        star=2,
        level=5,
        universe=3,
        vigor=9733,
        gold=96270,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=68}],
        attack=873,
        skill_attack=650,
        defence=1308,
        skill_defence=1308,
        health=8719};

get(126) ->
    #universe_cfg{
        id=126,
        next=127,
        star=2,
        level=6,
        universe=3,
        vigor=9834,
        gold=97272,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=51}],
        attack=941,
        skill_attack=650,
        defence=1308,
        skill_defence=1308,
        health=8719};

get(127) ->
    #universe_cfg{
        id=127,
        next=128,
        star=2,
        level=7,
        universe=3,
        vigor=9935,
        gold=98275,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=102}],
        attack=941,
        skill_attack=701,
        defence=1308,
        skill_defence=1308,
        health=8719};

get(128) ->
    #universe_cfg{
        id=128,
        next=129,
        star=2,
        level=8,
        universe=3,
        vigor=10036,
        gold=99277,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=102}],
        attack=941,
        skill_attack=701,
        defence=1410,
        skill_defence=1308,
        health=8719};

get(129) ->
    #universe_cfg{
        id=129,
        next=130,
        star=3,
        level=1,
        universe=3,
        vigor=10138,
        gold=100279,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=678}],
        attack=941,
        skill_attack=701,
        defence=1410,
        skill_defence=1410,
        health=8719};

get(130) ->
    #universe_cfg{
        id=130,
        next=131,
        star=3,
        level=2,
        universe=3,
        vigor=10239,
        gold=101281,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=69}],
        attack=941,
        skill_attack=701,
        defence=1410,
        skill_defence=1410,
        health=9397};

get(131) ->
    #universe_cfg{
        id=131,
        next=132,
        star=3,
        level=3,
        universe=3,
        vigor=10340,
        gold=102284,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=52}],
        attack=1010,
        skill_attack=701,
        defence=1410,
        skill_defence=1410,
        health=9397};

get(132) ->
    #universe_cfg{
        id=132,
        next=133,
        star=3,
        level=4,
        universe=3,
        vigor=10441,
        gold=103286,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=104}],
        attack=1010,
        skill_attack=753,
        defence=1410,
        skill_defence=1410,
        health=9397};

get(133) ->
    #universe_cfg{
        id=133,
        next=134,
        star=3,
        level=5,
        universe=3,
        vigor=10542,
        gold=104288,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=104}],
        attack=1010,
        skill_attack=753,
        defence=1514,
        skill_defence=1410,
        health=9397};

get(134) ->
    #universe_cfg{
        id=134,
        next=135,
        star=3,
        level=6,
        universe=3,
        vigor=10643,
        gold=105291,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=690}],
        attack=1010,
        skill_attack=753,
        defence=1514,
        skill_defence=1514,
        health=9397};

get(135) ->
    #universe_cfg{
        id=135,
        next=136,
        star=3,
        level=7,
        universe=3,
        vigor=10744,
        gold=106293,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=69}],
        attack=1010,
        skill_attack=753,
        defence=1514,
        skill_defence=1514,
        health=10087};

get(136) ->
    #universe_cfg{
        id=136,
        next=137,
        star=3,
        level=8,
        universe=3,
        vigor=10845,
        gold=107295,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=52}],
        attack=1079,
        skill_attack=753,
        defence=1514,
        skill_defence=1514,
        health=10087};

get(137) ->
    #universe_cfg{
        id=137,
        next=138,
        star=4,
        level=1,
        universe=3,
        vigor=10946,
        gold=108298,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=104}],
        attack=1079,
        skill_attack=805,
        defence=1514,
        skill_defence=1514,
        health=10087};

get(138) ->
    #universe_cfg{
        id=138,
        next=139,
        star=4,
        level=2,
        universe=3,
        vigor=11047,
        gold=109300,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=104}],
        attack=1079,
        skill_attack=805,
        defence=1618,
        skill_defence=1514,
        health=10087};

get(139) ->
    #universe_cfg{
        id=139,
        next=140,
        star=4,
        level=3,
        universe=3,
        vigor=11148,
        gold=110303,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=690}],
        attack=1079,
        skill_attack=805,
        defence=1618,
        skill_defence=1618,
        health=10087};

get(140) ->
    #universe_cfg{
        id=140,
        next=141,
        star=4,
        level=4,
        universe=3,
        vigor=11249,
        gold=111305,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=84}],
        attack=1079,
        skill_attack=805,
        defence=1618,
        skill_defence=1618,
        health=10777};

get(141) ->
    #universe_cfg{
        id=141,
        next=142,
        star=4,
        level=5,
        universe=3,
        vigor=11350,
        gold=112307,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=63}],
        attack=1163,
        skill_attack=805,
        defence=1618,
        skill_defence=1618,
        health=10777};

get(142) ->
    #universe_cfg{
        id=142,
        next=143,
        star=4,
        level=6,
        universe=3,
        vigor=11452,
        gold=113310,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=127}],
        attack=1163,
        skill_attack=868,
        defence=1618,
        skill_defence=1618,
        health=10777};

get(143) ->
    #universe_cfg{
        id=143,
        next=144,
        star=4,
        level=7,
        universe=3,
        vigor=11553,
        gold=114312,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=127}],
        attack=1163,
        skill_attack=868,
        defence=1745,
        skill_defence=1618,
        health=10777};

get(144) ->
    #universe_cfg{
        id=144,
        next=145,
        star=4,
        level=8,
        universe=3,
        vigor=11654,
        gold=115315,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=845}],
        attack=1163,
        skill_attack=868,
        defence=1745,
        skill_defence=1745,
        health=10777};

get(145) ->
    #universe_cfg{
        id=145,
        next=146,
        star=5,
        level=1,
        universe=3,
        vigor=11755,
        gold=116317,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=77}],
        attack=1163,
        skill_attack=868,
        defence=1745,
        skill_defence=1745,
        health=11622};

get(146) ->
    #universe_cfg{
        id=146,
        next=147,
        star=5,
        level=2,
        universe=3,
        vigor=11856,
        gold=117320,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=58}],
        attack=1240,
        skill_attack=868,
        defence=1745,
        skill_defence=1745,
        health=11622};

get(147) ->
    #universe_cfg{
        id=147,
        next=148,
        star=5,
        level=3,
        universe=3,
        vigor=11957,
        gold=118322,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=115}],
        attack=1240,
        skill_attack=926,
        defence=1745,
        skill_defence=1745,
        health=11622};

get(148) ->
    #universe_cfg{
        id=148,
        next=149,
        star=5,
        level=4,
        universe=3,
        vigor=12058,
        gold=119325,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=115}],
        attack=1240,
        skill_attack=926,
        defence=1860,
        skill_defence=1745,
        health=11622};

get(149) ->
    #universe_cfg{
        id=149,
        next=150,
        star=5,
        level=5,
        universe=3,
        vigor=12159,
        gold=120327,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=768}],
        attack=1240,
        skill_attack=926,
        defence=1860,
        skill_defence=1860,
        health=11622};

get(150) ->
    #universe_cfg{
        id=150,
        next=151,
        star=5,
        level=6,
        universe=3,
        vigor=12260,
        gold=121330,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=85}],
        attack=1240,
        skill_attack=926,
        defence=1860,
        skill_defence=1860,
        health=12390};

get(151) ->
    #universe_cfg{
        id=151,
        next=152,
        star=5,
        level=7,
        universe=3,
        vigor=12361,
        gold=122332,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=64}],
        attack=1325,
        skill_attack=926,
        defence=1860,
        skill_defence=1860,
        health=12390};

get(152) ->
    #universe_cfg{
        id=152,
        next=153,
        star=5,
        level=8,
        universe=3,
        vigor=12462,
        gold=123335,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=128}],
        attack=1325,
        skill_attack=990,
        defence=1860,
        skill_defence=1860,
        health=12390};

get(153) ->
    #universe_cfg{
        id=153,
        next=154,
        star=6,
        level=1,
        universe=3,
        vigor=12563,
        gold=124337,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=128}],
        attack=1325,
        skill_attack=990,
        defence=1988,
        skill_defence=1860,
        health=12390};

get(154) ->
    #universe_cfg{
        id=154,
        next=155,
        star=6,
        level=2,
        universe=3,
        vigor=12665,
        gold=125340,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=850}],
        attack=1325,
        skill_attack=990,
        defence=1988,
        skill_defence=1988,
        health=12390};

get(155) ->
    #universe_cfg{
        id=155,
        next=156,
        star=6,
        level=3,
        universe=3,
        vigor=12766,
        gold=126343,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=94}],
        attack=1325,
        skill_attack=990,
        defence=1988,
        skill_defence=1988,
        health=13240};

get(156) ->
    #universe_cfg{
        id=156,
        next=157,
        star=6,
        level=4,
        universe=3,
        vigor=12867,
        gold=127345,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=70}],
        attack=1419,
        skill_attack=990,
        defence=1988,
        skill_defence=1988,
        health=13240};

get(157) ->
    #universe_cfg{
        id=157,
        next=158,
        star=6,
        level=5,
        universe=3,
        vigor=12968,
        gold=128348,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=140}],
        attack=1419,
        skill_attack=1060,
        defence=1988,
        skill_defence=1988,
        health=13240};

get(158) ->
    #universe_cfg{
        id=158,
        next=159,
        star=6,
        level=6,
        universe=3,
        vigor=13069,
        gold=129350,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=140}],
        attack=1419,
        skill_attack=1060,
        defence=2128,
        skill_defence=1988,
        health=13240};

get(159) ->
    #universe_cfg{
        id=159,
        next=160,
        star=6,
        level=7,
        universe=3,
        vigor=13170,
        gold=130353,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=935}],
        attack=1419,
        skill_attack=1060,
        defence=2128,
        skill_defence=2128,
        health=13240};

get(160) ->
    #universe_cfg{
        id=160,
        next=161,
        star=6,
        level=8,
        universe=3,
        vigor=13271,
        gold=131356,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=94}],
        attack=1419,
        skill_attack=1060,
        defence=2128,
        skill_defence=2128,
        health=14175};

get(161) ->
    #universe_cfg{
        id=161,
        next=162,
        star=7,
        level=1,
        universe=3,
        vigor=13372,
        gold=132358,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=70}],
        attack=1513,
        skill_attack=1060,
        defence=2128,
        skill_defence=2128,
        health=14175};

get(162) ->
    #universe_cfg{
        id=162,
        next=163,
        star=7,
        level=2,
        universe=3,
        vigor=13473,
        gold=133361,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=140}],
        attack=1513,
        skill_attack=1130,
        defence=2128,
        skill_defence=2128,
        health=14175};

get(163) ->
    #universe_cfg{
        id=163,
        next=164,
        star=7,
        level=3,
        universe=3,
        vigor=13574,
        gold=134364,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=140}],
        attack=1513,
        skill_attack=1130,
        defence=2268,
        skill_defence=2128,
        health=14175};

get(164) ->
    #universe_cfg{
        id=164,
        next=165,
        star=7,
        level=4,
        universe=3,
        vigor=13676,
        gold=135367,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=936}],
        attack=1513,
        skill_attack=1130,
        defence=2268,
        skill_defence=2268,
        health=14175};

get(165) ->
    #universe_cfg{
        id=165,
        next=166,
        star=7,
        level=5,
        universe=3,
        vigor=13777,
        gold=136369,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=94}],
        attack=1513,
        skill_attack=1130,
        defence=2268,
        skill_defence=2268,
        health=15111};

get(166) ->
    #universe_cfg{
        id=166,
        next=167,
        star=7,
        level=6,
        universe=3,
        vigor=13878,
        gold=137372,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=70}],
        attack=1607,
        skill_attack=1130,
        defence=2268,
        skill_defence=2268,
        health=15111};

get(167) ->
    #universe_cfg{
        id=167,
        next=168,
        star=7,
        level=7,
        universe=3,
        vigor=13979,
        gold=138375,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=140}],
        attack=1607,
        skill_attack=1200,
        defence=2268,
        skill_defence=2268,
        health=15111};

get(168) ->
    #universe_cfg{
        id=168,
        next=169,
        star=7,
        level=8,
        universe=3,
        vigor=14080,
        gold=139378,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=140}],
        attack=1607,
        skill_attack=1200,
        defence=2408,
        skill_defence=2268,
        health=15111};

get(169) ->
    #universe_cfg{
        id=169,
        next=170,
        star=1,
        level=1,
        universe=4,
        vigor=14181,
        gold=140380,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=936}],
        attack=1607,
        skill_attack=1200,
        defence=2408,
        skill_defence=2408,
        health=15111};

get(170) ->
    #universe_cfg{
        id=170,
        next=171,
        star=1,
        level=2,
        universe=4,
        vigor=14282,
        gold=141383,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=113}],
        attack=1607,
        skill_attack=1200,
        defence=2408,
        skill_defence=2408,
        health=16047};

get(171) ->
    #universe_cfg{
        id=171,
        next=172,
        star=1,
        level=3,
        universe=4,
        vigor=14383,
        gold=142386,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=85}],
        attack=1720,
        skill_attack=1200,
        defence=2408,
        skill_defence=2408,
        health=16047};

get(172) ->
    #universe_cfg{
        id=172,
        next=173,
        star=1,
        level=4,
        universe=4,
        vigor=14484,
        gold=143389,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=169}],
        attack=1720,
        skill_attack=1285,
        defence=2408,
        skill_defence=2408,
        health=16047};

get(173) ->
    #universe_cfg{
        id=173,
        next=174,
        star=1,
        level=5,
        universe=4,
        vigor=14585,
        gold=144392,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=169}],
        attack=1720,
        skill_attack=1285,
        defence=2577,
        skill_defence=2408,
        health=16047};

get(174) ->
    #universe_cfg{
        id=174,
        next=175,
        star=1,
        level=6,
        universe=4,
        vigor=14687,
        gold=145395,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1129}],
        attack=1720,
        skill_attack=1285,
        defence=2577,
        skill_defence=2577,
        health=16047};

get(175) ->
    #universe_cfg{
        id=175,
        next=176,
        star=1,
        level=7,
        universe=4,
        vigor=14788,
        gold=146398,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=113}],
        attack=1720,
        skill_attack=1285,
        defence=2577,
        skill_defence=2577,
        health=17176};

get(176) ->
    #universe_cfg{
        id=176,
        next=177,
        star=1,
        level=8,
        universe=4,
        vigor=14889,
        gold=147401,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=85}],
        attack=1833,
        skill_attack=1285,
        defence=2577,
        skill_defence=2577,
        health=17176};

get(177) ->
    #universe_cfg{
        id=177,
        next=178,
        star=2,
        level=1,
        universe=4,
        vigor=14990,
        gold=148403,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=169}],
        attack=1833,
        skill_attack=1370,
        defence=2577,
        skill_defence=2577,
        health=17176};

get(178) ->
    #universe_cfg{
        id=178,
        next=179,
        star=2,
        level=2,
        universe=4,
        vigor=15091,
        gold=149406,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=169}],
        attack=1833,
        skill_attack=1370,
        defence=2746,
        skill_defence=2577,
        health=17176};

get(179) ->
    #universe_cfg{
        id=179,
        next=180,
        star=2,
        level=3,
        universe=4,
        vigor=15192,
        gold=150409,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1129}],
        attack=1833,
        skill_attack=1370,
        defence=2746,
        skill_defence=2746,
        health=17176};

get(180) ->
    #universe_cfg{
        id=180,
        next=181,
        star=2,
        level=4,
        universe=4,
        vigor=15293,
        gold=151412,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=134}],
        attack=1833,
        skill_attack=1370,
        defence=2746,
        skill_defence=2746,
        health=18305};

get(181) ->
    #universe_cfg{
        id=181,
        next=182,
        star=2,
        level=5,
        universe=4,
        vigor=15394,
        gold=152415,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=101}],
        attack=1967,
        skill_attack=1370,
        defence=2746,
        skill_defence=2746,
        health=18305};

get(182) ->
    #universe_cfg{
        id=182,
        next=183,
        star=2,
        level=6,
        universe=4,
        vigor=15495,
        gold=153418,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=202}],
        attack=1967,
        skill_attack=1471,
        defence=2746,
        skill_defence=2746,
        health=18305};

get(183) ->
    #universe_cfg{
        id=183,
        next=184,
        star=2,
        level=7,
        universe=4,
        vigor=15597,
        gold=154421,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=202}],
        attack=1967,
        skill_attack=1471,
        defence=2948,
        skill_defence=2746,
        health=18305};

get(184) ->
    #universe_cfg{
        id=184,
        next=185,
        star=2,
        level=8,
        universe=4,
        vigor=15698,
        gold=155424,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1344}],
        attack=1967,
        skill_attack=1471,
        defence=2948,
        skill_defence=2948,
        health=18305};

get(185) ->
    #universe_cfg{
        id=185,
        next=186,
        star=3,
        level=1,
        universe=4,
        vigor=15799,
        gold=156428,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=134}],
        attack=1967,
        skill_attack=1471,
        defence=2948,
        skill_defence=2948,
        health=19649};

get(186) ->
    #universe_cfg{
        id=186,
        next=187,
        star=3,
        level=2,
        universe=4,
        vigor=15900,
        gold=157431,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=101}],
        attack=2101,
        skill_attack=1471,
        defence=2948,
        skill_defence=2948,
        health=19649};

get(187) ->
    #universe_cfg{
        id=187,
        next=188,
        star=3,
        level=3,
        universe=4,
        vigor=16001,
        gold=158434,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=202}],
        attack=2101,
        skill_attack=1572,
        defence=2948,
        skill_defence=2948,
        health=19649};

get(188) ->
    #universe_cfg{
        id=188,
        next=189,
        star=3,
        level=4,
        universe=4,
        vigor=16102,
        gold=159437,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=202}],
        attack=2101,
        skill_attack=1572,
        defence=3150,
        skill_defence=2948,
        health=19649};

get(189) ->
    #universe_cfg{
        id=189,
        next=190,
        star=3,
        level=5,
        universe=4,
        vigor=16203,
        gold=160440,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1344}],
        attack=2101,
        skill_attack=1572,
        defence=3150,
        skill_defence=3150,
        health=19649};

get(190) ->
    #universe_cfg{
        id=190,
        next=191,
        star=3,
        level=6,
        universe=4,
        vigor=16304,
        gold=161443,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=174}],
        attack=2101,
        skill_attack=1572,
        defence=3150,
        skill_defence=3150,
        health=20993};

get(191) ->
    #universe_cfg{
        id=191,
        next=192,
        star=3,
        level=7,
        universe=4,
        vigor=16406,
        gold=162446,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=131}],
        attack=2275,
        skill_attack=1572,
        defence=3150,
        skill_defence=3150,
        health=20993};

get(192) ->
    #universe_cfg{
        id=192,
        next=193,
        star=3,
        level=8,
        universe=4,
        vigor=16507,
        gold=163450,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=261}],
        attack=2275,
        skill_attack=1703,
        defence=3150,
        skill_defence=3150,
        health=20993};

get(193) ->
    #universe_cfg{
        id=193,
        next=194,
        star=4,
        level=1,
        universe=4,
        vigor=16608,
        gold=164453,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=261}],
        attack=2275,
        skill_attack=1703,
        defence=3411,
        skill_defence=3150,
        health=20993};

get(194) ->
    #universe_cfg{
        id=194,
        next=195,
        star=4,
        level=2,
        universe=4,
        vigor=16709,
        gold=165456,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1742}],
        attack=2275,
        skill_attack=1703,
        defence=3411,
        skill_defence=3411,
        health=20993};

get(195) ->
    #universe_cfg{
        id=195,
        next=196,
        star=4,
        level=3,
        universe=4,
        vigor=16810,
        gold=166459,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=158}],
        attack=2275,
        skill_attack=1703,
        defence=3411,
        skill_defence=3411,
        health=22735};

get(196) ->
    #universe_cfg{
        id=196,
        next=197,
        star=4,
        level=4,
        universe=4,
        vigor=16911,
        gold=167463,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=119}],
        attack=2433,
        skill_attack=1703,
        defence=3411,
        skill_defence=3411,
        health=22735};

get(197) ->
    #universe_cfg{
        id=197,
        next=198,
        star=4,
        level=5,
        universe=4,
        vigor=17012,
        gold=168466,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=238}],
        attack=2433,
        skill_attack=1822,
        defence=3411,
        skill_defence=3411,
        health=22735};

get(198) ->
    #universe_cfg{
        id=198,
        next=199,
        star=4,
        level=6,
        universe=4,
        vigor=17114,
        gold=169469,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=238}],
        attack=2433,
        skill_attack=1822,
        defence=3649,
        skill_defence=3411,
        health=22735};

get(199) ->
    #universe_cfg{
        id=199,
        next=200,
        star=4,
        level=7,
        universe=4,
        vigor=17215,
        gold=170473,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1583}],
        attack=2433,
        skill_attack=1822,
        defence=3649,
        skill_defence=3649,
        health=22735};

get(200) ->
    #universe_cfg{
        id=200,
        next=201,
        star=4,
        level=8,
        universe=4,
        vigor=17316,
        gold=171476,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=185}],
        attack=2433,
        skill_attack=1822,
        defence=3649,
        skill_defence=3649,
        health=24318};

get(201) ->
    #universe_cfg{
        id=201,
        next=202,
        star=5,
        level=1,
        universe=4,
        vigor=17417,
        gold=172479,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=139}],
        attack=2618,
        skill_attack=1822,
        defence=3649,
        skill_defence=3649,
        health=24318};

get(202) ->
    #universe_cfg{
        id=202,
        next=203,
        star=5,
        level=2,
        universe=4,
        vigor=17518,
        gold=173483,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=277}],
        attack=2618,
        skill_attack=1961,
        defence=3649,
        skill_defence=3649,
        health=24318};

get(203) ->
    #universe_cfg{
        id=203,
        next=204,
        star=5,
        level=3,
        universe=4,
        vigor=17619,
        gold=174486,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=277}],
        attack=2618,
        skill_attack=1961,
        defence=3926,
        skill_defence=3649,
        health=24318};

get(204) ->
    #universe_cfg{
        id=204,
        next=205,
        star=5,
        level=4,
        universe=4,
        vigor=17720,
        gold=175490,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=1848}],
        attack=2618,
        skill_attack=1961,
        defence=3926,
        skill_defence=3926,
        health=24318};

get(205) ->
    #universe_cfg{
        id=205,
        next=206,
        star=5,
        level=5,
        universe=4,
        vigor=17822,
        gold=176493,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=203}],
        attack=2618,
        skill_attack=1961,
        defence=3926,
        skill_defence=3926,
        health=26166};

get(206) ->
    #universe_cfg{
        id=206,
        next=207,
        star=5,
        level=6,
        universe=4,
        vigor=17923,
        gold=177496,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=152}],
        attack=2821,
        skill_attack=1961,
        defence=3926,
        skill_defence=3926,
        health=26166};

get(207) ->
    #universe_cfg{
        id=207,
        next=208,
        star=5,
        level=7,
        universe=4,
        vigor=18024,
        gold=178500,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=305}],
        attack=2821,
        skill_attack=2113,
        defence=3926,
        skill_defence=3926,
        health=26166};

get(208) ->
    #universe_cfg{
        id=208,
        next=209,
        star=5,
        level=8,
        universe=4,
        vigor=18125,
        gold=179504,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=305}],
        attack=2821,
        skill_attack=2113,
        defence=4231,
        skill_defence=3926,
        health=26166};

get(209) ->
    #universe_cfg{
        id=209,
        next=210,
        star=6,
        level=1,
        universe=4,
        vigor=18226,
        gold=180507,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=2033}],
        attack=2821,
        skill_attack=2113,
        defence=4231,
        skill_defence=4231,
        health=26166};

get(210) ->
    #universe_cfg{
        id=210,
        next=211,
        star=6,
        level=2,
        universe=4,
        vigor=18327,
        gold=181511,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=214}],
        attack=2821,
        skill_attack=2113,
        defence=4231,
        skill_defence=4231,
        health=28199};

get(211) ->
    #universe_cfg{
        id=211,
        next=212,
        star=6,
        level=3,
        universe=4,
        vigor=18428,
        gold=182514,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=160}],
        attack=3035,
        skill_attack=2113,
        defence=4231,
        skill_defence=4231,
        health=28199};

get(212) ->
    #universe_cfg{
        id=212,
        next=213,
        star=6,
        level=4,
        universe=4,
        vigor=18530,
        gold=183518,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=321}],
        attack=3035,
        skill_attack=2273,
        defence=4231,
        skill_defence=4231,
        health=28199};

get(213) ->
    #universe_cfg{
        id=213,
        next=214,
        star=6,
        level=5,
        universe=4,
        vigor=18631,
        gold=184521,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=321}],
        attack=3035,
        skill_attack=2273,
        defence=4552,
        skill_defence=4231,
        health=28199};

get(214) ->
    #universe_cfg{
        id=214,
        next=215,
        star=6,
        level=6,
        universe=4,
        vigor=18732,
        gold=185525,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=2139}],
        attack=3035,
        skill_attack=2273,
        defence=4552,
        skill_defence=4552,
        health=28199};

get(215) ->
    #universe_cfg{
        id=215,
        next=216,
        star=6,
        level=7,
        universe=4,
        vigor=18833,
        gold=186529,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=214}],
        attack=3035,
        skill_attack=2273,
        defence=4552,
        skill_defence=4552,
        health=30338};

get(216) ->
    #universe_cfg{
        id=216,
        next=217,
        star=6,
        level=8,
        universe=4,
        vigor=18934,
        gold=187533,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=160}],
        attack=3249,
        skill_attack=2273,
        defence=4552,
        skill_defence=4552,
        health=30338};

get(217) ->
    #universe_cfg{
        id=217,
        next=218,
        star=7,
        level=1,
        universe=4,
        vigor=19035,
        gold=188536,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=321}],
        attack=3249,
        skill_attack=2433,
        defence=4552,
        skill_defence=4552,
        health=30338};

get(218) ->
    #universe_cfg{
        id=218,
        next=219,
        star=7,
        level=2,
        universe=4,
        vigor=19137,
        gold=189540,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=321}],
        attack=3249,
        skill_attack=2433,
        defence=4873,
        skill_defence=4552,
        health=30338};

get(219) ->
    #universe_cfg{
        id=219,
        next=220,
        star=7,
        level=3,
        universe=4,
        vigor=19238,
        gold=190544,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=2139}],
        attack=3249,
        skill_attack=2433,
        defence=4873,
        skill_defence=4873,
        health=30338};

get(220) ->
    #universe_cfg{
        id=220,
        next=221,
        star=7,
        level=4,
        universe=4,
        vigor=19339,
        gold=191548,
        coin=0,
        plus_attr=[#plus_attr{type=3,value=270}],
        attack=3249,
        skill_attack=2433,
        defence=4873,
        skill_defence=4873,
        health=32477};

get(221) ->
    #universe_cfg{
        id=221,
        next=222,
        star=7,
        level=5,
        universe=4,
        vigor=19440,
        gold=192551,
        coin=0,
        plus_attr=[#plus_attr{type=4,value=203}],
        attack=3519,
        skill_attack=2433,
        defence=4873,
        skill_defence=4873,
        health=32477};

get(222) ->
    #universe_cfg{
        id=222,
        next=223,
        star=7,
        level=6,
        universe=4,
        vigor=19541,
        gold=193555,
        coin=0,
        plus_attr=[#plus_attr{type=5,value=406}],
        attack=3519,
        skill_attack=2636,
        defence=4873,
        skill_defence=4873,
        health=32477};

get(223) ->
    #universe_cfg{
        id=223,
        next=224,
        star=7,
        level=7,
        universe=4,
        vigor=19642,
        gold=194559,
        coin=0,
        plus_attr=[#plus_attr{type=6,value=406}],
        attack=3519,
        skill_attack=2636,
        defence=5279,
        skill_defence=4873,
        health=32477};

get(224) ->
    #universe_cfg{
        id=224,
        next=224,
        star=7,
        level=8,
        universe=4,
        vigor=19232,
        gold=225000,
        coin=0,
        plus_attr=[#plus_attr{type=7,value=2139}],
        attack=3519,
        skill_attack=2636,
        defence=5279,
        skill_defence=5279,
        health=32477};

get(_) -> false.


