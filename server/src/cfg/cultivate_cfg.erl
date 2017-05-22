-module(cultivate_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(200) ->
    #cultivate_cfg{
        sumkey=200,
        gold=20000,
        coin=2,
        power2=10,
        attrs=[#cultivate_item_cfg{max=1000,l=10,b=10,gold_negative_chance=20,coin_negative_chance=8},#cultivate_item_cfg{max=1000,l=10,b=10,gold_negative_chance=36,coin_negative_chance=17},#cultivate_item_cfg{max=1000,l=10,b=10,gold_negative_chance=20,coin_negative_chance=8},#cultivate_item_cfg{max=1000,l=10,b=10,gold_negative_chance=28,coin_negative_chance=13},#cultivate_item_cfg{max=1000,l=10,b=10,gold_negative_chance=20,coin_negative_chance=8}]};

get(500) ->
    #cultivate_cfg{
        sumkey=500,
        gold=50000,
        coin=5,
        power2=10,
        attrs=[#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=25,coin_negative_chance=12},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=40,coin_negative_chance=21},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=25,coin_negative_chance=12},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=33,coin_negative_chance=16},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=25,coin_negative_chance=12}]};

get(1000) ->
    #cultivate_cfg{
        sumkey=1000,
        gold=100000,
        coin=10,
        power2=10,
        attrs=[#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=30,coin_negative_chance=16},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=44,coin_negative_chance=24},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=30,coin_negative_chance=16},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=37,coin_negative_chance=20},#cultivate_item_cfg{max=1000,l=8,b=8,gold_negative_chance=30,coin_negative_chance=16}]};

get(2000) ->
    #cultivate_cfg{
        sumkey=2000,
        gold=200000,
        coin=20,
        power2=10,
        attrs=[#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=35,coin_negative_chance=20},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=48,coin_negative_chance=28},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=35,coin_negative_chance=20},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=42,coin_negative_chance=24},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=35,coin_negative_chance=20}]};

get(5000) ->
    #cultivate_cfg{
        sumkey=5000,
        gold=500000,
        coin=50,
        power2=10,
        attrs=[#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=40,coin_negative_chance=24},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=52,coin_negative_chance=32},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=40,coin_negative_chance=24},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=46,coin_negative_chance=28},#cultivate_item_cfg{max=1000,l=6,b=6,gold_negative_chance=40,coin_negative_chance=24}]};

get(_) -> false.

get_all() ->
    [200,500,1000,2000,5000].

