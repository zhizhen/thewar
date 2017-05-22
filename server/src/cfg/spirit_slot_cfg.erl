-module(spirit_slot_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #spirit_slot_cfg{
        slot=1,
        level=15,
        friend_level=1,
        num=0};

get(2) ->
    #spirit_slot_cfg{
        slot=2,
        level=25,
        friend_level=1,
        num=0};

get(3) ->
    #spirit_slot_cfg{
        slot=3,
        level=35,
        friend_level=1,
        num=0};

get(4) ->
    #spirit_slot_cfg{
        slot=4,
        level=45,
        friend_level=1,
        num=0};

get(5) ->
    #spirit_slot_cfg{
        slot=5,
        level=55,
        friend_level=1,
        num=0};

get(6) ->
    #spirit_slot_cfg{
        slot=6,
        level=65,
        friend_level=1,
        num=0};

get(7) ->
    #spirit_slot_cfg{
        slot=7,
        level=75,
        friend_level=1,
        num=0};

get(8) ->
    #spirit_slot_cfg{
        slot=8,
        level=85,
        friend_level=1,
        num=0};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6,7,8].

