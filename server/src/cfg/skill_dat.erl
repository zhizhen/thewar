-module(skill_dat).
-export([find/1, keys/0]).
-export([foldl/2, filter/1]).
-export([floor/1, ceil/1]).

find(1000) ->
    #{    
      id => 1000
    };

find(_K) -> 
    false.

keys() -> 
    [1000].

filter(Fun) ->
    List = keys(),
    lists:filter(Fun, List).

foldl(Fun, Acc) ->
    List = keys(),
    lists:foldl(Fun, Acc, List).

ceil(Num) -> 
    case [X || X <- lists:sort(keys()), X >= Num] of
        [H|_] ->
            find(H);
        _ ->
            false
    end.

floor(Num) -> 
    case [X || X <- lists:sort(keys()), X =< Num] of
        [] ->
            false;
        List ->
            find(lists:last(List))
    end.


