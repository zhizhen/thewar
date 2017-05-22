-module(scout_event_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #scout_event_cfg{
        step=1,
        event={scout_api, add_scout, []},
        randoms=[#scout_item_cfg{index=1,award="1",rate=60},#scout_item_cfg{index=2,award="1",rate=10},#scout_item_cfg{index=3,award="2",rate=10},#scout_item_cfg{index=4,award="2",rate=10},#scout_item_cfg{index=5,award="2",rate=10}]};

get(2) ->
    #scout_event_cfg{
        step=2,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120001",rate=50},#scout_item_cfg{index=2,award="120002",rate=50}]};

get(3) ->
    #scout_event_cfg{
        step=3,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120004",rate=50},#scout_item_cfg{index=2,award="120005",rate=50}]};

get(4) ->
    #scout_event_cfg{
        step=4,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120007",rate=50},#scout_item_cfg{index=2,award="120008",rate=50}]};

get(5) ->
    #scout_event_cfg{
        step=5,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120010",rate=40},#scout_item_cfg{index=2,award="120011",rate=40},#scout_item_cfg{index=3,award="120002",rate=20}]};

get(6) ->
    #scout_event_cfg{
        step=6,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120008",rate=50},#scout_item_cfg{index=2,award="120009",rate=50}]};

get(7) ->
    #scout_event_cfg{
        step=7,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120013",rate=60},#scout_item_cfg{index=2,award="120014",rate=20},#scout_item_cfg{index=3,award="120009",rate=20}]};

get(8) ->
    #scout_event_cfg{
        step=8,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120002",rate=50},#scout_item_cfg{index=2,award="120003",rate=50}]};

get(9) ->
    #scout_event_cfg{
        step=9,
        event={scout_api, go_ahead, []},
        randoms=[#scout_item_cfg{index=1,award="1",rate=60},#scout_item_cfg{index=2,award="2",rate=10},#scout_item_cfg{index=3,award="3",rate=10},#scout_item_cfg{index=4,award="4",rate=10},#scout_item_cfg{index=5,award="5",rate=10}]};

get(10) ->
    #scout_event_cfg{
        step=10,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120005",rate=50},#scout_item_cfg{index=2,award="120006",rate=50}]};

get(11) ->
    #scout_event_cfg{
        step=11,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120004",rate=50},#scout_item_cfg{index=2,award="120005",rate=50}]};

get(12) ->
    #scout_event_cfg{
        step=12,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120008",rate=50},#scout_item_cfg{index=2,award="120009",rate=50}]};

get(13) ->
    #scout_event_cfg{
        step=13,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120011",rate=40},#scout_item_cfg{index=2,award="120012",rate=40},#scout_item_cfg{index=3,award="120002",rate=20}]};

get(14) ->
    #scout_event_cfg{
        step=14,
        event={scout_api, quest, []},
        randoms=[#scout_item_cfg{index=1,award="120014",rate=40},#scout_item_cfg{index=2,award="120015",rate=40},#scout_item_cfg{index=3,award="120003",rate=20}]};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14].

