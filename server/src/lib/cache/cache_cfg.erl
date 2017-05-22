-module(cache_cfg).
-export ([cfg/1]).

cfg(foo) -> et;
cfg(bar) -> pd;

cfg(process_global_info) -> pd;
cfg(game_info) -> pd;
cfg(seed) -> pd;
%% scene---------------------
cfg(scene_slave) -> pd;
cfg(scene_spec_id) -> pd;
%% scene---------------------

%% statistics--------------
cfg(statistics_cache) -> pd;
%% statistics--------------

%% -----BOSS----
cfg(boss_info) ->pd;
%% -----BOSS----

cfg(botdata) -> pd;

cfg(Other) -> throw({cache_cfg, wrong_key, Other}).
