-module(gold_mission_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #gold_mission_cfg{
        id=1,
        time=2,
        pay=0};

get(2) ->
    #gold_mission_cfg{
        id=2,
        time=3,
        pay=10};

get(3) ->
    #gold_mission_cfg{
        id=3,
        time=5,
        pay=20};

get(_) -> false.


