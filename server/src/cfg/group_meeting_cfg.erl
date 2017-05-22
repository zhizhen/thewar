-module(group_meeting_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #group_meeting_cfg{
        level=1,
        count=1,
        value=200,
        rolecount=3,
        cd=0,
        exp=0};

get(2) ->
    #group_meeting_cfg{
        level=2,
        count=1,
        value=250,
        rolecount=3,
        cd=0,
        exp=0};

get(3) ->
    #group_meeting_cfg{
        level=3,
        count=1,
        value=300,
        rolecount=3,
        cd=0,
        exp=0};

get(4) ->
    #group_meeting_cfg{
        level=4,
        count=1,
        value=350,
        rolecount=3,
        cd=0,
        exp=0};

get(5) ->
    #group_meeting_cfg{
        level=5,
        count=1,
        value=400,
        rolecount=3,
        cd=0,
        exp=0};

get(_) -> false.


