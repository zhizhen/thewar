-module(coin2exp_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #coin2exp_cfg{
        master=1,
        follow_cost=["5-0", "74002-1"],
        speedup_coin=1,
        speedup_item=["74000-1"],
        exp_rate=50,
        add_step=1,
        speed_step=2,
        max_exp=500000};

get(2) ->
    #coin2exp_cfg{
        master=2,
        follow_cost=["5-200", ""],
        speedup_coin=10,
        speedup_item=["74000-1"],
        exp_rate=200,
        add_step=1,
        speed_step=2,
        max_exp=1000000};

get(3) ->
    #coin2exp_cfg{
        master=3,
        follow_cost=["5-1000", ""],
        speedup_coin=50,
        speedup_item=["74000-1"],
        exp_rate=1000,
        add_step=1,
        speed_step=2,
        max_exp=5000000};

get(_) -> false.

get_all() ->
    [1,2,3].

