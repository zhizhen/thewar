-module(warrior_call2_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #warrior_call2_cfg{
        type=1,
        qs=[1, 2, 3, 4],
        chance=[50, 35, 10, 5],
        cd=1800,
        gold=100000,
        coin=0,
        s1=0,
        s2=0};

get(2) ->
    #warrior_call2_cfg{
        type=2,
        qs=[2, 3, 4, 5, 6],
        chance=[50, 30, 15, 3, 2],
        cd=86400,
        gold=0,
        coin=200,
        s1=0,
        s2=0};

get(3) ->
    #warrior_call2_cfg{
        type=3,
        qs=[2, 3, 4, 5],
        chance=[50, 30, 15, 5],
        cd=0,
        gold=900000,
        coin=0,
        s1=0,
        s2=0};

get(4) ->
    #warrior_call2_cfg{
        type=4,
        qs=[2, 3, 4, 5, 6],
        chance=[50, 30, 15, 3, 2],
        cd=0,
        gold=0,
        coin=1800,
        s1=0,
        s2=0};

get(_) -> false.


