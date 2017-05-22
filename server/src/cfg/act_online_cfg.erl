-module(act_online_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #act_online_cfg{
        id=1,
        cd=2,
        level=1,
        award=["5-0", "4-8888", "6-0"]};

get(2) ->
    #act_online_cfg{
        id=2,
        cd=5,
        level=1,
        award=["5-30", "4-0", "6-0"]};

get(3) ->
    #act_online_cfg{
        id=3,
        cd=10,
        level=1,
        award=["5-0", "4-18888", "6-0"]};

get(4) ->
    #act_online_cfg{
        id=4,
        cd=20,
        level=1,
        award=["5-30", "4-0", "6-0"]};

get(5) ->
    #act_online_cfg{
        id=5,
        cd=30,
        level=1,
        award=["5-0", "4-38888", "6-0"]};

get(6) ->
    #act_online_cfg{
        id=6,
        cd=45,
        level=1,
        award=["5-30", "4-0", "6-0"]};

get(_) -> false.


