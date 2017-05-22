%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(robot).
% -behaviour(gen_server).

% -include("robot.hrl").
% -include("goddess.hrl").
% -include("game_pb.hrl").
% %% API
% -export([start_link/3, start_link/4]).
% -export([
%         send2server/2,
%         get_robot/1,
%         put_robot/2
%     ]).
% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).

% -record(state, {sock, sock_cache, step}).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %% @doc 启动机器人角色进程API
% start_link(AccountId, Ip, Port) ->
%     start_link(AccountId, Ip, Port, 20001).

% start_link(AccountId, Ip, Port, SceneId) ->
%     ProcName = list_to_atom(util:to_list(AccountId)),
%     gen_server:start_link({local, ProcName}, ?MODULE, [AccountId, Ip, Port, ?TCP_OPTS, ?TCP_TIMEOUT, SceneId], []).

% %%%===================================================================
% %%% gen_server callbacks
% %%%===================================================================
% %% @doc 初始化进程
% init([AccountId, Ip, Port, Options, Timeout, SceneId]) ->
%     put(account_id, AccountId),
%     process_flag(trap_exit, true),
%     %% @todo 连接服务器
%     case gen_tcp:connect(Ip, Port, Options, Timeout) of
%         {ok, Sock} ->
%             inet:setopts(Sock, [{active, true}]),
%             Pid = self(),
%             ets:insert(?ETS_ONLINE_ROBOT, #robot{account_id = AccountId, pid = Pid}),
%             put_robot(account_id, AccountId),
%             put_robot(pid, Pid),
%             put_robot(sock, Sock),
%             put_robot(enable, true),
%             put_robot(sceneid, SceneId),
%             put_robot(step, 1),
%             self() ! {account_robot, get_role_list, []},
%             erlang:send_after(?HEART_BEAT, self(), {'heartbeat', ?HEART_BEAT}),
% %%             erlang:send_after(5000, self(), {move, right}),
%             {ok, #state{sock=Sock, sock_cache=netsake:net_packet_init(), step=1}};
%         {error, Reason} ->
%             ?PRINT("Robot connection error: ~p~n", [Reason]),
%             {stop, Reason}
%     end.


% %% @private
% %% @doc Handling call messages
% handle_call(Request, From, State) ->
%     ?PRINT("Unhandled Call Warning, Request: ~p, From: ~p, Stacktrace: ~p~n", 
%         [Request, From, erlang:get_stacktrace()]),
%     {reply, ok, State}.


% %% @private
% %% @doc Handling cast messages
% handle_cast({playsend, Msg}, State) ->
%     netsake:send(State#state.sock, Msg, State#state.step),
%     {noreply, State#state{step=step_policy(State#state.step)}};
% handle_cast(Msg, State) ->
%     ?PRINT("Unhandled Cast Warning, Msg: ~p, Stacktrace: ~p~n", [Msg, erlang:get_stacktrace()]),
%     {noreply, State}.

% %% @private
% %% @doc Handling all non call/cast messages
% handle_info(stop, State) ->
%     {stop, logout, State};

% handle_info({move, right}, State) ->
%     Data = #m__scene__move__c2s{dest_x=160, dest_y=9},
%     robot:send2server(robot:get_robot(pid), Data),
%     random:seed(erlang:now()),
%     erlang:send_after(random:uniform(5)*1000 + 5000, self(), {move, left}),
%     {noreply, State};

% handle_info({move, left}, State) ->
%     Data = #m__scene__move__c2s{dest_x=9, dest_y=9},
%     robot:send2server(robot:get_robot(pid), Data),
%     random:seed(erlang:now()),
%     erlang:send_after(random:uniform(5)*1000 + 5000, self(), {move, right}),
%     {noreply, State};

% handle_info({tcp_closed, _Socket}, State) ->
%     ?PRINT("tcp_closed !~n"),
%     {stop,normal, State};

% handle_info({tcp, Sock, <<Bin/binary>>}, #state{sock=Sock, sock_cache=Cache}=State) ->
%     {Cache2} = proc_tcp(Bin, Cache),
%     {noreply, State#state{sock_cache=Cache2}};

% %% handle_info({tcp,_Socket,<<Len:32,Binary/binary>>},State)->
% %%     {Mod, Fun, DataRecord} = goddess_net:unpack(Binary),
% %%     {match, [M, _R]} = re:run(atom_to_list(Mod), "([^ ]+)(_api)", [{capture, [1, 2], list}]),
% %% %       ?PRINT("recv from server :~nMod :~p~nFun :~p~nDataRecord: ~p~n", [Mod, Fun, DataRecord]),
% %%     RobotMod = list_to_atom(M ++ "_robot"),
% %%     erlang:apply(RobotMod, Fun, [DataRecord]),
% %%     {noreply, State};

% handle_info({'heartbeat', Timeout}, State) ->
%     netsake:send(State#state.sock, #m__system__heartbeat__c2s{}, State#state.step),
%     erlang:send_after(Timeout, get_robot(pid), {'heartbeat', Timeout}),
%     {noreply, State#state{step=step_policy(State#state.step)}};

% handle_info({M, F, A}, State) ->
%     try
%     erlang:apply(M, F, A)
%         catch
%         R:C ->
%             ?PRINT("~p ~n", [{R, C}])
%             end,

%     {noreply, State};

% handle_info({send2server, Msg}, State) ->
%     netsake:send(State#state.sock, Msg, State#state.step),
%     {noreply, State#state{step=step_policy(State#state.step)}};


% handle_info(Info, State) ->
%     ?PRINT("Unhandled Info Warning, Info: ~p, Stacktrace: ~p~n", [Info, erlang:get_stacktrace()]),
%     {noreply, State}.

% %% @private
% %% @doc
% %% This function is called by a gen_server when it is about to
% %% terminate. It should be the opposite of Module:init/1 and do any
% %% necessary cleaning up. When it returns, the gen_server terminates
% %% with Reason. The return value is ignored.
% terminate(Reason, State) ->
%     ?PRINT("robot terminate, reason: ~p, state: ~p~n", [Reason, State]),
%     gen_tcp:close(get_robot(sock)),
%     ok.

% %% @private
% %% @doc Convert process state when code is changed
% code_change(_OldVsn, State, _Extra) ->
%     {ok, State}.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% send2server(Pid,Data)->
% %%     <<_PacketLen:32, DataBin/binary>> = goddess_net:pack(Data),
% %%     Step = robot:get_robot(step),
% %%     HashKey = util:to_list(?PROTOCOL_KEY) ++ util:to_list(Step),
% %%     CryptoBin = xxtea:encrypt(DataBin, HashKey),
% %%     PacketLen = erlang:byte_size(CryptoBin),
% %%     Binary = <<PacketLen:32, CryptoBin/binary>>,
% %%     if  Step >= ?MAX_STEP -> robot:put_robot(step, 1);
% %%         true -> robot:put_robot(step, Step +1)
% %%     end,
%     Pid ! {send2server, Data}.

% %% @doc 进程字典改名， Key -> robot_1000_Key
% put_robot(Key, Value) ->
%     DicName = list_to_atom(util:to_list('robot') ++ "_" ++ 
%         util:to_list(get(account_id)) ++ "_" ++ util:to_list(Key)),
%     put(DicName, Value).
% get_robot(Key) ->
%     DicName = list_to_atom(util:to_list('robot') ++ "_" ++
%         util:to_list(get(account_id)) ++ "_" ++ util:to_list(Key)),
%     get(DicName).



% step_policy(Num) when Num >= ?MAX_STEP -> 1;
% step_policy(Num) -> Num +1.


% proc_tcp(Bin, Cache) ->
%     {Cache2, DataBin} = netsake:net_packet(Bin, Cache),
%     case DataBin of
%         fail ->
%             {Cache2};
%         _ ->
%                 case netsake:unpack(DataBin) of
%                     {Mod, F, A} ->
%                         {match, [M, _R]} = re:run(atom_to_list(Mod), "([^ ]+)(_api)", [{capture, [1, 2], list}]),
%                         RobotMod = list_to_atom(M ++ "_robot"),
%                         case A of
%                             #m__system__heartbeat__s2c{} -> ok;
%                             _ ->
%                                 error_logger:info_msg("mfa: ~p", [A])
%                         end,
%                         catch erlang:apply(RobotMod, F, [A]),
%                         proc_tcp([], Cache2);
%                     Other ->
%                         exit(Other)

%                 end
%     end.


