-module(warrior_quality_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #warrior_quality_cfg{
        id=1,
        level=20};

get(2) ->
    #warrior_quality_cfg{
        id=2,
        level=20};

get(3) ->
    #warrior_quality_cfg{
        id=3,
        level=20};

get(4) ->
    #warrior_quality_cfg{
        id=4,
        level=20};

get(5) ->
    #warrior_quality_cfg{
        id=5,
        level=20};

get(6) ->
    #warrior_quality_cfg{
        id=6,
        level=20};

get(_) -> false.


