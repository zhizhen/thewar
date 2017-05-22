-module(contest_award_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({1,1}) ->
    #contest_award_cfg{
        type=1,
        times=1,
        consume_point=200,
        items=["5-100"]};

get({1,2}) ->
    #contest_award_cfg{
        type=1,
        times=2,
        consume_point=50,
        items=["16-5"]};

get({2,1}) ->
    #contest_award_cfg{
        type=2,
        times=1,
        consume_point=200,
        items=["77201-1"]};

get({2,2}) ->
    #contest_award_cfg{
        type=2,
        times=2,
        consume_point=50,
        items=["17-5"]};

get(_) -> false.

get_all() ->
    [{1,1},{1,2},{2,1},{2,2}].

