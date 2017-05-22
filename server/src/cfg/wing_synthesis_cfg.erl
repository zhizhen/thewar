-module(wing_synthesis_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(77211) ->
    #wing_synthesis_cfg{
        item_id=77211,
        rate=100,
        cost=10000,
        num=5};

get(77212) ->
    #wing_synthesis_cfg{
        item_id=77212,
        rate=80,
        cost=20000,
        num=5};

get(77213) ->
    #wing_synthesis_cfg{
        item_id=77213,
        rate=65,
        cost=50000,
        num=5};

get(_) -> false.


