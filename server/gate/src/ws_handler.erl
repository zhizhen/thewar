-module(ws_handler).

-export([init/2]).
-export([websocket_init/1]).
-export([websocket_handle/2]).
-export([websocket_info/2]).
-export([websocket_terminate/2]).

init(Req, Opts) ->
    lager:info("websocket handler init: ~p~n", [{Req, Opts}]),
    {cowboy_websocket, Req, Opts}.

websocket_init(State) ->
    lager:info("websocket init: ~p~n", [{State}]),
    {ok, State}.

websocket_handle({text, Msg}, State) ->
    lager:info("receive message: ~p~n", [Msg]),
    {reply, {text, <<"That's what she said! ", Msg/binary>>}, State};
websocket_handle({binary, Bin}, State) ->
    lager:info("receive binary: ~p~n", [{Bin}]),
    Result = example_pb:decode_message(Bin),
    lager:info("receive binary: ~p~n", [{Result}]),
    {ok, State};
websocket_handle(_Data, State) ->
    lager:error("recv unhanded data: ~p~n", [_Data]),
    {ok, State}.

websocket_info({binary, Bin}, State) ->
    lager:info("websocket send binary: ~p~n", [Bin]),
    {reply, {binary, Bin}, State}.

websocket_terminate(Reason, _State) ->
    lager:info("terminate, reason: ~p~n", [Reason]),
    ok.
