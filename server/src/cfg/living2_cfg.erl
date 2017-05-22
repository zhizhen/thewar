-module(living2_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #living2_cfg{
        value=1,
        award=["4-10000"]};

get(2) ->
    #living2_cfg{
        value=2,
        award=["9-2000"]};

get(3) ->
    #living2_cfg{
        value=3,
        award=["4-50000"]};

get(4) ->
    #living2_cfg{
        value=4,
        award=["5-30"]};

get(5) ->
    #living2_cfg{
        value=5,
        award=["73304-1"]};

get(_) -> false.


