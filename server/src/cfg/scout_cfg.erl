-module(scout_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #scout_cfg{
        cicle=1,
        awards=["73301-1", "76995-1", "77066-1"]};

get(2) ->
    #scout_cfg{
        cicle=2,
        awards=["73302-1", "76996-1", "77067-1"]};

get(3) ->
    #scout_cfg{
        cicle=3,
        awards=["73303-1", "76997-1", "77068-1"]};

get(4) ->
    #scout_cfg{
        cicle=4,
        awards=["73304-1", "76998-1", "77069-1"]};

get(5) ->
    #scout_cfg{
        cicle=5,
        awards=["73305-1", "76999-1", "77070-1"]};

get(_) -> false.


