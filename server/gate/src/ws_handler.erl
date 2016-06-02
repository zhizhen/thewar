-module(ws_handler).

-export([init/2]).
-export([websocket_handle/3]).
-export([websocket_info/3]).
-export([websocket_terminate/3]).

init(Req, _Opts) ->
    lager:info("websocket handler init", [{Req, _Opts}]),
    State = undefined,
    {cowboy_websocket, Req, State}.

websocket_handle({text, Msg}, Req, State) ->
    lager:info("receive message: ~p~n", [Msg]),
    {reply, {text, <<"That's what she said! ", Msg/binary>>}, Req, State};
websocket_handle({binary, Bin}, Req, State) ->
    lager:info("receive binary: ~p~n", [Bin]),
    {ok, Req, State};
websocket_handle(_Data, Req, State) ->
    lager:error("recv unhanded data: ~p~n", [_Data]),
    {ok, Req, State}.

websocket_info({binary, Bin}, Req, State) ->
    lager:info("websocket send binary: ~p~n", [Bin]),
    {reply, {binary, Bin}, Req, State}.

websocket_terminate(Reason, _Req, _State) ->
    lager:info("terminate, reason: ~p~n", [Reason]),
    ok.
