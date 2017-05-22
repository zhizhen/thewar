%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-11-14 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(group_pool_srv).

% -behaviour(gen_server).

% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("cfg_record.hrl").
% -include("logger.hrl").

% %% API
% -export([start_link/1]).

% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).

% -export([join/2, play/2, leave/2]).

% -record(guy, {role_id, pid=0, x=0, y=0, state=?NO}).
% -record(state, {id, guys=[], ccount=0, count=0, tick1=0, tick2=0, shouldtick=0, cfg, send_count=0, state}).

% %%%===================================================================
% %%% API
% %%%===================================================================

% join(Id, RoleId) ->
%     Srv = group_pool_api:scene_name(Id, ?GROUP_POOL_SCENE),
%     gen_server:call(Srv, {join, RoleId, self()}).

% play(Id, RoleId) ->
%     Srv = group_pool_api:scene_name(Id, ?GROUP_POOL_SCENE),
%     gen_server:call(Srv, {play, RoleId}).

% leave(Id, RoleId) ->
%     Srv = group_pool_api:scene_name(Id, ?GROUP_POOL_SCENE),
%     gen_server:cast(Srv, {leave, RoleId}).



% %%--------------------------------------------------------------------
% %% @doc
% %% Starts the server
% %%
% %% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
% %% @end
% %%--------------------------------------------------------------------
% %% start_link(Id) ->
% %%     Srv = group_mod:pool_name(Id),
% %%     gen_server:start_link({local, Srv}, ?MODULE, [Id], []).

% start_link(Id) ->
%     Srv = group_pool_api:scene_name(Id, ?GROUP_POOL_SCENE),
%     gen_server:start_link({local, Srv}, ?MODULE, [Id, Srv], []).

% %%%===================================================================
% %%% gen_server callbacks
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Initializes the server
% %%
% %% @spec init(Args) -> {ok, State} |
% %%                     {ok, State, Timeout} |
% %%                     ignore |
% %%                     {stop, Reason}
% %% @end
% %%--------------------------------------------------------------------
% init([Id, Srv]) ->
%     Cfg = cfg(Id),
%     C = Cfg#group_pool_cfg.interval / 5,

%     T1 = Cfg#group_pool_cfg.starttime,
%     [H, M] = string:tokens(T1, ":"),
%     {D, _} = erlang:localtime(),
%     StartT = util:datetime_to_timestamp({D, {util:to_integer(H), util:to_integer(M), 0}}),
%     Now = ?NOW,

%     TT1 =
%     case Now - StartT of
%         V when V < Cfg#group_pool_cfg.interval ->
%             StartT + Cfg#group_pool_cfg.interval - Now;
%         V ->
%             case  (V div Cfg#group_pool_cfg.interval) > Cfg#group_pool_cfg.interval_count of
%                 true -> false;
%                 false ->
%                     StartT + Cfg#group_pool_cfg.interval * ((V div Cfg#group_pool_cfg.interval) + 1) - Now
%             end
%     end,


% %%     ?DEBUG_MSG("send_after ~p ~n", [TT1]),
%     case TT1 of
%         false -> ok;
%         _ ->
%             erlang:send_after(TT1 * 1000, self(), {gift_time})
%     end,

%     {ok, State} = scene_srv:init([notrap, Srv, ?GROUP_POOL_SCENE]),

%     {ok, #state{id=Id, shouldtick=C, tick2=(Now - StartT) div Cfg#group_pool_cfg.interval, cfg=Cfg, state=State}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling call messages
% %%
% %% @spec handle_call(Request, From, State) ->
% %%                                   {reply, Reply, State} |
% %%                                   {reply, Reply, State, Timeout} |
% %%                                   {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, Reply, State} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_call({join, RoleId, Pid}, _From, #state{guys=Guys, count=C}=State) ->
%     case lists:keyfind(RoleId, #guy.role_id, Guys) of
%         #guy{state=?YES}->
%             NewGuys = Guys,
%             Reply = false;
%         #guy{} ->
%             NewGuys = lists:keyreplace(RoleId, #guy.role_id, Guys, #guy{role_id=RoleId, pid=Pid, state=?YES}),
%             Reply = true;
%         _ ->
%             NewGuys = [#guy{role_id=RoleId, pid=Pid, state=?YES}|Guys],
%             Reply = true
%     end,

%     if
%         Reply ->
%             Pid ! {send, #m__group_pool__state__s2c{num=C}},
%             role_srv:send2role(Pid, {game_info, hook, [self()]});
%         true -> ok
%     end,
%     {reply, true, State#state{guys=NewGuys}};

% handle_call({play, RoleId}, _From, #state{ccount=CC, count=C, guys=Guys}=State) ->
%     case check(RoleId, Guys) of
%         false ->
%             {reply,false, State};
%         true ->
%             {reply, true, State#state{ccount=CC+1, count=C+1}}
%     end;

% handle_call(Request, From, #state{state=S}=State) ->
%     {_, Reply, S2} = scene_srv:handle_call(Request, From, S),
%     {reply, Reply, State#state{state=S2}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling cast messages
% %%
% %% @spec handle_cast(Msg, State) -> {noreply, State} |
% %%                                  {noreply, State, Timeout} |
% %%                                  {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_cast({leave, RoleId}, #state{guys=Guys}=State) ->
%     NewGuys = lists:keyreplace(RoleId, #guy.role_id, Guys, #guy{role_id=RoleId}),
%     {noreply, State#state{guys=NewGuys}};
% handle_cast(Msg, State) ->
%     {_, S} = scene_srv:handle_cast(Msg, State#state.state),
%     {noreply, State#state{state=S}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Handling all non call/cast messages
% %%
% %% @spec handle_info(Info, State) -> {noreply, State} |
% %%                                   {noreply, State, Timeout} |
% %%                                   {stop, Reason, State}
% %% @end
% %%--------------------------------------------------------------------
% handle_info({offline, RoleId2}, State) ->
%     RoleId = util:to_binary(RoleId2),
%     gen_server:cast(self(), {leave, RoleId}),
%     {noreply, State};
% handle_info(tick, #state{ccount=CC, count=C, guys=Guys, tick1=_T1, tick2=_T2, shouldtick=_ST, cfg=_Cfg}=State) ->
%     if
%         CC /= 0 ->
%             broadcast(Guys, #m__group_pool__state__s2c{num=C}),
%             CC1 = 0;
%         true ->
%             CC1 = CC
%     end,

% %%     case T2 >= Cfg#group_pool_cfg.interval_count of
% %%         true ->
% %%             T11 = T1, T21 = T2;
% %%         false ->
% %%             case T1 >= ST of
% %%                 true ->
% %%                     T11 = 0,
% %%                     T21 = T2 + 1,
% %%                     self() !  {gift_time};
% %%                 false ->
% %%                     T11 = T1 + 1,
% %%                     T21 = T2
% %%             end
% %%     end,
% %%     {noreply, State#state{tick1=T11, tick2=T21, ccount=CC1}};
%        {noreply, State#state{ccount=CC1}};
% handle_info({gift_time}, #state{guys=Guys, count=Count, tick2=Tick2, cfg=Cfg}=State) ->
% %%     ?DEBUG_MSG("==================pool ~p ~n", [{Tick2, erlang:localtime()}]),
%     State2 =
%     case Tick2 < Cfg#group_pool_cfg.interval_count of
%         true ->
%             erlang:send_after(Cfg#group_pool_cfg.interval * 1000, self(), {gift_time}),

%             Level =
%             case Count div Cfg#group_pool_cfg.levelup of
%                 N when N > Cfg#group_pool_cfg.max -> Cfg#group_pool_cfg.max;
%                 N -> N
%             end,

%             Power =
%             case Level of
%                 0 -> Cfg#group_pool_cfg.gain1;
%                 1 -> Cfg#group_pool_cfg.gain2;
%                 2 -> Cfg#group_pool_cfg.gain3;
%                 3 -> Cfg#group_pool_cfg.gain4;
%                 4 -> Cfg#group_pool_cfg.gain5;
%                 _ -> 0
%             end,
%             case Power of
%                 0 -> ok;
%                 _ ->
%                     [ role_srv:send2role(Pid, {group_pool_api, gift, [power, Power]}) || #guy{pid=Pid} <- Guys]
%             end,
%             State#state{tick2=Tick2+1};
%         false -> State
%     end,
%     {noreply, State2};
% handle_info(gameover, #state{guys=_Guys}=State) ->
%     {stop, normal, State};
% handle_info(Info, State) ->
%     {_, S} = scene_srv:handle_info(Info, State#state.state),
%     {noreply, State#state{state=S}}.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% This function is called by a gen_server when it is about to
% %% terminate. It should be the opposite of Module:init/1 and do any
% %% necessary cleaning up. When it returns, the gen_server terminates
% %% with Reason. The return value is ignored.
% %%
% %% @spec terminate(Reason, State) -> void()
% %% @end
% %%--------------------------------------------------------------------
% terminate(_Reason, _State) ->
%     ok.

% %%--------------------------------------------------------------------
% %% @private
% %% @doc
% %% Convert process state when code is changed
% %%
% %% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
% %% @end
% %%--------------------------------------------------------------------
% code_change(_OldVsn, State, _Extra) ->
%     {ok, State}.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% broadcast(L, M) ->
%     [Pid ! {send, M} || #guy{pid=Pid} <- L, Pid /= 0].

% check(RoleId, Guys) ->
%     case lists:keyfind(RoleId, #guy.role_id, Guys) of
%         false -> false;
%         #guy{state=State} ->
%             State == ?YES
%     end.

% cfg(Id) ->
%     #groups_ets{level=Level} = group_master_srv:get_info(Id),
%     group_pool_cfg:get(Level).
