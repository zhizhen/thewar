%% ===========================================================================
%% trick
%% ===========================================================================
-define(CURR_FUNC1, string:join([util:to_list(X)|| X <- erlang:tuple_to_list(erlang:element(2, erlang:process_info(self(),current_function)))], "-")).

-define(NOW, util:unixtime()).

-define(PERFORM(F),
    try
        F()
    catch throw:Reason ->
        %% 定位错误位置
        error_logger:info_msg("~p ~n, handle mod:~p~n", [erlang:get_stacktrace(), ?MODULE]),
        ?MODULE:handle_throw(Reason)
    end
).


-define(BUILD_BATTLE_STAR(Score),
    element(2, lists:keyfind(lists:max([X || X <- [0, 15000, 18000, 21000, 24000, 27000], X =< Score]), 1, [{0, 1}, {15000, 2}, {18000, 3}, {21000, 4}, {24000, 5}, {27000, 6}]))
).

-define(MAX_POWER, 200).

-define(TAIL(Record), lists:nthtail(1, erlang:tuple_to_list(Record))).
-define(FORMAT_SQL(X),
    case erlang:is_binary(X) of
        false -> X;
        true -> util:to_list(X)
    end).
-define(FILTER_SQL(Template, Params), util:to_binary(io_lib:format(Template, [?FORMAT_SQL(X) || X <- Params]))).

-define(CURR_MODE_FUNC,
    begin
        ModFunc =string:join([util:to_list(X)|| X <- erlang:tuple_to_list(erlang:element(2, erlang:process_info(self(),current_function)))], "-"),
        Mod = string:sub_string(ModFunc, 1, string:chr(ModFunc, $-) - 5),
        StartPos = 
            case string:chr(ModFunc, $/) of
                0 -> string:chr(ModFunc, $-) + 1;
                _ ->  string:chr(ModFunc, $-) + 2
            end,
        EndPos = 
            case string:chr(ModFunc, $/) of
                0 -> string:rchr(ModFunc, $-) -1;
                _ -> string:chr(ModFunc, $/) - 1
            end,

        Func = string:sub_string(ModFunc, StartPos, EndPos),
        string:join([Mod, Func], "_")
    end).