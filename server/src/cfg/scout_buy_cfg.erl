-module(scout_buy_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1) ->
    #scout_buy_cfg{
        count=1,
        coin=100};

get(2) ->
    #scout_buy_cfg{
        count=2,
        coin=150};

get(3) ->
    #scout_buy_cfg{
        count=3,
        coin=200};

get(4) ->
    #scout_buy_cfg{
        count=4,
        coin=250};

get(5) ->
    #scout_buy_cfg{
        count=5,
        coin=300};

get(6) ->
    #scout_buy_cfg{
        count=6,
        coin=350};

get(7) ->
    #scout_buy_cfg{
        count=7,
        coin=400};

get(8) ->
    #scout_buy_cfg{
        count=8,
        coin=450};

get(9) ->
    #scout_buy_cfg{
        count=9,
        coin=500};

get(10) ->
    #scout_buy_cfg{
        count=10,
        coin=550};

get(11) ->
    #scout_buy_cfg{
        count=11,
        coin=600};

get(12) ->
    #scout_buy_cfg{
        count=12,
        coin=650};

get(13) ->
    #scout_buy_cfg{
        count=13,
        coin=700};

get(14) ->
    #scout_buy_cfg{
        count=14,
        coin=750};

get(15) ->
    #scout_buy_cfg{
        count=15,
        coin=800};

get(16) ->
    #scout_buy_cfg{
        count=16,
        coin=850};

get(17) ->
    #scout_buy_cfg{
        count=17,
        coin=900};

get(18) ->
    #scout_buy_cfg{
        count=18,
        coin=950};

get(19) ->
    #scout_buy_cfg{
        count=19,
        coin=1000};

get(20) ->
    #scout_buy_cfg{
        count=20,
        coin=1050};

get(_) -> false.

get_all() ->
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].

