-module(act_shengyan_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #act_shengyan_cfg{
        id=1,
        start1=39600,
        end1=46800,
        start2=61200,
        end2=68400,
        power1=50,
        power2=50};

get(_) -> false.


