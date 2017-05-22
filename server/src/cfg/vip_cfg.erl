-module(vip_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(0) ->
    #vip_cfg{
        vip=0,
        exp=0};

get(100) ->
    #vip_cfg{
        vip=1,
        exp=100};

get(300) ->
    #vip_cfg{
        vip=2,
        exp=300};

get(1000) ->
    #vip_cfg{
        vip=3,
        exp=1000};

get(2000) ->
    #vip_cfg{
        vip=4,
        exp=2000};

get(5000) ->
    #vip_cfg{
        vip=5,
        exp=5000};

get(10000) ->
    #vip_cfg{
        vip=6,
        exp=10000};

get(20000) ->
    #vip_cfg{
        vip=7,
        exp=20000};

get(50000) ->
    #vip_cfg{
        vip=8,
        exp=50000};

get(100000) ->
    #vip_cfg{
        vip=9,
        exp=100000};

get(200000) ->
    #vip_cfg{
        vip=10,
        exp=200000};

get(_) -> false.

get_all() ->
    [0,100,300,1000,2000,5000,10000,20000,50000,100000,200000].

