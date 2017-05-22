-module(daily_quest_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(120001) ->
    #daily_quest_cfg{
        quest_id=120001,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=8,
        event=0,
        process=20,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=1,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120002) ->
    #daily_quest_cfg{
        quest_id=120002,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=8,
        event=0,
        process=30,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=1,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120003) ->
    #daily_quest_cfg{
        quest_id=120003,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=8,
        event=0,
        process=50,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=2,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120004) ->
    #daily_quest_cfg{
        quest_id=120004,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=12,
        event=1,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=1,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120005) ->
    #daily_quest_cfg{
        quest_id=120005,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=12,
        event=1,
        process=2,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=2,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120006) ->
    #daily_quest_cfg{
        quest_id=120006,
        func_id=1009,
        min_level=1,
        max_level=100,
        event_type=12,
        event=1,
        process=3,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=3,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120007) ->
    #daily_quest_cfg{
        quest_id=120007,
        func_id=1006,
        min_level=1,
        max_level=100,
        event_type=15,
        event=0,
        process=2,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=1,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120008) ->
    #daily_quest_cfg{
        quest_id=120008,
        func_id=1006,
        min_level=1,
        max_level=100,
        event_type=15,
        event=0,
        process=3,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=2,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120009) ->
    #daily_quest_cfg{
        quest_id=120009,
        func_id=1006,
        min_level=1,
        max_level=100,
        event_type=15,
        event=0,
        process=5,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=3,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120010) ->
    #daily_quest_cfg{
        quest_id=120010,
        func_id=1044,
        min_level=1,
        max_level=100,
        event_type=12,
        event=2,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=2,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120011) ->
    #daily_quest_cfg{
        quest_id=120011,
        func_id=1044,
        min_level=1,
        max_level=100,
        event_type=12,
        event=2,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=3,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120012) ->
    #daily_quest_cfg{
        quest_id=120012,
        func_id=1044,
        min_level=1,
        max_level=100,
        event_type=12,
        event=2,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=4,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120013) ->
    #daily_quest_cfg{
        quest_id=120013,
        func_id=1045,
        min_level=1,
        max_level=100,
        event_type=12,
        event=3,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=3,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120014) ->
    #daily_quest_cfg{
        quest_id=120014,
        func_id=1045,
        min_level=1,
        max_level=100,
        event_type=12,
        event=3,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=4,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(120015) ->
    #daily_quest_cfg{
        quest_id=120015,
        func_id=1045,
        min_level=1,
        max_level=100,
        event_type=12,
        event=3,
        process=1,
        auto_need_gold=0,
        auto_need_coin=10,
        award_index=5,
        level_list=["1-10", "2-10", "3-10", "4-10", "5-10"]};

get(_) -> false.

get_all() ->
    [120001,120002,120003,120004,120005,120006,120007,120008,120009,120010,120011,120012,120013,120014,120015].

