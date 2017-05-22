%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-1 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(scene_srv).

-behaviour(gen_server).

-include("logger.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").
-include("cfg_record.hrl").
-include("game_pb.hrl").


%% API
-export([start_link/1, start/2, start_link/2]).
-export([entry/4, move/4, sync/4, leave/3, stop/3]).
-export([join_line/5]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-export([init/2]).

-define(SERVER, ?MODULE). 

-record(state, {scene_id, open_lines=[1], ets}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------

%% 只传入scene id的接口, 是默认的场景地图

%% 1 其他使用地图的系统, 需要传入自定的注册id
%% 2 如果其他进程想在自己的进程使用地图功能, 直接执行init来进行初始化, 然后可以使用mod里的函数
%%   注意scene_mod里定义的record, 以及使用的进城字典(key 关联record)

%% @doc 启动地图
start_link(SceneId) ->
    SceneName = scene_mod:scene_name(SceneId),
    gen_server:start_link({local, SceneName}, ?MODULE, [SceneName, SceneId], []).

%% @doc 启动特殊地图, 自己传递注册名, 以及一个唯一id
start(Name, SceneId) ->
    gen_server:start({local, Name}, ?MODULE, [notrap, Name, SceneId], []).

start_link(Name, SceneId) ->
    gen_server:start_link({local, Name}, ?MODULE, [notrap, Name, SceneId], []).


%% 以下接口需调用者传入地图srv的注册名字, 以方便不同系统使用地图模块

%% @doc 切线
join_line(_, false, _, _, _) -> false;
join_line(Role, SceneName, SceneId, OldLine, LineId) ->
    Cfg = line_cfg:get(SceneId),
    case Cfg /= false andalso Cfg#line_cfg.can_switch of
        1 ->
            Pos = {Role#role.pos_x, Role#role.pos_y},
            gen_server:call(SceneName, {join_line, Role#role.role_id, Pos, OldLine, LineId});
        _ -> false
    end.

%% @doc 进入地图
entry(_, _, false, _) -> {false, []};
entry(RoleId, Pos, SceneName, SceneId) ->
    #scene_info_cfg{born_x=X, born_y=Y} = scene_info_cfg:get(SceneId),
    #line_cfg{strategy=Strategy} = line_cfg:get(SceneId),
    Pos1 = case Pos of
        {0, 0} -> {X, Y};
        _ -> Pos
    end,
    F = if Strategy == 0 -> pick_good_line; true -> pick_line end,

    case catch gen_server:call(SceneName, {entry, F, RoleId, Pos1}) of
        {'EXIT', Reason} ->
            ?DEBUG_MSG("~nentry error: ~p ~nreason:~p~n", [{SceneName, SceneId}, Reason]),
            {false, []};
        {LineId, OpenLines} ->
            {LineId, [LineId | lists:filter(fun(Id) -> Id /= LineId end, OpenLines)]}
    end.

%% @doc 移动
move(_, false, _, _) -> false;
move(RoleId, SceneName, TargetPos, LineId) ->
    gen_server:cast(SceneName, {move, {RoleId, TargetPos, LineId}}).

%% @doc 同步位置
sync(_, false, _, _) -> false;
sync(RoleId, SceneName, CurrPos, LineId) ->
    gen_server:cast(SceneName, {sync, RoleId, CurrPos, LineId}).

%% @doc 离开地图
leave(_, false, _) -> false;
leave(RoleId, SceneName, LineId) ->
    % SceneName 为非同屏副本的时候, srv会不存在
    case catch gen_server:cast(SceneName, {leave, RoleId, LineId}) of
        {'EXIT', R} ->
            ?DEBUG_MSG("****************error!!! module: ~p line: ~p error: ~p ~n", [?MODULE, ?LINE, R]),
            false;
        _ -> false
    end.

%% @doc 停下来
stop(_, false, _) -> false;
stop(RoleId, SceneName, LineId) ->
    gen_server:call(SceneName, {stop, RoleId, LineId}).


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([Ets, SceneId]) ->
    process_flag(trap_exit, true),
    init(Ets, SceneId);

init([notrap, Ets, SceneId]) ->
    init(Ets, SceneId).

init(Ets, SceneId) ->
    cache:init(self()),
    Ets2 = util:to_list(Ets),
    scene_mod:init_scene(Ets2, SceneId),
    {ok, #state{scene_id=SceneId, ets=Ets2}}.


%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    try
        do_call(Request, From, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_call exception:~nRequest: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Request, State, Reason, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.

do_call({entry, F, RoleId, Pos}, _From, #state{scene_id=SceneId, open_lines=OpenLines, ets=Ets}=State) ->
    LineId = scene_mod:F(SceneId, Ets),
    case LineId of
        false ->
            {reply, {false, OpenLines}, State};
        LineId ->
            scene_mod:entry({RoleId, Pos}, SceneId, LineId, Ets),
            {reply, {LineId, OpenLines}, State}
    end;
do_call({join_line, RoleId, Pos, OldLineId, LineId}, _From, #state{scene_id=SceneId, ets=Ets}=State) ->
    case scene_mod:is_full(SceneId, LineId, Ets) of
        true ->
            {reply, false, State};
        false ->
            scene_mod:entry({RoleId, Pos}, SceneId, LineId, Ets),
            scene_mod:leave(RoleId, SceneId, OldLineId, Ets),
            {reply, true, State}
    end;
do_call({stop, RoleId, LineId}, _From, #state{scene_id=SceneId, ets=Ets}=State) ->
    scene_mod:stop(RoleId, SceneId, LineId, Ets),
    {reply, ok, State};

%% with check
do_call({{entry, F, RoleId, Pos}, F1, A}, _From, State) ->
    case F1(RoleId, A) of
        false ->
            {reply, {false, []}, State};
        true ->
            handle_call({entry, F, RoleId, Pos}, _From, State)
    end;
do_call({{join_line, RoleId, Pos, OldLineId, LineId}, F, A}, _From, State) ->
    case F(RoleId, A) of
        false ->
            {reply, false, State};
        true ->
            handle_call({join_line, RoleId, Pos, OldLineId, LineId}, _From, State)
    end;
do_call({{sync, RoleId, CurrPos, LineId}, F, A}, _From, State) ->
    case F(RoleId, A) of
        false ->
            {reply, false, State};
        true ->
            handle_call({sync, RoleId, CurrPos, LineId}, _From, State)
    end;
do_call({{stop, RoleId, LineId}, F, A}, _From, State) ->
    case F(RoleId, A) of
        false ->
            {reply, false, State};
        true ->
            do_call({stop, RoleId, LineId}, _From, State)
    end;
do_call(_Request, _From, State) ->
    {reply, false, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast(Msg, State) ->
    try
        do_cast(Msg, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_cast exception:~nMsg: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Msg, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

do_cast({leave, RoleId, LineId}, #state{scene_id=SceneId, ets=Ets}=State) ->
    scene_mod:leave(RoleId, SceneId, LineId, Ets),
    {noreply, State};
do_cast({move, {RoleId, TargetPos, LineId}}, #state{scene_id=SceneId, ets=Ets}=State) ->
    scene_mod:move({RoleId, TargetPos}, SceneId, LineId, Ets),
    {noreply, State};

do_cast({{leave, RoleId, LineId}, F, A}, #state{scene_id=SceneId, ets=Ets}=State) ->
    case F(RoleId, A) of
        true ->
            scene_mod:leave(RoleId, SceneId, LineId, Ets);
        _ -> ok
    end,
    {noreply, State};
do_cast({{move, {RoleId, TargetPos, LineId}}, F, A}, #state{scene_id=SceneId, ets=Ets}=State) ->
    case F(RoleId, A) of
        true ->
            scene_mod:move({RoleId, TargetPos}, SceneId, LineId, Ets);
        _ -> ok
    end,
    {noreply, State};
do_cast({sync, RoleId, CurrPos, LineId}, #state{scene_id=SceneId, ets=Ets}=State) ->
    scene_mod:sync(RoleId, CurrPos, SceneId, LineId, Ets),
    {noreply, State};
do_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(Info, State) ->
    try
        do_info(Info, State)
    catch
        _:Reason ->
            ?ERROR_MSG("handle_info exception:~nInfo: ~p~nState: ~p~nReason: ~p~nStacktrace: ~p~n",
                [Info, State, Reason, erlang:get_stacktrace()]),
            {noreply, State}
    end.

do_info({open_line, LineId}, #state{scene_id=SceneId, open_lines=OpenLines}=State) ->
    OpenLines2 = [LineId | [Id || Id <- OpenLines, Id /= LineId] ],
    send_line_info(SceneId, OpenLines2),
    {noreply, State#state{open_lines=OpenLines2}};
do_info({close_line, LineId}, #state{scene_id=SceneId, open_lines=OpenLines}=State) ->
    OpenLines2 = [Id || Id <- OpenLines, Id /= LineId],
    send_line_info(SceneId, OpenLines2),
    {noreply, State#state{open_lines=OpenLines2}};
do_info(_Info, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
send_line_info(SceneId, OpenLines) ->
    Msg = #m__scene__lineinfo__s2c{openlines=OpenLines},
    broadcast_api:scene(SceneId, Msg).
