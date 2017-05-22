-module(group_value_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #group_value_cfg{
        id=1,
        gold=10000,
        value=100,
        exp=10,
        count=3};

get(2) ->
    #group_value_cfg{
        id=2,
        gold=100000,
        value=1000,
        exp=20,
        count=3};

get(3) ->
    #group_value_cfg{
        id=3,
        gold=1000000,
        value=10000,
        exp=40,
        count=3};

get(_) -> false.


