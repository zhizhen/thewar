-module(warrior_base_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({1,1}) ->
    #warrior_base_cfg{
        type=1,
        level=1,
        life=1800,
        attack=120,
        magic_attack=60,
        defense=96,
        magic_defense=72,
        force=30,
        intelligence=30,
        penetrate=0,
        reduce=0};

get({1,2}) ->
    #warrior_base_cfg{
        type=1,
        level=2,
        life=2250,
        attack=132,
        magic_attack=66,
        defense=105,
        magic_defense=79,
        force=31,
        intelligence=31,
        penetrate=0,
        reduce=0};

get({1,3}) ->
    #warrior_base_cfg{
        type=1,
        level=3,
        life=2700,
        attack=144,
        magic_attack=72,
        defense=115,
        magic_defense=86,
        force=32,
        intelligence=32,
        penetrate=0,
        reduce=0};

get({1,4}) ->
    #warrior_base_cfg{
        type=1,
        level=4,
        life=3150,
        attack=156,
        magic_attack=78,
        defense=124,
        magic_defense=93,
        force=33,
        intelligence=33,
        penetrate=0,
        reduce=0};

get({1,5}) ->
    #warrior_base_cfg{
        type=1,
        level=5,
        life=3600,
        attack=168,
        magic_attack=84,
        defense=134,
        magic_defense=100,
        force=34,
        intelligence=34,
        penetrate=0,
        reduce=0};

get({1,6}) ->
    #warrior_base_cfg{
        type=1,
        level=6,
        life=4050,
        attack=180,
        magic_attack=90,
        defense=144,
        magic_defense=108,
        force=35,
        intelligence=35,
        penetrate=0,
        reduce=0};

get({1,7}) ->
    #warrior_base_cfg{
        type=1,
        level=7,
        life=4500,
        attack=192,
        magic_attack=96,
        defense=153,
        magic_defense=115,
        force=36,
        intelligence=36,
        penetrate=0,
        reduce=0};

get({1,8}) ->
    #warrior_base_cfg{
        type=1,
        level=8,
        life=4950,
        attack=204,
        magic_attack=102,
        defense=163,
        magic_defense=122,
        force=37,
        intelligence=37,
        penetrate=0,
        reduce=0};

get({1,9}) ->
    #warrior_base_cfg{
        type=1,
        level=9,
        life=5400,
        attack=216,
        magic_attack=108,
        defense=172,
        magic_defense=129,
        force=38,
        intelligence=38,
        penetrate=0,
        reduce=0};

get({1,10}) ->
    #warrior_base_cfg{
        type=1,
        level=10,
        life=5850,
        attack=228,
        magic_attack=114,
        defense=182,
        magic_defense=136,
        force=39,
        intelligence=39,
        penetrate=0,
        reduce=0};

get({1,11}) ->
    #warrior_base_cfg{
        type=1,
        level=11,
        life=6300,
        attack=240,
        magic_attack=120,
        defense=192,
        magic_defense=144,
        force=40,
        intelligence=40,
        penetrate=0,
        reduce=0};

get({1,12}) ->
    #warrior_base_cfg{
        type=1,
        level=12,
        life=6750,
        attack=252,
        magic_attack=126,
        defense=201,
        magic_defense=151,
        force=41,
        intelligence=41,
        penetrate=0,
        reduce=0};

get({1,13}) ->
    #warrior_base_cfg{
        type=1,
        level=13,
        life=7200,
        attack=264,
        magic_attack=132,
        defense=211,
        magic_defense=158,
        force=42,
        intelligence=42,
        penetrate=0,
        reduce=0};

get({1,14}) ->
    #warrior_base_cfg{
        type=1,
        level=14,
        life=7650,
        attack=276,
        magic_attack=138,
        defense=220,
        magic_defense=165,
        force=43,
        intelligence=43,
        penetrate=0,
        reduce=0};

get({1,15}) ->
    #warrior_base_cfg{
        type=1,
        level=15,
        life=8100,
        attack=288,
        magic_attack=144,
        defense=230,
        magic_defense=172,
        force=44,
        intelligence=44,
        penetrate=0,
        reduce=0};

get({1,16}) ->
    #warrior_base_cfg{
        type=1,
        level=16,
        life=8550,
        attack=300,
        magic_attack=150,
        defense=240,
        magic_defense=180,
        force=45,
        intelligence=45,
        penetrate=0,
        reduce=0};

get({1,17}) ->
    #warrior_base_cfg{
        type=1,
        level=17,
        life=9000,
        attack=312,
        magic_attack=156,
        defense=249,
        magic_defense=187,
        force=46,
        intelligence=46,
        penetrate=0,
        reduce=0};

get({1,18}) ->
    #warrior_base_cfg{
        type=1,
        level=18,
        life=9450,
        attack=324,
        magic_attack=162,
        defense=259,
        magic_defense=194,
        force=47,
        intelligence=47,
        penetrate=0,
        reduce=0};

get({1,19}) ->
    #warrior_base_cfg{
        type=1,
        level=19,
        life=9900,
        attack=336,
        magic_attack=168,
        defense=268,
        magic_defense=201,
        force=48,
        intelligence=48,
        penetrate=0,
        reduce=0};

get({1,20}) ->
    #warrior_base_cfg{
        type=1,
        level=20,
        life=10350,
        attack=348,
        magic_attack=174,
        defense=278,
        magic_defense=208,
        force=49,
        intelligence=49,
        penetrate=0,
        reduce=0};

get({1,21}) ->
    #warrior_base_cfg{
        type=1,
        level=21,
        life=10800,
        attack=360,
        magic_attack=180,
        defense=288,
        magic_defense=216,
        force=50,
        intelligence=50,
        penetrate=0,
        reduce=0};

get({1,22}) ->
    #warrior_base_cfg{
        type=1,
        level=22,
        life=11250,
        attack=372,
        magic_attack=186,
        defense=297,
        magic_defense=223,
        force=51,
        intelligence=51,
        penetrate=0,
        reduce=0};

get({1,23}) ->
    #warrior_base_cfg{
        type=1,
        level=23,
        life=11700,
        attack=384,
        magic_attack=192,
        defense=307,
        magic_defense=230,
        force=52,
        intelligence=52,
        penetrate=0,
        reduce=0};

get({1,24}) ->
    #warrior_base_cfg{
        type=1,
        level=24,
        life=12150,
        attack=396,
        magic_attack=198,
        defense=316,
        magic_defense=237,
        force=53,
        intelligence=53,
        penetrate=0,
        reduce=0};

get({1,25}) ->
    #warrior_base_cfg{
        type=1,
        level=25,
        life=12600,
        attack=408,
        magic_attack=204,
        defense=326,
        magic_defense=244,
        force=54,
        intelligence=54,
        penetrate=0,
        reduce=0};

get({1,26}) ->
    #warrior_base_cfg{
        type=1,
        level=26,
        life=13050,
        attack=420,
        magic_attack=210,
        defense=336,
        magic_defense=252,
        force=55,
        intelligence=55,
        penetrate=0,
        reduce=0};

get({1,27}) ->
    #warrior_base_cfg{
        type=1,
        level=27,
        life=13500,
        attack=432,
        magic_attack=216,
        defense=345,
        magic_defense=259,
        force=56,
        intelligence=56,
        penetrate=0,
        reduce=0};

get({1,28}) ->
    #warrior_base_cfg{
        type=1,
        level=28,
        life=13950,
        attack=444,
        magic_attack=222,
        defense=355,
        magic_defense=266,
        force=57,
        intelligence=57,
        penetrate=0,
        reduce=0};

get({1,29}) ->
    #warrior_base_cfg{
        type=1,
        level=29,
        life=14400,
        attack=456,
        magic_attack=228,
        defense=364,
        magic_defense=273,
        force=58,
        intelligence=58,
        penetrate=0,
        reduce=0};

get({1,30}) ->
    #warrior_base_cfg{
        type=1,
        level=30,
        life=14850,
        attack=468,
        magic_attack=234,
        defense=374,
        magic_defense=280,
        force=59,
        intelligence=59,
        penetrate=0,
        reduce=0};

get({1,31}) ->
    #warrior_base_cfg{
        type=1,
        level=31,
        life=15300,
        attack=480,
        magic_attack=240,
        defense=384,
        magic_defense=288,
        force=60,
        intelligence=60,
        penetrate=0,
        reduce=0};

get({1,32}) ->
    #warrior_base_cfg{
        type=1,
        level=32,
        life=15750,
        attack=492,
        magic_attack=246,
        defense=393,
        magic_defense=295,
        force=61,
        intelligence=61,
        penetrate=0,
        reduce=0};

get({1,33}) ->
    #warrior_base_cfg{
        type=1,
        level=33,
        life=16200,
        attack=504,
        magic_attack=252,
        defense=403,
        magic_defense=302,
        force=62,
        intelligence=62,
        penetrate=0,
        reduce=0};

get({1,34}) ->
    #warrior_base_cfg{
        type=1,
        level=34,
        life=16650,
        attack=516,
        magic_attack=258,
        defense=412,
        magic_defense=309,
        force=63,
        intelligence=63,
        penetrate=0,
        reduce=0};

get({1,35}) ->
    #warrior_base_cfg{
        type=1,
        level=35,
        life=17100,
        attack=528,
        magic_attack=264,
        defense=422,
        magic_defense=316,
        force=64,
        intelligence=64,
        penetrate=0,
        reduce=0};

get({1,36}) ->
    #warrior_base_cfg{
        type=1,
        level=36,
        life=17550,
        attack=540,
        magic_attack=270,
        defense=432,
        magic_defense=324,
        force=65,
        intelligence=65,
        penetrate=0,
        reduce=0};

get({1,37}) ->
    #warrior_base_cfg{
        type=1,
        level=37,
        life=18000,
        attack=552,
        magic_attack=276,
        defense=441,
        magic_defense=331,
        force=66,
        intelligence=66,
        penetrate=0,
        reduce=0};

get({1,38}) ->
    #warrior_base_cfg{
        type=1,
        level=38,
        life=18450,
        attack=564,
        magic_attack=282,
        defense=451,
        magic_defense=338,
        force=67,
        intelligence=67,
        penetrate=0,
        reduce=0};

get({1,39}) ->
    #warrior_base_cfg{
        type=1,
        level=39,
        life=18900,
        attack=576,
        magic_attack=288,
        defense=460,
        magic_defense=345,
        force=68,
        intelligence=68,
        penetrate=0,
        reduce=0};

get({1,40}) ->
    #warrior_base_cfg{
        type=1,
        level=40,
        life=19350,
        attack=588,
        magic_attack=294,
        defense=470,
        magic_defense=352,
        force=69,
        intelligence=69,
        penetrate=0,
        reduce=0};

get({1,41}) ->
    #warrior_base_cfg{
        type=1,
        level=41,
        life=19800,
        attack=600,
        magic_attack=300,
        defense=480,
        magic_defense=360,
        force=70,
        intelligence=70,
        penetrate=0,
        reduce=0};

get({1,42}) ->
    #warrior_base_cfg{
        type=1,
        level=42,
        life=20250,
        attack=612,
        magic_attack=306,
        defense=489,
        magic_defense=367,
        force=71,
        intelligence=71,
        penetrate=0,
        reduce=0};

get({1,43}) ->
    #warrior_base_cfg{
        type=1,
        level=43,
        life=20700,
        attack=624,
        magic_attack=312,
        defense=499,
        magic_defense=374,
        force=72,
        intelligence=72,
        penetrate=0,
        reduce=0};

get({1,44}) ->
    #warrior_base_cfg{
        type=1,
        level=44,
        life=21150,
        attack=636,
        magic_attack=318,
        defense=508,
        magic_defense=381,
        force=73,
        intelligence=73,
        penetrate=0,
        reduce=0};

get({1,45}) ->
    #warrior_base_cfg{
        type=1,
        level=45,
        life=21600,
        attack=648,
        magic_attack=324,
        defense=518,
        magic_defense=388,
        force=74,
        intelligence=74,
        penetrate=0,
        reduce=0};

get({1,46}) ->
    #warrior_base_cfg{
        type=1,
        level=46,
        life=22050,
        attack=660,
        magic_attack=330,
        defense=528,
        magic_defense=396,
        force=75,
        intelligence=75,
        penetrate=0,
        reduce=0};

get({1,47}) ->
    #warrior_base_cfg{
        type=1,
        level=47,
        life=22500,
        attack=672,
        magic_attack=336,
        defense=537,
        magic_defense=403,
        force=76,
        intelligence=76,
        penetrate=0,
        reduce=0};

get({1,48}) ->
    #warrior_base_cfg{
        type=1,
        level=48,
        life=22950,
        attack=684,
        magic_attack=342,
        defense=547,
        magic_defense=410,
        force=77,
        intelligence=77,
        penetrate=0,
        reduce=0};

get({1,49}) ->
    #warrior_base_cfg{
        type=1,
        level=49,
        life=23400,
        attack=696,
        magic_attack=348,
        defense=556,
        magic_defense=417,
        force=78,
        intelligence=78,
        penetrate=0,
        reduce=0};

get({1,50}) ->
    #warrior_base_cfg{
        type=1,
        level=50,
        life=23850,
        attack=708,
        magic_attack=354,
        defense=566,
        magic_defense=424,
        force=79,
        intelligence=79,
        penetrate=0,
        reduce=0};

get({1,51}) ->
    #warrior_base_cfg{
        type=1,
        level=51,
        life=24300,
        attack=720,
        magic_attack=360,
        defense=576,
        magic_defense=432,
        force=80,
        intelligence=80,
        penetrate=0,
        reduce=0};

get({1,52}) ->
    #warrior_base_cfg{
        type=1,
        level=52,
        life=24750,
        attack=732,
        magic_attack=366,
        defense=585,
        magic_defense=439,
        force=81,
        intelligence=81,
        penetrate=0,
        reduce=0};

get({1,53}) ->
    #warrior_base_cfg{
        type=1,
        level=53,
        life=25200,
        attack=744,
        magic_attack=372,
        defense=595,
        magic_defense=446,
        force=82,
        intelligence=82,
        penetrate=0,
        reduce=0};

get({1,54}) ->
    #warrior_base_cfg{
        type=1,
        level=54,
        life=25650,
        attack=756,
        magic_attack=378,
        defense=604,
        magic_defense=453,
        force=83,
        intelligence=83,
        penetrate=0,
        reduce=0};

get({1,55}) ->
    #warrior_base_cfg{
        type=1,
        level=55,
        life=26100,
        attack=768,
        magic_attack=384,
        defense=614,
        magic_defense=460,
        force=84,
        intelligence=84,
        penetrate=0,
        reduce=0};

get({1,56}) ->
    #warrior_base_cfg{
        type=1,
        level=56,
        life=26550,
        attack=780,
        magic_attack=390,
        defense=624,
        magic_defense=468,
        force=85,
        intelligence=85,
        penetrate=0,
        reduce=0};

get({1,57}) ->
    #warrior_base_cfg{
        type=1,
        level=57,
        life=27000,
        attack=792,
        magic_attack=396,
        defense=633,
        magic_defense=475,
        force=86,
        intelligence=86,
        penetrate=0,
        reduce=0};

get({1,58}) ->
    #warrior_base_cfg{
        type=1,
        level=58,
        life=27450,
        attack=804,
        magic_attack=402,
        defense=643,
        magic_defense=482,
        force=87,
        intelligence=87,
        penetrate=0,
        reduce=0};

get({1,59}) ->
    #warrior_base_cfg{
        type=1,
        level=59,
        life=27900,
        attack=816,
        magic_attack=408,
        defense=652,
        magic_defense=489,
        force=88,
        intelligence=88,
        penetrate=0,
        reduce=0};

get({1,60}) ->
    #warrior_base_cfg{
        type=1,
        level=60,
        life=28350,
        attack=828,
        magic_attack=414,
        defense=662,
        magic_defense=496,
        force=89,
        intelligence=89,
        penetrate=0,
        reduce=0};

get({1,61}) ->
    #warrior_base_cfg{
        type=1,
        level=61,
        life=28800,
        attack=840,
        magic_attack=420,
        defense=672,
        magic_defense=504,
        force=90,
        intelligence=90,
        penetrate=0,
        reduce=0};

get({1,62}) ->
    #warrior_base_cfg{
        type=1,
        level=62,
        life=29250,
        attack=852,
        magic_attack=426,
        defense=681,
        magic_defense=511,
        force=91,
        intelligence=91,
        penetrate=0,
        reduce=0};

get({1,63}) ->
    #warrior_base_cfg{
        type=1,
        level=63,
        life=29700,
        attack=864,
        magic_attack=432,
        defense=691,
        magic_defense=518,
        force=92,
        intelligence=92,
        penetrate=0,
        reduce=0};

get({1,64}) ->
    #warrior_base_cfg{
        type=1,
        level=64,
        life=30150,
        attack=876,
        magic_attack=438,
        defense=700,
        magic_defense=525,
        force=93,
        intelligence=93,
        penetrate=0,
        reduce=0};

get({1,65}) ->
    #warrior_base_cfg{
        type=1,
        level=65,
        life=30600,
        attack=888,
        magic_attack=444,
        defense=710,
        magic_defense=532,
        force=94,
        intelligence=94,
        penetrate=0,
        reduce=0};

get({1,66}) ->
    #warrior_base_cfg{
        type=1,
        level=66,
        life=31050,
        attack=900,
        magic_attack=450,
        defense=720,
        magic_defense=540,
        force=95,
        intelligence=95,
        penetrate=0,
        reduce=0};

get({1,67}) ->
    #warrior_base_cfg{
        type=1,
        level=67,
        life=31500,
        attack=912,
        magic_attack=456,
        defense=729,
        magic_defense=547,
        force=96,
        intelligence=96,
        penetrate=0,
        reduce=0};

get({1,68}) ->
    #warrior_base_cfg{
        type=1,
        level=68,
        life=31950,
        attack=924,
        magic_attack=462,
        defense=739,
        magic_defense=554,
        force=97,
        intelligence=97,
        penetrate=0,
        reduce=0};

get({1,69}) ->
    #warrior_base_cfg{
        type=1,
        level=69,
        life=32400,
        attack=936,
        magic_attack=468,
        defense=748,
        magic_defense=561,
        force=98,
        intelligence=98,
        penetrate=0,
        reduce=0};

get({1,70}) ->
    #warrior_base_cfg{
        type=1,
        level=70,
        life=32850,
        attack=948,
        magic_attack=474,
        defense=758,
        magic_defense=568,
        force=99,
        intelligence=99,
        penetrate=0,
        reduce=0};

get({1,71}) ->
    #warrior_base_cfg{
        type=1,
        level=71,
        life=33300,
        attack=960,
        magic_attack=480,
        defense=768,
        magic_defense=576,
        force=100,
        intelligence=100,
        penetrate=0,
        reduce=0};

get({1,72}) ->
    #warrior_base_cfg{
        type=1,
        level=72,
        life=33750,
        attack=972,
        magic_attack=486,
        defense=777,
        magic_defense=583,
        force=101,
        intelligence=101,
        penetrate=0,
        reduce=0};

get({1,73}) ->
    #warrior_base_cfg{
        type=1,
        level=73,
        life=34200,
        attack=984,
        magic_attack=492,
        defense=787,
        magic_defense=590,
        force=102,
        intelligence=102,
        penetrate=0,
        reduce=0};

get({1,74}) ->
    #warrior_base_cfg{
        type=1,
        level=74,
        life=34650,
        attack=996,
        magic_attack=498,
        defense=796,
        magic_defense=597,
        force=103,
        intelligence=103,
        penetrate=0,
        reduce=0};

get({1,75}) ->
    #warrior_base_cfg{
        type=1,
        level=75,
        life=35100,
        attack=1008,
        magic_attack=504,
        defense=806,
        magic_defense=604,
        force=104,
        intelligence=104,
        penetrate=0,
        reduce=0};

get({1,76}) ->
    #warrior_base_cfg{
        type=1,
        level=76,
        life=35550,
        attack=1020,
        magic_attack=510,
        defense=816,
        magic_defense=612,
        force=105,
        intelligence=105,
        penetrate=0,
        reduce=0};

get({1,77}) ->
    #warrior_base_cfg{
        type=1,
        level=77,
        life=36000,
        attack=1032,
        magic_attack=516,
        defense=825,
        magic_defense=619,
        force=106,
        intelligence=106,
        penetrate=0,
        reduce=0};

get({1,78}) ->
    #warrior_base_cfg{
        type=1,
        level=78,
        life=36450,
        attack=1044,
        magic_attack=522,
        defense=835,
        magic_defense=626,
        force=107,
        intelligence=107,
        penetrate=0,
        reduce=0};

get({1,79}) ->
    #warrior_base_cfg{
        type=1,
        level=79,
        life=36900,
        attack=1056,
        magic_attack=528,
        defense=844,
        magic_defense=633,
        force=108,
        intelligence=108,
        penetrate=0,
        reduce=0};

get({1,80}) ->
    #warrior_base_cfg{
        type=1,
        level=80,
        life=37350,
        attack=1068,
        magic_attack=534,
        defense=854,
        magic_defense=640,
        force=109,
        intelligence=109,
        penetrate=0,
        reduce=0};

get({1,81}) ->
    #warrior_base_cfg{
        type=1,
        level=81,
        life=37800,
        attack=1080,
        magic_attack=540,
        defense=864,
        magic_defense=648,
        force=110,
        intelligence=110,
        penetrate=0,
        reduce=0};

get({1,82}) ->
    #warrior_base_cfg{
        type=1,
        level=82,
        life=38250,
        attack=1092,
        magic_attack=546,
        defense=873,
        magic_defense=655,
        force=111,
        intelligence=111,
        penetrate=0,
        reduce=0};

get({1,83}) ->
    #warrior_base_cfg{
        type=1,
        level=83,
        life=38700,
        attack=1104,
        magic_attack=552,
        defense=883,
        magic_defense=662,
        force=112,
        intelligence=112,
        penetrate=0,
        reduce=0};

get({1,84}) ->
    #warrior_base_cfg{
        type=1,
        level=84,
        life=39150,
        attack=1116,
        magic_attack=558,
        defense=892,
        magic_defense=669,
        force=113,
        intelligence=113,
        penetrate=0,
        reduce=0};

get({1,85}) ->
    #warrior_base_cfg{
        type=1,
        level=85,
        life=39600,
        attack=1128,
        magic_attack=564,
        defense=902,
        magic_defense=676,
        force=114,
        intelligence=114,
        penetrate=0,
        reduce=0};

get({1,86}) ->
    #warrior_base_cfg{
        type=1,
        level=86,
        life=40050,
        attack=1140,
        magic_attack=570,
        defense=912,
        magic_defense=684,
        force=115,
        intelligence=115,
        penetrate=0,
        reduce=0};

get({1,87}) ->
    #warrior_base_cfg{
        type=1,
        level=87,
        life=40500,
        attack=1152,
        magic_attack=576,
        defense=921,
        magic_defense=691,
        force=116,
        intelligence=116,
        penetrate=0,
        reduce=0};

get({1,88}) ->
    #warrior_base_cfg{
        type=1,
        level=88,
        life=40950,
        attack=1164,
        magic_attack=582,
        defense=931,
        magic_defense=698,
        force=117,
        intelligence=117,
        penetrate=0,
        reduce=0};

get({1,89}) ->
    #warrior_base_cfg{
        type=1,
        level=89,
        life=41400,
        attack=1176,
        magic_attack=588,
        defense=940,
        magic_defense=705,
        force=118,
        intelligence=118,
        penetrate=0,
        reduce=0};

get({1,90}) ->
    #warrior_base_cfg{
        type=1,
        level=90,
        life=41850,
        attack=1188,
        magic_attack=594,
        defense=950,
        magic_defense=712,
        force=119,
        intelligence=119,
        penetrate=0,
        reduce=0};

get({1,91}) ->
    #warrior_base_cfg{
        type=1,
        level=91,
        life=42300,
        attack=1200,
        magic_attack=600,
        defense=960,
        magic_defense=720,
        force=120,
        intelligence=120,
        penetrate=0,
        reduce=0};

get({1,92}) ->
    #warrior_base_cfg{
        type=1,
        level=92,
        life=42750,
        attack=1212,
        magic_attack=606,
        defense=969,
        magic_defense=727,
        force=121,
        intelligence=121,
        penetrate=0,
        reduce=0};

get({1,93}) ->
    #warrior_base_cfg{
        type=1,
        level=93,
        life=43200,
        attack=1224,
        magic_attack=612,
        defense=979,
        magic_defense=734,
        force=122,
        intelligence=122,
        penetrate=0,
        reduce=0};

get({1,94}) ->
    #warrior_base_cfg{
        type=1,
        level=94,
        life=43650,
        attack=1236,
        magic_attack=618,
        defense=988,
        magic_defense=741,
        force=123,
        intelligence=123,
        penetrate=0,
        reduce=0};

get({1,95}) ->
    #warrior_base_cfg{
        type=1,
        level=95,
        life=44100,
        attack=1248,
        magic_attack=624,
        defense=998,
        magic_defense=748,
        force=124,
        intelligence=124,
        penetrate=0,
        reduce=0};

get({1,96}) ->
    #warrior_base_cfg{
        type=1,
        level=96,
        life=44550,
        attack=1260,
        magic_attack=630,
        defense=1008,
        magic_defense=756,
        force=125,
        intelligence=125,
        penetrate=0,
        reduce=0};

get({1,97}) ->
    #warrior_base_cfg{
        type=1,
        level=97,
        life=45000,
        attack=1272,
        magic_attack=636,
        defense=1017,
        magic_defense=763,
        force=126,
        intelligence=126,
        penetrate=0,
        reduce=0};

get({1,98}) ->
    #warrior_base_cfg{
        type=1,
        level=98,
        life=45450,
        attack=1284,
        magic_attack=642,
        defense=1027,
        magic_defense=770,
        force=127,
        intelligence=127,
        penetrate=0,
        reduce=0};

get({1,99}) ->
    #warrior_base_cfg{
        type=1,
        level=99,
        life=45900,
        attack=1296,
        magic_attack=648,
        defense=1036,
        magic_defense=777,
        force=128,
        intelligence=128,
        penetrate=0,
        reduce=0};

get({1,100}) ->
    #warrior_base_cfg{
        type=1,
        level=100,
        life=46350,
        attack=1308,
        magic_attack=654,
        defense=1046,
        magic_defense=784,
        force=129,
        intelligence=129,
        penetrate=0,
        reduce=0};

get(_) -> false.


