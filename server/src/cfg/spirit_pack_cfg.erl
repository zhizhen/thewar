-module(spirit_pack_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #spirit_pack_cfg{
        slot_id=1,
        gold=0,
        coin=0};

get(2) ->
    #spirit_pack_cfg{
        slot_id=2,
        gold=0,
        coin=0};

get(3) ->
    #spirit_pack_cfg{
        slot_id=3,
        gold=0,
        coin=0};

get(4) ->
    #spirit_pack_cfg{
        slot_id=4,
        gold=0,
        coin=0};

get(5) ->
    #spirit_pack_cfg{
        slot_id=5,
        gold=0,
        coin=0};

get(6) ->
    #spirit_pack_cfg{
        slot_id=6,
        gold=0,
        coin=0};

get(7) ->
    #spirit_pack_cfg{
        slot_id=7,
        gold=0,
        coin=0};

get(8) ->
    #spirit_pack_cfg{
        slot_id=8,
        gold=0,
        coin=0};

get(9) ->
    #spirit_pack_cfg{
        slot_id=9,
        gold=0,
        coin=0};

get(10) ->
    #spirit_pack_cfg{
        slot_id=10,
        gold=0,
        coin=0};

get(11) ->
    #spirit_pack_cfg{
        slot_id=11,
        gold=0,
        coin=0};

get(12) ->
    #spirit_pack_cfg{
        slot_id=12,
        gold=0,
        coin=0};

get(13) ->
    #spirit_pack_cfg{
        slot_id=13,
        gold=0,
        coin=0};

get(14) ->
    #spirit_pack_cfg{
        slot_id=14,
        gold=0,
        coin=0};

get(15) ->
    #spirit_pack_cfg{
        slot_id=15,
        gold=0,
        coin=0};

get(16) ->
    #spirit_pack_cfg{
        slot_id=16,
        gold=0,
        coin=0};

get(17) ->
    #spirit_pack_cfg{
        slot_id=17,
        gold=0,
        coin=0};

get(18) ->
    #spirit_pack_cfg{
        slot_id=18,
        gold=0,
        coin=0};

get(19) ->
    #spirit_pack_cfg{
        slot_id=19,
        gold=0,
        coin=0};

get(20) ->
    #spirit_pack_cfg{
        slot_id=20,
        gold=0,
        coin=0};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].

