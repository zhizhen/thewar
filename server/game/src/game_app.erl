-module(game_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    case net_adm:ping('gate@127.0.0.1') of
        pong ->
            lager:info("connect gate succ, nodes: ~p~n", [nodes()]);
        pang ->
            lager:info("connect gate fail, nodes: ~p~n", [nodes()])
    end,
    game_sup:start_link().

stop(_State) ->
    ok.
