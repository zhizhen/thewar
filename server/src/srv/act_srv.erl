%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-19 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(act_srv).

% -behaviour(gen_server).

% -include("table_etc.hrl").
% -include("common.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").


% %% API
% -export([start_link/0]).

% %% gen_server callbacks
% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%          terminate/2, code_change/3]).

% % -export([op_data/2, get_count/0, get_act_open_state/1]).
% -export([get_act_open_state/1, get_act_expire_state/1, get_all_available/0, get_act_time_zone/1]).
% -export([add_activity/6, delete_activity/1]).

% -define(SERVER, ?MODULE).
% -define(INTERVAL, 60000).

% % -record(state, {act_list=[], act_data=[], tref}).
% -record(state, {activitys=[], tref}).

% %%%===================================================================
% %%% API
% %%%===================================================================
% % op_data(ActId, F) ->
% %     gen_server:call(?SERVER, {op_data, ActId, F}).

% % get_count() ->
% %     gen_server:call(?SERVER, getCount).

% % todo 添加新活动
% add_activity(ActId, Start, End, Begin, Expired, Remark) ->
%     gen_server:cast(?SERVER, {add_activity, ActId, Start, End, Begin, Expired, Remark}).
    
% % todo 删除活动
% delete_activity(ActId) ->
%     gen_server:cast(?SERVER, {delete_activity, ActId}).

% get_act_open_state(ActId) ->
%     gen_server:call(?SERVER, {get_act_open_state, ActId}).

% get_act_expire_state(ActId) ->
%     gen_server:call(?SERVER, {get_act_expire_state, ActId}).

% get_all_available() ->
%     gen_server:call(?SERVER, {get_all_available}).

% get_act_time_zone(ActId) ->
%     gen_server:call(?SERVER, {get_act_time_zone, ActId}).

% %%--------------------------------------------------------------------
% %% @doc
% %% Starts the server
% %%
% %% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
% %% @end
% %%--------------------------------------------------------------------
% start_link() ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

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
% init([]) ->
%     {ok, TRef} = timer:send_interval(?INTERVAL, tick),
%     {ok, #state{activitys=act_db:fetch_server_activitys(), tref=TRef}}.

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
% handle_call(Request, From, State) ->
%     try
%         do_call(Request, From, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Request, State, Reason, erlang:get_stacktrace()]),
%             {reply, ok, State}
%     end.
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
% handle_cast(Msg, State) ->
%     try
%         do_cast(Msg, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Msg, State, Reason, erlang:get_stacktrace()]),
%             {noreply, State}
%     end.
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
% handle_info(Info, State) ->
%     try
%         do_info(Info, State)
%     catch
%         _:Reason ->
%             ?ERROR_MSG("handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
%                 [Info, State, Reason, erlang:get_stacktrace()]),
%             {noreply, State}
%     end.
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
% do_call(stop, _From, State=#state{tref=TRef}) ->
%     {ok, cancel} = timer:cancel(TRef),
%     {stop, normal, stopped, State};

% do_call({get_act_open_state, ActId}, _From, State=#state{activitys=Activitys}) ->
%     ActState = 
%         case lists:keyfind(ActId, #global_activity.act_id, Activitys) of
%             false -> false;
%             #global_activity{open_state=AState} -> AState
%         end,
%     {reply, {ok, ActState}, State};

% do_call({get_act_expire_state, ActId}, _From, State=#state{activitys=Activitys}) ->
%     ActState = 
%         case lists:keyfind(ActId, #global_activity.act_id, Activitys) of
%             false -> false;
%             #global_activity{expire_state=AState} -> AState
%         end,
%     {reply, {ok, ActState}, State};

% do_call({get_act_time_zone, ActId}, _From, State=#state{activitys=Activitys}) ->
%     TimeZone = 
%         case lists:keyfind(ActId, #global_activity.act_id, Activitys) of
%             false -> 
%                 #p_act_timezone{
%                     show_from=0,
%                     show_to=0, 
%                     expire_from=0, 
%                     expire_to=0
%                 };
%             #global_activity{}=Act ->
%                 #p_act_timezone{
%                     show_from=Act#global_activity.start_time,
%                     show_to=Act#global_activity.end_time, 
%                     expire_from=Act#global_activity.begin_time, 
%                     expire_to=Act#global_activity.expired_time
%                 }
%         end,
%     {reply, {ok, TimeZone}, State};

% do_call({get_all_available}, _From, State=#state{activitys=Activitys}) ->
%     F = fun(Act, L) -> 
%             ActState = check_open_state(Act),
%             case ActState =:= ?ACTIVITY_OPEN of
%                 true -> L ++ [Act#global_activity.act_id];
%                 false -> L
%             end
%         end,
%     L1 = lists:foldl(F, [], Activitys),
%     {reply, {ok, L1}, State};

% do_call(_Request, _From, State) ->
%     Reply = ok,
%     {reply, Reply, State}.


% do_cast({add_activity, ActId, Start, End, Begin, Expired, Remark}, #state{activitys=Acts}=State) ->
%     Act = #global_activity{act_id=ActId,start_time=Start,end_time=End,begin_time=Begin,expired_time=Expired,remark=Remark},
%     OpenState = check_open_state(Act),
%     ExpireState = check_expires_state(Act),
%     NewAct = Act#global_activity{open_state=OpenState, expire_state=ExpireState},
%     % 存库
%     act_db:update_single_act(NewAct),
%     % 活动开启了，让玩家生成自己独有的活动数据
%     if OpenState =:= ?ACTIVITY_OPEN ->
%         update_all_roles([ActId], []);
%         true -> ok
%     end,
%     NewActs = 
%         case lists:keyfind(ActId, #global_activity.act_id, Acts) of
%             false -> Acts++[NewAct];
%             _ -> lists:keyreplace(ActId, #global_activity.act_id, Acts, Act)
%         end,
%     {noreply, State#state{activitys=NewActs}};

% do_cast({delete_activity, ActId}, #state{activitys=Acts}=State) ->
%     NewList = 
%         case lists:keyfind(ActId, #global_activity.act_id, Acts) of
%             false -> Acts;
%             #global_activity{} = Act ->
%                 NewAct = Act#global_activity{end_time=0, open_state=?ACTIVITY_CLOSED},
%                 act_db:update_single_act(NewAct),
%                 lists:keydelete(ActId, #global_activity.act_id, Acts)
%         end,
%     {noreply, State#state{activitys=NewList}};

% do_cast(_Msg, State) ->
%     {noreply, State}.

% % do_info(tick, #state{act_list=ActList, act_data=ActData} = State) ->
% %     Ids = [ Id || {Id, _} <- ActList],
% %     All = gen_act:all_available(),
% %     Open = All -- Ids,
% %     Close = Ids -- All,

% %     ActList2 = lists:filter(fun({Id, _}) -> not lists:member(Id, Close) end, ActList),
% %     ActList3 = [
% %         begin
% %             % 活动模块tick一下
% %             case gen_act:go_tick(Id, TickState) of
% %                 {false, NewTickState} -> ok;
% %                 {true,  NewTickState} -> tick_all_roles(Id, NewTickState) % 触发玩家进程的活动tick,目前玩家是不需要走tick的
% %             end,
% %             {Id, NewTickState}
% %         end || {Id, TickState} <- ActList2],
    
% %     ActData1 = handle_special_acts(ActData),
% %     [act_db:save(D) || D <- ActData1],
% %     ActData2 = lists:filter(fun(#activity{act_id=Id}) -> not lists:member(Id, Close) end, ActData1),
% %     ActData3 = ActData2 ++ [act_db:get2(Id) || Id <- Open],
% %     update_all_roles(Open, Close),
% %     {noreply, State#state{act_list=ActList3 ++ with_state(Open), act_data=ActData3}};
% do_info(tick, #state{activitys = Activitys} = State) ->
%     F = fun(#global_activity{act_id=Id,open_state=OldOpenState,expire_state=OldExpireState}=Act, L) ->
%             % {global_activity, 1002, start_time, end_time, begin_time, expired_time, remark}
%             OpenState = check_open_state(Act),
%             ExpireState = check_expires_state(Act),

%             case ExpireState =:= ?ACTIVITY_AWARDED andalso 
%                     OldExpireState =/= ?ACTIVITY_AWARDED andalso 
%                         (act_cfg:get(Id))#act_cfg.type =:= ?ACT_RELEASE6 of
%                 true -> act_mod:do_release6_act_tick();    % 开服七天按排位送称号的活动需要做发称号的逻辑
%                 false -> ok
%             end,
            
%             % 更新内存里的活动状态
%             case OpenState =/= OldOpenState orelse ExpireState =/= OldExpireState of
%                 true -> 
%                     NewAct = Act#global_activity{open_state=OpenState, expire_state=ExpireState},
%                     act_db:update_single_act(NewAct),
%                     if OpenState =:= ?ACTIVITY_CLOSED ->
%                         lists:keydelete(Id, #global_activity.act_id, L);
%                         true -> lists:keyreplace(Id, #global_activity.act_id, L, NewAct)
%                     end;
%                 false -> L
%             end
%         end,
%     New = lists:foldl(F, Activitys, Activitys),
%     {noreply, State#state{activitys = New}};

% do_info(_Info, State) ->
%     {noreply, State}.

% % with_state(ActIds) ->
% %     [{ActId, gen_act:go_tick_state(ActId)} || ActId <- ActIds].

% %% keep_tick() ->
% %%     erlang:send_after(?INTERVAL, self(), tick).

% % 这里要在tick里处理2个特殊活动，
% % 1.开服第N天:按照猛将擂台的排名给玩家分配不同的奖品券即根据玩家排名领取不同等级的奖励
% % 1.第N天返还玩家有效时期内充值的部分元宝
% % handle_special_acts(ActData) -> 
% %     ActData1 = act_mod:do_release6_act_tick(ActData),
% %     act_mod:do_recharge_back_act_tick(ActData1).

% % tick_all_roles(ActId, TickState) ->
% %     F = fun(#role_conn{role_pid=Pid}, _) ->
% %             role_srv:send2role(Pid, {gen_act, do_tick, [ActId, TickState]})
% %         end,
% %     ets:foldl(F, [], ?ETS_ROLE_CONN).

% update_all_roles([], []) -> ok;
% update_all_roles(Open, Close) ->
%     F = fun(#role_conn{role_pid=Pid}, _) ->
%         role_srv:send2role(Pid, {gen_act, do_update, [Open, Close]})
%     end,
%     ets:foldl(F, [], ?ETS_ROLE_CONN).

% % send_to_roles(ActId, Msg) ->
% %     F = fun(#role_conn{role_pid=Pid}, _) ->
% %         role_srv:send2role(Pid, {act_release_api, handle_msg, [msg, ActId, Msg]})
% %     end,
% %     ets:foldl(F, [], ?ETS_ROLE_CONN).
% check_open_state(Act) ->
%     Cfg = act_cfg:get(Act#global_activity.act_id),
%     case Cfg of
%         false -> ?ACTIVITY_NOT_OPEN;
%         #act_cfg{enable = Enable} when Enable =:= ?ACTIVITY_NOT_OPEN -> ?ACTIVITY_NOT_OPEN;
%         #act_cfg{} ->  
%             case Act#global_activity.start_time > ?NOW of
%                 true -> ?ACTIVITY_NOT_OPEN;
%                 false -> 
%                     case Act#global_activity.end_time >= ?NOW of
%                         true -> ?ACTIVITY_OPEN;
%                         false -> ?ACTIVITY_CLOSED
%                     end
%             end
%     end.

% check_expires_state(Act) ->
%     Cfg = act_cfg:get(Act#global_activity.act_id),
%     case Cfg of
%         false -> ?ACTIVITY_EXPIRED;
%         #act_cfg{enable = Enable} when Enable =:= ?ACTIVITY_EXPIRED -> ?ACTIVITY_EXPIRED;
%         #act_cfg{} ->
%             case Act#global_activity.begin_time > ?NOW of
%                 true -> ?ACTIVITY_EXPIRED;
%                 false -> 
%                     case Act#global_activity.expired_time >= ?NOW of
%                         true -> ?ACTIVITY_LIVING;
%                         false -> ?ACTIVITY_AWARDED
%                     end
%             end
%     end.

