-module(line_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(20001) ->
    #line_cfg{
        id=20001,
        max_line=1000,
        can_switch=1,
        busy=30,
        full=40,
        close=0.8,
        strategy=0,
        namemod=scene_mod};

get(20002) ->
    #line_cfg{
        id=20002,
        max_line=1000,
        can_switch=1,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=scene_mod};

get(20003) ->
    #line_cfg{
        id=20003,
        max_line=1000,
        can_switch=1,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=scene_mod};

get(20004) ->
    #line_cfg{
        id=20004,
        max_line=1000,
        can_switch=1,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=scene_mod};

get(20005) ->
    #line_cfg{
        id=20005,
        max_line=1000,
        can_switch=1,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=scene_mod};

get(21000) ->
    #line_cfg{
        id=21000,
        max_line=1,
        can_switch=0,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=group_pool_api};

get(33001) ->
    #line_cfg{
        id=33001,
        max_line=1,
        can_switch=0,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=world_boss_api};

get(33003) ->
    #line_cfg{
        id=33003,
        max_line=1,
        can_switch=0,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=world_boss_api};

get(33004) ->
    #line_cfg{
        id=33004,
        max_line=1,
        can_switch=0,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=world_boss_api};

get(33005) ->
    #line_cfg{
        id=33005,
        max_line=1,
        can_switch=0,
        busy=30,
        full=40,
        close=0.8,
        strategy=1,
        namemod=group_boss_api};

get(_) -> false.


