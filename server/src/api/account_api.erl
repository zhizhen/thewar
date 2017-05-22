%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(account_api).

-include("game_pb.hrl").
-include("logger.hrl").
-include("msg_code.hrl").
-include("goddess.hrl").
-include("table_etc.hrl").

%% API
-export([
    login/1,
    open_function/1
]).

-export([
    after_login/3,
    leave/1
]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% 玩家账号登录API
%% @end
%%--------------------------------------------------------------------
login(#m__account__login__c2s{account_id=AccountId, ticket=Ticket, platform=Platform, server_id=ServerId}) ->
    {AllowPlatform, AllowServerId, _} = goddess_env:client_identity(),
    F = fun() ->
        case lists:member(Platform, AllowPlatform) of
            false -> 
                ?ERROR_MSG("Not In AllowPlat:~p~n", [{Platform, AllowPlatform}]),
                throw({error, ?AUTH_FAIL});
            true -> ok
        end,
        case lists:member(ServerId, AllowServerId) of
            false -> 
                ?ERROR_MSG("Not In AllowServer:~p~n", [{ServerId, AllowServerId}]),
                throw({error, ?AUTH_FAIL});
            true -> ok
        end,
%%         case lists:member(Version, AllowClientVersion) of
%%             false -> throw({error, ?AUTH_FAIL});
%%             true -> ok
%%         end,
        Ret = account_mod:check_login(AccountId, Ticket),
        case Ret of
            {ok, _} -> account_db:update_login_time(AccountId);
            _ -> false
        end,
        Ret
    end,
    performer(F).

%%%===================================================================
%%% Internal functions
%%%===================================================================



after_login(AccountId, Sock, ReceiverPid) ->
    Old = ets:lookup(?ETS_ACCOUNT, AccountId),
    ets:insert(?ETS_ACCOUNT, #account_conn{account_id = AccountId, sock=Sock, receiverid = ReceiverPid}),
    handle_repeat_login(Old).

leave(Sock) ->
    ets:match_delete(?ETS_ACCOUNT, #account_conn{sock = Sock}).


handle_repeat_login([#account_conn{role_pid=Pid, receiverid = Receiver, sock=Sock}]) ->
    ?DEBUG_MSG("handle_repeat_login ~p ~n", [{Pid, Receiver, Sock}]),
    case is_pid(Receiver) andalso erlang:is_process_alive(Receiver) of
        true ->
%%             inet:setopts(Sock, [{send_timeout, 5000}]),
%%             goddess_net:send(Sock, #m__system__notify__s2c{code=1000}),

            erlang:exit(Receiver, repeat_login),
            try erlang:monitor(process, Pid) of
                Ref ->
                    receive
                        {'DOWN', Ref, _, _, _} ->
                            erlang:demonitor(Ref)
                    end
            catch
                Class:Reason ->
                    ?DEBUG_MSG("check_role_repeat_login: ~p ~n", [Class, Reason])
            end;
        _ -> ok
    end;
handle_repeat_login(_) -> ok.




open_function(_FuncId) ->
    ok.

performer(F) ->
    try
        F()
    catch
        throw:Reason ->
            handle_throw(Reason)
    end.

handle_throw({error, Code}) ->
    {error, Code};

handle_throw(Reason) ->
    throw(Reason).

