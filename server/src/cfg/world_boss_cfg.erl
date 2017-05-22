-module(world_boss_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(59500) ->
    #world_boss_cfg{
        boss_id=59500,
        init_level=10,
        daily_open_time=45000};

get(59600) ->
    #world_boss_cfg{
        boss_id=59600,
        init_level=10,
        daily_open_time=64800};

get(59700) ->
    #world_boss_cfg{
        boss_id=59700,
        init_level=10,
        daily_open_time=75600};

get(_) -> false.

get_all() ->
    [59500,59600,59700].

