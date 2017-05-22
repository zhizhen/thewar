-module(vip_recharge_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #vip_recharge_cfg{
        index=1,
        coin=60,
        extra=0,
        money=6};

get(2) ->
    #vip_recharge_cfg{
        index=2,
        coin=300,
        extra=0,
        money=30};

get(3) ->
    #vip_recharge_cfg{
        index=3,
        coin=980,
        extra=0,
        money=98};

get(4) ->
    #vip_recharge_cfg{
        index=4,
        coin=1280,
        extra=0,
        money=128};

get(5) ->
    #vip_recharge_cfg{
        index=5,
        coin=3280,
        extra=0,
        money=328};

get(6) ->
    #vip_recharge_cfg{
        index=6,
        coin=6480,
        extra=0,
        money=648};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6].

