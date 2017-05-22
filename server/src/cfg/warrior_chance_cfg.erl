-module(warrior_chance_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({10001,1}) ->
    #warrior_chance_cfg{
        id=10001,
        id2=1,
        count_type=1,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10002,1}) ->
    #warrior_chance_cfg{
        id=10002,
        id2=1,
        count_type=1,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10003,1}) ->
    #warrior_chance_cfg{
        id=10003,
        id2=1,
        count_type=1,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10004,1}) ->
    #warrior_chance_cfg{
        id=10004,
        id2=1,
        count_type=1,
        chance=200,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10005,1}) ->
    #warrior_chance_cfg{
        id=10005,
        id2=1,
        count_type=1,
        chance=108,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10006,1}) ->
    #warrior_chance_cfg{
        id=10006,
        id2=1,
        count_type=1,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10007,1}) ->
    #warrior_chance_cfg{
        id=10007,
        id2=1,
        count_type=1,
        chance=30,
        add_chance=15,
        set_zero=1,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10008,1}) ->
    #warrior_chance_cfg{
        id=10008,
        id2=1,
        count_type=1,
        chance=18,
        add_chance=9,
        set_zero=1,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10009,1}) ->
    #warrior_chance_cfg{
        id=10009,
        id2=1,
        count_type=1,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10010,1}) ->
    #warrior_chance_cfg{
        id=10010,
        id2=1,
        count_type=1,
        chance=6,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10011,1}) ->
    #warrior_chance_cfg{
        id=10011,
        id2=1,
        count_type=1,
        chance=1,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10012,1}) ->
    #warrior_chance_cfg{
        id=10012,
        id2=1,
        count_type=1,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10013,1}) ->
    #warrior_chance_cfg{
        id=10013,
        id2=1,
        count_type=1,
        chance=60,
        add_chance=0,
        set_zero=0,
        ws=[130343]};

get({10014,1}) ->
    #warrior_chance_cfg{
        id=10014,
        id2=1,
        count_type=1,
        chance=50,
        add_chance=0,
        set_zero=0,
        ws=[130344]};

get({10015,1}) ->
    #warrior_chance_cfg{
        id=10015,
        id2=1,
        count_type=1,
        chance=20,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10016,1}) ->
    #warrior_chance_cfg{
        id=10016,
        id2=1,
        count_type=1,
        chance=3,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10017,2}) ->
    #warrior_chance_cfg{
        id=10017,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10018,2}) ->
    #warrior_chance_cfg{
        id=10018,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10019,2}) ->
    #warrior_chance_cfg{
        id=10019,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10020,2}) ->
    #warrior_chance_cfg{
        id=10020,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10021,2}) ->
    #warrior_chance_cfg{
        id=10021,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10022,2}) ->
    #warrior_chance_cfg{
        id=10022,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10023,2}) ->
    #warrior_chance_cfg{
        id=10023,
        id2=2,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10024,2}) ->
    #warrior_chance_cfg{
        id=10024,
        id2=2,
        count_type=0,
        chance=72,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10025,2}) ->
    #warrior_chance_cfg{
        id=10025,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10026,2}) ->
    #warrior_chance_cfg{
        id=10026,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10027,2}) ->
    #warrior_chance_cfg{
        id=10027,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10028,2}) ->
    #warrior_chance_cfg{
        id=10028,
        id2=2,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10029,3}) ->
    #warrior_chance_cfg{
        id=10029,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10030,3}) ->
    #warrior_chance_cfg{
        id=10030,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10031,3}) ->
    #warrior_chance_cfg{
        id=10031,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10032,3}) ->
    #warrior_chance_cfg{
        id=10032,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10033,3}) ->
    #warrior_chance_cfg{
        id=10033,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10034,3}) ->
    #warrior_chance_cfg{
        id=10034,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10035,3}) ->
    #warrior_chance_cfg{
        id=10035,
        id2=3,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10036,3}) ->
    #warrior_chance_cfg{
        id=10036,
        id2=3,
        count_type=0,
        chance=72,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10037,3}) ->
    #warrior_chance_cfg{
        id=10037,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10038,3}) ->
    #warrior_chance_cfg{
        id=10038,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10039,3}) ->
    #warrior_chance_cfg{
        id=10039,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10040,3}) ->
    #warrior_chance_cfg{
        id=10040,
        id2=3,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10041,4}) ->
    #warrior_chance_cfg{
        id=10041,
        id2=4,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10042,4}) ->
    #warrior_chance_cfg{
        id=10042,
        id2=4,
        count_type=0,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10043,4}) ->
    #warrior_chance_cfg{
        id=10043,
        id2=4,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10044,4}) ->
    #warrior_chance_cfg{
        id=10044,
        id2=4,
        count_type=0,
        chance=200,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10045,4}) ->
    #warrior_chance_cfg{
        id=10045,
        id2=4,
        count_type=0,
        chance=108,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10046,4}) ->
    #warrior_chance_cfg{
        id=10046,
        id2=4,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10047,4}) ->
    #warrior_chance_cfg{
        id=10047,
        id2=4,
        count_type=0,
        chance=30,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10048,4}) ->
    #warrior_chance_cfg{
        id=10048,
        id2=4,
        count_type=0,
        chance=18,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10049,4}) ->
    #warrior_chance_cfg{
        id=10049,
        id2=4,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10050,4}) ->
    #warrior_chance_cfg{
        id=10050,
        id2=4,
        count_type=0,
        chance=3,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10051,4}) ->
    #warrior_chance_cfg{
        id=10051,
        id2=4,
        count_type=0,
        chance=1,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10052,4}) ->
    #warrior_chance_cfg{
        id=10052,
        id2=4,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10053,1}) ->
    #warrior_chance_cfg{
        id=10053,
        id2=1,
        count_type=0,
        chance=60,
        add_chance=0,
        set_zero=0,
        ws=[130343]};

get({10054,1}) ->
    #warrior_chance_cfg{
        id=10054,
        id2=1,
        count_type=0,
        chance=50,
        add_chance=0,
        set_zero=0,
        ws=[130344]};

get({10055,1}) ->
    #warrior_chance_cfg{
        id=10055,
        id2=1,
        count_type=0,
        chance=20,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10056,1}) ->
    #warrior_chance_cfg{
        id=10056,
        id2=1,
        count_type=0,
        chance=3,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10057,5}) ->
    #warrior_chance_cfg{
        id=10057,
        id2=5,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10058,5}) ->
    #warrior_chance_cfg{
        id=10058,
        id2=5,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10059,5}) ->
    #warrior_chance_cfg{
        id=10059,
        id2=5,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10060,5}) ->
    #warrior_chance_cfg{
        id=10060,
        id2=5,
        count_type=2,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10061,5}) ->
    #warrior_chance_cfg{
        id=10061,
        id2=5,
        count_type=2,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10062,5}) ->
    #warrior_chance_cfg{
        id=10062,
        id2=5,
        count_type=2,
        chance=16,
        add_chance=8,
        set_zero=0,
        ws=[130092]};

get({10063,5}) ->
    #warrior_chance_cfg{
        id=10063,
        id2=5,
        count_type=2,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10064,5}) ->
    #warrior_chance_cfg{
        id=10064,
        id2=5,
        count_type=2,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10065,5}) ->
    #warrior_chance_cfg{
        id=10065,
        id2=5,
        count_type=2,
        chance=12,
        add_chance=6,
        set_zero=0,
        ws=[130093]};

get({10066,5}) ->
    #warrior_chance_cfg{
        id=10066,
        id2=5,
        count_type=2,
        chance=64,
        add_chance=32,
        set_zero=1,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10067,5}) ->
    #warrior_chance_cfg{
        id=10067,
        id2=5,
        count_type=2,
        chance=18,
        add_chance=9,
        set_zero=1,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10068,5}) ->
    #warrior_chance_cfg{
        id=10068,
        id2=5,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10069,1}) ->
    #warrior_chance_cfg{
        id=10069,
        id2=1,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130343]};

get({10070,1}) ->
    #warrior_chance_cfg{
        id=10070,
        id2=1,
        count_type=2,
        chance=180,
        add_chance=0,
        set_zero=0,
        ws=[130344]};

get({10071,1}) ->
    #warrior_chance_cfg{
        id=10071,
        id2=1,
        count_type=2,
        chance=180,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10072,1}) ->
    #warrior_chance_cfg{
        id=10072,
        id2=1,
        count_type=2,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10073,6}) ->
    #warrior_chance_cfg{
        id=10073,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10074,6}) ->
    #warrior_chance_cfg{
        id=10074,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10075,6}) ->
    #warrior_chance_cfg{
        id=10075,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10076,6}) ->
    #warrior_chance_cfg{
        id=10076,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10077,6}) ->
    #warrior_chance_cfg{
        id=10077,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10078,6}) ->
    #warrior_chance_cfg{
        id=10078,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10079,6}) ->
    #warrior_chance_cfg{
        id=10079,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10080,6}) ->
    #warrior_chance_cfg{
        id=10080,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10081,6}) ->
    #warrior_chance_cfg{
        id=10081,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10082,6}) ->
    #warrior_chance_cfg{
        id=10082,
        id2=6,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10083,6}) ->
    #warrior_chance_cfg{
        id=10083,
        id2=6,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10084,6}) ->
    #warrior_chance_cfg{
        id=10084,
        id2=6,
        count_type=0,
        chance=10,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10085,7}) ->
    #warrior_chance_cfg{
        id=10085,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10086,7}) ->
    #warrior_chance_cfg{
        id=10086,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10087,7}) ->
    #warrior_chance_cfg{
        id=10087,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10088,7}) ->
    #warrior_chance_cfg{
        id=10088,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10089,7}) ->
    #warrior_chance_cfg{
        id=10089,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10090,7}) ->
    #warrior_chance_cfg{
        id=10090,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10091,7}) ->
    #warrior_chance_cfg{
        id=10091,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10092,7}) ->
    #warrior_chance_cfg{
        id=10092,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10093,7}) ->
    #warrior_chance_cfg{
        id=10093,
        id2=7,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10094,7}) ->
    #warrior_chance_cfg{
        id=10094,
        id2=7,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10095,7}) ->
    #warrior_chance_cfg{
        id=10095,
        id2=7,
        count_type=0,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10096,7}) ->
    #warrior_chance_cfg{
        id=10096,
        id2=7,
        count_type=0,
        chance=30,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10097,8}) ->
    #warrior_chance_cfg{
        id=10097,
        id2=8,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10098,8}) ->
    #warrior_chance_cfg{
        id=10098,
        id2=8,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10099,8}) ->
    #warrior_chance_cfg{
        id=10099,
        id2=8,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10100,8}) ->
    #warrior_chance_cfg{
        id=10100,
        id2=8,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10101,8}) ->
    #warrior_chance_cfg{
        id=10101,
        id2=8,
        count_type=0,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10102,8}) ->
    #warrior_chance_cfg{
        id=10102,
        id2=8,
        count_type=0,
        chance=16,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10103,8}) ->
    #warrior_chance_cfg{
        id=10103,
        id2=8,
        count_type=0,
        chance=240,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10104,8}) ->
    #warrior_chance_cfg{
        id=10104,
        id2=8,
        count_type=0,
        chance=120,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10105,8}) ->
    #warrior_chance_cfg{
        id=10105,
        id2=8,
        count_type=0,
        chance=12,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10106,8}) ->
    #warrior_chance_cfg{
        id=10106,
        id2=8,
        count_type=0,
        chance=64,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10107,8}) ->
    #warrior_chance_cfg{
        id=10107,
        id2=8,
        count_type=0,
        chance=18,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10108,8}) ->
    #warrior_chance_cfg{
        id=10108,
        id2=8,
        count_type=0,
        chance=10,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10109,1}) ->
    #warrior_chance_cfg{
        id=10109,
        id2=1,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130343]};

get({10110,1}) ->
    #warrior_chance_cfg{
        id=10110,
        id2=1,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130344]};

get({10111,1}) ->
    #warrior_chance_cfg{
        id=10111,
        id2=1,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10112,1}) ->
    #warrior_chance_cfg{
        id=10112,
        id2=1,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10113,9}) ->
    #warrior_chance_cfg{
        id=10113,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10114,9}) ->
    #warrior_chance_cfg{
        id=10114,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10115,9}) ->
    #warrior_chance_cfg{
        id=10115,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10116,9}) ->
    #warrior_chance_cfg{
        id=10116,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10117,9}) ->
    #warrior_chance_cfg{
        id=10117,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10118,9}) ->
    #warrior_chance_cfg{
        id=10118,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10119,9}) ->
    #warrior_chance_cfg{
        id=10119,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10120,9}) ->
    #warrior_chance_cfg{
        id=10120,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10121,9}) ->
    #warrior_chance_cfg{
        id=10121,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10122,9}) ->
    #warrior_chance_cfg{
        id=10122,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10123,9}) ->
    #warrior_chance_cfg{
        id=10123,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10124,9}) ->
    #warrior_chance_cfg{
        id=10124,
        id2=9,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10125,9}) ->
    #warrior_chance_cfg{
        id=10125,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130005, 130011, 130017, 130023, 130029, 130035, 130041, 130047]};

get({10126,9}) ->
    #warrior_chance_cfg{
        id=10126,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130053, 130059, 130065, 130071, 130077, 130101]};

get({10127,9}) ->
    #warrior_chance_cfg{
        id=10127,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130095]};

get({10128,9}) ->
    #warrior_chance_cfg{
        id=10128,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130006, 130012, 130018, 130024, 130030, 130036, 130042, 130048]};

get({10129,9}) ->
    #warrior_chance_cfg{
        id=10129,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130054, 130060, 130066, 130072, 130078, 130102]};

get({10130,9}) ->
    #warrior_chance_cfg{
        id=10130,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130096]};

get({10131,9}) ->
    #warrior_chance_cfg{
        id=10131,
        id2=9,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10132,9}) ->
    #warrior_chance_cfg{
        id=10132,
        id2=9,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10133,9}) ->
    #warrior_chance_cfg{
        id=10133,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130347]};

get({10134,9}) ->
    #warrior_chance_cfg{
        id=10134,
        id2=9,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130348]};

get({10135,10}) ->
    #warrior_chance_cfg{
        id=10135,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10136,10}) ->
    #warrior_chance_cfg{
        id=10136,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10137,10}) ->
    #warrior_chance_cfg{
        id=10137,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10138,10}) ->
    #warrior_chance_cfg{
        id=10138,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10139,10}) ->
    #warrior_chance_cfg{
        id=10139,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10140,10}) ->
    #warrior_chance_cfg{
        id=10140,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10141,10}) ->
    #warrior_chance_cfg{
        id=10141,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10142,10}) ->
    #warrior_chance_cfg{
        id=10142,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10143,10}) ->
    #warrior_chance_cfg{
        id=10143,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10144,10}) ->
    #warrior_chance_cfg{
        id=10144,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10145,10}) ->
    #warrior_chance_cfg{
        id=10145,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10146,10}) ->
    #warrior_chance_cfg{
        id=10146,
        id2=10,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10147,10}) ->
    #warrior_chance_cfg{
        id=10147,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130005, 130011, 130017, 130023, 130029, 130035, 130041, 130047]};

get({10148,10}) ->
    #warrior_chance_cfg{
        id=10148,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130053, 130059, 130065, 130071, 130077, 130101]};

get({10149,10}) ->
    #warrior_chance_cfg{
        id=10149,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130095]};

get({10150,10}) ->
    #warrior_chance_cfg{
        id=10150,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130006, 130012, 130018, 130024, 130030, 130036, 130042, 130048]};

get({10151,10}) ->
    #warrior_chance_cfg{
        id=10151,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130054, 130060, 130066, 130072, 130078, 130102]};

get({10152,10}) ->
    #warrior_chance_cfg{
        id=10152,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130096]};

get({10153,10}) ->
    #warrior_chance_cfg{
        id=10153,
        id2=10,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10154,10}) ->
    #warrior_chance_cfg{
        id=10154,
        id2=10,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10155,10}) ->
    #warrior_chance_cfg{
        id=10155,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130347]};

get({10156,10}) ->
    #warrior_chance_cfg{
        id=10156,
        id2=10,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130348]};

get({10157,11}) ->
    #warrior_chance_cfg{
        id=10157,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130001, 130007, 130013, 130019, 130025, 130031, 130037, 130043]};

get({10158,11}) ->
    #warrior_chance_cfg{
        id=10158,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130049, 130067, 130061, 130073, 130097, 130055]};

get({10159,11}) ->
    #warrior_chance_cfg{
        id=10159,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130091]};

get({10160,11}) ->
    #warrior_chance_cfg{
        id=10160,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130002, 130008, 130014, 130020, 130026, 130032, 130038, 130044]};

get({10161,11}) ->
    #warrior_chance_cfg{
        id=10161,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130050, 130068, 130062, 130074, 130098, 130056]};

get({10162,11}) ->
    #warrior_chance_cfg{
        id=10162,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130092]};

get({10163,11}) ->
    #warrior_chance_cfg{
        id=10163,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130003, 130009, 130015, 130021, 130027, 130033, 130039, 130045]};

get({10164,11}) ->
    #warrior_chance_cfg{
        id=10164,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130051, 130069, 130063, 130075, 130099, 130057]};

get({10165,11}) ->
    #warrior_chance_cfg{
        id=10165,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130093]};

get({10166,11}) ->
    #warrior_chance_cfg{
        id=10166,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130004, 130010, 130016, 130022, 130028, 130034, 130040, 130046]};

get({10167,11}) ->
    #warrior_chance_cfg{
        id=10167,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130052, 130070, 130064, 130076, 130100, 130058]};

get({10168,11}) ->
    #warrior_chance_cfg{
        id=10168,
        id2=11,
        count_type=0,
        chance=100,
        add_chance=0,
        set_zero=0,
        ws=[130094]};

get({10169,11}) ->
    #warrior_chance_cfg{
        id=10169,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130005, 130011, 130017, 130023, 130029, 130035, 130041, 130047]};

get({10170,11}) ->
    #warrior_chance_cfg{
        id=10170,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130053, 130059, 130065, 130071, 130077, 130101]};

get({10171,11}) ->
    #warrior_chance_cfg{
        id=10171,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130095]};

get({10172,11}) ->
    #warrior_chance_cfg{
        id=10172,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130006, 130012, 130018, 130024, 130030, 130036, 130042, 130048]};

get({10173,11}) ->
    #warrior_chance_cfg{
        id=10173,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130054, 130060, 130066, 130072, 130078, 130102]};

get({10174,11}) ->
    #warrior_chance_cfg{
        id=10174,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130096]};

get({10175,11}) ->
    #warrior_chance_cfg{
        id=10175,
        id2=11,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130345]};

get({10176,11}) ->
    #warrior_chance_cfg{
        id=10176,
        id2=11,
        count_type=0,
        chance=80,
        add_chance=0,
        set_zero=0,
        ws=[130346]};

get({10177,11}) ->
    #warrior_chance_cfg{
        id=10177,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130347]};

get({10178,11}) ->
    #warrior_chance_cfg{
        id=10178,
        id2=11,
        count_type=0,
        chance=0,
        add_chance=0,
        set_zero=0,
        ws=[130348]};

get(_) -> false.

get_all() ->
    [{10001,1},{10002,1},{10003,1},{10004,1},{10005,1},{10006,1},{10007,1},{10008,1},{10009,1},{10010,1},{10011,1},{10012,1},{10013,1},{10014,1},{10015,1},{10016,1},{10017,2},{10018,2},{10019,2},{10020,2},{10021,2},{10022,2},{10023,2},{10024,2},{10025,2},{10026,2},{10027,2},{10028,2},{10029,3},{10030,3},{10031,3},{10032,3},{10033,3},{10034,3},{10035,3},{10036,3},{10037,3},{10038,3},{10039,3},{10040,3},{10041,4},{10042,4},{10043,4},{10044,4},{10045,4},{10046,4},{10047,4},{10048,4},{10049,4},{10050,4},{10051,4},{10052,4},{10053,1},{10054,1},{10055,1},{10056,1},{10057,5},{10058,5},{10059,5},{10060,5},{10061,5},{10062,5},{10063,5},{10064,5},{10065,5},{10066,5},{10067,5},{10068,5},{10069,1},{10070,1},{10071,1},{10072,1},{10073,6},{10074,6},{10075,6},{10076,6},{10077,6},{10078,6},{10079,6},{10080,6},{10081,6},{10082,6},{10083,6},{10084,6},{10085,7},{10086,7},{10087,7},{10088,7},{10089,7},{10090,7},{10091,7},{10092,7},{10093,7},{10094,7},{10095,7},{10096,7},{10097,8},{10098,8},{10099,8},{10100,8},{10101,8},{10102,8},{10103,8},{10104,8},{10105,8},{10106,8},{10107,8},{10108,8},{10109,1},{10110,1},{10111,1},{10112,1},{10113,9},{10114,9},{10115,9},{10116,9},{10117,9},{10118,9},{10119,9},{10120,9},{10121,9},{10122,9},{10123,9},{10124,9},{10125,9},{10126,9},{10127,9},{10128,9},{10129,9},{10130,9},{10131,9},{10132,9},{10133,9},{10134,9},{10135,10},{10136,10},{10137,10},{10138,10},{10139,10},{10140,10},{10141,10},{10142,10},{10143,10},{10144,10},{10145,10},{10146,10},{10147,10},{10148,10},{10149,10},{10150,10},{10151,10},{10152,10},{10153,10},{10154,10},{10155,10},{10156,10},{10157,11},{10158,11},{10159,11},{10160,11},{10161,11},{10162,11},{10163,11},{10164,11},{10165,11},{10166,11},{10167,11},{10168,11},{10169,11},{10170,11},{10171,11},{10172,11},{10173,11},{10174,11},{10175,11},{10176,11},{10177,11},{10178,11}].

