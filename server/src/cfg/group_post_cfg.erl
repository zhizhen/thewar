-module(group_post_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #group_post_cfg{
        id=1,
        notice=1,
        close=1,
        transfer=1,
        handle_request=1,
        invite=1,
        kick=1,
        act=1,
        leave=0,
        appoint1=1,
        appoint2=1,
        appoint3=1,
        start_boss=1};

get(2) ->
    #group_post_cfg{
        id=2,
        notice=1,
        close=0,
        transfer=0,
        handle_request=1,
        invite=1,
        kick=1,
        act=1,
        leave=1,
        appoint1=0,
        appoint2=1,
        appoint3=1,
        start_boss=1};

get(3) ->
    #group_post_cfg{
        id=3,
        notice=0,
        close=0,
        transfer=0,
        handle_request=1,
        invite=1,
        kick=0,
        act=0,
        leave=1,
        appoint1=0,
        appoint2=0,
        appoint3=0,
        start_boss=0};

get(4) ->
    #group_post_cfg{
        id=4,
        notice=0,
        close=0,
        transfer=0,
        handle_request=0,
        invite=0,
        kick=0,
        act=0,
        leave=1,
        appoint1=0,
        appoint2=0,
        appoint3=0,
        start_boss=0};

get(_) -> false.


