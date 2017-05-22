-module(group_boss_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(59000) ->
    #group_boss_cfg{
        boss_id=59000,
        init_level=1};

get(59010) ->
    #group_boss_cfg{
        boss_id=59010,
        init_level=1};

get(59020) ->
    #group_boss_cfg{
        boss_id=59020,
        init_level=1};

get(59030) ->
    #group_boss_cfg{
        boss_id=59030,
        init_level=1};

get(59040) ->
    #group_boss_cfg{
        boss_id=59040,
        init_level=1};

get(_) -> false.

get_all() ->
    [59000,59010,59020,59030,59040].

