-module(challenge_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(81001) ->
    #challenge_cfg{
        type=1,
        task_id=81001,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=21,
        event=80,
        check_tag="compare",
        process=1,
        awards=["16-1"],
        show=0};

get(81002) ->
    #challenge_cfg{
        type=1,
        task_id=81002,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=22,
        event=60,
        check_tag="compare",
        process=1,
        awards=["16-1"],
        show=0};

get(81003) ->
    #challenge_cfg{
        type=1,
        task_id=81003,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=22,
        event=30,
        check_tag="compare",
        process=1,
        awards=["16-2"],
        show=0};

get(81004) ->
    #challenge_cfg{
        type=1,
        task_id=81004,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=23,
        event=3,
        check_tag="compare",
        process=1,
        awards=["16-1"],
        show=0};

get(81005) ->
    #challenge_cfg{
        type=1,
        task_id=81005,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=25,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-1"],
        show=0};

get(81006) ->
    #challenge_cfg{
        type=1,
        task_id=81006,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=26,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-1"],
        show=0};

get(81007) ->
    #challenge_cfg{
        type=1,
        task_id=81007,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=23,
        event=3,
        check_tag="compare",
        process=2,
        awards=["16-3"],
        show=0};

get(81008) ->
    #challenge_cfg{
        type=1,
        task_id=81008,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=25,
        event=0,
        check_tag="add",
        process=2,
        awards=["16-3"],
        show=0};

get(81009) ->
    #challenge_cfg{
        type=1,
        task_id=81009,
        func_id=1001,
        min_level=10,
        max_level=0,
        event_type=26,
        event=0,
        check_tag="add",
        process=2,
        awards=["16-3"],
        show=0};

get(81010) ->
    #challenge_cfg{
        type=1,
        task_id=81010,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=34,
        event=0,
        check_tag="add",
        process=30,
        awards=["16-2"],
        show=0};

get(81011) ->
    #challenge_cfg{
        type=1,
        task_id=81011,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=35,
        event=0,
        check_tag="add",
        process=30,
        awards=["16-2"],
        show=0};

get(81012) ->
    #challenge_cfg{
        type=1,
        task_id=81012,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=36,
        event=0,
        check_tag="add",
        process=30,
        awards=["16-2"],
        show=0};

get(81013) ->
    #challenge_cfg{
        type=1,
        task_id=81013,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=37,
        event=0,
        check_tag="add",
        process=30,
        awards=["16-2"],
        show=0};

get(81014) ->
    #challenge_cfg{
        type=1,
        task_id=81014,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=38,
        event=0,
        check_tag="add",
        process=30,
        awards=["16-2"],
        show=0};

get(81015) ->
    #challenge_cfg{
        type=1,
        task_id=81015,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=34,
        event=0,
        check_tag="add",
        process=50,
        awards=["17-1"],
        show=0};

get(81016) ->
    #challenge_cfg{
        type=1,
        task_id=81016,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=35,
        event=0,
        check_tag="add",
        process=50,
        awards=["17-1"],
        show=0};

get(81017) ->
    #challenge_cfg{
        type=1,
        task_id=81017,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=36,
        event=0,
        check_tag="add",
        process=50,
        awards=["17-1"],
        show=0};

get(81018) ->
    #challenge_cfg{
        type=1,
        task_id=81018,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=37,
        event=0,
        check_tag="add",
        process=50,
        awards=["17-1"],
        show=0};

get(81019) ->
    #challenge_cfg{
        type=1,
        task_id=81019,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=38,
        event=0,
        check_tag="add",
        process=50,
        awards=["17-1"],
        show=0};

get(81020) ->
    #challenge_cfg{
        type=1,
        task_id=81020,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=40,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-1"],
        show=0};

get(81021) ->
    #challenge_cfg{
        type=1,
        task_id=81021,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=42,
        event=0,
        check_tag="add",
        process=3,
        awards=["16-1"],
        show=0};

get(81022) ->
    #challenge_cfg{
        type=1,
        task_id=81022,
        func_id=1035,
        min_level=10,
        max_level=0,
        event_type=45,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-2"],
        show=0};

get(81023) ->
    #challenge_cfg{
        type=1,
        task_id=81023,
        func_id=1036,
        min_level=10,
        max_level=0,
        event_type=46,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-2"],
        show=0};

get(81024) ->
    #challenge_cfg{
        type=1,
        task_id=81024,
        func_id=1038,
        min_level=10,
        max_level=0,
        event_type=47,
        event=0,
        check_tag="add",
        process=2,
        awards=["16-5"],
        show=0};

get(81025) ->
    #challenge_cfg{
        type=1,
        task_id=81025,
        func_id=1037,
        min_level=10,
        max_level=0,
        event_type=48,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-2"],
        show=0};

get(81026) ->
    #challenge_cfg{
        type=1,
        task_id=81026,
        func_id=1017,
        min_level=10,
        max_level=35,
        event_type=50,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-5"],
        show=0};

get(81027) ->
    #challenge_cfg{
        type=1,
        task_id=81027,
        func_id=1038,
        min_level=10,
        max_level=0,
        event_type=51,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-5"],
        show=0};

get(81028) ->
    #challenge_cfg{
        type=1,
        task_id=81028,
        func_id=1025,
        min_level=10,
        max_level=0,
        event_type=53,
        event=0,
        check_tag="add",
        process=2,
        awards=["16-2"],
        show=0};

get(81029) ->
    #challenge_cfg{
        type=1,
        task_id=81029,
        func_id=1058,
        min_level=10,
        max_level=0,
        event_type=54,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-1"],
        show=0};

get(81030) ->
    #challenge_cfg{
        type=1,
        task_id=81030,
        func_id=1026,
        min_level=10,
        max_level=0,
        event_type=55,
        event=0,
        check_tag="add",
        process=1,
        awards=["16-1"],
        show=0};

get(81031) ->
    #challenge_cfg{
        type=1,
        task_id=81031,
        func_id=1001,
        min_level=20,
        max_level=25,
        event_type=58,
        event=73000,
        check_tag="compare",
        process=3,
        awards=["16-5"],
        show=0};

get(81032) ->
    #challenge_cfg{
        type=1,
        task_id=81032,
        func_id=1001,
        min_level=20,
        max_level=25,
        event_type=58,
        event=73001,
        check_tag="compare",
        process=3,
        awards=["16-5"],
        show=0};

get(81033) ->
    #challenge_cfg{
        type=1,
        task_id=81033,
        func_id=1001,
        min_level=20,
        max_level=25,
        event_type=58,
        event=73002,
        check_tag="compare",
        process=3,
        awards=["16-5"],
        show=0};

get(81034) ->
    #challenge_cfg{
        type=1,
        task_id=81034,
        func_id=1001,
        min_level=40,
        max_level=25,
        event_type=58,
        event=73003,
        check_tag="compare",
        process=3,
        awards=["17-1"],
        show=0};

get(81035) ->
    #challenge_cfg{
        type=1,
        task_id=81035,
        func_id=1001,
        min_level=40,
        max_level=25,
        event_type=58,
        event=73004,
        check_tag="compare",
        process=3,
        awards=["17-1"],
        show=0};

get(81036) ->
    #challenge_cfg{
        type=1,
        task_id=81036,
        func_id=1001,
        min_level=40,
        max_level=25,
        event_type=58,
        event=73005,
        check_tag="compare",
        process=3,
        awards=["17-1"],
        show=0};

get(81037) ->
    #challenge_cfg{
        type=1,
        task_id=81037,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73051,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81038) ->
    #challenge_cfg{
        type=1,
        task_id=81038,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73052,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81039) ->
    #challenge_cfg{
        type=1,
        task_id=81039,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73053,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81040) ->
    #challenge_cfg{
        type=1,
        task_id=81040,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73054,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81041) ->
    #challenge_cfg{
        type=1,
        task_id=81041,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73055,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81042) ->
    #challenge_cfg{
        type=1,
        task_id=81042,
        func_id=1001,
        min_level=32,
        max_level=60,
        event_type=58,
        event=73056,
        check_tag="compare",
        process=3,
        awards=["16-2"],
        show=0};

get(81044) ->
    #challenge_cfg{
        type=1,
        task_id=81044,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73058,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(81045) ->
    #challenge_cfg{
        type=1,
        task_id=81045,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73059,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(81046) ->
    #challenge_cfg{
        type=1,
        task_id=81046,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73060,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(81047) ->
    #challenge_cfg{
        type=1,
        task_id=81047,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73061,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(81048) ->
    #challenge_cfg{
        type=1,
        task_id=81048,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73062,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(81049) ->
    #challenge_cfg{
        type=1,
        task_id=81049,
        func_id=1001,
        min_level=35,
        max_level=45,
        event_type=58,
        event=73063,
        check_tag="compare",
        process=3,
        awards=["16-3"],
        show=0};

get(82083) ->
    #challenge_cfg{
        type=2,
        task_id=82083,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31000,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82084) ->
    #challenge_cfg{
        type=2,
        task_id=82084,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31001,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82085) ->
    #challenge_cfg{
        type=2,
        task_id=82085,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31002,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82086) ->
    #challenge_cfg{
        type=2,
        task_id=82086,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31003,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82087) ->
    #challenge_cfg{
        type=2,
        task_id=82087,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31004,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82088) ->
    #challenge_cfg{
        type=2,
        task_id=82088,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31005,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82089) ->
    #challenge_cfg{
        type=2,
        task_id=82089,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31006,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82090) ->
    #challenge_cfg{
        type=2,
        task_id=82090,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31007,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82091) ->
    #challenge_cfg{
        type=2,
        task_id=82091,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31008,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82092) ->
    #challenge_cfg{
        type=2,
        task_id=82092,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31009,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82093) ->
    #challenge_cfg{
        type=2,
        task_id=82093,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31010,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82094) ->
    #challenge_cfg{
        type=2,
        task_id=82094,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31011,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82095) ->
    #challenge_cfg{
        type=2,
        task_id=82095,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31012,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82096) ->
    #challenge_cfg{
        type=2,
        task_id=82096,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31013,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82097) ->
    #challenge_cfg{
        type=2,
        task_id=82097,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31014,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82098) ->
    #challenge_cfg{
        type=2,
        task_id=82098,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31015,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82099) ->
    #challenge_cfg{
        type=2,
        task_id=82099,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31016,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82100) ->
    #challenge_cfg{
        type=2,
        task_id=82100,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31017,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82101) ->
    #challenge_cfg{
        type=2,
        task_id=82101,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31018,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82102) ->
    #challenge_cfg{
        type=2,
        task_id=82102,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31019,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82103) ->
    #challenge_cfg{
        type=2,
        task_id=82103,
        func_id=1044,
        min_level=10,
        max_level=0,
        event_type=24,
        event=31020,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82104) ->
    #challenge_cfg{
        type=2,
        task_id=82104,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32000,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82105) ->
    #challenge_cfg{
        type=2,
        task_id=82105,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32001,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82106) ->
    #challenge_cfg{
        type=2,
        task_id=82106,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32002,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82107) ->
    #challenge_cfg{
        type=2,
        task_id=82107,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32003,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82108) ->
    #challenge_cfg{
        type=2,
        task_id=82108,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32004,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82109) ->
    #challenge_cfg{
        type=2,
        task_id=82109,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32005,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82110) ->
    #challenge_cfg{
        type=2,
        task_id=82110,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32006,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82111) ->
    #challenge_cfg{
        type=2,
        task_id=82111,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32007,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82112) ->
    #challenge_cfg{
        type=2,
        task_id=82112,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32008,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82113) ->
    #challenge_cfg{
        type=2,
        task_id=82113,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32009,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82114) ->
    #challenge_cfg{
        type=2,
        task_id=82114,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32010,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82115) ->
    #challenge_cfg{
        type=2,
        task_id=82115,
        func_id=1045,
        min_level=10,
        max_level=0,
        event_type=24,
        event=32011,
        check_tag="add",
        process=1,
        awards=["5-20"],
        show=0};

get(82005) ->
    #challenge_cfg{
        type=2,
        task_id=82005,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=3,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82006) ->
    #challenge_cfg{
        type=2,
        task_id=82006,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=4,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82007) ->
    #challenge_cfg{
        type=2,
        task_id=82007,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=5,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82008) ->
    #challenge_cfg{
        type=2,
        task_id=82008,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=6,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82009) ->
    #challenge_cfg{
        type=2,
        task_id=82009,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=7,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82010) ->
    #challenge_cfg{
        type=2,
        task_id=82010,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=8,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82011) ->
    #challenge_cfg{
        type=2,
        task_id=82011,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=9,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82012) ->
    #challenge_cfg{
        type=2,
        task_id=82012,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=27,
        event=10,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82013) ->
    #challenge_cfg{
        type=2,
        task_id=82013,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72004,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82014) ->
    #challenge_cfg{
        type=2,
        task_id=82014,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72014,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82015) ->
    #challenge_cfg{
        type=2,
        task_id=82015,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72024,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82016) ->
    #challenge_cfg{
        type=2,
        task_id=82016,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72034,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82017) ->
    #challenge_cfg{
        type=2,
        task_id=82017,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72044,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82018) ->
    #challenge_cfg{
        type=2,
        task_id=82018,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72054,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82019) ->
    #challenge_cfg{
        type=2,
        task_id=82019,
        func_id=1043,
        min_level=10,
        max_level=0,
        event_type=28,
        event=72064,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82020) ->
    #challenge_cfg{
        type=2,
        task_id=82020,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=29,
        event=100,
        check_tag="compare",
        process=100,
        awards=["4-10000"],
        show=1};

get(82021) ->
    #challenge_cfg{
        type=2,
        task_id=82021,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=29,
        event=300,
        check_tag="compare",
        process=300,
        awards=["4-20000"],
        show=1};

get(82022) ->
    #challenge_cfg{
        type=2,
        task_id=82022,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=29,
        event=1000,
        check_tag="compare",
        process=1000,
        awards=["4-50000"],
        show=1};

get(82023) ->
    #challenge_cfg{
        type=2,
        task_id=82023,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=30,
        event=100,
        check_tag="compare",
        process=100,
        awards=["4-10000"],
        show=1};

get(82024) ->
    #challenge_cfg{
        type=2,
        task_id=82024,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=30,
        event=300,
        check_tag="compare",
        process=300,
        awards=["4-20000"],
        show=1};

get(82025) ->
    #challenge_cfg{
        type=2,
        task_id=82025,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=30,
        event=1000,
        check_tag="compare",
        process=1000,
        awards=["4-50000"],
        show=1};

get(82026) ->
    #challenge_cfg{
        type=2,
        task_id=82026,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=31,
        event=100,
        check_tag="compare",
        process=100,
        awards=["4-10000"],
        show=1};

get(82027) ->
    #challenge_cfg{
        type=2,
        task_id=82027,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=31,
        event=300,
        check_tag="compare",
        process=300,
        awards=["4-20000"],
        show=1};

get(82028) ->
    #challenge_cfg{
        type=2,
        task_id=82028,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=31,
        event=1000,
        check_tag="compare",
        process=1000,
        awards=["4-50000"],
        show=1};

get(82029) ->
    #challenge_cfg{
        type=2,
        task_id=82029,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=32,
        event=100,
        check_tag="compare",
        process=100,
        awards=["4-10000"],
        show=1};

get(82030) ->
    #challenge_cfg{
        type=2,
        task_id=82030,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=32,
        event=300,
        check_tag="compare",
        process=300,
        awards=["4-20000"],
        show=1};

get(82031) ->
    #challenge_cfg{
        type=2,
        task_id=82031,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=32,
        event=1000,
        check_tag="compare",
        process=1000,
        awards=["4-50000"],
        show=1};

get(82032) ->
    #challenge_cfg{
        type=2,
        task_id=82032,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=33,
        event=100,
        check_tag="compare",
        process=100,
        awards=["4-10000"],
        show=1};

get(82033) ->
    #challenge_cfg{
        type=2,
        task_id=82033,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=33,
        event=300,
        check_tag="compare",
        process=300,
        awards=["4-20000"],
        show=1};

get(82034) ->
    #challenge_cfg{
        type=2,
        task_id=82034,
        func_id=1022,
        min_level=10,
        max_level=0,
        event_type=33,
        event=1000,
        check_tag="compare",
        process=1000,
        awards=["4-50000"],
        show=1};

get(82042) ->
    #challenge_cfg{
        type=2,
        task_id=82042,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=8,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82043) ->
    #challenge_cfg{
        type=2,
        task_id=82043,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=16,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82044) ->
    #challenge_cfg{
        type=2,
        task_id=82044,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=24,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82045) ->
    #challenge_cfg{
        type=2,
        task_id=82045,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=32,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82046) ->
    #challenge_cfg{
        type=2,
        task_id=82046,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=40,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82047) ->
    #challenge_cfg{
        type=2,
        task_id=82047,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=48,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82048) ->
    #challenge_cfg{
        type=2,
        task_id=82048,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=56,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82049) ->
    #challenge_cfg{
        type=2,
        task_id=82049,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=64,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82050) ->
    #challenge_cfg{
        type=2,
        task_id=82050,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=72,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82051) ->
    #challenge_cfg{
        type=2,
        task_id=82051,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=80,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82052) ->
    #challenge_cfg{
        type=2,
        task_id=82052,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=88,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82053) ->
    #challenge_cfg{
        type=2,
        task_id=82053,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=96,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82054) ->
    #challenge_cfg{
        type=2,
        task_id=82054,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=104,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82055) ->
    #challenge_cfg{
        type=2,
        task_id=82055,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=112,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82056) ->
    #challenge_cfg{
        type=2,
        task_id=82056,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=120,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82057) ->
    #challenge_cfg{
        type=2,
        task_id=82057,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=128,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82058) ->
    #challenge_cfg{
        type=2,
        task_id=82058,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=136,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82059) ->
    #challenge_cfg{
        type=2,
        task_id=82059,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=144,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82060) ->
    #challenge_cfg{
        type=2,
        task_id=82060,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=152,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82061) ->
    #challenge_cfg{
        type=2,
        task_id=82061,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=160,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82062) ->
    #challenge_cfg{
        type=2,
        task_id=82062,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=168,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82063) ->
    #challenge_cfg{
        type=2,
        task_id=82063,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=176,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82064) ->
    #challenge_cfg{
        type=2,
        task_id=82064,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=184,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82065) ->
    #challenge_cfg{
        type=2,
        task_id=82065,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=192,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82066) ->
    #challenge_cfg{
        type=2,
        task_id=82066,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=200,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82067) ->
    #challenge_cfg{
        type=2,
        task_id=82067,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=208,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82068) ->
    #challenge_cfg{
        type=2,
        task_id=82068,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=216,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82069) ->
    #challenge_cfg{
        type=2,
        task_id=82069,
        func_id=1019,
        min_level=10,
        max_level=0,
        event_type=39,
        event=224,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82070) ->
    #challenge_cfg{
        type=2,
        task_id=82070,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=41,
        event=3,
        check_tag="add",
        process=1,
        awards=["4-5000"],
        show=0};

get(82071) ->
    #challenge_cfg{
        type=2,
        task_id=82071,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=41,
        event=4,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82072) ->
    #challenge_cfg{
        type=2,
        task_id=82072,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=41,
        event=5,
        check_tag="add",
        process=1,
        awards=["4-50000"],
        show=0};

get(82073) ->
    #challenge_cfg{
        type=2,
        task_id=82073,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=44,
        event=2,
        check_tag="add",
        process=1,
        awards=["4-5000"],
        show=0};

get(82074) ->
    #challenge_cfg{
        type=2,
        task_id=82074,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=44,
        event=3,
        check_tag="add",
        process=1,
        awards=["4-10000"],
        show=0};

get(82075) ->
    #challenge_cfg{
        type=2,
        task_id=82075,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=44,
        event=4,
        check_tag="add",
        process=1,
        awards=["4-20000"],
        show=0};

get(82076) ->
    #challenge_cfg{
        type=2,
        task_id=82076,
        func_id=1031,
        min_level=10,
        max_level=0,
        event_type=44,
        event=5,
        check_tag="add",
        process=1,
        awards=["4-50000"],
        show=0};

get(82077) ->
    #challenge_cfg{
        type=2,
        task_id=82077,
        func_id=1017,
        min_level=10,
        max_level=0,
        event_type=49,
        event=0,
        check_tag="add",
        process=10,
        awards=["5-10"],
        show=0};

get(82078) ->
    #challenge_cfg{
        type=2,
        task_id=82078,
        func_id=1017,
        min_level=10,
        max_level=0,
        event_type=49,
        event=0,
        check_tag="add",
        process=15,
        awards=["5-10"],
        show=0};

get(82079) ->
    #challenge_cfg{
        type=2,
        task_id=82079,
        func_id=1017,
        min_level=10,
        max_level=0,
        event_type=49,
        event=0,
        check_tag="add",
        process=20,
        awards=["5-10"],
        show=0};

get(82001) ->
    #challenge_cfg{
        type=2,
        task_id=82001,
        func_id=1028,
        min_level=40,
        max_level=0,
        event_type=52,
        event=0,
        check_tag="add",
        process=1,
        awards=["5-10"],
        show=0};

get(82002) ->
    #challenge_cfg{
        type=2,
        task_id=82002,
        func_id=1028,
        min_level=40,
        max_level=0,
        event_type=52,
        event=0,
        check_tag="add",
        process=3,
        awards=["5-20"],
        show=0};

get(82003) ->
    #challenge_cfg{
        type=2,
        task_id=82003,
        func_id=1028,
        min_level=40,
        max_level=0,
        event_type=52,
        event=0,
        check_tag="add",
        process=5,
        awards=["5-20"],
        show=0};

get(82004) ->
    #challenge_cfg{
        type=2,
        task_id=82004,
        func_id=1028,
        min_level=40,
        max_level=0,
        event_type=52,
        event=0,
        check_tag="add",
        process=10,
        awards=["5-30"],
        show=0};

get(82080) ->
    #challenge_cfg{
        type=2,
        task_id=82080,
        func_id=1029,
        min_level=10,
        max_level=0,
        event_type=56,
        event=50,
        check_tag="compare",
        process=1,
        awards=["5-10"],
        show=0};

get(82081) ->
    #challenge_cfg{
        type=2,
        task_id=82081,
        func_id=1029,
        min_level=10,
        max_level=0,
        event_type=56,
        event=75,
        check_tag="compare",
        process=1,
        awards=["5-10"],
        show=0};

get(82082) ->
    #challenge_cfg{
        type=2,
        task_id=82082,
        func_id=1029,
        min_level=10,
        max_level=0,
        event_type=56,
        event=100,
        check_tag="compare",
        process=1,
        awards=["5-10"],
        show=0};

get(82035) ->
    #challenge_cfg{
        type=2,
        task_id=82035,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=1,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82036) ->
    #challenge_cfg{
        type=2,
        task_id=82036,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=2,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82037) ->
    #challenge_cfg{
        type=2,
        task_id=82037,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=3,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82038) ->
    #challenge_cfg{
        type=2,
        task_id=82038,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=4,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82039) ->
    #challenge_cfg{
        type=2,
        task_id=82039,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=5,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82040) ->
    #challenge_cfg{
        type=2,
        task_id=82040,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=6,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(82041) ->
    #challenge_cfg{
        type=2,
        task_id=82041,
        func_id=1018,
        min_level=10,
        max_level=0,
        event_type=57,
        event=7,
        check_tag="add",
        process=1,
        awards=["5-50"],
        show=0};

get(_) -> false.

get_all() ->
    [81001,81002,81003,81004,81005,81006,81007,81008,81009,81010,81011,81012,81013,81014,81015,81016,81017,81018,81019,81020,81021,81022,81023,81024,81025,81026,81027,81028,81029,81030,81031,81032,81033,81034,81035,81036,81037,81038,81039,81040,81041,81042,81044,81045,81046,81047,81048,81049,82083,82084,82085,82086,82087,82088,82089,82090,82091,82092,82093,82094,82095,82096,82097,82098,82099,82100,82101,82102,82103,82104,82105,82106,82107,82108,82109,82110,82111,82112,82113,82114,82115,82005,82006,82007,82008,82009,82010,82011,82012,82013,82014,82015,82016,82017,82018,82019,82020,82021,82022,82023,82024,82025,82026,82027,82028,82029,82030,82031,82032,82033,82034,82042,82043,82044,82045,82046,82047,82048,82049,82050,82051,82052,82053,82054,82055,82056,82057,82058,82059,82060,82061,82062,82063,82064,82065,82066,82067,82068,82069,82070,82071,82072,82073,82074,82075,82076,82077,82078,82079,82001,82002,82003,82004,82080,82081,82082,82035,82036,82037,82038,82039,82040,82041].

