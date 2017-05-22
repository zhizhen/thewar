-module(spirit_group_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(0) ->
    #spirit_group_cfg{
        gold=0,
        group_id=1};

get(5000000) ->
    #spirit_group_cfg{
        gold=5000000,
        group_id=2};

get(10000000) ->
    #spirit_group_cfg{
        gold=10000000,
        group_id=3};

get(20000000) ->
    #spirit_group_cfg{
        gold=20000000,
        group_id=4};

get(50000000) ->
    #spirit_group_cfg{
        gold=50000000,
        group_id=5};

get(100000000) ->
    #spirit_group_cfg{
        gold=100000000,
        group_id=6};

get(_) -> false.

get_all() ->
    [0,5000000,10000000,20000000,50000000,100000000].

