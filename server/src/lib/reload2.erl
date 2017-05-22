%% Copyright
-module(reload2).
-author("snow").

%% API
-export([reload/0]).

%% 进程在使用当前模块, erlang:check_process_code(Pid, Mod)
%% 在try里面做loop的进程模块 无法purge
%% receive阻塞没有设置超时, 并且没有进行显示的递归回调 无法purge
%% 进程活在一个receive里面的, 无法purge

%% e.g 当执行热更时, 当前模块就无法purge

reload() ->
    All = code:all_loaded(),
    F = fun(Str) ->
        case is_list(Str) of
            true -> string:str(Str, "server/ebin") /= 0;
            false -> false
        end
    end,
    Modules = [M || {M, Path} <- All, F(Path), is_changed(M)],
    reload(Modules -- [?MODULE]).

reload(ModuleList) ->
    F = fun(M, Acc) ->
            case reload_single(M) of
                false -> Acc;
                M -> [M|Acc]
            end
        end,
    Fail = lists:foldl(F, [], ModuleList),
    {log, Fail}.

reload_single(Mod) ->
    case code:soft_purge(Mod) of
        false ->
            Mod;
        true ->
            code:load_file(Mod),
            false
    end.

is_changed(M) ->
    try
        module_vsn(M:module_info()) =/= module_vsn(code:get_object_code(M))
    catch _:_ ->
        false
    end.

module_vsn({M, Beam, _Fn}) ->
    {ok, {M, Vsn}} = beam_lib:version(Beam),
    Vsn;
module_vsn(L) when is_list(L) ->
    {_, Attrs} = lists:keyfind(attributes, 1, L),
    {_, Vsn} = lists:keyfind(vsn, 1, Attrs),
    Vsn.

