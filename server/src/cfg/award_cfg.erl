-module(award_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(challenge_api) ->
    #award_cfg{
        key=challenge_api,
        awards=["76046-1"]};

get(_) -> false.


