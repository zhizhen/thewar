%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 敏感词过滤
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(sensitive_srv).

-behaviour(gen_server).

-include("logger.hrl").

%% API
-export([start_link/0, check_words/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
    Tree = dict:new(),
    NewTree = build_tree(Tree, sensitive:get_sensitive_list()),
    {ok, NewTree}.


check_words(_) ->
    false.
%% check_words(Msg) ->
%%     gen_server:call(?SERVER, {check, Msg}).

%% @private
%% @doc Handling call messages
handle_call(Request, From, State) ->
    try
    do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("sensitive_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
            [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

%% @private
%% @doc Handling cast messages
handle_cast(Msg, State) ->
    try
    do_cast(Msg, State)
    catch
        _:Reason ->

            ?ERROR_MSG("sensitive_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc Handling all non call/cast messages
handle_info(Info, State) ->
    try
    do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("sensitive_srv handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
terminate(_Reason, _State) ->
    ok.

%% @private
%% @doc Convert process state when code is changed
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

do_call({check, Word}, _From, State) ->
    Flag = check(State, State, util:to_list(Word)),
    {reply, Flag, State};

do_call(Request, From, State) ->
    ?ERROR_MSG("Unhandled Call Warning, Request: ~p, From: ~p, State: ~p~n", [Request, From, State]),
    {reply, ok, State}.

do_cast(Msg, State) ->
    ?ERROR_MSG("Unhandled Cast Warning, Msg: ~p, State: ~p~n", [Msg, State]),
    {noreply, State}.

do_info(Info, State) ->
    ?ERROR_MSG("Unhandled Info Warning, Info: ~p, State: ~p~n", [Info, State]),
    {noreply, State}.


build_tree(Tree, []) ->
    Tree;
build_tree(Tree, [Word|Words]) ->
    NewTree = build_one(Tree, Word),
    build_tree(NewTree, Words).

build_one(_, []) ->
    End = dict:new(),
    dict:store(0, true, End);

build_one(Tree, [Char|Chars]) ->
    NextNode = case dict:is_key(Char, Tree) of
        false ->
            dict:new();
        true ->
            {ok, Data} = dict:find(Char, Tree),
            Data
    end,
    NextTree = build_one(NextNode, Chars),
    dict:store(Char, NextTree, Tree).


check(_, _, []) ->
    false;

check(Tree, Node, [Char|Chars]) ->
    NextNode = case dict:is_key(Char, Node) of
        false ->
            case dict:is_key(Char, Tree) of
                false ->
                    Tree;
                true ->
                    {ok, Data} = dict:find(Char, Tree),
                    Data
            end;
        true ->
            {ok, Data} = dict:find(Char, Node),
            Data
    end,
    case dict:is_key(0, NextNode) of
        true ->
            true;
        false ->
            check(Tree, NextNode, Chars)
    end.


