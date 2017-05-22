-module(living_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #living_cfg{
        id=1,
        needcount=1,
        value=5};

get(2) ->
    #living_cfg{
        id=2,
        needcount=1,
        value=5};

get(3) ->
    #living_cfg{
        id=3,
        needcount=2,
        value=20};

get(5) ->
    #living_cfg{
        id=5,
        needcount=2,
        value=5};

get(6) ->
    #living_cfg{
        id=6,
        needcount=1,
        value=10};

get(8) ->
    #living_cfg{
        id=8,
        needcount=1,
        value=5};

get(9) ->
    #living_cfg{
        id=9,
        needcount=1,
        value=10};

get(10) ->
    #living_cfg{
        id=10,
        needcount=1,
        value=10};

get(11) ->
    #living_cfg{
        id=11,
        needcount=3,
        value=10};

get(12) ->
    #living_cfg{
        id=12,
        needcount=1,
        value=10};

get(13) ->
    #living_cfg{
        id=13,
        needcount=1,
        value=10};

get(14) ->
    #living_cfg{
        id=14,
        needcount=1,
        value=10};

get(15) ->
    #living_cfg{
        id=15,
        needcount=1,
        value=10};

get(16) ->
    #living_cfg{
        id=16,
        needcount=1,
        value=30};

get(_) -> false.


