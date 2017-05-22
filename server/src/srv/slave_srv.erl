%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-13 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(slave_srv).


%% API
-export([start_link/0, work/2, release/1]).
-export([slave/1]).

-ifdef(debug).
% -export([test/0]).
-endif.

%%%===================================================================
%%% API
%%%===================================================================
start_link() ->
    Parent = self(),
    Pid = erlang:spawn_link(?MODULE, slave, [Parent]),
    {ok, Pid}.

work(Srv, MFA) ->
    Srv ! {self(), work, MFA}.

release(Srv) ->
    Srv ! {self(), release}.


slave(Parent) ->
    receive
        {Parent, release} ->
            go_release();
        {Parent, work, {Module, Fun, Args}} ->
            go_work({Module, Fun, Args}),
            ?MODULE:slave(Parent);
        _ ->
            ?MODULE:slave(Parent)
    after 5000 ->
        erlang:hibernate(?MODULE, slave, [Parent])
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================

go_release() ->
    ok.

go_work({Module, Fun, Args}) ->
    case catch apply(Module, Fun, Args) of
        {'EXIT', _} ->
            ok;
        _Result ->
            ok
    end.


%%%===================================================================
%%% test
%%%===================================================================

% test() ->
%     {ok, P} = slave_srv:start_link(),
%     slave_srv:work(P, {lists, seq, [1,2]}),
%     slave_srv:work(P, {lists, seq, [3,4]}),
%     slave_srv:work(P, {lists, seq, [5,6]}),
%     P ! {nosence_msg_1},
%     P ! {nosence_msg_2},
%     P ! {nosence_msg_3},
%     receive
%     after 11000 ->
%         slave_srv:work(P, {lists, seq, [6,7]}),
%         slave_srv:work(P, {lists, seq, [7,8]}),
%         slave_srv:work(P, {lists, seq, [9,10]}),
%         P ! {nosence_msg_4}
%     end,
%     slave_srv:release(P).
