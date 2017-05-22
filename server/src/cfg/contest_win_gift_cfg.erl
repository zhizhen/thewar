-module(contest_win_gift_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #contest_win_gift_cfg{
        level=1,
        win_times=1,
        items=[""],
        honor_point=2,
        fight_point=0};

get(2) ->
    #contest_win_gift_cfg{
        level=2,
        win_times=4,
        items=[""],
        honor_point=2,
        fight_point=1};

get(3) ->
    #contest_win_gift_cfg{
        level=3,
        win_times=7,
        items=[""],
        honor_point=4,
        fight_point=1};

get(4) ->
    #contest_win_gift_cfg{
        level=4,
        win_times=9,
        items=[""],
        honor_point=4,
        fight_point=4};

get(_) -> false.


