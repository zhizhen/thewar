-module(gate_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    lager:set_loglevel(lager_console_backend, debug),
    lager:info("Application start!!!"),
    ok = start_websocket(),
    gate_sup:start_link().

stop(_State) ->
    ok.

start_websocket() ->
    Rules = [
                {'_', [
                       {"/", cowboy_static, {priv_file, gate, "index.html"}},
                       {"/ws", ws_handler, []},
                       {"/static/[...]", cowboy_static, {priv_dir, gate, "static"}}
                      ]
                }
            ],
    Dispatch = cowboy_router:compile(Rules),
    cowboy:start_clear(http, 100, [{port, 8080}], #{env => #{dispatch =>Dispatch}}),
    ok.
