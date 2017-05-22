%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(account_mod).
-include_lib("stdlib/include/ms_transform.hrl").

-include("common.hrl").
-include("msg_code.hrl").
-include("table_etc.hrl").
-include("table_record.hrl").
-include("logger.hrl").
-include("game_pb.hrl").

%% API
-export([
    check_login/2,
    handle_repeat_login/1
]).

% -export([build_p_account/2]).

%%%===================================================================
%%% API
%%%===================================================================

%% @doc  玩家账号登录

check_login(AccountId, Ticket) ->
    Bin = util:to_binary(Ticket),
    <<TimeStamp:10/binary, ClientHash:32/binary>> = Bin,
    case erlang:abs(util:unixtime() - util:to_integer(TimeStamp)) < ?EXPIRE_TIME of
        true ->
            HashStr = io_lib:format("~s~s~s", [?SECRET_KEY, util:to_list(AccountId), util:to_list(TimeStamp)]),
            ServerHash = util:md5_to_hex(HashStr),
            case string:to_upper(util:to_list(ServerHash)) == string:to_upper(util:to_list(ClientHash)) of
                true ->
                    {ok, AccountId};
                false ->
                    % 认证失败
                    ?DEBUG_MSG("ticket auth failed! ~nServerHash:~n~p ~nClientHash:~n~p~n", [ServerHash, ClientHash]),
                    {error, ?AUTH_FAIL}
            end;
        false ->
            %% 认证过期
            ?DEBUG_MSG("ticket auth timeout:~p~n", [{util:unixtime(), util:to_integer(TimeStamp)}]),
            {error, ?AUTH_EXPIRED}
    end.

% build_p_account(Account, Coin) ->
%     #p_account{
%         account_id = Account#account.account_id,
%         coin = Coin
%     }.

handle_repeat_login(AccountId) ->
    Msg = #m__system__notify__s2c{code=1000},
    % 如果已经登录角色, 让角色进程主动退出
    % 否则, 给客户端发送通知后, 直接关闭sock, receiver则会异常退出
    case ets:lookup(?ETS_ACCOUNT, AccountId) of
        [#account_conn{role_pid=Pid, sock=Sock}] ->
            case is_pid(Pid) andalso erlang:is_process_alive(Pid) of
                false ->
                    goddess_net:send(Sock, Msg),
                    gen_tcp:close(Sock);
                true ->
                    Pid ! {logout, role_repeat_login},
                    try erlang:monitor(process, Pid) of
                        Ref ->
                            receive
                                {'DOWN', Ref, _, _, _} ->
                                    erlang:demonitor(Ref)
                            end
                    catch
                        Class:Reason ->
                            ?DEBUG_MSG("check_role_repeat_login: ~p ~n", [Class, Reason])
                    end
            end;
        _ ->
            ok
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
