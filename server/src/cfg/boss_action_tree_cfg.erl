-module(boss_action_tree_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #boss_action_tree_cfg{
        action_id=1,
        action_time=1000,
        probability=100,
        is_end=0,
        next_action=[2, 3]};

get(2) ->
    #boss_action_tree_cfg{
        action_id=2,
        action_time=1000,
        probability=100,
        is_end=0,
        next_action=[3, 4]};

get(3) ->
    #boss_action_tree_cfg{
        action_id=3,
        action_time=1000,
        probability=100,
        is_end=0,
        next_action=[4]};

get(4) ->
    #boss_action_tree_cfg{
        action_id=4,
        action_time=1000,
        probability=100,
        is_end=1,
        next_action=[]};

get(_) -> false.


