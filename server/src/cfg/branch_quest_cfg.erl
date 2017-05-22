-module(branch_quest_cfg).
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(62001) ->
    #branch_quest_cfg{
        id=62001,
        need_level=0,
        pre_quest_id=[60022],
        next_quest_id=62002,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30013,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-11970", "4-1676", "5-0", "0"],
        awards_10002=["1-11970", "4-1676", "5-0", "0"],
        awards_10003=["1-11970", "4-1676", "5-0", "0"]};

get(62002) ->
    #branch_quest_cfg{
        id=62002,
        need_level=0,
        pre_quest_id=[60023, 62001],
        next_quest_id=62003,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30014,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-12715", "4-1840", "5-0", "0"],
        awards_10002=["1-12715", "4-1840", "5-0", "0"],
        awards_10003=["1-12715", "4-1840", "5-0", "0"]};

get(62003) ->
    #branch_quest_cfg{
        id=62003,
        need_level=0,
        pre_quest_id=[60025, 62002],
        next_quest_id=62004,
        start_npc=100013,
        end_npc=100013,
        process=1,
        event_type=2,
        event=30016,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-14064", "4-2016", "5-0", "0"],
        awards_10002=["1-14064", "4-2016", "5-0", "0"],
        awards_10003=["1-14064", "4-2016", "5-0", "0"]};

get(62004) ->
    #branch_quest_cfg{
        id=62004,
        need_level=0,
        pre_quest_id=[60026, 62003],
        next_quest_id=62005,
        start_npc=100013,
        end_npc=100013,
        process=1,
        event_type=2,
        event=30017,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-23375", "4-2207", "5-0", "0"],
        awards_10002=["1-23375", "4-2207", "5-0", "0"],
        awards_10003=["1-23375", "4-2207", "5-0", "0"]};

get(62005) ->
    #branch_quest_cfg{
        id=62005,
        need_level=0,
        pre_quest_id=[60028, 62004],
        next_quest_id=62006,
        start_npc=100014,
        end_npc=100014,
        process=1,
        event_type=2,
        event=30019,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-42586", "4-2413", "5-0", "0"],
        awards_10002=["1-42586", "4-2413", "5-0", "0"],
        awards_10003=["1-42586", "4-2413", "5-0", "0"]};

get(62006) ->
    #branch_quest_cfg{
        id=62006,
        need_level=0,
        pre_quest_id=[60029, 62005],
        next_quest_id=62007,
        start_npc=100014,
        end_npc=100014,
        process=1,
        event_type=2,
        event=30020,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-52383", "4-2635", "5-0", "0"],
        awards_10002=["1-52383", "4-2635", "5-0", "0"],
        awards_10003=["1-52383", "4-2635", "5-0", "0"]};

get(62007) ->
    #branch_quest_cfg{
        id=62007,
        need_level=0,
        pre_quest_id=[60031, 62006],
        next_quest_id=62008,
        start_npc=100015,
        end_npc=100015,
        process=2,
        event_type=2,
        event=30022,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-72107", "4-2874", "5-0", "0"],
        awards_10002=["1-72107", "4-2874", "5-0", "0"],
        awards_10003=["1-72107", "4-2874", "5-0", "0"]};

get(62008) ->
    #branch_quest_cfg{
        id=62008,
        need_level=0,
        pre_quest_id=[60032, 62007],
        next_quest_id=62009,
        start_npc=100015,
        end_npc=100015,
        process=2,
        event_type=2,
        event=30023,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-81932", "4-3133", "5-0", "0"],
        awards_10002=["1-81932", "4-3133", "5-0", "0"],
        awards_10003=["1-81932", "4-3133", "5-0", "0"]};

get(62009) ->
    #branch_quest_cfg{
        id=62009,
        need_level=0,
        pre_quest_id=[60034, 62008],
        next_quest_id=62010,
        start_npc=100013,
        end_npc=100013,
        process=2,
        event_type=2,
        event=30025,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-91712", "4-3412", "5-0", "0"],
        awards_10002=["1-91712", "4-3412", "5-0", "0"],
        awards_10003=["1-91712", "4-3412", "5-0", "0"]};

get(62010) ->
    #branch_quest_cfg{
        id=62010,
        need_level=0,
        pre_quest_id=[60035, 62009],
        next_quest_id=62011,
        start_npc=100014,
        end_npc=100014,
        process=2,
        event_type=2,
        event=30026,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-96531", "4-3713", "5-0", "0"],
        awards_10002=["1-96531", "4-3713", "5-0", "0"],
        awards_10003=["1-96531", "4-3713", "5-0", "0"]};

get(62011) ->
    #branch_quest_cfg{
        id=62011,
        need_level=0,
        pre_quest_id=[60037, 62010],
        next_quest_id=62012,
        start_npc=100011,
        end_npc=100011,
        process=2,
        event_type=2,
        event=30028,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-104464", "4-4038", "5-0", "0"],
        awards_10002=["1-104464", "4-4038", "5-0", "0"],
        awards_10003=["1-104464", "4-4038", "5-0", "0"]};

get(62012) ->
    #branch_quest_cfg{
        id=62012,
        need_level=0,
        pre_quest_id=[60038, 62011],
        next_quest_id=62013,
        start_npc=100011,
        end_npc=100011,
        process=2,
        event_type=2,
        event=30029,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-107577", "4-4389", "5-0", "0"],
        awards_10002=["1-107577", "4-4389", "5-0", "0"],
        awards_10003=["1-107577", "4-4389", "5-0", "0"]};

get(64001) ->
    #branch_quest_cfg{
        id=64001,
        need_level=0,
        pre_quest_id=[60024],
        next_quest_id=64002,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52274,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-30000", "4-10000", "5-0", "0"],
        awards_10002=["1-30000", "4-10000", "5-0", "0"],
        awards_10003=["1-30000", "4-10000", "5-0", "0"]};

get(64002) ->
    #branch_quest_cfg{
        id=64002,
        need_level=0,
        pre_quest_id=[60027, 64001],
        next_quest_id=64003,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52279,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-50000", "4-10000", "5-0", "0"],
        awards_10002=["1-50000", "4-10000", "5-0", "0"],
        awards_10003=["1-50000", "4-10000", "5-0", "0"]};

get(64003) ->
    #branch_quest_cfg{
        id=64003,
        need_level=0,
        pre_quest_id=[60030, 64002],
        next_quest_id=64004,
        start_npc=100013,
        end_npc=100013,
        process=1,
        event_type=3,
        event=52286,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-70000", "4-10000", "5-0", "0"],
        awards_10002=["1-70000", "4-10000", "5-0", "0"],
        awards_10003=["1-70000", "4-10000", "5-0", "0"]};

get(64004) ->
    #branch_quest_cfg{
        id=64004,
        need_level=0,
        pre_quest_id=[60033, 64003],
        next_quest_id=64005,
        start_npc=100014,
        end_npc=100014,
        process=1,
        event_type=3,
        event=52291,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-110000", "4-20000", "5-0", "0"],
        awards_10002=["1-110000", "4-20000", "5-0", "0"],
        awards_10003=["1-110000", "4-20000", "5-0", "0"]};

get(64005) ->
    #branch_quest_cfg{
        id=64005,
        need_level=0,
        pre_quest_id=[60036, 64004],
        next_quest_id=64006,
        start_npc=100015,
        end_npc=100015,
        process=1,
        event_type=3,
        event=52296,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-120000", "4-20000", "5-0", "0"],
        awards_10002=["1-120000", "4-20000", "5-0", "0"],
        awards_10003=["1-120000", "4-20000", "5-0", "0"]};

get(64006) ->
    #branch_quest_cfg{
        id=64006,
        need_level=0,
        pre_quest_id=[60037, 64005],
        next_quest_id=64007,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52302,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-130000", "4-20000", "5-0", "0"],
        awards_10002=["1-130000", "4-20000", "5-0", "0"],
        awards_10003=["1-130000", "4-20000", "5-0", "0"]};

get(65001) ->
    #branch_quest_cfg{
        id=65001,
        need_level=0,
        pre_quest_id=[60030],
        next_quest_id=65002,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52341,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-160000", "4-50000", "5-0", "0"],
        awards_10002=["1-160000", "4-50000", "5-0", "0"],
        awards_10003=["1-160000", "4-50000", "5-0", "0"]};

get(65002) ->
    #branch_quest_cfg{
        id=65002,
        need_level=0,
        pre_quest_id=[60036, 65001],
        next_quest_id=65003,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52348,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-180000", "4-50000", "5-0", "0"],
        awards_10002=["1-180000", "4-50000", "5-0", "0"],
        awards_10003=["1-180000", "4-50000", "5-0", "0"]};

get(65003) ->
    #branch_quest_cfg{
        id=65003,
        need_level=0,
        pre_quest_id=[60039, 65002],
        next_quest_id=65004,
        start_npc=100013,
        end_npc=100013,
        process=1,
        event_type=3,
        event=52355,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-200000", "4-50000", "5-0", "0"],
        awards_10002=["1-200000", "4-50000", "5-0", "0"],
        awards_10003=["1-200000", "4-50000", "5-0", "0"]};

get(62013) ->
    #branch_quest_cfg{
        id=62013,
        need_level=0,
        pre_quest_id=[60041, 62012],
        next_quest_id=62014,
        start_npc=100021,
        end_npc=100021,
        process=3,
        event_type=2,
        event=30031,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-124287", "4-4767", "5-0", "0"],
        awards_10002=["1-124287", "4-4767", "5-0", "0"],
        awards_10003=["1-124287", "4-4767", "5-0", "0"]};

get(62014) ->
    #branch_quest_cfg{
        id=62014,
        need_level=0,
        pre_quest_id=[60042, 62013],
        next_quest_id=62015,
        start_npc=100021,
        end_npc=100021,
        process=3,
        event_type=2,
        event=30032,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-128686", "4-5176", "5-0", "0"],
        awards_10002=["1-128686", "4-5176", "5-0", "0"],
        awards_10003=["1-128686", "4-5176", "5-0", "0"]};

get(62015) ->
    #branch_quest_cfg{
        id=62015,
        need_level=0,
        pre_quest_id=[60044, 62014],
        next_quest_id=62016,
        start_npc=100023,
        end_npc=100023,
        process=3,
        event_type=2,
        event=30034,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-137187", "4-5617", "5-0", "0"],
        awards_10002=["1-137187", "4-5617", "5-0", "0"],
        awards_10003=["1-137187", "4-5617", "5-0", "0"]};

get(62016) ->
    #branch_quest_cfg{
        id=62016,
        need_level=0,
        pre_quest_id=[60045, 62015],
        next_quest_id=62017,
        start_npc=100023,
        end_npc=100023,
        process=3,
        event_type=2,
        event=30035,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-141263", "4-6093", "5-0", "0"],
        awards_10002=["1-141263", "4-6093", "5-0", "0"],
        awards_10003=["1-141263", "4-6093", "5-0", "0"]};

get(62017) ->
    #branch_quest_cfg{
        id=62017,
        need_level=0,
        pre_quest_id=[60048, 62016],
        next_quest_id=62018,
        start_npc=100024,
        end_npc=100024,
        process=3,
        event_type=2,
        event=30037,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-149140", "4-6606", "5-0", "0"],
        awards_10002=["1-149140", "4-6606", "5-0", "0"],
        awards_10003=["1-149140", "4-6606", "5-0", "0"]};

get(62018) ->
    #branch_quest_cfg{
        id=62018,
        need_level=0,
        pre_quest_id=[60049, 62017],
        next_quest_id=62019,
        start_npc=100024,
        end_npc=100024,
        process=3,
        event_type=2,
        event=30038,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-152940", "4-7161", "5-0", "0"],
        awards_10002=["1-152940", "4-7161", "5-0", "0"],
        awards_10003=["1-152940", "4-7161", "5-0", "0"]};

get(62019) ->
    #branch_quest_cfg{
        id=62019,
        need_level=0,
        pre_quest_id=[60051, 62018],
        next_quest_id=62020,
        start_npc=100025,
        end_npc=100025,
        process=3,
        event_type=2,
        event=30040,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-160091", "4-7759", "5-0", "0"],
        awards_10002=["1-160091", "4-7759", "5-0", "0"],
        awards_10003=["1-160091", "4-7759", "5-0", "0"]};

get(62020) ->
    #branch_quest_cfg{
        id=62020,
        need_level=0,
        pre_quest_id=[60052, 62019],
        next_quest_id=62021,
        start_npc=100025,
        end_npc=100025,
        process=3,
        event_type=2,
        event=30041,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-163415", "4-8405", "5-0", "0"],
        awards_10002=["1-163415", "4-8405", "5-0", "0"],
        awards_10003=["1-163415", "4-8405", "5-0", "0"]};

get(62021) ->
    #branch_quest_cfg{
        id=62021,
        need_level=0,
        pre_quest_id=[60055, 62020],
        next_quest_id=62022,
        start_npc=100022,
        end_npc=100022,
        process=3,
        event_type=2,
        event=30043,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-169712", "4-9101", "5-0", "0"],
        awards_10002=["1-169712", "4-9101", "5-0", "0"],
        awards_10003=["1-169712", "4-9101", "5-0", "0"]};

get(62022) ->
    #branch_quest_cfg{
        id=62022,
        need_level=0,
        pre_quest_id=[60056, 62021],
        next_quest_id=62023,
        start_npc=100022,
        end_npc=100022,
        process=3,
        event_type=2,
        event=30044,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-172734", "4-9853", "5-0", "0"],
        awards_10002=["1-172734", "4-9853", "5-0", "0"],
        awards_10003=["1-172734", "4-9853", "5-0", "0"]};

get(62023) ->
    #branch_quest_cfg{
        id=62023,
        need_level=0,
        pre_quest_id=[60058, 62022],
        next_quest_id=62024,
        start_npc=100021,
        end_npc=100021,
        process=3,
        event_type=2,
        event=30046,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-178075", "4-10665", "5-0", "0"],
        awards_10002=["1-178075", "4-10665", "5-0", "0"],
        awards_10003=["1-178075", "4-10665", "5-0", "0"]};

get(62024) ->
    #branch_quest_cfg{
        id=62024,
        need_level=0,
        pre_quest_id=[60059, 62023],
        next_quest_id=62025,
        start_npc=100021,
        end_npc=100021,
        process=3,
        event_type=2,
        event=30047,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-180369", "4-11541", "5-0", "0"],
        awards_10002=["1-180369", "4-11541", "5-0", "0"],
        awards_10003=["1-180369", "4-11541", "5-0", "0"]};

get(64007) ->
    #branch_quest_cfg{
        id=64007,
        need_level=0,
        pre_quest_id=[60043, 64006],
        next_quest_id=64008,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52307,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-150000", "4-30000", "5-0", "0"],
        awards_10002=["1-150000", "4-30000", "5-0", "0"],
        awards_10003=["1-150000", "4-30000", "5-0", "0"]};

get(64008) ->
    #branch_quest_cfg{
        id=64008,
        need_level=0,
        pre_quest_id=[60046, 64007],
        next_quest_id=64009,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52312,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-170000", "4-30000", "5-0", "0"],
        awards_10002=["1-170000", "4-30000", "5-0", "0"],
        awards_10003=["1-170000", "4-30000", "5-0", "0"]};

get(64009) ->
    #branch_quest_cfg{
        id=64009,
        need_level=0,
        pre_quest_id=[60050, 64008],
        next_quest_id=64010,
        start_npc=100023,
        end_npc=100023,
        process=1,
        event_type=3,
        event=52318,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-190000", "4-30000", "5-0", "0"],
        awards_10002=["1-190000", "4-30000", "5-0", "0"],
        awards_10003=["1-190000", "4-30000", "5-0", "0"]};

get(64010) ->
    #branch_quest_cfg{
        id=64010,
        need_level=0,
        pre_quest_id=[60053, 64009],
        next_quest_id=64011,
        start_npc=100024,
        end_npc=100024,
        process=1,
        event_type=3,
        event=52323,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-200000", "4-35000", "5-0", "0"],
        awards_10002=["1-200000", "4-35000", "5-0", "0"],
        awards_10003=["1-200000", "4-35000", "5-0", "0"]};

get(64011) ->
    #branch_quest_cfg{
        id=64011,
        need_level=0,
        pre_quest_id=[60057, 64010],
        next_quest_id=64012,
        start_npc=100025,
        end_npc=100025,
        process=1,
        event_type=3,
        event=52328,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-210000", "4-35000", "5-0", "0"],
        awards_10002=["1-210000", "4-35000", "5-0", "0"],
        awards_10003=["1-210000", "4-35000", "5-0", "0"]};

get(64012) ->
    #branch_quest_cfg{
        id=64012,
        need_level=0,
        pre_quest_id=[60060, 64011],
        next_quest_id=64013,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52334,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-220000", "4-35000", "5-0", "0"],
        awards_10002=["1-220000", "4-35000", "5-0", "0"],
        awards_10003=["1-220000", "4-35000", "5-0", "0"]};

get(65004) ->
    #branch_quest_cfg{
        id=65004,
        need_level=0,
        pre_quest_id=[60043, 65003],
        next_quest_id=65002,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52362,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-250000", "4-100000", "5-0", "0"],
        awards_10002=["1-250000", "4-100000", "5-0", "0"],
        awards_10003=["1-250000", "4-100000", "5-0", "0"]};

get(65005) ->
    #branch_quest_cfg{
        id=65005,
        need_level=0,
        pre_quest_id=[60050, 65004],
        next_quest_id=65003,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52369,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-300000", "4-100000", "5-0", "0"],
        awards_10002=["1-300000", "4-100000", "5-0", "0"],
        awards_10003=["1-300000", "4-100000", "5-0", "0"]};

get(65006) ->
    #branch_quest_cfg{
        id=65006,
        need_level=0,
        pre_quest_id=[60057, 65005],
        next_quest_id=65004,
        start_npc=100023,
        end_npc=100023,
        process=1,
        event_type=3,
        event=52376,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-350000", "4-100000", "5-0", "0"],
        awards_10002=["1-350000", "4-100000", "5-0", "0"],
        awards_10003=["1-350000", "4-100000", "5-0", "0"]};

get(62025) ->
    #branch_quest_cfg{
        id=62025,
        need_level=0,
        pre_quest_id=[60062, 62024],
        next_quest_id=62026,
        start_npc=100031,
        end_npc=100031,
        process=4,
        event_type=2,
        event=30049,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-188075", "4-12417", "5-0", "0"],
        awards_10002=["1-188075", "4-12417", "5-0", "0"],
        awards_10003=["1-188075", "4-12417", "5-0", "0"]};

get(62026) ->
    #branch_quest_cfg{
        id=62026,
        need_level=0,
        pre_quest_id=[60063, 62025],
        next_quest_id=62027,
        start_npc=100031,
        end_npc=100031,
        process=4,
        event_type=2,
        event=30050,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-195781", "4-13293", "5-0", "0"],
        awards_10002=["1-195781", "4-13293", "5-0", "0"],
        awards_10003=["1-195781", "4-13293", "5-0", "0"]};

get(62027) ->
    #branch_quest_cfg{
        id=62027,
        need_level=0,
        pre_quest_id=[60065, 62026],
        next_quest_id=62028,
        start_npc=100033,
        end_npc=100033,
        process=4,
        event_type=2,
        event=30052,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-203487", "4-14169", "5-0", "0"],
        awards_10002=["1-203487", "4-14169", "5-0", "0"],
        awards_10003=["1-203487", "4-14169", "5-0", "0"]};

get(62028) ->
    #branch_quest_cfg{
        id=62028,
        need_level=0,
        pre_quest_id=[60066, 62027],
        next_quest_id=62029,
        start_npc=100033,
        end_npc=100033,
        process=4,
        event_type=2,
        event=30053,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-211193", "4-15045", "5-0", "0"],
        awards_10002=["1-211193", "4-15045", "5-0", "0"],
        awards_10003=["1-211193", "4-15045", "5-0", "0"]};

get(62029) ->
    #branch_quest_cfg{
        id=62029,
        need_level=0,
        pre_quest_id=[60068, 62028],
        next_quest_id=62030,
        start_npc=100034,
        end_npc=100034,
        process=4,
        event_type=2,
        event=30055,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-218899", "4-15921", "5-0", "0"],
        awards_10002=["1-218899", "4-15921", "5-0", "0"],
        awards_10003=["1-218899", "4-15921", "5-0", "0"]};

get(62030) ->
    #branch_quest_cfg{
        id=62030,
        need_level=0,
        pre_quest_id=[60069, 62029],
        next_quest_id=62031,
        start_npc=100034,
        end_npc=100034,
        process=4,
        event_type=2,
        event=30056,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-226605", "4-16797", "5-0", "0"],
        awards_10002=["1-226605", "4-16797", "5-0", "0"],
        awards_10003=["1-226605", "4-16797", "5-0", "0"]};

get(62031) ->
    #branch_quest_cfg{
        id=62031,
        need_level=0,
        pre_quest_id=[60071, 62030],
        next_quest_id=62032,
        start_npc=100035,
        end_npc=100035,
        process=4,
        event_type=2,
        event=30058,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-234311", "4-17673", "5-0", "0"],
        awards_10002=["1-234311", "4-17673", "5-0", "0"],
        awards_10003=["1-234311", "4-17673", "5-0", "0"]};

get(62032) ->
    #branch_quest_cfg{
        id=62032,
        need_level=0,
        pre_quest_id=[60072, 62031],
        next_quest_id=62033,
        start_npc=100035,
        end_npc=100035,
        process=4,
        event_type=2,
        event=30059,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-242017", "4-18549", "5-0", "0"],
        awards_10002=["1-242017", "4-18549", "5-0", "0"],
        awards_10003=["1-242017", "4-18549", "5-0", "0"]};

get(62033) ->
    #branch_quest_cfg{
        id=62033,
        need_level=0,
        pre_quest_id=[60074, 62032],
        next_quest_id=62034,
        start_npc=100031,
        end_npc=100031,
        process=4,
        event_type=2,
        event=30061,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-249723", "4-19425", "5-0", "0"],
        awards_10002=["1-249723", "4-19425", "5-0", "0"],
        awards_10003=["1-249723", "4-19425", "5-0", "0"]};

get(62034) ->
    #branch_quest_cfg{
        id=62034,
        need_level=0,
        pre_quest_id=[60075, 62033],
        next_quest_id=62035,
        start_npc=100031,
        end_npc=100031,
        process=4,
        event_type=2,
        event=30062,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-257429", "4-20301", "5-0", "0"],
        awards_10002=["1-257429", "4-20301", "5-0", "0"],
        awards_10003=["1-257429", "4-20301", "5-0", "0"]};

get(62035) ->
    #branch_quest_cfg{
        id=62035,
        need_level=0,
        pre_quest_id=[60077, 62034],
        next_quest_id=62036,
        start_npc=100031,
        end_npc=100031,
        process=4,
        event_type=2,
        event=30064,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-265135", "4-21177", "5-0", "0"],
        awards_10002=["1-265135", "4-21177", "5-0", "0"],
        awards_10003=["1-265135", "4-21177", "5-0", "0"]};

get(62036) ->
    #branch_quest_cfg{
        id=62036,
        need_level=0,
        pre_quest_id=[60078, 62035],
        next_quest_id=62037,
        start_npc=100033,
        end_npc=100033,
        process=4,
        event_type=2,
        event=30065,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-272841", "4-22053", "5-0", "0"],
        awards_10002=["1-272841", "4-22053", "5-0", "0"],
        awards_10003=["1-272841", "4-22053", "5-0", "0"]};

get(64013) ->
    #branch_quest_cfg{
        id=64013,
        need_level=0,
        pre_quest_id=[60064, 64012],
        next_quest_id=64014,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=3,
        event=52441,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-240000", "4-40000", "5-0", "0"],
        awards_10002=["1-240000", "4-40000", "5-0", "0"],
        awards_10003=["1-240000", "4-40000", "5-0", "0"]};

get(64014) ->
    #branch_quest_cfg{
        id=64014,
        need_level=0,
        pre_quest_id=[60067, 64013],
        next_quest_id=64015,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=3,
        event=52446,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-260000", "4-40000", "5-0", "0"],
        awards_10002=["1-260000", "4-40000", "5-0", "0"],
        awards_10003=["1-260000", "4-40000", "5-0", "0"]};

get(64015) ->
    #branch_quest_cfg{
        id=64015,
        need_level=0,
        pre_quest_id=[60070, 64014],
        next_quest_id=64016,
        start_npc=100033,
        end_npc=100033,
        process=1,
        event_type=3,
        event=52452,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-280000", "4-40000", "5-0", "0"],
        awards_10002=["1-280000", "4-40000", "5-0", "0"],
        awards_10003=["1-280000", "4-40000", "5-0", "0"]};

get(64016) ->
    #branch_quest_cfg{
        id=64016,
        need_level=0,
        pre_quest_id=[60073, 64015],
        next_quest_id=64017,
        start_npc=100033,
        end_npc=100033,
        process=1,
        event_type=3,
        event=52457,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-310000", "4-45000", "5-0", "0"],
        awards_10002=["1-310000", "4-45000", "5-0", "0"],
        awards_10003=["1-310000", "4-45000", "5-0", "0"]};

get(64017) ->
    #branch_quest_cfg{
        id=64017,
        need_level=0,
        pre_quest_id=[60076, 64016],
        next_quest_id=64018,
        start_npc=100034,
        end_npc=100034,
        process=1,
        event_type=3,
        event=52462,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-340000", "4-45000", "5-0", "0"],
        awards_10002=["1-340000", "4-45000", "5-0", "0"],
        awards_10003=["1-340000", "4-45000", "5-0", "0"]};

get(64018) ->
    #branch_quest_cfg{
        id=64018,
        need_level=0,
        pre_quest_id=[60079, 64017],
        next_quest_id=64019,
        start_npc=100034,
        end_npc=100034,
        process=1,
        event_type=3,
        event=52468,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-370000", "4-45000", "5-0", "0"],
        awards_10002=["1-370000", "4-45000", "5-0", "0"],
        awards_10003=["1-370000", "4-45000", "5-0", "0"]};

get(65007) ->
    #branch_quest_cfg{
        id=65007,
        need_level=0,
        pre_quest_id=[60064, 65006],
        next_quest_id=65008,
        start_npc=100034,
        end_npc=100034,
        process=1,
        event_type=3,
        event=52475,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-400000", "4-150000", "5-0", "0"],
        awards_10002=["1-400000", "4-150000", "5-0", "0"],
        awards_10003=["1-400000", "4-150000", "5-0", "0"]};

get(65008) ->
    #branch_quest_cfg{
        id=65008,
        need_level=0,
        pre_quest_id=[60067, 65007],
        next_quest_id=65009,
        start_npc=100034,
        end_npc=100034,
        process=1,
        event_type=3,
        event=52482,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-400000", "4-150000", "5-0", "0"],
        awards_10002=["1-400000", "4-150000", "5-0", "0"],
        awards_10003=["1-400000", "4-150000", "5-0", "0"]};

get(65009) ->
    #branch_quest_cfg{
        id=65009,
        need_level=0,
        pre_quest_id=[60070, 65008],
        next_quest_id=65010,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=3,
        event=52489,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-450000", "4-150000", "5-0", "0"],
        awards_10002=["1-450000", "4-150000", "5-0", "0"],
        awards_10003=["1-450000", "4-150000", "5-0", "0"]};

get(65010) ->
    #branch_quest_cfg{
        id=65010,
        need_level=0,
        pre_quest_id=[60073, 65009],
        next_quest_id=65011,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=3,
        event=52496,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-450000", "4-150000", "5-0", "0"],
        awards_10002=["1-450000", "4-150000", "5-0", "0"],
        awards_10003=["1-450000", "4-150000", "5-0", "0"]};

get(65011) ->
    #branch_quest_cfg{
        id=65011,
        need_level=0,
        pre_quest_id=[60076, 65010],
        next_quest_id=65012,
        start_npc=100033,
        end_npc=100033,
        process=1,
        event_type=3,
        event=52503,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-500000", "4-150000", "5-0", "0"],
        awards_10002=["1-500000", "4-150000", "5-0", "0"],
        awards_10003=["1-500000", "4-150000", "5-0", "0"]};

get(65012) ->
    #branch_quest_cfg{
        id=65012,
        need_level=0,
        pre_quest_id=[60079, 65011],
        next_quest_id=65013,
        start_npc=100033,
        end_npc=100033,
        process=1,
        event_type=3,
        event=52510,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-500000", "4-150000", "5-0", "0"],
        awards_10002=["1-500000", "4-150000", "5-0", "0"],
        awards_10003=["1-500000", "4-150000", "5-0", "0"]};

get(66001) ->
    #branch_quest_cfg{
        id=66001,
        need_level=0,
        pre_quest_id=[60022],
        next_quest_id=66002,
        start_npc=100015,
        end_npc=100015,
        process=1,
        event_type=22,
        event=0,
        check_tag="compare",
        check_script=fun() -> #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),#role_warrior{warrior_attach_id = Aid} = RoleWarrior,if Aid =/= 0 ->    1;    true -> 0end end,
        awards_10001=["1-0", "4-2000", "5-0", "77114-1"],
        awards_10002=["1-0", "4-2000", "5-0", "77114-1"],
        awards_10003=["1-0", "4-2000", "5-0", "77114-1"]};

get(66002) ->
    #branch_quest_cfg{
        id=66002,
        need_level=0,
        pre_quest_id=[60039, 66001],
        next_quest_id=66003,
        start_npc=100015,
        end_npc=100015,
        process=1,
        event_type=21,
        event=0,
        check_tag="compare",
        check_script=fun() -> #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),#role_warrior{warrior_id = Wids} = RoleWarrior,if length(Wids) >= 2 ->    1;    true -> 0end end,
        awards_10001=["1-0", "4-5000", "5-0", "77114-1"],
        awards_10002=["1-0", "4-5000", "5-0", "77114-1"],
        awards_10003=["1-0", "4-5000", "5-0", "77114-1"]};

get(66003) ->
    #branch_quest_cfg{
        id=66003,
        need_level=0,
        pre_quest_id=[60066, 66002],
        next_quest_id=66004,
        start_npc=100035,
        end_npc=100035,
        process=1,
        event_type=21,
        event=0,
        check_tag="compare",
        check_script=fun() -> #game_info{role_warrior=RoleWarrior} = role_api:get_user_data(),#role_warrior{warrior_id = Wids} = RoleWarrior,if length(Wids) >= 3 ->    1;    true -> 0end end,
        awards_10001=["1-0", "4-10000", "5-0", "77114-1"],
        awards_10002=["1-0", "4-10000", "5-0", "77114-1"],
        awards_10003=["1-0", "4-10000", "5-0", "77114-1"]};

get(_) -> false.

get_all() ->
    [62001,62002,62003,62004,62005,62006,62007,62008,62009,62010,62011,62012,64001,64002,64003,64004,64005,64006,65001,65002,65003,62013,62014,62015,62016,62017,62018,62019,62020,62021,62022,62023,62024,64007,64008,64009,64010,64011,64012,65004,65005,65006,62025,62026,62027,62028,62029,62030,62031,62032,62033,62034,62035,62036,64013,64014,64015,64016,64017,64018,65007,65008,65009,65010,65011,65012,66001,66002,66003].

