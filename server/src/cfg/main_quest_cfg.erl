-module(main_quest_cfg).
-include("cfg_record.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-export([get/1]).

get(60001) ->
    #main_quest_cfg{
        id=60001,
        need_level=0,
        pre_quest_id=[0],
        next_quest_id=60002,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=1,
        event=100001,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-240", "4-100", "5-0", "0"],
        awards_10002=["1-240", "4-100", "5-0", "0"],
        awards_10003=["1-240", "4-100", "5-0", "0"]};

get(60002) ->
    #main_quest_cfg{
        id=60002,
        need_level=0,
        pre_quest_id=[60001],
        next_quest_id=60003,
        start_npc=100001,
        end_npc=100005,
        process=1,
        event_type=1,
        event=100001,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-834", "4-270", "5-0", "76000-1"],
        awards_10002=["1-834", "4-270", "5-0", "76000-1"],
        awards_10003=["1-834", "4-270", "5-0", "76000-1"]};

get(60003) ->
    #main_quest_cfg{
        id=60003,
        need_level=0,
        pre_quest_id=[60002],
        next_quest_id=60004,
        start_npc=100005,
        end_npc=100001,
        process=1,
        event_type=2,
        event=30002,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-1429", "4-404", "5-0", "0"],
        awards_10002=["1-1429", "4-404", "5-0", "0"],
        awards_10003=["1-1429", "4-404", "5-0", "0"]};

get(60004) ->
    #main_quest_cfg{
        id=60004,
        need_level=0,
        pre_quest_id=[60003],
        next_quest_id=60005,
        start_npc=100001,
        end_npc=100001,
        process=2,
        event_type=20,
        event=0,
        check_tag="compare",
        check_script=fun() -> _GameInfo = role_api:get_user_data(),
_Job = _GameInfo#game_info.role#role.job,
Result = case _Job of
    10001 -> skill_api:skill_info(_GameInfo, 120001);
    10002 -> skill_api:skill_info(_GameInfo, 120004);
    10003 -> skill_api:skill_info(_GameInfo, 120007) 
    end,
case Result of
    false -> 0;
    #skill{level = L} -> L  
end end,
        awards_10001=["1-1680", "4-367", "5-0", "0"],
        awards_10002=["1-1680", "4-367", "5-0", "0"],
        awards_10003=["1-1680", "4-367", "5-0", "0"]};

get(60005) ->
    #main_quest_cfg{
        id=60005,
        need_level=0,
        pre_quest_id=[60004],
        next_quest_id=60006,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52006,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-2231", "4-448", "5-0", "0"],
        awards_10002=["1-2231", "4-448", "5-0", "0"],
        awards_10003=["1-2231", "4-448", "5-0", "0"]};

get(60006) ->
    #main_quest_cfg{
        id=60006,
        need_level=0,
        pre_quest_id=[60005],
        next_quest_id=60007,
        start_npc=100001,
        end_npc=100005,
        process=3,
        event_type=15,
        event=0,
        check_tag="compare",
        check_script=fun() -> #game_info{role=__Role} = role_api:get_user_data(),
__Job = __Role#role.job,
__ItemIdList = case __Job of
    10001 -> [70000,70018,70036,70054,70072];
    10002 -> [70006,70024,70042,70060,70078];
    10003 -> [70012,70030,70048,70066,70084]
end,
F = fun(X, Acc0)->
 Acc0 ++ item_api:get_info_by_item_id(X, [1, 2])
end,
__ItemList = lists:foldl(F, [], __ItemIdList),
lists:max([X#item.level || X <- __ItemList, X /= false]++[0]) end,
        awards_10001=["1-2920", "4-2535", "5-0", "0"],
        awards_10002=["1-2920", "4-2535", "5-0", "0"],
        awards_10003=["1-2920", "4-2535", "5-0", "0"]};

get(60007) ->
    #main_quest_cfg{
        id=60007,
        need_level=0,
        pre_quest_id=[60006],
        next_quest_id=60008,
        start_npc=100005,
        end_npc=100001,
        process=1,
        event_type=2,
        event=30004,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-3572", "4-628", "5-0", "0"],
        awards_10002=["1-3572", "4-628", "5-0", "0"],
        awards_10003=["1-3572", "4-628", "5-0", "0"]};

get(60008) ->
    #main_quest_cfg{
        id=60008,
        need_level=0,
        pre_quest_id=[60007],
        next_quest_id=60009,
        start_npc=100001,
        end_npc=100001,
        process=3,
        event_type=14,
        event=0,
        check_tag="compare",
        check_script=fun() -> _GameInfo = role_api:get_user_data(),
_Job = _GameInfo#game_info.role#role.job,
Result = case _Job of
    10001 -> [skill_api:spell_info(_GameInfo, 110201), skill_api:spell_info(_GameInfo, 110202),skill_api:spell_info(_GameInfo, 110203),skill_api:spell_info(_GameInfo, 110204)];
    10002 -> [skill_api:spell_info(_GameInfo, 110213), skill_api:spell_info(_GameInfo, 110214),skill_api:spell_info(_GameInfo, 110215),skill_api:spell_info(_GameInfo, 110216)];
    10003 -> [skill_api:spell_info(_GameInfo, 110225), skill_api:spell_info(_GameInfo, 110226), skill_api:spell_info(_GameInfo, 110227), skill_api:spell_info(_GameInfo, 110228)] 
end,
lists:max([0 |[X#spell.level || X <- Result, X =/= false]]) end,
        awards_10001=["1-4824", "4-730", "5-0", "0"],
        awards_10002=["1-4824", "4-730", "5-0", "0"],
        awards_10003=["1-4824", "4-730", "5-0", "0"]};

get(60009) ->
    #main_quest_cfg{
        id=60009,
        need_level=0,
        pre_quest_id=[60008],
        next_quest_id=60010,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52013,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-5933", "4-839", "5-0", "0"],
        awards_10002=["1-5933", "4-839", "5-0", "0"],
        awards_10003=["1-5933", "4-839", "5-0", "0"]};

get(60010) ->
    #main_quest_cfg{
        id=60010,
        need_level=0,
        pre_quest_id=[60009],
        next_quest_id=60011,
        start_npc=100001,
        end_npc=100001,
        process=3,
        event_type=20,
        event=0,
        check_tag="compare",
        check_script=fun() -> _GameInfo = role_api:get_user_data(),
_Job = _GameInfo#game_info.role#role.job,
Result = case _Job of
    10001 -> skill_api:skill_info(_GameInfo, 120001);
    10002 -> skill_api:skill_info(_GameInfo, 120004);
    10003 -> skill_api:skill_info(_GameInfo, 120007) 
    end,
case Result of
    false -> 0;
    #skill{level = L} -> L  
end end,
        awards_10001=["1-6516", "4-957", "5-0", "0"],
        awards_10002=["1-6516", "4-957", "5-0", "0"],
        awards_10003=["1-6516", "4-957", "5-0", "0"]};

get(60011) ->
    #main_quest_cfg{
        id=60011,
        need_level=0,
        pre_quest_id=[60010],
        next_quest_id=60012,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52017,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-7242", "4-1084", "5-0", "0"],
        awards_10002=["1-7242", "4-1084", "5-0", "0"],
        awards_10003=["1-7242", "4-1084", "5-0", "0"]};

get(60012) ->
    #main_quest_cfg{
        id=60012,
        need_level=0,
        pre_quest_id=[60011],
        next_quest_id=60013,
        start_npc=100001,
        end_npc=100001,
        process=4,
        event_type=20,
        event=0,
        check_tag="compare",
        check_script=fun() -> _GameInfo = role_api:get_user_data(),
_Job = _GameInfo#game_info.role#role.job,
Result = case _Job of
    10001 -> skill_api:skill_info(_GameInfo, 120001);
    10002 -> skill_api:skill_info(_GameInfo, 120004);
    10003 -> skill_api:skill_info(_GameInfo, 120007) 
    end,
case Result of
    false -> 0;
    #skill{level = L} -> L  
end end,
        awards_10001=["1-7880", "4-1221", "5-0", "0"],
        awards_10002=["1-7880", "4-1221", "5-0", "0"],
        awards_10003=["1-7880", "4-1221", "5-0", "0"]};

get(60013) ->
    #main_quest_cfg{
        id=60013,
        need_level=0,
        pre_quest_id=[60012],
        next_quest_id=60014,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52021,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-8254", "4-1370", "5-0", "0"],
        awards_10002=["1-8254", "4-1370", "5-0", "0"],
        awards_10003=["1-8254", "4-1370", "5-0", "0"]};

get(60014) ->
    #main_quest_cfg{
        id=60014,
        need_level=0,
        pre_quest_id=[60013],
        next_quest_id=60015,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52025,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-8727", "4-1529", "5-0", "0"],
        awards_10002=["1-8727", "4-1529", "5-0", "0"],
        awards_10003=["1-8727", "4-1529", "5-0", "0"]};

get(60015) ->
    #main_quest_cfg{
        id=60015,
        need_level=0,
        pre_quest_id=[60014],
        next_quest_id=60016,
        start_npc=100001,
        end_npc=100005,
        process=1,
        event_type=1,
        event=100001,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-9576", "4-1702", "5-0", "0"],
        awards_10002=["1-9576", "4-1702", "5-0", "0"],
        awards_10003=["1-9576", "4-1702", "5-0", "0"]};

get(60016) ->
    #main_quest_cfg{
        id=60016,
        need_level=0,
        pre_quest_id=[60015],
        next_quest_id=60017,
        start_npc=100005,
        end_npc=100001,
        process=1,
        event_type=2,
        event=30009,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-10045", "4-1888", "5-0", "0"],
        awards_10002=["1-10045", "4-1888", "5-0", "0"],
        awards_10003=["1-10045", "4-1888", "5-0", "0"]};

get(60017) ->
    #main_quest_cfg{
        id=60017,
        need_level=0,
        pre_quest_id=[60016],
        next_quest_id=60018,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=2,
        event=30010,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-10513", "4-2089", "5-0", "0"],
        awards_10002=["1-10513", "4-2089", "5-0", "0"],
        awards_10003=["1-10513", "4-2089", "5-0", "0"]};

get(60018) ->
    #main_quest_cfg{
        id=60018,
        need_level=0,
        pre_quest_id=[60017],
        next_quest_id=60019,
        start_npc=100001,
        end_npc=100001,
        process=10,
        event_type=15,
        event=0,
        check_tag="compare",
        check_script=fun() -> #game_info{role=__Role} = role_api:get_user_data(),
__Job = __Role#role.job,
__ItemIdList = case __Job of
    10001 -> [70000,70018,70036,70054,70072];
    10002 -> [70006,70024,70042,70060,70078];
    10003 -> [70012,70030,70048,70066,70084]
end,
F = fun(X, Acc0)->
 Acc0 ++ item_api:get_info_by_item_id(X, [1, 2])
end,
__ItemList = lists:foldl(F, [], __ItemIdList),
lists:max([X#item.level || X <- __ItemList, X /= false]++[0]) end,
        awards_10001=["1-10822", "4-2306", "5-0", "0"],
        awards_10002=["1-10822", "4-2306", "5-0", "0"],
        awards_10003=["1-10822", "4-2306", "5-0", "0"]};

get(60019) ->
    #main_quest_cfg{
        id=60019,
        need_level=0,
        pre_quest_id=[60018],
        next_quest_id=60020,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52035,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-11131", "4-2541", "5-0", "0"],
        awards_10002=["1-11131", "4-2541", "5-0", "0"],
        awards_10003=["1-11131", "4-2541", "5-0", "0"]};

get(60020) ->
    #main_quest_cfg{
        id=60020,
        need_level=0,
        pre_quest_id=[60019],
        next_quest_id=60021,
        start_npc=100001,
        end_npc=100001,
        process=1,
        event_type=3,
        event=52039,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-11440", "4-2793", "5-0", "0"],
        awards_10002=["1-11440", "4-2793", "5-0", "0"],
        awards_10003=["1-11440", "4-2793", "5-0", "0"]};

get(60021) ->
    #main_quest_cfg{
        id=60021,
        need_level=0,
        pre_quest_id=[60020],
        next_quest_id=60022,
        start_npc=100001,
        end_npc=100011,
        process=1,
        event_type=1,
        event=100001,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-12337", "4-3066", "5-0", "0"],
        awards_10002=["1-12337", "4-3066", "5-0", "0"],
        awards_10003=["1-12337", "4-3066", "5-0", "0"]};

get(60022) ->
    #main_quest_cfg{
        id=60022,
        need_level=15,
        pre_quest_id=[60021],
        next_quest_id=60023,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30013,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-13200", "4-3360", "5-0", "0"],
        awards_10002=["1-13200", "4-3360", "5-0", "0"],
        awards_10003=["1-13200", "4-3360", "5-0", "0"]};

get(60023) ->
    #main_quest_cfg{
        id=60023,
        need_level=16,
        pre_quest_id=[60022],
        next_quest_id=60024,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30014,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-14018", "4-3678", "5-0", "0"],
        awards_10002=["1-14018", "4-3678", "5-0", "0"],
        awards_10003=["1-14018", "4-3678", "5-0", "0"]};

get(60024) ->
    #main_quest_cfg{
        id=60024,
        need_level=17,
        pre_quest_id=[60023],
        next_quest_id=60025,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52049,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-14784", "4-4021", "5-0", "0"],
        awards_10002=["1-14784", "4-4021", "5-0", "0"],
        awards_10003=["1-14784", "4-4021", "5-0", "0"]};

get(60025) ->
    #main_quest_cfg{
        id=60025,
        need_level=18,
        pre_quest_id=[60024],
        next_quest_id=60026,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30016,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-15487", "4-4391", "5-0", "0"],
        awards_10002=["1-15487", "4-4391", "5-0", "0"],
        awards_10003=["1-15487", "4-4391", "5-0", "0"]};

get(60026) ->
    #main_quest_cfg{
        id=60026,
        need_level=19,
        pre_quest_id=[60025],
        next_quest_id=60027,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30017,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-26383", "4-4790", "5-0", "0"],
        awards_10002=["1-26383", "4-4790", "5-0", "0"],
        awards_10003=["1-26383", "4-4790", "5-0", "0"]};

get(60027) ->
    #main_quest_cfg{
        id=60027,
        need_level=20,
        pre_quest_id=[60026],
        next_quest_id=60028,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52059,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-37530", "4-5221", "5-0", "72010-1"],
        awards_10002=["1-37530", "4-5221", "5-0", "72010-1"],
        awards_10003=["1-37530", "4-5221", "5-0", "72010-1"]};

get(60028) ->
    #main_quest_cfg{
        id=60028,
        need_level=21,
        pre_quest_id=[60027],
        next_quest_id=60029,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30019,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-48867", "4-5686", "5-0", "0"],
        awards_10002=["1-48867", "4-5686", "5-0", "0"],
        awards_10003=["1-48867", "4-5686", "5-0", "0"]};

get(60029) ->
    #main_quest_cfg{
        id=60029,
        need_level=22,
        pre_quest_id=[60028],
        next_quest_id=60030,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30020,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-60334", "4-6188", "5-0", "0"],
        awards_10002=["1-60334", "4-6188", "5-0", "0"],
        awards_10003=["1-60334", "4-6188", "5-0", "0"]};

get(60030) ->
    #main_quest_cfg{
        id=60030,
        need_level=23,
        pre_quest_id=[60029],
        next_quest_id=60031,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52069,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-71872", "4-6730", "5-0", "0"],
        awards_10002=["1-71872", "4-6730", "5-0", "0"],
        awards_10003=["1-71872", "4-6730", "5-0", "0"]};

get(60031) ->
    #main_quest_cfg{
        id=60031,
        need_level=24,
        pre_quest_id=[60030],
        next_quest_id=60032,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30022,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-83421", "4-7315", "5-0", "0"],
        awards_10002=["1-83421", "4-7315", "5-0", "0"],
        awards_10003=["1-83421", "4-7315", "5-0", "0"]};

get(60032) ->
    #main_quest_cfg{
        id=60032,
        need_level=25,
        pre_quest_id=[60031],
        next_quest_id=60033,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30023,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-94920", "4-7946", "5-0", "0"],
        awards_10002=["1-94920", "4-7946", "5-0", "0"],
        awards_10003=["1-94920", "4-7946", "5-0", "0"]};

get(60033) ->
    #main_quest_cfg{
        id=60033,
        need_level=26,
        pre_quest_id=[60032],
        next_quest_id=60034,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52079,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-100615", "4-8627", "5-0", "0"],
        awards_10002=["1-100615", "4-8627", "5-0", "0"],
        awards_10003=["1-100615", "4-8627", "5-0", "0"]};

get(60034) ->
    #main_quest_cfg{
        id=60034,
        need_level=27,
        pre_quest_id=[60033],
        next_quest_id=60035,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30025,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-106309", "4-9362", "5-0", "0"],
        awards_10002=["1-106309", "4-9362", "5-0", "0"],
        awards_10003=["1-106309", "4-9362", "5-0", "0"]};

get(60035) ->
    #main_quest_cfg{
        id=60035,
        need_level=28,
        pre_quest_id=[60034],
        next_quest_id=60036,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30026,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-111919", "4-10155", "5-0", "0"],
        awards_10002=["1-111919", "4-10155", "5-0", "0"],
        awards_10003=["1-111919", "4-10155", "5-0", "0"]};

get(60036) ->
    #main_quest_cfg{
        id=60036,
        need_level=0,
        pre_quest_id=[60035],
        next_quest_id=60037,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52089,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-117529", "4-11011", "5-0", "0"],
        awards_10002=["1-117529", "4-11011", "5-0", "0"],
        awards_10003=["1-117529", "4-11011", "5-0", "0"]};

get(60037) ->
    #main_quest_cfg{
        id=60037,
        need_level=29,
        pre_quest_id=[60036],
        next_quest_id=60038,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30028,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-121193", "4-11935", "5-0", "0"],
        awards_10002=["1-121193", "4-11935", "5-0", "0"],
        awards_10003=["1-121193", "4-11935", "5-0", "0"]};

get(60038) ->
    #main_quest_cfg{
        id=60038,
        need_level=0,
        pre_quest_id=[60037],
        next_quest_id=60039,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=2,
        event=30029,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-124856", "4-12932", "5-0", "0"],
        awards_10002=["1-124856", "4-12932", "5-0", "0"],
        awards_10003=["1-124856", "4-12932", "5-0", "0"]};

get(60039) ->
    #main_quest_cfg{
        id=60039,
        need_level=30,
        pre_quest_id=[60038],
        next_quest_id=60040,
        start_npc=100011,
        end_npc=100011,
        process=1,
        event_type=3,
        event=52099,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-128520", "4-14008", "5-0", "0"],
        awards_10002=["1-128520", "4-14008", "5-0", "0"],
        awards_10003=["1-128520", "4-14008", "5-0", "0"]};

get(60040) ->
    #main_quest_cfg{
        id=60040,
        need_level=31,
        pre_quest_id=[60039],
        next_quest_id=60041,
        start_npc=100011,
        end_npc=100021,
        process=1,
        event_type=1,
        event=100011,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-139221", "4-15169", "5-0", "0"],
        awards_10002=["1-139221", "4-15169", "5-0", "0"],
        awards_10003=["1-139221", "4-15169", "5-0", "0"]};

get(60041) ->
    #main_quest_cfg{
        id=60041,
        need_level=31,
        pre_quest_id=[60040],
        next_quest_id=60042,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30031,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-144397", "4-16422", "5-0", "0"],
        awards_10002=["1-144397", "4-16422", "5-0", "0"],
        awards_10003=["1-144397", "4-16422", "5-0", "0"]};

get(60042) ->
    #main_quest_cfg{
        id=60042,
        need_level=31,
        pre_quest_id=[60041],
        next_quest_id=60043,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30032,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-149572", "4-17775", "5-0", "0"],
        awards_10002=["1-149572", "4-17775", "5-0", "0"],
        awards_10003=["1-149572", "4-17775", "5-0", "0"]};

get(60043) ->
    #main_quest_cfg{
        id=60043,
        need_level=0,
        pre_quest_id=[60042],
        next_quest_id=60044,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52219,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-154543", "4-19234", "5-0", "0"],
        awards_10002=["1-154543", "4-19234", "5-0", "0"],
        awards_10003=["1-154543", "4-19234", "5-0", "0"]};

get(60044) ->
    #main_quest_cfg{
        id=60044,
        need_level=32,
        pre_quest_id=[60043],
        next_quest_id=60045,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30034,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-159515", "4-20810", "5-0", "0"],
        awards_10002=["1-159515", "4-20810", "5-0", "0"],
        awards_10003=["1-159515", "4-20810", "5-0", "0"]};

get(60045) ->
    #main_quest_cfg{
        id=60045,
        need_level=0,
        pre_quest_id=[60044],
        next_quest_id=60046,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30035,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-164251", "4-22510", "5-0", "0"],
        awards_10002=["1-164251", "4-22510", "5-0", "0"],
        awards_10003=["1-164251", "4-22510", "5-0", "0"]};

get(60046) ->
    #main_quest_cfg{
        id=60046,
        need_level=33,
        pre_quest_id=[60045],
        next_quest_id=60047,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52229,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-168987", "4-24345", "5-0", "0"],
        awards_10002=["1-168987", "4-24345", "5-0", "0"],
        awards_10003=["1-168987", "4-24345", "5-0", "0"]};

get(60047) ->
    #main_quest_cfg{
        id=60047,
        need_level=0,
        pre_quest_id=[60046],
        next_quest_id=60048,
        start_npc=100021,
        end_npc=100022,
        process=1,
        event_type=1,
        event=100021,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-168987", "4-26325", "5-0", "0"],
        awards_10002=["1-168987", "4-26325", "5-0", "0"],
        awards_10003=["1-168987", "4-26325", "5-0", "0"]};

get(60048) ->
    #main_quest_cfg{
        id=60048,
        need_level=34,
        pre_quest_id=[60047],
        next_quest_id=60049,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=2,
        event=30037,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-173459", "4-28462", "5-0", "0"],
        awards_10002=["1-173459", "4-28462", "5-0", "0"],
        awards_10003=["1-173459", "4-28462", "5-0", "0"]};

get(60049) ->
    #main_quest_cfg{
        id=60049,
        need_level=0,
        pre_quest_id=[60048],
        next_quest_id=60050,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=2,
        event=30038,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-177930", "4-30769", "5-0", "0"],
        awards_10002=["1-177930", "4-30769", "5-0", "0"],
        awards_10003=["1-177930", "4-30769", "5-0", "0"]};

get(60050) ->
    #main_quest_cfg{
        id=60050,
        need_level=35,
        pre_quest_id=[60049],
        next_quest_id=60051,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=3,
        event=52239,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-182107", "4-33258", "5-0", "0"],
        awards_10002=["1-182107", "4-33258", "5-0", "0"],
        awards_10003=["1-182107", "4-33258", "5-0", "0"]};

get(60051) ->
    #main_quest_cfg{
        id=60051,
        need_level=0,
        pre_quest_id=[60050],
        next_quest_id=60052,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=2,
        event=30040,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-186284", "4-35945", "5-0", "0"],
        awards_10002=["1-186284", "4-35945", "5-0", "0"],
        awards_10003=["1-186284", "4-35945", "5-0", "0"]};

get(60052) ->
    #main_quest_cfg{
        id=60052,
        need_level=36,
        pre_quest_id=[60051],
        next_quest_id=60053,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=2,
        event=30041,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-190136", "4-38872", "5-0", "0"],
        awards_10002=["1-190136", "4-38872", "5-0", "0"],
        awards_10003=["1-190136", "4-38872", "5-0", "0"]};

get(60053) ->
    #main_quest_cfg{
        id=60053,
        need_level=0,
        pre_quest_id=[60052],
        next_quest_id=60054,
        start_npc=100022,
        end_npc=100022,
        process=1,
        event_type=3,
        event=52249,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-193988", "4-41827", "5-0", "0"],
        awards_10002=["1-193988", "4-41827", "5-0", "0"],
        awards_10003=["1-193988", "4-41827", "5-0", "0"]};

get(60054) ->
    #main_quest_cfg{
        id=60054,
        need_level=37,
        pre_quest_id=[60053],
        next_quest_id=60055,
        start_npc=100022,
        end_npc=100021,
        process=1,
        event_type=1,
        event=100022,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-193988", "4-44810", "5-0", "0"],
        awards_10002=["1-193988", "4-44810", "5-0", "0"],
        awards_10003=["1-193988", "4-44810", "5-0", "0"]};

get(60055) ->
    #main_quest_cfg{
        id=60055,
        need_level=0,
        pre_quest_id=[60054],
        next_quest_id=60056,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30043,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-197485", "4-47822", "5-0", "0"],
        awards_10002=["1-197485", "4-47822", "5-0", "0"],
        awards_10003=["1-197485", "4-47822", "5-0", "0"]};

get(60056) ->
    #main_quest_cfg{
        id=60056,
        need_level=38,
        pre_quest_id=[60055],
        next_quest_id=60057,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30044,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-200982", "4-50863", "5-0", "0"],
        awards_10002=["1-200982", "4-50863", "5-0", "0"],
        awards_10003=["1-200982", "4-50863", "5-0", "0"]};

get(60057) ->
    #main_quest_cfg{
        id=60057,
        need_level=0,
        pre_quest_id=[60056],
        next_quest_id=60058,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52259,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-204095", "4-53933", "5-0", "0"],
        awards_10002=["1-204095", "4-53933", "5-0", "0"],
        awards_10003=["1-204095", "4-53933", "5-0", "0"]};

get(60058) ->
    #main_quest_cfg{
        id=60058,
        need_level=39,
        pre_quest_id=[60057],
        next_quest_id=60059,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30046,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-207207", "4-57032", "5-0", "0"],
        awards_10002=["1-207207", "4-57032", "5-0", "0"],
        awards_10003=["1-207207", "4-57032", "5-0", "0"]};

get(60059) ->
    #main_quest_cfg{
        id=60059,
        need_level=0,
        pre_quest_id=[60058],
        next_quest_id=60060,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=2,
        event=30047,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-209905", "4-60161", "5-0", "0"],
        awards_10002=["1-209905", "4-60161", "5-0", "0"],
        awards_10003=["1-209905", "4-60161", "5-0", "0"]};

get(60060) ->
    #main_quest_cfg{
        id=60060,
        need_level=40,
        pre_quest_id=[60059],
        next_quest_id=60061,
        start_npc=100021,
        end_npc=100021,
        process=1,
        event_type=3,
        event=52269,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-212603", "4-63320", "5-0", "0"],
        awards_10002=["1-212603", "4-63320", "5-0", "0"],
        awards_10003=["1-212603", "4-63320", "5-0", "0"]};

get(60061) ->
    #main_quest_cfg{
        id=60061,
        need_level=41,
        pre_quest_id=[60060],
        next_quest_id=60062,
        start_npc=100021,
        end_npc=100031,
        process=1,
        event_type=1,
        event=100021,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-215391", "4-66510", "5-0", "0"],
        awards_10002=["1-215391", "4-66510", "5-0", "0"],
        awards_10003=["1-215391", "4-66510", "5-0", "0"]};

get(60062) ->
    #main_quest_cfg{
        id=60062,
        need_level=41,
        pre_quest_id=[60061],
        next_quest_id=60063,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30049,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-218089", "4-69669", "5-0", "0"],
        awards_10002=["1-218089", "4-69669", "5-0", "0"],
        awards_10003=["1-218089", "4-69669", "5-0", "0"]};

get(60063) ->
    #main_quest_cfg{
        id=60063,
        need_level=42,
        pre_quest_id=[60062],
        next_quest_id=60064,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30050,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-220787", "4-72828", "5-0", "0"],
        awards_10002=["1-220787", "4-72828", "5-0", "0"],
        awards_10003=["1-220787", "4-72828", "5-0", "0"]};

get(60064) ->
    #main_quest_cfg{
        id=60064,
        need_level=43,
        pre_quest_id=[60063],
        next_quest_id=60065,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30051,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-223485", "4-75987", "5-0", "0"],
        awards_10002=["1-223485", "4-75987", "5-0", "0"],
        awards_10003=["1-223485", "4-75987", "5-0", "0"]};

get(60065) ->
    #main_quest_cfg{
        id=60065,
        need_level=44,
        pre_quest_id=[60064],
        next_quest_id=60066,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30052,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-226183", "4-79146", "5-0", "0"],
        awards_10002=["1-226183", "4-79146", "5-0", "0"],
        awards_10003=["1-226183", "4-79146", "5-0", "0"]};

get(60066) ->
    #main_quest_cfg{
        id=60066,
        need_level=45,
        pre_quest_id=[60065],
        next_quest_id=60067,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30053,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-228881", "4-82305", "5-0", "0"],
        awards_10002=["1-228881", "4-82305", "5-0", "0"],
        awards_10003=["1-228881", "4-82305", "5-0", "0"]};

get(60067) ->
    #main_quest_cfg{
        id=60067,
        need_level=46,
        pre_quest_id=[60066],
        next_quest_id=60068,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30054,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-231579", "4-85464", "5-0", "0"],
        awards_10002=["1-231579", "4-85464", "5-0", "0"],
        awards_10003=["1-231579", "4-85464", "5-0", "0"]};

get(60068) ->
    #main_quest_cfg{
        id=60068,
        need_level=47,
        pre_quest_id=[60067],
        next_quest_id=60069,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30055,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-234277", "4-88623", "5-0", "0"],
        awards_10002=["1-234277", "4-88623", "5-0", "0"],
        awards_10003=["1-234277", "4-88623", "5-0", "0"]};

get(60069) ->
    #main_quest_cfg{
        id=60069,
        need_level=48,
        pre_quest_id=[60068],
        next_quest_id=60070,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30056,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-236975", "4-91782", "5-0", "0"],
        awards_10002=["1-236975", "4-91782", "5-0", "0"],
        awards_10003=["1-236975", "4-91782", "5-0", "0"]};

get(60070) ->
    #main_quest_cfg{
        id=60070,
        need_level=49,
        pre_quest_id=[60069],
        next_quest_id=60071,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30057,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-239673", "4-94941", "5-0", "0"],
        awards_10002=["1-239673", "4-94941", "5-0", "0"],
        awards_10003=["1-239673", "4-94941", "5-0", "0"]};

get(60071) ->
    #main_quest_cfg{
        id=60071,
        need_level=50,
        pre_quest_id=[60070],
        next_quest_id=60072,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30058,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-242371", "4-98100", "5-0", "0"],
        awards_10002=["1-242371", "4-98100", "5-0", "0"],
        awards_10003=["1-242371", "4-98100", "5-0", "0"]};

get(60072) ->
    #main_quest_cfg{
        id=60072,
        need_level=51,
        pre_quest_id=[60071],
        next_quest_id=60073,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30059,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-245069", "4-101259", "5-0", "0"],
        awards_10002=["1-245069", "4-101259", "5-0", "0"],
        awards_10003=["1-245069", "4-101259", "5-0", "0"]};

get(60073) ->
    #main_quest_cfg{
        id=60073,
        need_level=52,
        pre_quest_id=[60072],
        next_quest_id=60074,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30060,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-247767", "4-104418", "5-0", "0"],
        awards_10002=["1-247767", "4-104418", "5-0", "0"],
        awards_10003=["1-247767", "4-104418", "5-0", "0"]};

get(60074) ->
    #main_quest_cfg{
        id=60074,
        need_level=53,
        pre_quest_id=[60073],
        next_quest_id=60075,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30061,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-250465", "4-107577", "5-0", "0"],
        awards_10002=["1-250465", "4-107577", "5-0", "0"],
        awards_10003=["1-250465", "4-107577", "5-0", "0"]};

get(60075) ->
    #main_quest_cfg{
        id=60075,
        need_level=54,
        pre_quest_id=[60074],
        next_quest_id=60076,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30062,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-253163", "4-110736", "5-0", "0"],
        awards_10002=["1-253163", "4-110736", "5-0", "0"],
        awards_10003=["1-253163", "4-110736", "5-0", "0"]};

get(60076) ->
    #main_quest_cfg{
        id=60076,
        need_level=55,
        pre_quest_id=[60075],
        next_quest_id=60077,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30063,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-255861", "4-113895", "5-0", "0"],
        awards_10002=["1-255861", "4-113895", "5-0", "0"],
        awards_10003=["1-255861", "4-113895", "5-0", "0"]};

get(60077) ->
    #main_quest_cfg{
        id=60077,
        need_level=56,
        pre_quest_id=[60076],
        next_quest_id=60078,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30064,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-258559", "4-117054", "5-0", "0"],
        awards_10002=["1-258559", "4-117054", "5-0", "0"],
        awards_10003=["1-258559", "4-117054", "5-0", "0"]};

get(60078) ->
    #main_quest_cfg{
        id=60078,
        need_level=57,
        pre_quest_id=[60077],
        next_quest_id=60079,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30065,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-261257", "4-120213", "5-0", "0"],
        awards_10002=["1-261257", "4-120213", "5-0", "0"],
        awards_10003=["1-261257", "4-120213", "5-0", "0"]};

get(60079) ->
    #main_quest_cfg{
        id=60079,
        need_level=58,
        pre_quest_id=[60078],
        next_quest_id=60080,
        start_npc=100031,
        end_npc=100031,
        process=1,
        event_type=2,
        event=30066,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-263955", "4-123372", "5-0", "0"],
        awards_10002=["1-263955", "4-123372", "5-0", "0"],
        awards_10003=["1-263955", "4-123372", "5-0", "0"]};

get(60080) ->
    #main_quest_cfg{
        id=60080,
        need_level=61,
        pre_quest_id=[60079],
        next_quest_id=60081,
        start_npc=100031,
        end_npc=100041,
        process=1,
        event_type=1,
        event=100031,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-266653", "4-126531", "5-0", "0"],
        awards_10002=["1-266653", "4-126531", "5-0", "0"],
        awards_10003=["1-266653", "4-126531", "5-0", "0"]};

get(60081) ->
    #main_quest_cfg{
        id=60081,
        need_level=0,
        pre_quest_id=[60080],
        next_quest_id=60082,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30055,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-41175", "4-49410", "5-0", "0"],
        awards_10002=["1-41175", "4-49410", "5-0", "0"],
        awards_10003=["1-41175", "4-49410", "5-0", "0"]};

get(60082) ->
    #main_quest_cfg{
        id=60082,
        need_level=0,
        pre_quest_id=[60081],
        next_quest_id=60083,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30056,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-41850", "4-50220", "5-0", "0"],
        awards_10002=["1-41850", "4-50220", "5-0", "0"],
        awards_10003=["1-41850", "4-50220", "5-0", "0"]};

get(60083) ->
    #main_quest_cfg{
        id=60083,
        need_level=0,
        pre_quest_id=[60082],
        next_quest_id=60084,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30057,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-42525", "4-51030", "5-0", "0"],
        awards_10002=["1-42525", "4-51030", "5-0", "0"],
        awards_10003=["1-42525", "4-51030", "5-0", "0"]};

get(60084) ->
    #main_quest_cfg{
        id=60084,
        need_level=0,
        pre_quest_id=[60083],
        next_quest_id=60085,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30058,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-43200", "4-51840", "5-0", "0"],
        awards_10002=["1-43200", "4-51840", "5-0", "0"],
        awards_10003=["1-43200", "4-51840", "5-0", "0"]};

get(60085) ->
    #main_quest_cfg{
        id=60085,
        need_level=0,
        pre_quest_id=[60084],
        next_quest_id=60086,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30059,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-43875", "4-52650", "5-0", "0"],
        awards_10002=["1-43875", "4-52650", "5-0", "0"],
        awards_10003=["1-43875", "4-52650", "5-0", "0"]};

get(60086) ->
    #main_quest_cfg{
        id=60086,
        need_level=0,
        pre_quest_id=[60085],
        next_quest_id=60087,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30060,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-44550", "4-53460", "5-0", "0"],
        awards_10002=["1-44550", "4-53460", "5-0", "0"],
        awards_10003=["1-44550", "4-53460", "5-0", "0"]};

get(60087) ->
    #main_quest_cfg{
        id=60087,
        need_level=0,
        pre_quest_id=[60086],
        next_quest_id=60088,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30061,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-45225", "4-54270", "5-0", "0"],
        awards_10002=["1-45225", "4-54270", "5-0", "0"],
        awards_10003=["1-45225", "4-54270", "5-0", "0"]};

get(60088) ->
    #main_quest_cfg{
        id=60088,
        need_level=0,
        pre_quest_id=[60087],
        next_quest_id=60089,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30062,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-45900", "4-55080", "5-0", "0"],
        awards_10002=["1-45900", "4-55080", "5-0", "0"],
        awards_10003=["1-45900", "4-55080", "5-0", "0"]};

get(60089) ->
    #main_quest_cfg{
        id=60089,
        need_level=0,
        pre_quest_id=[60088],
        next_quest_id=60090,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30063,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-46575", "4-55890", "5-0", "0"],
        awards_10002=["1-46575", "4-55890", "5-0", "0"],
        awards_10003=["1-46575", "4-55890", "5-0", "0"]};

get(60090) ->
    #main_quest_cfg{
        id=60090,
        need_level=0,
        pre_quest_id=[60089],
        next_quest_id=60091,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30064,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-47250", "4-56700", "5-0", "0"],
        awards_10002=["1-47250", "4-56700", "5-0", "0"],
        awards_10003=["1-47250", "4-56700", "5-0", "0"]};

get(60091) ->
    #main_quest_cfg{
        id=60091,
        need_level=0,
        pre_quest_id=[60090],
        next_quest_id=60092,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30065,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-47925", "4-57510", "5-0", "0"],
        awards_10002=["1-47925", "4-57510", "5-0", "0"],
        awards_10003=["1-47925", "4-57510", "5-0", "0"]};

get(60092) ->
    #main_quest_cfg{
        id=60092,
        need_level=0,
        pre_quest_id=[60091],
        next_quest_id=60093,
        start_npc=100041,
        end_npc=100041,
        process=1,
        event_type=2,
        event=30066,
        check_tag="add",
        check_script=fun() -> util:to_integer(0) end,
        awards_10001=["1-48600", "4-58320", "5-0", "0"],
        awards_10002=["1-48600", "4-58320", "5-0", "0"],
        awards_10003=["1-48600", "4-58320", "5-0", "0"]};

get(_) -> false.


