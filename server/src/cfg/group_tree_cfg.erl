-module(group_tree_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #group_tree_cfg{
        level=1,
        max_air=400,
        watering_times=1,
        waterings=[#waterings{type=1,consume=20000,award=160,air_add=30},#waterings{type=2,consume=8,award=640,air_add=40},#waterings{type=3,consume=88,award=7040,air_add=50}],
        full_award=1000,
        full_air_add=500};

get(2) ->
    #group_tree_cfg{
        level=2,
        max_air=1000,
        watering_times=2,
        waterings=[#waterings{type=1,consume=20000,award=160,air_add=30},#waterings{type=2,consume=8,award=640,air_add=40},#waterings{type=3,consume=88,award=7040,air_add=50}],
        full_award=1250,
        full_air_add=500};

get(3) ->
    #group_tree_cfg{
        level=3,
        max_air=1200,
        watering_times=2,
        waterings=[#waterings{type=1,consume=20000,award=200,air_add=30},#waterings{type=2,consume=8,award=800,air_add=40},#waterings{type=3,consume=88,award=8800,air_add=50}],
        full_award=1500,
        full_air_add=500};

get(4) ->
    #group_tree_cfg{
        level=4,
        max_air=2000,
        watering_times=3,
        waterings=[#waterings{type=1,consume=20000,award=200,air_add=30},#waterings{type=2,consume=8,award=800,air_add=40},#waterings{type=3,consume=88,award=8800,air_add=50}],
        full_award=1750,
        full_air_add=500};

get(5) ->
    #group_tree_cfg{
        level=5,
        max_air=2200,
        watering_times=3,
        waterings=[#waterings{type=1,consume=20000,award=240,air_add=30},#waterings{type=2,consume=8,award=960,air_add=40},#waterings{type=3,consume=88,award=10560,air_add=50}],
        full_award=2000,
        full_air_add=500};

get(_) -> false.


