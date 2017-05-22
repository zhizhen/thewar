-module(golden_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(0) ->
    #golden_cfg{
        vip=0,
        dailylimit=1,
        time=160,
        delay=20};

get(1) ->
    #golden_cfg{
        vip=1,
        dailylimit=1,
        time=160,
        delay=20};

get(2) ->
    #golden_cfg{
        vip=2,
        dailylimit=2,
        time=160,
        delay=20};

get(3) ->
    #golden_cfg{
        vip=3,
        dailylimit=3,
        time=160,
        delay=20};

get(4) ->
    #golden_cfg{
        vip=4,
        dailylimit=4,
        time=160,
        delay=20};

get(5) ->
    #golden_cfg{
        vip=5,
        dailylimit=5,
        time=160,
        delay=20};

get(6) ->
    #golden_cfg{
        vip=6,
        dailylimit=6,
        time=160,
        delay=20};

get(7) ->
    #golden_cfg{
        vip=7,
        dailylimit=7,
        time=160,
        delay=20};

get(8) ->
    #golden_cfg{
        vip=8,
        dailylimit=8,
        time=160,
        delay=20};

get(9) ->
    #golden_cfg{
        vip=9,
        dailylimit=9,
        time=160,
        delay=20};

get(_) -> false.


