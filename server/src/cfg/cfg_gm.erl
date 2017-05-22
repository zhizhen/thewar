%% Copyright
-module(cfg_gm).

%% API
-export([get/1]).

get(1) -> {add_items, 3};
get(2) -> {add_gold, 1};
get(3) -> {add_coin, 2};
get(4) -> {ban, 1};
get(5) -> {un_ban, 0};
get(_) -> false.
