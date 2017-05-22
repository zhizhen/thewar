-module(group_level_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(10000) ->
    #group_level_cfg{
        level=1,
        exp=10000,
        max=20};

get(30000) ->
    #group_level_cfg{
        level=2,
        exp=30000,
        max=22};

get(80000) ->
    #group_level_cfg{
        level=3,
        exp=80000,
        max=25};

get(180000) ->
    #group_level_cfg{
        level=4,
        exp=180000,
        max=27};

get(300000) ->
    #group_level_cfg{
        level=5,
        exp=300000,
        max=30};

get(_) -> false.

get_all() ->
    [10000,30000,80000,180000,300000].

