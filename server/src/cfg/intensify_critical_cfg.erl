-module(intensify_critical_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(0) ->
    #intensify_critical_cfg{
        vip=0,
        chance=0.0,
        min=1,
        max=1};

get(1) ->
    #intensify_critical_cfg{
        vip=1,
        chance=0.0,
        min=1,
        max=1};

get(2) ->
    #intensify_critical_cfg{
        vip=2,
        chance=0.0,
        min=1,
        max=1};

get(3) ->
    #intensify_critical_cfg{
        vip=3,
        chance=0.0,
        min=1,
        max=1};

get(4) ->
    #intensify_critical_cfg{
        vip=4,
        chance=0.0,
        min=1,
        max=1};

get(5) ->
    #intensify_critical_cfg{
        vip=5,
        chance=0.0,
        min=1,
        max=1};

get(6) ->
    #intensify_critical_cfg{
        vip=6,
        chance=0.0,
        min=1,
        max=1};

get(7) ->
    #intensify_critical_cfg{
        vip=7,
        chance=0.0,
        min=1,
        max=1};

get(8) ->
    #intensify_critical_cfg{
        vip=8,
        chance=0.0,
        min=1,
        max=1};

get(9) ->
    #intensify_critical_cfg{
        vip=9,
        chance=0.0,
        min=1,
        max=1};

get(10) ->
    #intensify_critical_cfg{
        vip=10,
        chance=0.0,
        min=1,
        max=1};

get(_) -> false.


