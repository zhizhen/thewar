-module(broadcast_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #broadcast_cfg{
        id=1,
        con1=100,
        con2=[0],
        con3=0,
        tmpid=8,
        channel=1};

get(2) ->
    #broadcast_cfg{
        id=2,
        con1=100,
        con2=[0],
        con3=0,
        tmpid=9,
        channel=1};

get(3) ->
    #broadcast_cfg{
        id=3,
        con1=0,
        con2=[1, 2, 3, 4, 5],
        con3=0,
        tmpid=10,
        channel=1};

get(_) -> false.


