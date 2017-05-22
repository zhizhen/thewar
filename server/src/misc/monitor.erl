%% Copyright
-module(monitor).

%% API
-export([run_etop/0, with_time/1]).

-define(INTERVAL, 5). % seconds

run_etop() ->
    spawn(fun() -> etop:start([{output, text}, {interval, ?INTERVAL}, {lines, 20}, {sort, msg_q}]) end),
    spawn(fun() -> loop(fun() -> etop:dump("logs/etop.log") end, ?INTERVAL*1000) end).

with_time(F) ->
    erlang:statistics(runtime),
    erlang:statistics(wall_clock),
    F(),
    {_, T1} = erlang:statistics(runtime),
    {_, T2} = erlang:statistics(wall_clock),
    io:format("runtime:~p wall_clock: ~p ~n", [T1, T2]).

%% internal fun
loop(F, T) ->
    receive
    after T->
        F(),
        loop(F, T)
    end.
