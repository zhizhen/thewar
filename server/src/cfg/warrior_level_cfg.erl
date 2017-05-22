-module(warrior_level_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #warrior_level_cfg{
        level=1,
        exp=0,
        gold=0};

get(2) ->
    #warrior_level_cfg{
        level=2,
        exp=20,
        gold=1000};

get(3) ->
    #warrior_level_cfg{
        level=3,
        exp=64,
        gold=2000};

get(4) ->
    #warrior_level_cfg{
        level=4,
        exp=133,
        gold=3000};

get(5) ->
    #warrior_level_cfg{
        level=5,
        exp=227,
        gold=3500};

get(6) ->
    #warrior_level_cfg{
        level=6,
        exp=347,
        gold=4500};

get(7) ->
    #warrior_level_cfg{
        level=7,
        exp=493,
        gold=5350};

get(8) ->
    #warrior_level_cfg{
        level=8,
        exp=666,
        gold=6200};

get(9) ->
    #warrior_level_cfg{
        level=9,
        exp=867,
        gold=7050};

get(10) ->
    #warrior_level_cfg{
        level=10,
        exp=1096,
        gold=7900};

get(11) ->
    #warrior_level_cfg{
        level=11,
        exp=1383,
        gold=8750};

get(12) ->
    #warrior_level_cfg{
        level=12,
        exp=1699,
        gold=9600};

get(13) ->
    #warrior_level_cfg{
        level=13,
        exp=2044,
        gold=10450};

get(14) ->
    #warrior_level_cfg{
        level=14,
        exp=2419,
        gold=11300};

get(15) ->
    #warrior_level_cfg{
        level=15,
        exp=2825,
        gold=12150};

get(16) ->
    #warrior_level_cfg{
        level=16,
        exp=3261,
        gold=13000};

get(17) ->
    #warrior_level_cfg{
        level=17,
        exp=3729,
        gold=13850};

get(18) ->
    #warrior_level_cfg{
        level=18,
        exp=4229,
        gold=14700};

get(19) ->
    #warrior_level_cfg{
        level=19,
        exp=4761,
        gold=15550};

get(20) ->
    #warrior_level_cfg{
        level=20,
        exp=5326,
        gold=16400};

get(21) ->
    #warrior_level_cfg{
        level=21,
        exp=5924,
        gold=17250};

get(22) ->
    #warrior_level_cfg{
        level=22,
        exp=6606,
        gold=18100};

get(23) ->
    #warrior_level_cfg{
        level=23,
        exp=7323,
        gold=18950};

get(24) ->
    #warrior_level_cfg{
        level=24,
        exp=8075,
        gold=19800};

get(25) ->
    #warrior_level_cfg{
        level=25,
        exp=8862,
        gold=20650};

get(26) ->
    #warrior_level_cfg{
        level=26,
        exp=9685,
        gold=21500};

get(27) ->
    #warrior_level_cfg{
        level=27,
        exp=10544,
        gold=22350};

get(28) ->
    #warrior_level_cfg{
        level=28,
        exp=11440,
        gold=23200};

get(29) ->
    #warrior_level_cfg{
        level=29,
        exp=12374,
        gold=24050};

get(30) ->
    #warrior_level_cfg{
        level=30,
        exp=13346,
        gold=24900};

get(31) ->
    #warrior_level_cfg{
        level=31,
        exp=14456,
        gold=25750};

get(32) ->
    #warrior_level_cfg{
        level=32,
        exp=15605,
        gold=26600};

get(33) ->
    #warrior_level_cfg{
        level=33,
        exp=16793,
        gold=27450};

get(34) ->
    #warrior_level_cfg{
        level=34,
        exp=18021,
        gold=28300};

get(35) ->
    #warrior_level_cfg{
        level=35,
        exp=19290,
        gold=29150};

get(36) ->
    #warrior_level_cfg{
        level=36,
        exp=20600,
        gold=30000};

get(37) ->
    #warrior_level_cfg{
        level=37,
        exp=21951,
        gold=30850};

get(38) ->
    #warrior_level_cfg{
        level=38,
        exp=23344,
        gold=31700};

get(39) ->
    #warrior_level_cfg{
        level=39,
        exp=24780,
        gold=32550};

get(40) ->
    #warrior_level_cfg{
        level=40,
        exp=26259,
        gold=33400};

get(41) ->
    #warrior_level_cfg{
        level=41,
        exp=27931,
        gold=34250};

get(42) ->
    #warrior_level_cfg{
        level=42,
        exp=29647,
        gold=35100};

get(43) ->
    #warrior_level_cfg{
        level=43,
        exp=31407,
        gold=35950};

get(44) ->
    #warrior_level_cfg{
        level=44,
        exp=33212,
        gold=36800};

get(45) ->
    #warrior_level_cfg{
        level=45,
        exp=35063,
        gold=37650};

get(46) ->
    #warrior_level_cfg{
        level=46,
        exp=36960,
        gold=38500};

get(47) ->
    #warrior_level_cfg{
        level=47,
        exp=38903,
        gold=39350};

get(48) ->
    #warrior_level_cfg{
        level=48,
        exp=40893,
        gold=40200};

get(49) ->
    #warrior_level_cfg{
        level=49,
        exp=42931,
        gold=41050};

get(50) ->
    #warrior_level_cfg{
        level=50,
        exp=45017,
        gold=41900};

get(51) ->
    #warrior_level_cfg{
        level=51,
        exp=47301,
        gold=42750};

get(52) ->
    #warrior_level_cfg{
        level=52,
        exp=49634,
        gold=43600};

get(53) ->
    #warrior_level_cfg{
        level=53,
        exp=52016,
        gold=44450};

get(54) ->
    #warrior_level_cfg{
        level=54,
        exp=54448,
        gold=45300};

get(55) ->
    #warrior_level_cfg{
        level=55,
        exp=56931,
        gold=46150};

get(56) ->
    #warrior_level_cfg{
        level=56,
        exp=59465,
        gold=47000};

get(57) ->
    #warrior_level_cfg{
        level=57,
        exp=62050,
        gold=47850};

get(58) ->
    #warrior_level_cfg{
        level=58,
        exp=64687,
        gold=48700};

get(59) ->
    #warrior_level_cfg{
        level=59,
        exp=67377,
        gold=49550};

get(60) ->
    #warrior_level_cfg{
        level=60,
        exp=70120,
        gold=50400};

get(61) ->
    #warrior_level_cfg{
        level=61,
        exp=73116,
        gold=51250};

get(62) ->
    #warrior_level_cfg{
        level=62,
        exp=76166,
        gold=52100};

get(63) ->
    #warrior_level_cfg{
        level=63,
        exp=79271,
        gold=52950};

get(64) ->
    #warrior_level_cfg{
        level=64,
        exp=82431,
        gold=53800};

get(65) ->
    #warrior_level_cfg{
        level=65,
        exp=85646,
        gold=54650};

get(66) ->
    #warrior_level_cfg{
        level=66,
        exp=88917,
        gold=55500};

get(67) ->
    #warrior_level_cfg{
        level=67,
        exp=92245,
        gold=56350};

get(68) ->
    #warrior_level_cfg{
        level=68,
        exp=95630,
        gold=57200};

get(69) ->
    #warrior_level_cfg{
        level=69,
        exp=99072,
        gold=58050};

get(70) ->
    #warrior_level_cfg{
        level=70,
        exp=102572,
        gold=58900};

get(71) ->
    #warrior_level_cfg{
        level=71,
        exp=106331,
        gold=59750};

get(72) ->
    #warrior_level_cfg{
        level=72,
        exp=110149,
        gold=60600};

get(73) ->
    #warrior_level_cfg{
        level=73,
        exp=114026,
        gold=61450};

get(74) ->
    #warrior_level_cfg{
        level=74,
        exp=117963,
        gold=62300};

get(75) ->
    #warrior_level_cfg{
        level=75,
        exp=121961,
        gold=63150};

get(76) ->
    #warrior_level_cfg{
        level=76,
        exp=126020,
        gold=64000};

get(77) ->
    #warrior_level_cfg{
        level=77,
        exp=130140,
        gold=64850};

get(78) ->
    #warrior_level_cfg{
        level=78,
        exp=134322,
        gold=65700};

get(79) ->
    #warrior_level_cfg{
        level=79,
        exp=138567,
        gold=66550};

get(80) ->
    #warrior_level_cfg{
        level=80,
        exp=142875,
        gold=67400};

get(81) ->
    #warrior_level_cfg{
        level=81,
        exp=147446,
        gold=68250};

get(82) ->
    #warrior_level_cfg{
        level=82,
        exp=152081,
        gold=69100};

get(83) ->
    #warrior_level_cfg{
        level=83,
        exp=156781,
        gold=69950};

get(84) ->
    #warrior_level_cfg{
        level=84,
        exp=161546,
        gold=70800};

get(85) ->
    #warrior_level_cfg{
        level=85,
        exp=166376,
        gold=71650};

get(86) ->
    #warrior_level_cfg{
        level=86,
        exp=171272,
        gold=72500};

get(87) ->
    #warrior_level_cfg{
        level=87,
        exp=176235,
        gold=73350};

get(88) ->
    #warrior_level_cfg{
        level=88,
        exp=181265,
        gold=74200};

get(89) ->
    #warrior_level_cfg{
        level=89,
        exp=186362,
        gold=75050};

get(90) ->
    #warrior_level_cfg{
        level=90,
        exp=191527,
        gold=75900};

get(91) ->
    #warrior_level_cfg{
        level=91,
        exp=196961,
        gold=76750};

get(92) ->
    #warrior_level_cfg{
        level=92,
        exp=202464,
        gold=77600};

get(93) ->
    #warrior_level_cfg{
        level=93,
        exp=208037,
        gold=78450};

get(94) ->
    #warrior_level_cfg{
        level=94,
        exp=213680,
        gold=79300};

get(95) ->
    #warrior_level_cfg{
        level=95,
        exp=219393,
        gold=80150};

get(96) ->
    #warrior_level_cfg{
        level=96,
        exp=225177,
        gold=81000};

get(97) ->
    #warrior_level_cfg{
        level=97,
        exp=231033,
        gold=81850};

get(98) ->
    #warrior_level_cfg{
        level=98,
        exp=236961,
        gold=82700};

get(99) ->
    #warrior_level_cfg{
        level=99,
        exp=242961,
        gold=83550};

get(100) ->
    #warrior_level_cfg{
        level=100,
        exp=249034,
        gold=84400};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100].

