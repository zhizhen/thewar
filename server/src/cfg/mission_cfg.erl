-module(mission_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(30001) ->
    #mission_cfg{
        mission_id=30001,
        type=1,
        need_level=1,
        need_mission=0,
        need_power=0,
        daily_times=0,
        awards_a=["1-390", "4-160", "12-200", "9-0"],
        awards_b=["1-360", "4-140", "12-180", "9-0"],
        awards_c=["1-330", "4-120", "12-160", "9-0"],
        awards_d=["1-300", "4-100", "12-140", "9-0"],
        awards_e=["1-270", "4-80", "12-120", "9-0"],
        awards_f=["1-240", "4-60", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30002) ->
    #mission_cfg{
        mission_id=30002,
        type=1,
        need_level=1,
        need_mission=0,
        need_power=5,
        daily_times=0,
        awards_a=["1-325", "4-160", "12-200", "9-0"],
        awards_b=["1-300", "4-140", "12-180", "9-0"],
        awards_c=["1-275", "4-120", "12-160", "9-0"],
        awards_d=["1-250", "4-100", "12-140", "9-0"],
        awards_e=["1-225", "4-80", "12-120", "9-0"],
        awards_f=["1-200", "4-60", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30003) ->
    #mission_cfg{
        mission_id=30003,
        type=1,
        need_level=1,
        need_mission=30002,
        need_power=5,
        daily_times=0,
        awards_a=["1-325", "4-160", "12-200", "9-0"],
        awards_b=["1-300", "4-140", "12-180", "9-0"],
        awards_c=["1-275", "4-120", "12-160", "9-0"],
        awards_d=["1-250", "4-100", "12-140", "9-0"],
        awards_e=["1-225", "4-80", "12-120", "9-0"],
        awards_f=["1-200", "4-60", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30004) ->
    #mission_cfg{
        mission_id=30004,
        type=1,
        need_level=1,
        need_mission=30003,
        need_power=5,
        daily_times=0,
        awards_a=["1-390", "4-240", "12-200", "9-0"],
        awards_b=["1-360", "4-210", "12-180", "9-0"],
        awards_c=["1-330", "4-180", "12-160", "9-0"],
        awards_d=["1-300", "4-150", "12-140", "9-0"],
        awards_e=["1-270", "4-120", "12-120", "9-0"],
        awards_f=["1-240", "4-90", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30005) ->
    #mission_cfg{
        mission_id=30005,
        type=1,
        need_level=1,
        need_mission=30004,
        need_power=5,
        daily_times=0,
        awards_a=["1-390", "4-240", "12-200", "9-0"],
        awards_b=["1-360", "4-210", "12-180", "9-0"],
        awards_c=["1-330", "4-180", "12-160", "9-0"],
        awards_d=["1-300", "4-150", "12-140", "9-0"],
        awards_e=["1-270", "4-120", "12-120", "9-0"],
        awards_f=["1-240", "4-90", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30006) ->
    #mission_cfg{
        mission_id=30006,
        type=1,
        need_level=1,
        need_mission=30005,
        need_power=5,
        daily_times=0,
        awards_a=["1-585", "4-240", "12-200", "9-0"],
        awards_b=["1-540", "4-210", "12-180", "9-0"],
        awards_c=["1-495", "4-180", "12-160", "9-0"],
        awards_d=["1-450", "4-150", "12-140", "9-0"],
        awards_e=["1-405", "4-120", "12-120", "9-0"],
        awards_f=["1-360", "4-90", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30007) ->
    #mission_cfg{
        mission_id=30007,
        type=1,
        need_level=1,
        need_mission=30006,
        need_power=5,
        daily_times=0,
        awards_a=["1-650", "4-320", "12-200", "9-0"],
        awards_b=["1-600", "4-280", "12-180", "9-0"],
        awards_c=["1-550", "4-240", "12-160", "9-0"],
        awards_d=["1-500", "4-200", "12-140", "9-0"],
        awards_e=["1-450", "4-160", "12-120", "9-0"],
        awards_f=["1-400", "4-120", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30008) ->
    #mission_cfg{
        mission_id=30008,
        type=1,
        need_level=1,
        need_mission=30007,
        need_power=5,
        daily_times=0,
        awards_a=["1-715", "4-320", "12-200", "9-0"],
        awards_b=["1-660", "4-280", "12-180", "9-0"],
        awards_c=["1-605", "4-240", "12-160", "9-0"],
        awards_d=["1-550", "4-200", "12-140", "9-0"],
        awards_e=["1-495", "4-160", "12-120", "9-0"],
        awards_f=["1-440", "4-120", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30009) ->
    #mission_cfg{
        mission_id=30009,
        type=1,
        need_level=1,
        need_mission=30008,
        need_power=5,
        daily_times=0,
        awards_a=["1-780", "4-320", "12-200", "9-0"],
        awards_b=["1-720", "4-280", "12-180", "9-0"],
        awards_c=["1-660", "4-240", "12-160", "9-0"],
        awards_d=["1-600", "4-200", "12-140", "9-0"],
        awards_e=["1-540", "4-160", "12-120", "9-0"],
        awards_f=["1-480", "4-120", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30010) ->
    #mission_cfg{
        mission_id=30010,
        type=1,
        need_level=1,
        need_mission=30009,
        need_power=5,
        daily_times=0,
        awards_a=["1-780", "4-400", "12-200", "9-0"],
        awards_b=["1-720", "4-350", "12-180", "9-0"],
        awards_c=["1-660", "4-300", "12-160", "9-0"],
        awards_d=["1-600", "4-250", "12-140", "9-0"],
        awards_e=["1-540", "4-200", "12-120", "9-0"],
        awards_f=["1-480", "4-150", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30011) ->
    #mission_cfg{
        mission_id=30011,
        type=1,
        need_level=1,
        need_mission=30010,
        need_power=5,
        daily_times=0,
        awards_a=["1-975", "4-400", "12-200", "9-0"],
        awards_b=["1-900", "4-350", "12-180", "9-0"],
        awards_c=["1-825", "4-300", "12-160", "9-0"],
        awards_d=["1-750", "4-250", "12-140", "9-0"],
        awards_e=["1-675", "4-200", "12-120", "9-0"],
        awards_f=["1-600", "4-150", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30012) ->
    #mission_cfg{
        mission_id=30012,
        type=1,
        need_level=1,
        need_mission=30011,
        need_power=5,
        daily_times=0,
        awards_a=["1-975", "4-400", "12-200", "9-0"],
        awards_b=["1-900", "4-350", "12-180", "9-0"],
        awards_c=["1-825", "4-300", "12-160", "9-0"],
        awards_d=["1-750", "4-250", "12-140", "9-0"],
        awards_e=["1-675", "4-200", "12-120", "9-0"],
        awards_f=["1-600", "4-150", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30013) ->
    #mission_cfg{
        mission_id=30013,
        type=1,
        need_level=1,
        need_mission=0,
        need_power=5,
        daily_times=0,
        awards_a=["1-1300", "4-480", "12-200", "9-0"],
        awards_b=["1-1200", "4-420", "12-180", "9-0"],
        awards_c=["1-1100", "4-360", "12-160", "9-0"],
        awards_d=["1-1000", "4-300", "12-140", "9-0"],
        awards_e=["1-900", "4-240", "12-120", "9-0"],
        awards_f=["1-800", "4-180", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30014) ->
    #mission_cfg{
        mission_id=30014,
        type=1,
        need_level=1,
        need_mission=30013,
        need_power=5,
        daily_times=0,
        awards_a=["1-1430", "4-480", "12-200", "9-0"],
        awards_b=["1-1320", "4-420", "12-180", "9-0"],
        awards_c=["1-1210", "4-360", "12-160", "9-0"],
        awards_d=["1-1100", "4-300", "12-140", "9-0"],
        awards_e=["1-990", "4-240", "12-120", "9-0"],
        awards_f=["1-880", "4-180", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30015) ->
    #mission_cfg{
        mission_id=30015,
        type=1,
        need_level=1,
        need_mission=30014,
        need_power=5,
        daily_times=0,
        awards_a=["1-1625", "4-480", "12-200", "9-0"],
        awards_b=["1-1500", "4-420", "12-180", "9-0"],
        awards_c=["1-1375", "4-360", "12-160", "9-0"],
        awards_d=["1-1250", "4-300", "12-140", "9-0"],
        awards_e=["1-1125", "4-240", "12-120", "9-0"],
        awards_f=["1-1000", "4-180", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30016) ->
    #mission_cfg{
        mission_id=30016,
        type=1,
        need_level=1,
        need_mission=30015,
        need_power=5,
        daily_times=0,
        awards_a=["1-1755", "4-560", "12-200", "9-0"],
        awards_b=["1-1620", "4-490", "12-180", "9-0"],
        awards_c=["1-1485", "4-420", "12-160", "9-0"],
        awards_d=["1-1350", "4-350", "12-140", "9-0"],
        awards_e=["1-1215", "4-280", "12-120", "9-0"],
        awards_f=["1-1080", "4-210", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30017) ->
    #mission_cfg{
        mission_id=30017,
        type=1,
        need_level=1,
        need_mission=30016,
        need_power=5,
        daily_times=0,
        awards_a=["1-1950", "4-560", "12-200", "9-0"],
        awards_b=["1-1800", "4-490", "12-180", "9-0"],
        awards_c=["1-1650", "4-420", "12-160", "9-0"],
        awards_d=["1-1500", "4-350", "12-140", "9-0"],
        awards_e=["1-1350", "4-280", "12-120", "9-0"],
        awards_f=["1-1200", "4-210", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30018) ->
    #mission_cfg{
        mission_id=30018,
        type=1,
        need_level=1,
        need_mission=30017,
        need_power=5,
        daily_times=0,
        awards_a=["1-2275", "4-560", "12-200", "9-0"],
        awards_b=["1-2100", "4-490", "12-180", "9-0"],
        awards_c=["1-1925", "4-420", "12-160", "9-0"],
        awards_d=["1-1750", "4-350", "12-140", "9-0"],
        awards_e=["1-1575", "4-280", "12-120", "9-0"],
        awards_f=["1-1400", "4-210", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30019) ->
    #mission_cfg{
        mission_id=30019,
        type=1,
        need_level=1,
        need_mission=30018,
        need_power=5,
        daily_times=0,
        awards_a=["1-2665", "4-640", "12-200", "9-0"],
        awards_b=["1-2460", "4-560", "12-180", "9-0"],
        awards_c=["1-2255", "4-480", "12-160", "9-0"],
        awards_d=["1-2050", "4-400", "12-140", "9-0"],
        awards_e=["1-1845", "4-320", "12-120", "9-0"],
        awards_f=["1-1640", "4-240", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30020) ->
    #mission_cfg{
        mission_id=30020,
        type=1,
        need_level=1,
        need_mission=30019,
        need_power=5,
        daily_times=0,
        awards_a=["1-2795", "4-640", "12-200", "9-0"],
        awards_b=["1-2580", "4-560", "12-180", "9-0"],
        awards_c=["1-2365", "4-480", "12-160", "9-0"],
        awards_d=["1-2150", "4-400", "12-140", "9-0"],
        awards_e=["1-1935", "4-320", "12-120", "9-0"],
        awards_f=["1-1720", "4-240", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30021) ->
    #mission_cfg{
        mission_id=30021,
        type=1,
        need_level=1,
        need_mission=30020,
        need_power=5,
        daily_times=0,
        awards_a=["1-2925", "4-640", "12-200", "9-0"],
        awards_b=["1-2700", "4-560", "12-180", "9-0"],
        awards_c=["1-2475", "4-480", "12-160", "9-0"],
        awards_d=["1-2250", "4-400", "12-140", "9-0"],
        awards_e=["1-2025", "4-320", "12-120", "9-0"],
        awards_f=["1-1800", "4-240", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30022) ->
    #mission_cfg{
        mission_id=30022,
        type=1,
        need_level=1,
        need_mission=30021,
        need_power=5,
        daily_times=0,
        awards_a=["1-2990", "4-720", "12-200", "9-0"],
        awards_b=["1-2760", "4-630", "12-180", "9-0"],
        awards_c=["1-2530", "4-540", "12-160", "9-0"],
        awards_d=["1-2300", "4-450", "12-140", "9-0"],
        awards_e=["1-2070", "4-360", "12-120", "9-0"],
        awards_f=["1-1840", "4-270", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30023) ->
    #mission_cfg{
        mission_id=30023,
        type=1,
        need_level=1,
        need_mission=30022,
        need_power=5,
        daily_times=0,
        awards_a=["1-3055", "4-720", "12-200", "9-0"],
        awards_b=["1-2820", "4-630", "12-180", "9-0"],
        awards_c=["1-2585", "4-540", "12-160", "9-0"],
        awards_d=["1-2350", "4-450", "12-140", "9-0"],
        awards_e=["1-2115", "4-360", "12-120", "9-0"],
        awards_f=["1-1880", "4-270", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30024) ->
    #mission_cfg{
        mission_id=30024,
        type=1,
        need_level=1,
        need_mission=30023,
        need_power=5,
        daily_times=0,
        awards_a=["1-3185", "4-720", "12-200", "9-0"],
        awards_b=["1-2940", "4-630", "12-180", "9-0"],
        awards_c=["1-2695", "4-540", "12-160", "9-0"],
        awards_d=["1-2450", "4-450", "12-140", "9-0"],
        awards_e=["1-2205", "4-360", "12-120", "9-0"],
        awards_f=["1-1960", "4-270", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30025) ->
    #mission_cfg{
        mission_id=30025,
        type=1,
        need_level=1,
        need_mission=30024,
        need_power=5,
        daily_times=0,
        awards_a=["1-3250", "4-800", "12-200", "9-0"],
        awards_b=["1-3000", "4-700", "12-180", "9-0"],
        awards_c=["1-2750", "4-600", "12-160", "9-0"],
        awards_d=["1-2500", "4-500", "12-140", "9-0"],
        awards_e=["1-2250", "4-400", "12-120", "9-0"],
        awards_f=["1-2000", "4-300", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30026) ->
    #mission_cfg{
        mission_id=30026,
        type=1,
        need_level=1,
        need_mission=30025,
        need_power=5,
        daily_times=0,
        awards_a=["1-3380", "4-800", "12-200", "9-0"],
        awards_b=["1-3120", "4-700", "12-180", "9-0"],
        awards_c=["1-2860", "4-600", "12-160", "9-0"],
        awards_d=["1-2600", "4-500", "12-140", "9-0"],
        awards_e=["1-2340", "4-400", "12-120", "9-0"],
        awards_f=["1-2080", "4-300", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30027) ->
    #mission_cfg{
        mission_id=30027,
        type=1,
        need_level=1,
        need_mission=30026,
        need_power=5,
        daily_times=0,
        awards_a=["1-3575", "4-800", "12-200", "9-0"],
        awards_b=["1-3300", "4-700", "12-180", "9-0"],
        awards_c=["1-3025", "4-600", "12-160", "9-0"],
        awards_d=["1-2750", "4-500", "12-140", "9-0"],
        awards_e=["1-2475", "4-400", "12-120", "9-0"],
        awards_f=["1-2200", "4-300", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30028) ->
    #mission_cfg{
        mission_id=30028,
        type=1,
        need_level=1,
        need_mission=30027,
        need_power=5,
        daily_times=0,
        awards_a=["1-3640", "4-880", "12-200", "9-0"],
        awards_b=["1-3360", "4-770", "12-180", "9-0"],
        awards_c=["1-3080", "4-660", "12-160", "9-0"],
        awards_d=["1-2800", "4-550", "12-140", "9-0"],
        awards_e=["1-2520", "4-440", "12-120", "9-0"],
        awards_f=["1-2240", "4-330", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30029) ->
    #mission_cfg{
        mission_id=30029,
        type=1,
        need_level=1,
        need_mission=30028,
        need_power=5,
        daily_times=0,
        awards_a=["1-3770", "4-880", "12-200", "9-0"],
        awards_b=["1-3480", "4-770", "12-180", "9-0"],
        awards_c=["1-3190", "4-660", "12-160", "9-0"],
        awards_d=["1-2900", "4-550", "12-140", "9-0"],
        awards_e=["1-2610", "4-440", "12-120", "9-0"],
        awards_f=["1-2320", "4-330", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30030) ->
    #mission_cfg{
        mission_id=30030,
        type=1,
        need_level=1,
        need_mission=30029,
        need_power=5,
        daily_times=0,
        awards_a=["1-3900", "4-800", "12-200", "9-0"],
        awards_b=["1-3600", "4-700", "12-180", "9-0"],
        awards_c=["1-3300", "4-600", "12-160", "9-0"],
        awards_d=["1-3000", "4-500", "12-140", "9-0"],
        awards_e=["1-2700", "4-400", "12-120", "9-0"],
        awards_f=["1-2400", "4-300", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30031) ->
    #mission_cfg{
        mission_id=30031,
        type=1,
        need_level=1,
        need_mission=0,
        need_power=5,
        daily_times=0,
        awards_a=["1-4225", "4-880", "12-200", "9-0"],
        awards_b=["1-3900", "4-770", "12-180", "9-0"],
        awards_c=["1-3575", "4-660", "12-160", "9-0"],
        awards_d=["1-3250", "4-550", "12-140", "9-0"],
        awards_e=["1-2925", "4-440", "12-120", "9-0"],
        awards_f=["1-2600", "4-330", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30032) ->
    #mission_cfg{
        mission_id=30032,
        type=1,
        need_level=1,
        need_mission=30031,
        need_power=5,
        daily_times=0,
        awards_a=["1-4225", "4-880", "12-200", "9-0"],
        awards_b=["1-3900", "4-770", "12-180", "9-0"],
        awards_c=["1-3575", "4-660", "12-160", "9-0"],
        awards_d=["1-3250", "4-550", "12-140", "9-0"],
        awards_e=["1-2925", "4-440", "12-120", "9-0"],
        awards_f=["1-2600", "4-330", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30033) ->
    #mission_cfg{
        mission_id=30033,
        type=1,
        need_level=1,
        need_mission=30032,
        need_power=5,
        daily_times=0,
        awards_a=["1-4550", "4-880", "12-200", "9-0", "73051-1"],
        awards_b=["1-4200", "4-770", "12-180", "9-0", "73051-1"],
        awards_c=["1-3850", "4-660", "12-160", "9-0", "73051-1"],
        awards_d=["1-3500", "4-550", "12-140", "9-0", "73051-1"],
        awards_e=["1-3150", "4-440", "12-120", "9-0", "73051-1"],
        awards_f=["1-2800", "4-330", "12-100", "9-0", "73051-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30034) ->
    #mission_cfg{
        mission_id=30034,
        type=1,
        need_level=1,
        need_mission=30033,
        need_power=5,
        daily_times=0,
        awards_a=["1-4745", "4-960", "12-200", "9-0"],
        awards_b=["1-4380", "4-840", "12-180", "9-0"],
        awards_c=["1-4015", "4-720", "12-160", "9-0"],
        awards_d=["1-3650", "4-600", "12-140", "9-0"],
        awards_e=["1-3285", "4-480", "12-120", "9-0"],
        awards_f=["1-2920", "4-360", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30035) ->
    #mission_cfg{
        mission_id=30035,
        type=1,
        need_level=1,
        need_mission=30034,
        need_power=5,
        daily_times=0,
        awards_a=["1-4745", "4-960", "12-200", "9-0"],
        awards_b=["1-4380", "4-840", "12-180", "9-0"],
        awards_c=["1-4015", "4-720", "12-160", "9-0"],
        awards_d=["1-3650", "4-600", "12-140", "9-0"],
        awards_e=["1-3285", "4-480", "12-120", "9-0"],
        awards_f=["1-2920", "4-360", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30036) ->
    #mission_cfg{
        mission_id=30036,
        type=1,
        need_level=1,
        need_mission=30035,
        need_power=5,
        daily_times=0,
        awards_a=["1-4940", "4-960", "12-200", "9-0", "73052-1"],
        awards_b=["1-4560", "4-840", "12-180", "9-0", "73052-1"],
        awards_c=["1-4180", "4-720", "12-160", "9-0", "73052-1"],
        awards_d=["1-3800", "4-600", "12-140", "9-0", "73052-1"],
        awards_e=["1-3420", "4-480", "12-120", "9-0", "73052-1"],
        awards_f=["1-3040", "4-360", "12-100", "9-0", "73052-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30037) ->
    #mission_cfg{
        mission_id=30037,
        type=1,
        need_level=1,
        need_mission=30036,
        need_power=5,
        daily_times=0,
        awards_a=["1-5135", "4-1040", "12-200", "9-0"],
        awards_b=["1-4740", "4-910", "12-180", "9-0"],
        awards_c=["1-4345", "4-780", "12-160", "9-0"],
        awards_d=["1-3950", "4-650", "12-140", "9-0"],
        awards_e=["1-3555", "4-520", "12-120", "9-0"],
        awards_f=["1-3160", "4-390", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30038) ->
    #mission_cfg{
        mission_id=30038,
        type=1,
        need_level=1,
        need_mission=30037,
        need_power=5,
        daily_times=0,
        awards_a=["1-5135", "4-1040", "12-200", "9-0"],
        awards_b=["1-4740", "4-910", "12-180", "9-0"],
        awards_c=["1-4345", "4-780", "12-160", "9-0"],
        awards_d=["1-3950", "4-650", "12-140", "9-0"],
        awards_e=["1-3555", "4-520", "12-120", "9-0"],
        awards_f=["1-3160", "4-390", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30039) ->
    #mission_cfg{
        mission_id=30039,
        type=1,
        need_level=1,
        need_mission=30038,
        need_power=5,
        daily_times=0,
        awards_a=["1-5330", "4-1040", "12-200", "9-0", "73053-1"],
        awards_b=["1-4920", "4-910", "12-180", "9-0", "73053-1"],
        awards_c=["1-4510", "4-780", "12-160", "9-0", "73053-1"],
        awards_d=["1-4100", "4-650", "12-140", "9-0", "73053-1"],
        awards_e=["1-3690", "4-520", "12-120", "9-0", "73053-1"],
        awards_f=["1-3280", "4-390", "12-100", "9-0", "73053-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30040) ->
    #mission_cfg{
        mission_id=30040,
        type=1,
        need_level=1,
        need_mission=30039,
        need_power=5,
        daily_times=0,
        awards_a=["1-5525", "4-1120", "12-200", "9-0"],
        awards_b=["1-5100", "4-980", "12-180", "9-0"],
        awards_c=["1-4675", "4-840", "12-160", "9-0"],
        awards_d=["1-4250", "4-700", "12-140", "9-0"],
        awards_e=["1-3825", "4-560", "12-120", "9-0"],
        awards_f=["1-3400", "4-420", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30041) ->
    #mission_cfg{
        mission_id=30041,
        type=1,
        need_level=1,
        need_mission=30040,
        need_power=5,
        daily_times=0,
        awards_a=["1-5525", "4-1120", "12-200", "9-0"],
        awards_b=["1-5100", "4-980", "12-180", "9-0"],
        awards_c=["1-4675", "4-840", "12-160", "9-0"],
        awards_d=["1-4250", "4-700", "12-140", "9-0"],
        awards_e=["1-3825", "4-560", "12-120", "9-0"],
        awards_f=["1-3400", "4-420", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30042) ->
    #mission_cfg{
        mission_id=30042,
        type=1,
        need_level=1,
        need_mission=30041,
        need_power=5,
        daily_times=0,
        awards_a=["1-5850", "4-1120", "12-200", "9-0", "73054-1"],
        awards_b=["1-5400", "4-980", "12-180", "9-0", "73054-1"],
        awards_c=["1-4950", "4-840", "12-160", "9-0", "73054-1"],
        awards_d=["1-4500", "4-700", "12-140", "9-0", "73054-1"],
        awards_e=["1-4050", "4-560", "12-120", "9-0", "73054-1"],
        awards_f=["1-3600", "4-420", "12-100", "9-0", "73054-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30043) ->
    #mission_cfg{
        mission_id=30043,
        type=1,
        need_level=1,
        need_mission=30042,
        need_power=5,
        daily_times=0,
        awards_a=["1-6045", "4-1200", "12-200", "9-0"],
        awards_b=["1-5580", "4-1050", "12-180", "9-0"],
        awards_c=["1-5115", "4-900", "12-160", "9-0"],
        awards_d=["1-4650", "4-750", "12-140", "9-0"],
        awards_e=["1-4185", "4-600", "12-120", "9-0"],
        awards_f=["1-3720", "4-450", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30044) ->
    #mission_cfg{
        mission_id=30044,
        type=1,
        need_level=1,
        need_mission=30043,
        need_power=5,
        daily_times=0,
        awards_a=["1-6045", "4-1200", "12-200", "9-0"],
        awards_b=["1-5580", "4-1050", "12-180", "9-0"],
        awards_c=["1-5115", "4-900", "12-160", "9-0"],
        awards_d=["1-4650", "4-750", "12-140", "9-0"],
        awards_e=["1-4185", "4-600", "12-120", "9-0"],
        awards_f=["1-3720", "4-450", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30045) ->
    #mission_cfg{
        mission_id=30045,
        type=1,
        need_level=1,
        need_mission=30044,
        need_power=5,
        daily_times=0,
        awards_a=["1-6240", "4-1200", "12-200", "9-0", "73055-1"],
        awards_b=["1-5760", "4-1050", "12-180", "9-0", "73055-1"],
        awards_c=["1-5280", "4-900", "12-160", "9-0", "73055-1"],
        awards_d=["1-4800", "4-750", "12-140", "9-0", "73055-1"],
        awards_e=["1-4320", "4-600", "12-120", "9-0", "73055-1"],
        awards_f=["1-3840", "4-450", "12-100", "9-0", "73055-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30046) ->
    #mission_cfg{
        mission_id=30046,
        type=1,
        need_level=1,
        need_mission=30045,
        need_power=5,
        daily_times=0,
        awards_a=["1-6435", "4-1280", "12-200", "9-0"],
        awards_b=["1-5940", "4-1120", "12-180", "9-0"],
        awards_c=["1-5445", "4-960", "12-160", "9-0"],
        awards_d=["1-4950", "4-800", "12-140", "9-0"],
        awards_e=["1-4455", "4-640", "12-120", "9-0"],
        awards_f=["1-3960", "4-480", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30047) ->
    #mission_cfg{
        mission_id=30047,
        type=1,
        need_level=1,
        need_mission=30046,
        need_power=5,
        daily_times=0,
        awards_a=["1-6435", "4-1280", "12-200", "9-0"],
        awards_b=["1-5940", "4-1120", "12-180", "9-0"],
        awards_c=["1-5445", "4-960", "12-160", "9-0"],
        awards_d=["1-4950", "4-800", "12-140", "9-0"],
        awards_e=["1-4455", "4-640", "12-120", "9-0"],
        awards_f=["1-3960", "4-480", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30048) ->
    #mission_cfg{
        mission_id=30048,
        type=1,
        need_level=1,
        need_mission=30047,
        need_power=5,
        daily_times=0,
        awards_a=["1-6630", "4-1280", "12-200", "9-0", "73056-1"],
        awards_b=["1-6120", "4-1120", "12-180", "9-0", "73056-1"],
        awards_c=["1-5610", "4-960", "12-160", "9-0", "73056-1"],
        awards_d=["1-5100", "4-800", "12-140", "9-0", "73056-1"],
        awards_e=["1-4590", "4-640", "12-120", "9-0", "73056-1"],
        awards_f=["1-4080", "4-480", "12-100", "9-0", "73056-1"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30049) ->
    #mission_cfg{
        mission_id=30049,
        type=1,
        need_level=1,
        need_mission=30048,
        need_power=5,
        daily_times=0,
        awards_a=["1-9825", "4-1600", "12-200", "9-0"],
        awards_b=["1-8300", "4-1400", "12-180", "9-0"],
        awards_c=["1-6775", "4-1200", "12-160", "9-0"],
        awards_d=["1-5250", "4-1000", "12-140", "9-0"],
        awards_e=["1-4725", "4-800", "12-120", "9-0"],
        awards_f=["1-4200", "4-600", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30050) ->
    #mission_cfg{
        mission_id=30050,
        type=1,
        need_level=1,
        need_mission=30049,
        need_power=5,
        daily_times=0,
        awards_a=["1-10150", "4-1600", "12-200", "9-0"],
        awards_b=["1-8600", "4-1400", "12-180", "9-0"],
        awards_c=["1-7050", "4-1200", "12-160", "9-0"],
        awards_d=["1-5500", "4-1000", "12-140", "9-0"],
        awards_e=["1-4950", "4-800", "12-120", "9-0"],
        awards_f=["1-4400", "4-600", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30051) ->
    #mission_cfg{
        mission_id=30051,
        type=1,
        need_level=1,
        need_mission=30050,
        need_power=5,
        daily_times=0,
        awards_a=["1-10475", "4-2480", "12-200", "9-0", "73058-1"],
        awards_b=["1-8900", "4-2170", "12-180", "9-0", "73058-1"],
        awards_c=["1-7325", "4-1860", "12-160", "9-0", "73058-1"],
        awards_d=["1-5750", "4-1550", "12-140", "9-0", "73058-1"],
        awards_e=["1-5175", "4-1240", "12-120", "9-0", "73058-1"],
        awards_f=["1-4600", "4-930", "12-100", "9-0", "73058-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30052) ->
    #mission_cfg{
        mission_id=30052,
        type=1,
        need_level=1,
        need_mission=30051,
        need_power=5,
        daily_times=0,
        awards_a=["1-10800", "4-2640", "12-200", "9-0"],
        awards_b=["1-9200", "4-2310", "12-180", "9-0"],
        awards_c=["1-7600", "4-1980", "12-160", "9-0"],
        awards_d=["1-6000", "4-1650", "12-140", "9-0"],
        awards_e=["1-5400", "4-1320", "12-120", "9-0"],
        awards_f=["1-4800", "4-990", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30053) ->
    #mission_cfg{
        mission_id=30053,
        type=1,
        need_level=1,
        need_mission=30052,
        need_power=5,
        daily_times=0,
        awards_a=["1-11125", "4-2640", "12-200", "9-0"],
        awards_b=["1-9500", "4-2310", "12-180", "9-0"],
        awards_c=["1-7875", "4-1980", "12-160", "9-0"],
        awards_d=["1-6250", "4-1650", "12-140", "9-0"],
        awards_e=["1-5625", "4-1320", "12-120", "9-0"],
        awards_f=["1-5000", "4-990", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30054) ->
    #mission_cfg{
        mission_id=30054,
        type=1,
        need_level=1,
        need_mission=30053,
        need_power=5,
        daily_times=0,
        awards_a=["1-11450", "4-2640", "12-200", "9-0", "73059-1"],
        awards_b=["1-9800", "4-2310", "12-180", "9-0", "73059-1"],
        awards_c=["1-8150", "4-1980", "12-160", "9-0", "73059-1"],
        awards_d=["1-6500", "4-1650", "12-140", "9-0", "73059-1"],
        awards_e=["1-5850", "4-1320", "12-120", "9-0", "73059-1"],
        awards_f=["1-5200", "4-990", "12-100", "9-0", "73059-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30055) ->
    #mission_cfg{
        mission_id=30055,
        type=1,
        need_level=1,
        need_mission=30054,
        need_power=5,
        daily_times=0,
        awards_a=["1-11775", "4-2800", "12-200", "9-0"],
        awards_b=["1-10100", "4-2450", "12-180", "9-0"],
        awards_c=["1-8425", "4-2100", "12-160", "9-0"],
        awards_d=["1-6750", "4-1750", "12-140", "9-0"],
        awards_e=["1-6075", "4-1400", "12-120", "9-0"],
        awards_f=["1-5400", "4-1050", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30056) ->
    #mission_cfg{
        mission_id=30056,
        type=1,
        need_level=1,
        need_mission=30055,
        need_power=5,
        daily_times=0,
        awards_a=["1-12100", "4-2800", "12-200", "9-0"],
        awards_b=["1-10400", "4-2450", "12-180", "9-0"],
        awards_c=["1-8700", "4-2100", "12-160", "9-0"],
        awards_d=["1-7000", "4-1750", "12-140", "9-0"],
        awards_e=["1-6300", "4-1400", "12-120", "9-0"],
        awards_f=["1-5600", "4-1050", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30057) ->
    #mission_cfg{
        mission_id=30057,
        type=1,
        need_level=1,
        need_mission=30056,
        need_power=5,
        daily_times=0,
        awards_a=["1-12425", "4-2800", "12-200", "9-0", "73060-1"],
        awards_b=["1-10700", "4-2450", "12-180", "9-0", "73060-1"],
        awards_c=["1-8975", "4-2100", "12-160", "9-0", "73060-1"],
        awards_d=["1-7250", "4-1750", "12-140", "9-0", "73060-1"],
        awards_e=["1-6525", "4-1400", "12-120", "9-0", "73060-1"],
        awards_f=["1-5800", "4-1050", "12-100", "9-0", "73060-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30058) ->
    #mission_cfg{
        mission_id=30058,
        type=1,
        need_level=1,
        need_mission=30057,
        need_power=5,
        daily_times=0,
        awards_a=["1-12750", "4-2960", "12-200", "9-0"],
        awards_b=["1-11000", "4-2590", "12-180", "9-0"],
        awards_c=["1-9250", "4-2220", "12-160", "9-0"],
        awards_d=["1-7500", "4-1850", "12-140", "9-0"],
        awards_e=["1-6750", "4-1480", "12-120", "9-0"],
        awards_f=["1-6000", "4-1110", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30059) ->
    #mission_cfg{
        mission_id=30059,
        type=1,
        need_level=1,
        need_mission=30058,
        need_power=5,
        daily_times=0,
        awards_a=["1-13075", "4-2960", "12-200", "9-0"],
        awards_b=["1-11300", "4-2590", "12-180", "9-0"],
        awards_c=["1-9525", "4-2220", "12-160", "9-0"],
        awards_d=["1-7750", "4-1850", "12-140", "9-0"],
        awards_e=["1-6975", "4-1480", "12-120", "9-0"],
        awards_f=["1-6200", "4-1110", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30060) ->
    #mission_cfg{
        mission_id=30060,
        type=1,
        need_level=1,
        need_mission=30059,
        need_power=5,
        daily_times=0,
        awards_a=["1-13400", "4-2960", "12-200", "9-0", "73061-1"],
        awards_b=["1-11600", "4-2590", "12-180", "9-0", "73061-1"],
        awards_c=["1-9800", "4-2220", "12-160", "9-0", "73061-1"],
        awards_d=["1-8000", "4-1850", "12-140", "9-0", "73061-1"],
        awards_e=["1-7200", "4-1480", "12-120", "9-0", "73061-1"],
        awards_f=["1-6400", "4-1110", "12-100", "9-0", "73061-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30061) ->
    #mission_cfg{
        mission_id=30061,
        type=1,
        need_level=1,
        need_mission=30060,
        need_power=5,
        daily_times=0,
        awards_a=["1-13725", "4-3120", "12-200", "9-0"],
        awards_b=["1-11900", "4-2730", "12-180", "9-0"],
        awards_c=["1-10075", "4-2340", "12-160", "9-0"],
        awards_d=["1-8250", "4-1950", "12-140", "9-0"],
        awards_e=["1-7425", "4-1560", "12-120", "9-0"],
        awards_f=["1-6600", "4-1170", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30062) ->
    #mission_cfg{
        mission_id=30062,
        type=1,
        need_level=1,
        need_mission=30061,
        need_power=5,
        daily_times=0,
        awards_a=["1-14050", "4-3120", "12-200", "9-0"],
        awards_b=["1-12200", "4-2730", "12-180", "9-0"],
        awards_c=["1-10350", "4-2340", "12-160", "9-0"],
        awards_d=["1-8500", "4-1950", "12-140", "9-0"],
        awards_e=["1-7650", "4-1560", "12-120", "9-0"],
        awards_f=["1-6800", "4-1170", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30063) ->
    #mission_cfg{
        mission_id=30063,
        type=1,
        need_level=1,
        need_mission=30062,
        need_power=5,
        daily_times=0,
        awards_a=["1-14375", "4-3120", "12-200", "9-0", "73062-1"],
        awards_b=["1-12500", "4-2730", "12-180", "9-0", "73062-1"],
        awards_c=["1-10625", "4-2340", "12-160", "9-0", "73062-1"],
        awards_d=["1-8750", "4-1950", "12-140", "9-0", "73062-1"],
        awards_e=["1-7875", "4-1560", "12-120", "9-0", "73062-1"],
        awards_f=["1-7000", "4-1170", "12-100", "9-0", "73062-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30064) ->
    #mission_cfg{
        mission_id=30064,
        type=1,
        need_level=1,
        need_mission=30063,
        need_power=5,
        daily_times=0,
        awards_a=["1-14700", "4-3440", "12-200", "9-0"],
        awards_b=["1-12800", "4-3010", "12-180", "9-0"],
        awards_c=["1-10900", "4-2580", "12-160", "9-0"],
        awards_d=["1-9000", "4-2150", "12-140", "9-0"],
        awards_e=["1-8100", "4-1720", "12-120", "9-0"],
        awards_f=["1-7200", "4-1290", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30065) ->
    #mission_cfg{
        mission_id=30065,
        type=1,
        need_level=1,
        need_mission=30064,
        need_power=5,
        daily_times=0,
        awards_a=["1-15025", "4-3440", "12-200", "9-0"],
        awards_b=["1-13100", "4-3010", "12-180", "9-0"],
        awards_c=["1-11175", "4-2580", "12-160", "9-0"],
        awards_d=["1-9250", "4-2150", "12-140", "9-0"],
        awards_e=["1-8325", "4-1720", "12-120", "9-0"],
        awards_f=["1-7400", "4-1290", "12-100", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30066) ->
    #mission_cfg{
        mission_id=30066,
        type=1,
        need_level=1,
        need_mission=30065,
        need_power=5,
        daily_times=0,
        awards_a=["1-15350", "4-3440", "12-200", "9-0", "73063-1"],
        awards_b=["1-13400", "4-3010", "12-180", "9-0", "73063-1"],
        awards_c=["1-11450", "4-2580", "12-160", "9-0", "73063-1"],
        awards_d=["1-9500", "4-2150", "12-140", "9-0", "73063-1"],
        awards_e=["1-8550", "4-1720", "12-120", "9-0", "73063-1"],
        awards_f=["1-7600", "4-1290", "12-100", "9-0", "73063-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30067) ->
    #mission_cfg{
        mission_id=30067,
        type=1,
        need_level=1,
        need_mission=30066,
        need_power=5,
        daily_times=0,
        awards_a=["1-15675", "4-3920", "12-200", "9-0"],
        awards_b=["1-13700", "4-3430", "12-180", "9-0"],
        awards_c=["1-11725", "4-2940", "12-160", "9-0"],
        awards_d=["1-9750", "4-2450", "12-140", "9-0"],
        awards_e=["1-8775", "4-1960", "12-120", "9-0"],
        awards_f=["1-7800", "4-1470", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30068) ->
    #mission_cfg{
        mission_id=30068,
        type=1,
        need_level=1,
        need_mission=30067,
        need_power=5,
        daily_times=0,
        awards_a=["1-16000", "4-3920", "12-200", "9-0"],
        awards_b=["1-14000", "4-3430", "12-180", "9-0"],
        awards_c=["1-12000", "4-2940", "12-160", "9-0"],
        awards_d=["1-10000", "4-2450", "12-140", "9-0"],
        awards_e=["1-9000", "4-1960", "12-120", "9-0"],
        awards_f=["1-8000", "4-1470", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30069) ->
    #mission_cfg{
        mission_id=30069,
        type=1,
        need_level=1,
        need_mission=30068,
        need_power=5,
        daily_times=0,
        awards_a=["1-16325", "4-4080", "12-200", "9-0"],
        awards_b=["1-14300", "4-3570", "12-180", "9-0"],
        awards_c=["1-12275", "4-3060", "12-160", "9-0"],
        awards_d=["1-10250", "4-2550", "12-140", "9-0"],
        awards_e=["1-9225", "4-2040", "12-120", "9-0"],
        awards_f=["1-8200", "4-1530", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30070) ->
    #mission_cfg{
        mission_id=30070,
        type=1,
        need_level=1,
        need_mission=30069,
        need_power=5,
        daily_times=0,
        awards_a=["1-16650", "4-4560", "12-200", "9-0"],
        awards_b=["1-14600", "4-3990", "12-180", "9-0"],
        awards_c=["1-12550", "4-3420", "12-160", "9-0"],
        awards_d=["1-10500", "4-2850", "12-140", "9-0"],
        awards_e=["1-9450", "4-2280", "12-120", "9-0"],
        awards_f=["1-8400", "4-1710", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30071) ->
    #mission_cfg{
        mission_id=30071,
        type=1,
        need_level=1,
        need_mission=30070,
        need_power=5,
        daily_times=0,
        awards_a=["1-16975", "4-4560", "12-200", "9-0"],
        awards_b=["1-14900", "4-3990", "12-180", "9-0"],
        awards_c=["1-12825", "4-3420", "12-160", "9-0"],
        awards_d=["1-10750", "4-2850", "12-140", "9-0"],
        awards_e=["1-9675", "4-2280", "12-120", "9-0"],
        awards_f=["1-8600", "4-1710", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30072) ->
    #mission_cfg{
        mission_id=30072,
        type=1,
        need_level=1,
        need_mission=30071,
        need_power=5,
        daily_times=0,
        awards_a=["1-17300", "4-4720", "12-200", "9-0"],
        awards_b=["1-15200", "4-4130", "12-180", "9-0"],
        awards_c=["1-13100", "4-3540", "12-160", "9-0"],
        awards_d=["1-11000", "4-2950", "12-140", "9-0"],
        awards_e=["1-9900", "4-2360", "12-120", "9-0"],
        awards_f=["1-8800", "4-1770", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30073) ->
    #mission_cfg{
        mission_id=30073,
        type=1,
        need_level=1,
        need_mission=30072,
        need_power=5,
        daily_times=0,
        awards_a=["1-17625", "4-5200", "12-200", "9-0"],
        awards_b=["1-15500", "4-4550", "12-180", "9-0"],
        awards_c=["1-13375", "4-3900", "12-160", "9-0"],
        awards_d=["1-11250", "4-3250", "12-140", "9-0"],
        awards_e=["1-10125", "4-2600", "12-120", "9-0"],
        awards_f=["1-9000", "4-1950", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30074) ->
    #mission_cfg{
        mission_id=30074,
        type=1,
        need_level=1,
        need_mission=30073,
        need_power=5,
        daily_times=0,
        awards_a=["1-17950", "4-5200", "12-200", "9-0"],
        awards_b=["1-15800", "4-4550", "12-180", "9-0"],
        awards_c=["1-13650", "4-3900", "12-160", "9-0"],
        awards_d=["1-11500", "4-3250", "12-140", "9-0"],
        awards_e=["1-10350", "4-2600", "12-120", "9-0"],
        awards_f=["1-9200", "4-1950", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30075) ->
    #mission_cfg{
        mission_id=30075,
        type=1,
        need_level=1,
        need_mission=30074,
        need_power=5,
        daily_times=0,
        awards_a=["1-18275", "4-5360", "12-200", "9-0"],
        awards_b=["1-16100", "4-4690", "12-180", "9-0"],
        awards_c=["1-13925", "4-4020", "12-160", "9-0"],
        awards_d=["1-11750", "4-3350", "12-140", "9-0"],
        awards_e=["1-10575", "4-2680", "12-120", "9-0"],
        awards_f=["1-9400", "4-2010", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30076) ->
    #mission_cfg{
        mission_id=30076,
        type=1,
        need_level=1,
        need_mission=30075,
        need_power=5,
        daily_times=0,
        awards_a=["1-18600", "4-5840", "12-200", "9-0"],
        awards_b=["1-16400", "4-5110", "12-180", "9-0"],
        awards_c=["1-14200", "4-4380", "12-160", "9-0"],
        awards_d=["1-12000", "4-3650", "12-140", "9-0"],
        awards_e=["1-10800", "4-2920", "12-120", "9-0"],
        awards_f=["1-9600", "4-2190", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30077) ->
    #mission_cfg{
        mission_id=30077,
        type=1,
        need_level=1,
        need_mission=30076,
        need_power=5,
        daily_times=0,
        awards_a=["1-18925", "4-5840", "12-200", "9-0"],
        awards_b=["1-16700", "4-5110", "12-180", "9-0"],
        awards_c=["1-14475", "4-4380", "12-160", "9-0"],
        awards_d=["1-12250", "4-3650", "12-140", "9-0"],
        awards_e=["1-11025", "4-2920", "12-120", "9-0"],
        awards_f=["1-9800", "4-2190", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30078) ->
    #mission_cfg{
        mission_id=30078,
        type=1,
        need_level=1,
        need_mission=30077,
        need_power=5,
        daily_times=0,
        awards_a=["1-19250", "4-6000", "12-200", "9-0"],
        awards_b=["1-17000", "4-5250", "12-180", "9-0"],
        awards_c=["1-14750", "4-4500", "12-160", "9-0"],
        awards_d=["1-12500", "4-3750", "12-140", "9-0"],
        awards_e=["1-11250", "4-3000", "12-120", "9-0"],
        awards_f=["1-10000", "4-2250", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30079) ->
    #mission_cfg{
        mission_id=30079,
        type=1,
        need_level=1,
        need_mission=30078,
        need_power=5,
        daily_times=0,
        awards_a=["1-19575", "4-6480", "12-200", "9-0"],
        awards_b=["1-17300", "4-5670", "12-180", "9-0"],
        awards_c=["1-15025", "4-4860", "12-160", "9-0"],
        awards_d=["1-12750", "4-4050", "12-140", "9-0"],
        awards_e=["1-11475", "4-3240", "12-120", "9-0"],
        awards_f=["1-10200", "4-2430", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30080) ->
    #mission_cfg{
        mission_id=30080,
        type=1,
        need_level=1,
        need_mission=30079,
        need_power=5,
        daily_times=0,
        awards_a=["1-19900", "4-6480", "12-200", "9-0"],
        awards_b=["1-17600", "4-5670", "12-180", "9-0"],
        awards_c=["1-15300", "4-4860", "12-160", "9-0"],
        awards_d=["1-13000", "4-4050", "12-140", "9-0"],
        awards_e=["1-11700", "4-3240", "12-120", "9-0"],
        awards_f=["1-10400", "4-2430", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30081) ->
    #mission_cfg{
        mission_id=30081,
        type=1,
        need_level=1,
        need_mission=30080,
        need_power=5,
        daily_times=0,
        awards_a=["1-20225", "4-6640", "12-200", "9-0"],
        awards_b=["1-17900", "4-5810", "12-180", "9-0"],
        awards_c=["1-15575", "4-4980", "12-160", "9-0"],
        awards_d=["1-13250", "4-4150", "12-140", "9-0"],
        awards_e=["1-11925", "4-3320", "12-120", "9-0"],
        awards_f=["1-10600", "4-2490", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30082) ->
    #mission_cfg{
        mission_id=30082,
        type=1,
        need_level=1,
        need_mission=30081,
        need_power=5,
        daily_times=0,
        awards_a=["1-20550", "4-7120", "12-200", "9-0"],
        awards_b=["1-18200", "4-6230", "12-180", "9-0"],
        awards_c=["1-15850", "4-5340", "12-160", "9-0"],
        awards_d=["1-13500", "4-4450", "12-140", "9-0"],
        awards_e=["1-12150", "4-3560", "12-120", "9-0"],
        awards_f=["1-10800", "4-2670", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30083) ->
    #mission_cfg{
        mission_id=30083,
        type=1,
        need_level=1,
        need_mission=30082,
        need_power=5,
        daily_times=0,
        awards_a=["1-20875", "4-7120", "12-200", "9-0"],
        awards_b=["1-18500", "4-6230", "12-180", "9-0"],
        awards_c=["1-16125", "4-5340", "12-160", "9-0"],
        awards_d=["1-13750", "4-4450", "12-140", "9-0"],
        awards_e=["1-12375", "4-3560", "12-120", "9-0"],
        awards_f=["1-11000", "4-2670", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(30084) ->
    #mission_cfg{
        mission_id=30084,
        type=1,
        need_level=1,
        need_mission=30083,
        need_power=5,
        daily_times=0,
        awards_a=["1-21200", "4-7280", "12-200", "9-0"],
        awards_b=["1-18800", "4-6370", "12-180", "9-0"],
        awards_c=["1-16400", "4-5460", "12-160", "9-0"],
        awards_d=["1-14000", "4-4550", "12-140", "9-0"],
        awards_e=["1-12600", "4-3640", "12-120", "9-0"],
        awards_f=["1-11200", "4-2730", "12-100", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31000) ->
    #mission_cfg{
        mission_id=31000,
        type=2,
        need_level=15,
        need_mission=30015,
        need_power=10,
        daily_times=3,
        awards_a=["1-3900", "4-4800", "12-1000", "9-300", "73000-1", "77002-1"],
        awards_b=["1-3600", "4-4200", "12-900", "9-275", "73000-1", "77001-1"],
        awards_c=["1-3300", "4-3600", "12-800", "9-250", "73000-1", "77001-1"],
        awards_d=["1-3000", "4-3000", "12-700", "9-225", "73000-1", "77000-1"],
        awards_e=["1-2850", "4-2400", "12-600", "9-200", "73000-1", "77000-1"],
        awards_f=["1-2700", "4-1800", "12-500", "9-175", "73000-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31001) ->
    #mission_cfg{
        mission_id=31001,
        type=2,
        need_level=15,
        need_mission=31000,
        need_power=10,
        daily_times=3,
        awards_a=["1-4550", "4-5600", "12-1000", "9-300", "73001-1", "77002-1"],
        awards_b=["1-4200", "4-4900", "12-900", "9-275", "73001-1", "77001-1"],
        awards_c=["1-3850", "4-4200", "12-800", "9-250", "73001-1", "77001-1"],
        awards_d=["1-3500", "4-3500", "12-700", "9-225", "73001-1", "77000-1"],
        awards_e=["1-3325", "4-2800", "12-600", "9-200", "73001-1", "77000-1"],
        awards_f=["1-3150", "4-2100", "12-500", "9-175", "73001-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31002) ->
    #mission_cfg{
        mission_id=31002,
        type=2,
        need_level=15,
        need_mission=31001,
        need_power=10,
        daily_times=3,
        awards_a=["1-5200", "4-6400", "12-1000", "9-300", "73002-1", "77002-1"],
        awards_b=["1-4800", "4-5600", "12-900", "9-275", "73002-1", "77001-1"],
        awards_c=["1-4400", "4-4800", "12-800", "9-250", "73002-1", "77001-1"],
        awards_d=["1-4000", "4-4000", "12-700", "9-225", "73002-1", "77000-1"],
        awards_e=["1-3800", "4-3200", "12-600", "9-200", "73002-1", "77000-1"],
        awards_f=["1-3600", "4-2400", "12-500", "9-175", "73002-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31003) ->
    #mission_cfg{
        mission_id=31003,
        type=2,
        need_level=50,
        need_mission=0,
        need_power=10,
        daily_times=3,
        awards_a=["1-13000", "4-16000", "12-150", "9-0"],
        awards_b=["1-12000", "4-14000", "12-120", "9-0"],
        awards_c=["1-11000", "4-12000", "12-100", "9-0"],
        awards_d=["1-10000", "4-10000", "12-80", "9-0"],
        awards_e=["1-9500", "4-8000", "12-60", "9-0"],
        awards_f=["1-9000", "4-6000", "12-40", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31004) ->
    #mission_cfg{
        mission_id=31004,
        type=2,
        need_level=50,
        need_mission=0,
        need_power=10,
        daily_times=3,
        awards_a=["1-13000", "4-16000", "12-150", "9-0"],
        awards_b=["1-12000", "4-14000", "12-120", "9-0"],
        awards_c=["1-11000", "4-12000", "12-100", "9-0"],
        awards_d=["1-10000", "4-10000", "12-80", "9-0"],
        awards_e=["1-9500", "4-8000", "12-60", "9-0"],
        awards_f=["1-9000", "4-6000", "12-40", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31005) ->
    #mission_cfg{
        mission_id=31005,
        type=2,
        need_level=50,
        need_mission=0,
        need_power=10,
        daily_times=3,
        awards_a=["1-13000", "4-16000", "12-150", "9-0"],
        awards_b=["1-12000", "4-14000", "12-120", "9-0"],
        awards_c=["1-11000", "4-12000", "12-100", "9-0"],
        awards_d=["1-10000", "4-10000", "12-80", "9-0"],
        awards_e=["1-9500", "4-8000", "12-60", "9-0"],
        awards_f=["1-9000", "4-6000", "12-40", "9-0"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31006) ->
    #mission_cfg{
        mission_id=31006,
        type=2,
        need_level=25,
        need_mission=31002,
        need_power=10,
        daily_times=3,
        awards_a=["1-5850", "4-7200", "12-1000", "9-360", "73000-1", "77002-1"],
        awards_b=["1-5400", "4-6300", "12-900", "9-330", "73000-1", "77001-1"],
        awards_c=["1-4950", "4-5400", "12-800", "9-300", "73000-1", "77001-1"],
        awards_d=["1-4500", "4-4500", "12-700", "9-270", "73000-1", "77000-1"],
        awards_e=["1-4275", "4-3600", "12-600", "9-240", "73000-1", "77000-1"],
        awards_f=["1-4050", "4-2700", "12-500", "9-210", "73000-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31007) ->
    #mission_cfg{
        mission_id=31007,
        type=2,
        need_level=25,
        need_mission=31006,
        need_power=10,
        daily_times=3,
        awards_a=["1-6500", "4-8000", "12-1000", "9-360", "73001-1", "77002-1"],
        awards_b=["1-6000", "4-7000", "12-900", "9-330", "73001-1", "77001-1"],
        awards_c=["1-5500", "4-6000", "12-800", "9-300", "73001-1", "77001-1"],
        awards_d=["1-5000", "4-5000", "12-700", "9-270", "73001-1", "77000-1"],
        awards_e=["1-4750", "4-4000", "12-600", "9-240", "73001-1", "77000-1"],
        awards_f=["1-4500", "4-3000", "12-500", "9-210", "73001-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31008) ->
    #mission_cfg{
        mission_id=31008,
        type=2,
        need_level=25,
        need_mission=31007,
        need_power=10,
        daily_times=3,
        awards_a=["1-7150", "4-8800", "12-1000", "9-360", "73002-1", "77002-1"],
        awards_b=["1-6600", "4-7700", "12-900", "9-330", "73002-1", "77001-1"],
        awards_c=["1-6050", "4-6600", "12-800", "9-300", "73002-1", "77001-1"],
        awards_d=["1-5500", "4-5500", "12-700", "9-270", "73002-1", "77000-1"],
        awards_e=["1-5225", "4-4400", "12-600", "9-240", "73002-1", "77000-1"],
        awards_f=["1-4950", "4-3300", "12-500", "9-210", "73002-1", "77000-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32000) ->
    #mission_cfg{
        mission_id=32000,
        type=3,
        need_level=20,
        need_mission=30021,
        need_power=15,
        daily_times=2,
        awards_a=["1-13000", "4-32000", "12-3000", "9-720", "73301-1", "77002-1"],
        awards_b=["1-12000", "4-28000", "12-2800", "9-660", "73301-1", "77001-1"],
        awards_c=["1-11000", "4-24000", "12-2600", "9-600", "73301-1", "77001-1"],
        awards_d=["1-10000", "4-20000", "12-2400", "9-540", "73301-1", "77000-1"],
        awards_e=["1-9500", "4-16000", "12-2200", "9-480", "73301-1", "77000-1"],
        awards_f=["1-9000", "4-12000", "12-2000", "9-420", "73301-1", "77000-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32001) ->
    #mission_cfg{
        mission_id=32001,
        type=3,
        need_level=20,
        need_mission=32000,
        need_power=15,
        daily_times=2,
        awards_a=["1-14300", "4-40000", "12-3000", "9-720", "73301-1", "77002-1"],
        awards_b=["1-13200", "4-35000", "12-2800", "9-660", "73301-1", "77001-1"],
        awards_c=["1-12100", "4-30000", "12-2600", "9-600", "73301-1", "77001-1"],
        awards_d=["1-11000", "4-25000", "12-2400", "9-540", "73301-1", "77000-1"],
        awards_e=["1-10450", "4-20000", "12-2200", "9-480", "73301-1", "77000-1"],
        awards_f=["1-9900", "4-15000", "12-2000", "9-420", "73301-1", "77000-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32002) ->
    #mission_cfg{
        mission_id=32002,
        type=3,
        need_level=20,
        need_mission=32001,
        need_power=15,
        daily_times=2,
        awards_a=["1-15600", "4-48000", "12-3000", "9-720", "73302-1", "77002-1"],
        awards_b=["1-14400", "4-42000", "12-2800", "9-660", "73302-1", "77001-1"],
        awards_c=["1-13200", "4-36000", "12-2600", "9-600", "73302-1", "77001-1"],
        awards_d=["1-12000", "4-30000", "12-2400", "9-540", "73302-1", "77000-1"],
        awards_e=["1-11400", "4-24000", "12-2200", "9-480", "73302-1", "77000-1"],
        awards_f=["1-10800", "4-18000", "12-2000", "9-420", "73302-1", "77000-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31009) ->
    #mission_cfg{
        mission_id=31009,
        type=2,
        need_level=30,
        need_mission=31008,
        need_power=10,
        daily_times=3,
        awards_a=["1-9750", "4-12000", "12-1000", "9-384", "73003-1", "77005-1"],
        awards_b=["1-9000", "4-10500", "12-900", "9-352", "73003-1", "77004-1"],
        awards_c=["1-8250", "4-9000", "12-800", "9-320", "73003-1", "77004-1"],
        awards_d=["1-7500", "4-7500", "12-700", "9-288", "73003-1", "77003-1"],
        awards_e=["1-7125", "4-6000", "12-600", "9-256", "73003-1", "77003-1"],
        awards_f=["1-6750", "4-4500", "12-500", "9-224", "73003-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31010) ->
    #mission_cfg{
        mission_id=31010,
        type=2,
        need_level=30,
        need_mission=31009,
        need_power=10,
        daily_times=3,
        awards_a=["1-10400", "4-12800", "12-1000", "9-408", "73004-1", "77005-1"],
        awards_b=["1-9600", "4-11200", "12-900", "9-374", "73004-1", "77004-1"],
        awards_c=["1-8800", "4-9600", "12-800", "9-340", "73004-1", "77004-1"],
        awards_d=["1-8000", "4-8000", "12-700", "9-306", "73004-1", "77003-1"],
        awards_e=["1-7600", "4-6400", "12-600", "9-272", "73004-1", "77003-1"],
        awards_f=["1-7200", "4-4800", "12-500", "9-238", "73004-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31011) ->
    #mission_cfg{
        mission_id=31011,
        type=2,
        need_level=30,
        need_mission=31010,
        need_power=10,
        daily_times=3,
        awards_a=["1-11050", "4-13600", "12-1000", "9-432", "73005-1", "77005-1"],
        awards_b=["1-10200", "4-11900", "12-900", "9-396", "73005-1", "77004-1"],
        awards_c=["1-9350", "4-10200", "12-800", "9-360", "73005-1", "77004-1"],
        awards_d=["1-8500", "4-8500", "12-700", "9-324", "73005-1", "77003-1"],
        awards_e=["1-8075", "4-6800", "12-600", "9-288", "73005-1", "77003-1"],
        awards_f=["1-7650", "4-5100", "12-500", "9-252", "73005-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31012) ->
    #mission_cfg{
        mission_id=31012,
        type=2,
        need_level=35,
        need_mission=31011,
        need_power=10,
        daily_times=3,
        awards_a=["1-11700", "4-14400", "12-1000", "9-456", "73003-1", "77005-1"],
        awards_b=["1-10800", "4-12600", "12-900", "9-418", "73003-1", "77004-1"],
        awards_c=["1-9900", "4-10800", "12-800", "9-380", "73003-1", "77004-1"],
        awards_d=["1-9000", "4-9000", "12-700", "9-342", "73003-1", "77003-1"],
        awards_e=["1-8550", "4-7200", "12-600", "9-304", "73003-1", "77003-1"],
        awards_f=["1-8100", "4-5400", "12-500", "9-266", "73003-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31013) ->
    #mission_cfg{
        mission_id=31013,
        type=2,
        need_level=35,
        need_mission=31012,
        need_power=10,
        daily_times=3,
        awards_a=["1-12350", "4-15200", "12-1000", "9-480", "73004-1", "77005-1"],
        awards_b=["1-11400", "4-13300", "12-900", "9-440", "73004-1", "77004-1"],
        awards_c=["1-10450", "4-11400", "12-800", "9-400", "73004-1", "77004-1"],
        awards_d=["1-9500", "4-9500", "12-700", "9-360", "73004-1", "77003-1"],
        awards_e=["1-9025", "4-7600", "12-600", "9-320", "73004-1", "77003-1"],
        awards_f=["1-8550", "4-5700", "12-500", "9-280", "73004-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31014) ->
    #mission_cfg{
        mission_id=31014,
        type=2,
        need_level=35,
        need_mission=31013,
        need_power=10,
        daily_times=3,
        awards_a=["1-13000", "4-16000", "12-1000", "9-504", "73005-1", "77005-1"],
        awards_b=["1-12000", "4-14000", "12-900", "9-462", "73005-1", "77004-1"],
        awards_c=["1-11000", "4-12000", "12-800", "9-420", "73005-1", "77004-1"],
        awards_d=["1-10000", "4-10000", "12-700", "9-378", "73005-1", "77003-1"],
        awards_e=["1-9500", "4-8000", "12-600", "9-336", "73005-1", "77003-1"],
        awards_f=["1-9000", "4-6000", "12-500", "9-294", "73005-1", "77003-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32003) ->
    #mission_cfg{
        mission_id=32003,
        type=3,
        need_level=30,
        need_mission=32002,
        need_power=15,
        daily_times=2,
        awards_a=["1-18200", "4-72000", "12-3000", "9-1200", "73302-1", "77005-1"],
        awards_b=["1-16800", "4-63000", "12-2800", "9-1100", "73302-1", "77004-1"],
        awards_c=["1-15400", "4-54000", "12-2600", "9-1000", "73302-1", "77004-1"],
        awards_d=["1-14000", "4-45000", "12-2400", "9-900", "73302-1", "77003-1"],
        awards_e=["1-13300", "4-36000", "12-2200", "9-800", "73302-1", "77003-1"],
        awards_f=["1-12600", "4-27000", "12-2000", "9-700", "73302-1", "77003-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32004) ->
    #mission_cfg{
        mission_id=32004,
        type=3,
        need_level=30,
        need_mission=32003,
        need_power=15,
        daily_times=2,
        awards_a=["1-19500", "4-80000", "12-3000", "9-1320", "73303-1", "77005-1"],
        awards_b=["1-18000", "4-70000", "12-2800", "9-1210", "73303-1", "77004-1"],
        awards_c=["1-16500", "4-60000", "12-2600", "9-1100", "73303-1", "77004-1"],
        awards_d=["1-15000", "4-50000", "12-2400", "9-990", "73303-1", "77003-1"],
        awards_e=["1-14250", "4-40000", "12-2200", "9-880", "73303-1", "77003-1"],
        awards_f=["1-13500", "4-30000", "12-2000", "9-770", "73303-1", "77003-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32005) ->
    #mission_cfg{
        mission_id=32005,
        type=3,
        need_level=30,
        need_mission=32004,
        need_power=15,
        daily_times=2,
        awards_a=["1-20800", "4-88000", "12-3000", "9-1440", "73303-1", "77005-1"],
        awards_b=["1-19200", "4-77000", "12-2800", "9-1320", "73303-1", "77004-1"],
        awards_c=["1-17600", "4-66000", "12-2600", "9-1200", "73303-1", "77004-1"],
        awards_d=["1-16000", "4-55000", "12-2400", "9-1080", "73303-1", "77003-1"],
        awards_e=["1-15200", "4-44000", "12-2200", "9-960", "73303-1", "77003-1"],
        awards_f=["1-14400", "4-33000", "12-2000", "9-840", "73303-1", "77003-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31015) ->
    #mission_cfg{
        mission_id=31015,
        type=2,
        need_level=30,
        need_mission=31014,
        need_power=10,
        daily_times=3,
        awards_a=["1-13650", "4-16800", "12-1000", "9-528", "77211-1", "77008-1"],
        awards_b=["1-12600", "4-14700", "12-900", "9-484", "77211-1", "77007-1"],
        awards_c=["1-11550", "4-12600", "12-800", "9-440", "77211-1", "77007-1"],
        awards_d=["1-10500", "4-10500", "12-700", "9-396", "77211-1", "77006-1"],
        awards_e=["1-9450", "4-8400", "12-600", "9-352", "77211-1", "77006-1"],
        awards_f=["1-8400", "4-6300", "12-500", "9-308", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31016) ->
    #mission_cfg{
        mission_id=31016,
        type=2,
        need_level=30,
        need_mission=31015,
        need_power=10,
        daily_times=3,
        awards_a=["1-14300", "4-17600", "12-1000", "9-552", "77211-1", "77008-1"],
        awards_b=["1-13200", "4-15400", "12-900", "9-506", "77211-1", "77007-1"],
        awards_c=["1-12100", "4-13200", "12-800", "9-460", "77211-1", "77007-1"],
        awards_d=["1-11000", "4-11000", "12-700", "9-414", "77211-1", "77006-1"],
        awards_e=["1-9900", "4-8800", "12-600", "9-368", "77211-1", "77006-1"],
        awards_f=["1-8800", "4-6600", "12-500", "9-322", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31017) ->
    #mission_cfg{
        mission_id=31017,
        type=2,
        need_level=30,
        need_mission=31016,
        need_power=10,
        daily_times=3,
        awards_a=["1-14950", "4-18400", "12-1000", "9-576", "77211-1", "77008-1"],
        awards_b=["1-13800", "4-16100", "12-900", "9-528", "77211-1", "77007-1"],
        awards_c=["1-12650", "4-13800", "12-800", "9-480", "77211-1", "77007-1"],
        awards_d=["1-11500", "4-11500", "12-700", "9-432", "77211-1", "77006-1"],
        awards_e=["1-10350", "4-9200", "12-600", "9-384", "77211-1", "77006-1"],
        awards_f=["1-9200", "4-6900", "12-500", "9-336", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31018) ->
    #mission_cfg{
        mission_id=31018,
        type=2,
        need_level=40,
        need_mission=31017,
        need_power=10,
        daily_times=3,
        awards_a=["1-15600", "4-19200", "12-1000", "9-600", "77211-1", "77008-1"],
        awards_b=["1-14400", "4-16800", "12-900", "9-550", "77211-1", "77007-1"],
        awards_c=["1-13200", "4-14400", "12-800", "9-500", "77211-1", "77007-1"],
        awards_d=["1-12000", "4-12000", "12-700", "9-450", "77211-1", "77006-1"],
        awards_e=["1-10800", "4-9600", "12-600", "9-400", "77211-1", "77006-1"],
        awards_f=["1-9600", "4-7200", "12-500", "9-350", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31019) ->
    #mission_cfg{
        mission_id=31019,
        type=2,
        need_level=40,
        need_mission=31018,
        need_power=10,
        daily_times=3,
        awards_a=["1-16250", "4-20000", "12-1000", "9-624", "77211-1", "77008-1"],
        awards_b=["1-15000", "4-17500", "12-900", "9-572", "77211-1", "77007-1"],
        awards_c=["1-13750", "4-15000", "12-800", "9-520", "77211-1", "77007-1"],
        awards_d=["1-12500", "4-12500", "12-700", "9-468", "77211-1", "77006-1"],
        awards_e=["1-11250", "4-10000", "12-600", "9-416", "77211-1", "77006-1"],
        awards_f=["1-10000", "4-7500", "12-500", "9-364", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31020) ->
    #mission_cfg{
        mission_id=31020,
        type=2,
        need_level=40,
        need_mission=31019,
        need_power=10,
        daily_times=3,
        awards_a=["1-16900", "4-20800", "12-1000", "9-648", "77211-1", "77008-1"],
        awards_b=["1-15600", "4-18200", "12-900", "9-594", "77211-1", "77007-1"],
        awards_c=["1-14300", "4-15600", "12-800", "9-540", "77211-1", "77007-1"],
        awards_d=["1-13000", "4-13000", "12-700", "9-486", "77211-1", "77006-1"],
        awards_e=["1-11700", "4-10400", "12-600", "9-432", "77211-1", "77006-1"],
        awards_f=["1-10400", "4-7800", "12-500", "9-378", "77211-1", "77006-1"],
        warrior_exp=50,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32006) ->
    #mission_cfg{
        mission_id=32006,
        type=3,
        need_level=40,
        need_mission=32005,
        need_power=15,
        daily_times=2,
        awards_a=["1-23400", "4-96000", "12-3000", "9-1560", "73304-1", "77008-1"],
        awards_b=["1-21600", "4-84000", "12-2800", "9-1430", "73304-1", "77007-1"],
        awards_c=["1-19800", "4-72000", "12-2600", "9-1300", "73304-1", "77007-1"],
        awards_d=["1-18000", "4-60000", "12-2400", "9-1170", "73304-1", "77006-1"],
        awards_e=["1-17100", "4-48000", "12-2200", "9-1040", "73304-1", "77006-1"],
        awards_f=["1-16200", "4-36000", "12-2000", "9-910", "73304-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32007) ->
    #mission_cfg{
        mission_id=32007,
        type=3,
        need_level=40,
        need_mission=32006,
        need_power=15,
        daily_times=2,
        awards_a=["1-24700", "4-104000", "12-3000", "9-1680", "73304-1", "77008-1"],
        awards_b=["1-22800", "4-91000", "12-2800", "9-1540", "73304-1", "77007-1"],
        awards_c=["1-20900", "4-78000", "12-2600", "9-1400", "73304-1", "77007-1"],
        awards_d=["1-19000", "4-65000", "12-2400", "9-1260", "73304-1", "77006-1"],
        awards_e=["1-18050", "4-52000", "12-2200", "9-1120", "73304-1", "77006-1"],
        awards_f=["1-17100", "4-39000", "12-2000", "9-980", "73304-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32008) ->
    #mission_cfg{
        mission_id=32008,
        type=3,
        need_level=40,
        need_mission=32007,
        need_power=15,
        daily_times=2,
        awards_a=["1-26000", "4-112000", "12-3000", "9-1800", "73304-1", "77008-1"],
        awards_b=["1-24000", "4-98000", "12-2800", "9-1650", "73304-1", "77007-1"],
        awards_c=["1-22000", "4-84000", "12-2600", "9-1500", "73304-1", "77007-1"],
        awards_d=["1-20000", "4-70000", "12-2400", "9-1350", "73304-1", "77006-1"],
        awards_e=["1-19000", "4-56000", "12-2200", "9-1200", "73304-1", "77006-1"],
        awards_f=["1-18000", "4-42000", "12-2000", "9-1050", "73304-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32009) ->
    #mission_cfg{
        mission_id=32009,
        type=3,
        need_level=40,
        need_mission=32008,
        need_power=15,
        daily_times=2,
        awards_a=["1-27300", "4-120000", "12-3000", "9-1920", "73305-1", "77008-1"],
        awards_b=["1-25200", "4-105000", "12-2800", "9-1760", "73305-1", "77007-1"],
        awards_c=["1-23100", "4-90000", "12-2600", "9-1600", "73305-1", "77007-1"],
        awards_d=["1-21000", "4-75000", "12-2400", "9-1440", "73305-1", "77006-1"],
        awards_e=["1-19950", "4-60000", "12-2200", "9-1280", "73305-1", "77006-1"],
        awards_f=["1-18900", "4-45000", "12-2000", "9-1120", "73305-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32010) ->
    #mission_cfg{
        mission_id=32010,
        type=3,
        need_level=40,
        need_mission=32009,
        need_power=15,
        daily_times=2,
        awards_a=["1-28600", "4-128000", "12-3000", "9-2040", "73305-1", "77008-1"],
        awards_b=["1-26400", "4-112000", "12-2800", "9-1870", "73305-1", "77007-1"],
        awards_c=["1-24200", "4-96000", "12-2600", "9-1700", "73305-1", "77007-1"],
        awards_d=["1-22000", "4-80000", "12-2400", "9-1530", "73305-1", "77006-1"],
        awards_e=["1-20900", "4-64000", "12-2200", "9-1360", "73305-1", "77006-1"],
        awards_f=["1-19800", "4-48000", "12-2000", "9-1190", "73305-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(32011) ->
    #mission_cfg{
        mission_id=32011,
        type=3,
        need_level=40,
        need_mission=32010,
        need_power=15,
        daily_times=2,
        awards_a=["1-29900", "4-136000", "12-3000", "9-2160", "73305-1", "77008-1"],
        awards_b=["1-27600", "4-119000", "12-2800", "9-1980", "73305-1", "77007-1"],
        awards_c=["1-25300", "4-102000", "12-2600", "9-1800", "73305-1", "77007-1"],
        awards_d=["1-23000", "4-85000", "12-2400", "9-1620", "73305-1", "77006-1"],
        awards_e=["1-21850", "4-68000", "12-2200", "9-1440", "73305-1", "77006-1"],
        awards_f=["1-20700", "4-51000", "12-2000", "9-1260", "73305-1", "77006-1"],
        warrior_exp=100,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31021) ->
    #mission_cfg{
        mission_id=31021,
        type=2,
        need_level=40,
        need_mission=31020,
        need_power=15,
        daily_times=0,
        awards_a=["1-97500", "4-120000", "12-150", "9-0"],
        awards_b=["1-90000", "4-105000", "12-120", "9-0"],
        awards_c=["1-82500", "4-90000", "12-100", "9-0"],
        awards_d=["1-75000", "4-75000", "12-80", "9-0"],
        awards_e=["1-67500", "4-60000", "12-60", "9-0"],
        awards_f=["1-60000", "4-45000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31022) ->
    #mission_cfg{
        mission_id=31022,
        type=2,
        need_level=40,
        need_mission=31021,
        need_power=15,
        daily_times=0,
        awards_a=["1-97500", "4-120000", "12-150", "9-0"],
        awards_b=["1-90000", "4-105000", "12-120", "9-0"],
        awards_c=["1-82500", "4-90000", "12-100", "9-0"],
        awards_d=["1-75000", "4-75000", "12-80", "9-0"],
        awards_e=["1-67500", "4-60000", "12-60", "9-0"],
        awards_f=["1-60000", "4-45000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31023) ->
    #mission_cfg{
        mission_id=31023,
        type=2,
        need_level=40,
        need_mission=31022,
        need_power=15,
        daily_times=0,
        awards_a=["1-97500", "4-120000", "12-150", "9-0"],
        awards_b=["1-90000", "4-105000", "12-120", "9-0"],
        awards_c=["1-82500", "4-90000", "12-100", "9-0"],
        awards_d=["1-75000", "4-75000", "12-80", "9-0"],
        awards_e=["1-67500", "4-60000", "12-60", "9-0"],
        awards_f=["1-60000", "4-45000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31024) ->
    #mission_cfg{
        mission_id=31024,
        type=2,
        need_level=50,
        need_mission=31023,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31025) ->
    #mission_cfg{
        mission_id=31025,
        type=2,
        need_level=50,
        need_mission=31024,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31026) ->
    #mission_cfg{
        mission_id=31026,
        type=2,
        need_level=50,
        need_mission=31025,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31027) ->
    #mission_cfg{
        mission_id=31027,
        type=2,
        need_level=50,
        need_mission=31026,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31028) ->
    #mission_cfg{
        mission_id=31028,
        type=2,
        need_level=50,
        need_mission=31027,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(31029) ->
    #mission_cfg{
        mission_id=31029,
        type=2,
        need_level=50,
        need_mission=31028,
        need_power=15,
        daily_times=0,
        awards_a=["1-130000", "4-160000", "12-150", "9-0"],
        awards_b=["1-120000", "4-140000", "12-120", "9-0"],
        awards_c=["1-110000", "4-120000", "12-100", "9-0"],
        awards_d=["1-100000", "4-100000", "12-80", "9-0"],
        awards_e=["1-90000", "4-80000", "12-60", "9-0"],
        awards_f=["1-80000", "4-60000", "12-40", "9-0"],
        warrior_exp=20,
        open_week_day=[[]],
        start_time="",
        end_time=""};

get(34000) ->
    #mission_cfg{
        mission_id=34000,
        type=4,
        need_level=25,
        need_mission=0,
        need_power=15,
        daily_times=2,
        awards_a=["1-1000", "4-2000", "12-0", "9-0", "77114-5"],
        awards_b=["1-900", "4-1800", "12-0", "9-0", "77114-4"],
        awards_c=["1-800", "4-1600", "12-0", "9-0", "77114-4"],
        awards_d=["1-700", "4-1400", "12-0", "9-0", "77114-3"],
        awards_e=["1-600", "4-1200", "12-0", "9-0", "77114-3"],
        awards_f=["1-500", "4-1000", "12-0", "9-0", "77114-3"],
        warrior_exp=200,
        open_week_day=[1, 3, 5, 7],
        start_time="",
        end_time=""};

get(34001) ->
    #mission_cfg{
        mission_id=34001,
        type=4,
        need_level=40,
        need_mission=34000,
        need_power=20,
        daily_times=2,
        awards_a=["1-2000", "4-4000", "12-0", "9-0", "77115-5"],
        awards_b=["1-1800", "4-3600", "12-0", "9-0", "77115-4"],
        awards_c=["1-1600", "4-3200", "12-0", "9-0", "77115-4"],
        awards_d=["1-1400", "4-2800", "12-0", "9-0", "77115-3"],
        awards_e=["1-1200", "4-2400", "12-0", "9-0", "77115-3"],
        awards_f=["1-1000", "4-2000", "12-0", "9-0", "77115-3"],
        warrior_exp=500,
        open_week_day=[1, 3, 5, 7],
        start_time="",
        end_time=""};

get(34002) ->
    #mission_cfg{
        mission_id=34002,
        type=4,
        need_level=55,
        need_mission=34001,
        need_power=30,
        daily_times=2,
        awards_a=["1-5000", "4-10000", "12-0", "9-0", "77116-5"],
        awards_b=["1-4500", "4-9000", "12-0", "9-0", "77116-4"],
        awards_c=["1-4000", "4-8000", "12-0", "9-0", "77116-4"],
        awards_d=["1-3500", "4-7000", "12-0", "9-0", "77116-3"],
        awards_e=["1-3000", "4-6000", "12-0", "9-0", "77116-3"],
        awards_f=["1-2500", "4-5000", "12-0", "9-0", "77116-3"],
        warrior_exp=1000,
        open_week_day=[1, 3, 5, 7],
        start_time="",
        end_time=""};

get(34010) ->
    #mission_cfg{
        mission_id=34010,
        type=5,
        need_level=20,
        need_mission=0,
        need_power=10,
        daily_times=2,
        awards_a=["1-1000", "4-2000", "12-0", "9-1000"],
        awards_b=["1-900", "4-1800", "12-0", "9-900"],
        awards_c=["1-800", "4-1600", "12-0", "9-800"],
        awards_d=["1-700", "4-1400", "12-0", "9-700"],
        awards_e=["1-600", "4-1200", "12-0", "9-600"],
        awards_f=["1-500", "4-1000", "12-0", "9-500"],
        warrior_exp=20,
        open_week_day=[2, 4, 6, 7],
        start_time="",
        end_time=""};

get(34011) ->
    #mission_cfg{
        mission_id=34011,
        type=5,
        need_level=36,
        need_mission=34010,
        need_power=15,
        daily_times=2,
        awards_a=["1-2000", "4-4000", "12-0", "9-2000"],
        awards_b=["1-1800", "4-3600", "12-0", "9-1800"],
        awards_c=["1-1600", "4-3200", "12-0", "9-1600"],
        awards_d=["1-1400", "4-2800", "12-0", "9-1400"],
        awards_e=["1-1200", "4-2400", "12-0", "9-1200"],
        awards_f=["1-1000", "4-2000", "12-0", "9-1000"],
        warrior_exp=50,
        open_week_day=[2, 4, 6, 7],
        start_time="",
        end_time=""};

get(34012) ->
    #mission_cfg{
        mission_id=34012,
        type=5,
        need_level=52,
        need_mission=34011,
        need_power=20,
        daily_times=2,
        awards_a=["1-5000", "4-10000", "12-0", "9-4000"],
        awards_b=["1-4500", "4-9000", "12-0", "9-3600"],
        awards_c=["1-4000", "4-8000", "12-0", "9-3200"],
        awards_d=["1-3500", "4-7000", "12-0", "9-2800"],
        awards_e=["1-3000", "4-6000", "12-0", "9-2400"],
        awards_f=["1-2500", "4-5000", "12-0", "9-2000"],
        warrior_exp=100,
        open_week_day=[2, 4, 6, 7],
        start_time="",
        end_time=""};

get(34020) ->
    #mission_cfg{
        mission_id=34020,
        type=6,
        need_level=22,
        need_mission=0,
        need_power=10,
        daily_times=2,
        awards_a=["1-1000", "4-2000", "12-5000", "9-0"],
        awards_b=["1-900", "4-1800", "12-4500", "9-0"],
        awards_c=["1-800", "4-1600", "12-4000", "9-0"],
        awards_d=["1-700", "4-1400", "12-3500", "9-0"],
        awards_e=["1-600", "4-1200", "12-3000", "9-0"],
        awards_f=["1-500", "4-1000", "12-2500", "9-0"],
        warrior_exp=20,
        open_week_day=[1, 2, 4, 7],
        start_time="",
        end_time=""};

get(34021) ->
    #mission_cfg{
        mission_id=34021,
        type=6,
        need_level=38,
        need_mission=34020,
        need_power=15,
        daily_times=2,
        awards_a=["1-2000", "4-4000", "12-10000", "9-0"],
        awards_b=["1-1800", "4-3600", "12-9000", "9-0"],
        awards_c=["1-1600", "4-3200", "12-8000", "9-0"],
        awards_d=["1-1400", "4-2800", "12-7000", "9-0"],
        awards_e=["1-1200", "4-2400", "12-6000", "9-0"],
        awards_f=["1-1000", "4-2000", "12-5000", "9-0"],
        warrior_exp=50,
        open_week_day=[1, 2, 4, 7],
        start_time="",
        end_time=""};

get(34022) ->
    #mission_cfg{
        mission_id=34022,
        type=6,
        need_level=54,
        need_mission=34021,
        need_power=20,
        daily_times=2,
        awards_a=["1-5000", "4-10000", "12-20000", "9-0"],
        awards_b=["1-4500", "4-9000", "12-18000", "9-0"],
        awards_c=["1-4000", "4-8000", "12-16000", "9-0"],
        awards_d=["1-3500", "4-7000", "12-14000", "9-0"],
        awards_e=["1-3000", "4-6000", "12-12000", "9-0"],
        awards_f=["1-2500", "4-5000", "12-10000", "9-0"],
        warrior_exp=100,
        open_week_day=[1, 2, 4, 7],
        start_time="",
        end_time=""};

get(34030) ->
    #mission_cfg{
        mission_id=34030,
        type=7,
        need_level=18,
        need_mission=0,
        need_power=20,
        daily_times=2,
        awards_a=["1-1000", "4-2000", "12-0", "9-0", "76996-5", "76995-5"],
        awards_b=["1-900", "4-1800", "12-0", "9-0", "76996-4", "76995-4"],
        awards_c=["1-800", "4-1600", "12-0", "9-0", "76996-4", "76995-4"],
        awards_d=["1-700", "4-1400", "12-0", "9-0", "76996-3", "76995-3"],
        awards_e=["1-600", "4-1200", "12-0", "9-0", "76996-3", "76995-3"],
        awards_f=["1-500", "4-1000", "12-0", "9-0", "76996-3", "76995-3"],
        warrior_exp=20,
        open_week_day=[3, 5, 6],
        start_time="18:00",
        end_time="22:00"};

get(34031) ->
    #mission_cfg{
        mission_id=34031,
        type=7,
        need_level=34,
        need_mission=34030,
        need_power=30,
        daily_times=2,
        awards_a=["1-2000", "4-4000", "12-0", "9-0", "76997-5", "76996-5"],
        awards_b=["1-1800", "4-3600", "12-0", "9-0", "76997-4", "76996-4"],
        awards_c=["1-1600", "4-3200", "12-0", "9-0", "76997-4", "76996-4"],
        awards_d=["1-1400", "4-2800", "12-0", "9-0", "76997-3", "76996-3"],
        awards_e=["1-1200", "4-2400", "12-0", "9-0", "76997-3", "76996-3"],
        awards_f=["1-1000", "4-2000", "12-0", "9-0", "76997-3", "76996-3"],
        warrior_exp=50,
        open_week_day=[3, 5, 6],
        start_time="18:00",
        end_time="22:00"};

get(34032) ->
    #mission_cfg{
        mission_id=34032,
        type=7,
        need_level=50,
        need_mission=34031,
        need_power=40,
        daily_times=2,
        awards_a=["1-5000", "4-10000", "12-0", "9-0", "76998-5", "76997-5"],
        awards_b=["1-4500", "4-9000", "12-0", "9-0", "76998-4", "76997-4"],
        awards_c=["1-4000", "4-8000", "12-0", "9-0", "76998-4", "76997-4"],
        awards_d=["1-3500", "4-7000", "12-0", "9-0", "76998-3", "76997-3"],
        awards_e=["1-3000", "4-6000", "12-0", "9-0", "76998-3", "76997-3"],
        awards_f=["1-2500", "4-5000", "12-0", "9-0", "76998-3", "76997-3"],
        warrior_exp=100,
        open_week_day=[3, 5, 6],
        start_time="18:00",
        end_time="22:00"};

get(_) -> false.

get_all() ->
    [30001,30002,30003,30004,30005,30006,30007,30008,30009,30010,30011,30012,30013,30014,30015,30016,30017,30018,30019,30020,30021,30022,30023,30024,30025,30026,30027,30028,30029,30030,30031,30032,30033,30034,30035,30036,30037,30038,30039,30040,30041,30042,30043,30044,30045,30046,30047,30048,30049,30050,30051,30052,30053,30054,30055,30056,30057,30058,30059,30060,30061,30062,30063,30064,30065,30066,30067,30068,30069,30070,30071,30072,30073,30074,30075,30076,30077,30078,30079,30080,30081,30082,30083,30084,31000,31001,31002,31003,31004,31005,31006,31007,31008,32000,32001,32002,31009,31010,31011,31012,31013,31014,32003,32004,32005,31015,31016,31017,31018,31019,31020,32006,32007,32008,32009,32010,32011,31021,31022,31023,31024,31025,31026,31027,31028,31029,34000,34001,34002,34010,34011,34012,34020,34021,34022,34030,34031,34032].

