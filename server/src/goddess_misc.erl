%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_misc).

%% API
-export([
        tcp_name/3,
        ntoa/1,
        ntoab/1,
        role_process_name/1,
        receiver_process_name/1,
        client_sender_process_name/1,
        client_receiver_process_name/1,
        is_process_alive/1,
        whereis_name/2,
        register/3,
        get_pid_by_name/1,
        get_role_pid/1
]).

%%%===================================================================
%%% API
%%%===================================================================
get_pid_by_name(Name) ->
    Pid = whereis_name(local, util:to_atom(Name)),
    case is_pid(Pid) of
        false -> false;
        true ->
            case goddess_misc:is_process_alive(Pid) of
                false -> false;
                true -> Pid
            end
    end.

get_role_pid(RoleId) ->
    RoleProcessName = role_process_name(util:to_list(RoleId)),
    RolePid = whereis_name(local, RoleProcessName),
    case is_pid(RolePid) of
        false -> false;
        true ->
            case goddess_misc:is_process_alive(RolePid) of
                false -> false;
                true -> RolePid
            end
    end.

%%--------------------------------------------------------------------
%% @doc
%% tcp名称格式：prefix_127.0.0.1:8888
%% @end
%%--------------------------------------------------------------------
tcp_name(Prefix, IPAddress, Port)
  when is_atom(Prefix) andalso is_number(Port) ->
    list_to_atom(
      format("~w_~s:~w", [Prefix, ntoa(IPAddress), Port])).

format(Fmt, Args) -> lists:flatten(io_lib:format(Fmt, Args)).

%%--------------------------------------------------------------------
%% @doc
%% IP地址格式转换，{127, 0, 0, 1} -> 127.0.0.1
%% @end
%%--------------------------------------------------------------------
ntoa(IP) ->
    inet_parse:ntoa(IP).

%%--------------------------------------------------------------------
%% @doc
%% IP地址格式转换
%% 127.0.0.1 -> 127.0.0.1
%% 127.0.0.1:8888 -> [127.0.0.1:8888]
%% @end
%%--------------------------------------------------------------------
ntoab(IP) ->
    Str = ntoa(IP),
    case string:str(Str, ":") of
        0 -> Str;
        _ -> "[" ++ Str ++ "]"
    end.

%%--------------------------------------------------------------------
%% @doc
%% 玩家角色进程名称格式：goddess_role_10000
%% @end
%%--------------------------------------------------------------------
role_process_name(RoleId) when is_integer(RoleId) or is_atom(RoleId) ->
    util:list_to_atom2(
      lists:concat([goddess_role_, RoleId]));
role_process_name(RoleId) when is_list(RoleId) ->
    util:list_to_atom2(
      lists:flatten(["goddess_role_" | RoleId]));
role_process_name(RoleId) when is_binary(RoleId) ->
    util:list_to_atom2(
        lists:concat([goddess_role_, util:md5(RoleId)])).

%%--------------------------------------------------------------------
%% @doc
%% 接收客户端socket信息的进程名称格式：goddess_client_receiver_10000
%% @end
%%--------------------------------------------------------------------
client_receiver_process_name(RoleId) when is_integer(RoleId) or is_atom(RoleId) ->
    util:list_to_atom2(
        lists:concat([goddess_client_receiver_, RoleId]));
client_receiver_process_name(RoleId) when is_list(RoleId) ->
    util:list_to_atom2(
        lists:flatten(["goddess_client_receiver_" | RoleId]));
client_receiver_process_name(RoleId) when is_binary(RoleId) ->
    util:list_to_atom2(
        lists:concat([goddess_client_receiver_, util:md5(RoleId)])).

%%--------------------------------------------------------------------
%% @doc
%% 接收客户端socket信息的进程名称格式：goddess_receiver_10000
%% @end
%%--------------------------------------------------------------------
receiver_process_name(RoleId) when is_integer(RoleId) or is_atom(RoleId) ->
    util:list_to_atom2(
      lists:concat([goddess_receiver_, RoleId]));
receiver_process_name(RoleId) when is_list(RoleId) ->
    util:list_to_atom2(
      lists:flatten(["goddess_receiver_" | RoleId]));
receiver_process_name(RoleId) when is_binary(RoleId) ->
    util:list_to_atom2(
        lists:concat([goddess_receiver_, util:md5(RoleId)])).

%%--------------------------------------------------------------------
%% @doc
%% 发送客户端socket信息的进程名称格式：goddess_client_sender_10000
%% @end
%%--------------------------------------------------------------------
client_sender_process_name(RoleId) when is_integer(RoleId) or is_atom(RoleId) ->
    util:list_to_atom2(
      lists:concat([goddess_client_sender_, RoleId]));
client_sender_process_name(RoleId) when is_list(RoleId) ->
    util:list_to_atom2(
      lists:flatten(["goddess_client_sender_" | RoleId]));
client_sender_process_name(RoleId) when is_binary(RoleId) ->
    util:list_to_atom2(
        lists:concat([goddess_client_sender_, util:md5(RoleId)])).

%%--------------------------------------------------------------------
%% @doc
%% 检查进程是否存活（未实现跨节点检查功能）
%% @end
%%--------------------------------------------------------------------
is_process_alive(Pid) when is_pid(Pid) ->    
    erlang:is_process_alive(Pid).

%%--------------------------------------------------------------------
%% @doc
%% 根据进程注册名称获得进程Pid
%% @end
%%--------------------------------------------------------------------
whereis_name(local, Atom) -> 
    erlang:whereis(Atom);
whereis_name(global, Atom) ->
    global:whereis_name(Atom).

%%--------------------------------------------------------------------
%% @doc
%% 注册Pid名称
%% @end
%%--------------------------------------------------------------------
register(local, Name, Pid) ->
    PidInfo = erlang:process_info(Pid),
    RegNameInfo = lists:keyfind(registered_name, 1, PidInfo),
    case RegNameInfo of
        {registered_name, RegName} -> erlang:unregister(RegName);
        _ -> ok
    end,
    erlang:register(Name, Pid);

register(global, Name, Pid) ->
    PidInfo = erlang:process_info(Pid),
    RegNameInfo = lists:keyfind(registered_name, 1, PidInfo),
    case RegNameInfo of
        {registered_name, RegName} -> global:unregister_name(RegName);
        _ -> ok
    end,
    global:register_name(Name, Pid).

%%%===================================================================
%%% Internal functions
%%%===================================================================
