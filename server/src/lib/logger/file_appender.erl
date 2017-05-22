%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(file_appender).

-behaviour(gen_event).

%% gen_event callbacks
-export([
    init/1, handle_event/2, handle_call/2, handle_info/2, terminate/2,
    code_change/3
]).

-record(state, {fd, dir, prefix, is_mf}).

%%%----------------------------------------------------------------------
%%% Callback functions from gen_event
%%%----------------------------------------------------------------------

%%----------------------------------------------------------------------
%% Func: init/1
%% Returns: {ok, State}          |
%%          Other
%%----------------------------------------------------------------------
init([Dir, Prefix, IsMf]) ->
    File = make_log_file(Dir, Prefix, IsMf),
    trucate_file_at_next_hour(),
    {ok, #state{fd = File, dir = Dir, prefix = Prefix, is_mf = IsMf}}.

%%----------------------------------------------------------------------
%% Func: handle_event/2
%% Returns: {ok, State}                                |
%%          {swap_handler, Args1, State1, Mod2, Args2} |
%%          remove_handler                              
%%----------------------------------------------------------------------
handle_event(Event, State) ->
    write_event(State#state.fd, {erlang:localtime(), Event}),
    {ok, State}.

%%----------------------------------------------------------------------
%% Func: handle_call/2
%% Returns: {ok, Reply, State}                                |
%%          {swap_handler, Reply, Args1, State1, Mod2, Args2} |
%%          {remove_handler, Reply}                            
%%----------------------------------------------------------------------
handle_call(_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

%%----------------------------------------------------------------------
%% Func: handle_info/2
%% Returns: {ok, State}                                |
%%          {swap_handler, Args1, State1, Mod2, Args2} |
%%          remove_handler                              
%%----------------------------------------------------------------------
handle_info(rotate_timer, #state{dir = Dir, prefix = Prefix, is_mf = IsMf} = State) ->
    File = make_log_file(Dir, Prefix, IsMf),
    trucate_file_at_next_hour(),
    {ok, State#state{fd = File}};

handle_info({'EXIT', _Fd, _Reason}, _State) ->
    remove_handler;
handle_info(_Info, State) ->
    {ok, State}.

%%----------------------------------------------------------------------
%% Func: terminate/2
%% Purpose: Shutdown the server
%% Returns: any
%%----------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%----------------------------------------------------------------------
%%% Internal functions
%%%----------------------------------------------------------------------
%% @doc 生成日志文件名
make_log_file(BaseDir, Prefix, IsMf) ->
    ok = filelib:ensure_dir(BaseDir),
    case IsMf of
        true ->
            {{Year, Month, Day}, {H, _, _}} = erlang:localtime(),
            io_lib:format("~s/~s_~p_~p_~p_~p.log", [BaseDir, Prefix, Year, Month, Day, H]);
        false ->
            io_lib:format("~s/~s.log", [BaseDir, Prefix])
    end.

%% @doc 通知服务器在下一个整点刷新日志文件
trucate_file_at_next_hour() ->
    {_, {_H, I, S}} = erlang:localtime(),
    Time = ((59 - I) * 60 + (59 - S) + 2) * 1000,

    Self = self(),
    io:format("starting file timer :~p~n", [Time]),
    timer:send_after(Time, Self, rotate_timer),
    ok.

do_write(Fd, Time, Type, Format, Args) ->
    {{Y,Mo,D},{H,Mi,S}} = Time, 
    LBin = erlang:iolist_to_binary(Type),
    InfoMsg = unicode:characters_to_list(LBin),
    Time2 = io_lib:format("==== ~w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w ===",
          [Y, Mo, D, H, Mi, S]),
    L2 = lists:concat([InfoMsg, Time2]),
    B = unicode:characters_to_binary(L2),
    file:write_file(Fd, B, [append, delayed_write]),
    try 
        M = io_lib:format(Format, Args),
        file:write_file(Fd, M, [append, delayed_write])
    catch _:Error ->
            io:format("log error ~p ~p ~p", [Error, Format, Args])
    end.

% Copied from erlang_logger_file_h.erl
write_event(Fd, {Time, {error, _GL, {_Pid, Format, Args}}}) ->
    [L] = io_lib:format("~ts", ["error report"]),
    do_write(Fd, Time, L, Format, Args);

write_event(Fd, {Time, {emulator, _GL, Chars}}) ->
    T = write_time(Time),
    case catch io_lib:format(Chars, []) of
    S when is_list(S) ->
        file:write_file(Fd, io_lib:format(T ++ S, []), [append, delayed_write]);
    _ ->
        file:write_file(Fd, io_lib:format(T ++ "ERROR: ~p ~n", [Chars]), [append, delayed_write])
    end;


write_event(Fd, {Time, {info, _GL, {Pid, Info, _}}}) ->
    T = write_time(Time),
    file:write_file(Fd, io_lib:format(T ++ add_node("~p~n",Pid), [Info]), [append, delayed_write]);


write_event(Fd, {Time, {error_report, _GL, {Pid, _, Rep}}}) ->
    T = write_time(Time),
    S = format_report(Rep),
    file:write_file(Fd, io_lib:format(T ++ S ++ add_node("", Pid), []), [append, delayed_write]);


write_event(Fd, {Time, {info_report, _GL, {Pid, std_info, Rep}}}) ->
    T = write_time(Time, "INFO REPORT"),
    S = format_report(Rep),
    file:write_file(Fd, io_lib:format(T ++ S ++ add_node("", Pid), []), [append, delayed_write]);


write_event(Fd, {Time, {info_msg, _GL, {_Pid, Format, Args}}}) ->
    [L] = io_lib:format("~ts", ["info report"]),
    do_write(Fd, Time, L, Format, Args);

write_event(Fd, {Time, {info_report, _GL, {_PID, progress, Detail}}}) ->
    [L] = io_lib:format("~ts", ["OTP progress"]),
    do_write(Fd, Time, L, "~n~p~n~n", [Detail]);


write_event(_, Info) ->
    io:format("~ts ~p", ["unkown info", Info]),
    ok.

format_report(Rep) when is_list(Rep) ->
    case string_p(Rep) of
    true ->
        io_lib:format("~s~n",[Rep]);
    _ ->
        format_rep(Rep)
    end;
format_report(Rep) ->
    io_lib:format("~p~n",[Rep]).

format_rep([{Tag,Data}|Rep]) ->
    io_lib:format("    ~p: ~p~n",[Tag,Data]) ++ format_rep(Rep);


format_rep([Other|Rep]) ->
    io_lib:format("    ~p~n",[Other]) ++ format_rep(Rep);


format_rep(_) ->
    [].

add_node(X, Pid) when node(Pid) /= node() ->
    lists:concat([X,"** at node ",node(Pid)," **~n"]);
add_node(X, _) ->
    X.

string_p([]) ->
    false;
string_p(Term) ->
    string_p1(Term).

string_p1([H|T]) when is_integer(H), H >= $\s, H < 255 ->
    string_p1(T);
string_p1([$\n|T]) -> string_p1(T);
string_p1([$\r|T]) -> string_p1(T);
string_p1([$\t|T]) -> string_p1(T);
string_p1([$\v|T]) -> string_p1(T);
string_p1([$\b|T]) -> string_p1(T);
string_p1([$\f|T]) -> string_p1(T);
string_p1([$\e|T]) -> string_p1(T);
string_p1([H|T]) when is_list(H) ->
    case string_p1(H) of
    true -> string_p1(T);
    _    -> false
    end;
string_p1([]) -> true;
string_p1(_) ->  false.

write_time(Time) -> write_time(Time, "ERROR REPORT").

write_time({{Y,Mo,D},{H,Mi,S}}, Type) ->
    io_lib:format("~n=~s==== ~w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w ===",
          [Type, Y, Mo, D, H, Mi, S]).
