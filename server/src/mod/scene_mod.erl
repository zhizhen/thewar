%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(scene_mod).

% -include("game_pb.hrl").
% -include("logger.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").


% %% API
% -export([init_scene/2]).

% -export([entry/4, leave/4, move/4, sync/5, stop/4]).
% -export([aoi_entry/4, aoi_leave/3, aoi_move/5, aoi_update_pos/6]).
% %% -export([is_legal/4, reachable/2]).
% -export([scene_name/1, tower_name/2, tower_where/2]).
% -export([close_line/2, pick_line/2, pick_good_line/2, is_full/3]).

% -define(CURR, 1).
% -define(TARGET, 2).

% -record(scene_cache_pos, {pos}).

% %%%===================================================================
% %%% API
% %%%===================================================================

% % entry -> move -> update_pos -> leave

% %% @doc 进入场景
% entry({RoleId, Pos1}, SceneId, LineId, Ets) ->
%     Pos =
%     case Pos1 of
%         {0, 0} ->
%             Cfg = scene_info_cfg:get(SceneId),
%             {Cfg#scene_info_cfg.born_x, Cfg#scene_info_cfg.born_y};
%         _ -> Pos1
%     end,

%     TowerName = tower_name(Ets, LineId),
%     Tower = tower_where(Pos, SceneId),
%     update_role_scene_info(RoleId,  0, Tower, TowerName),
%     case pos_get(RoleId, ?CURR) of
%         false ->
%             line_update_role(1, SceneId, LineId, Ets);
%         P -> 
%             ?ERROR_MSG("already has pos before entry:~p~n", [{RoleId, Pos1, SceneId, LineId, Ets, P}]),
%             ok
%     end,

%     pos_put(RoleId, ?CURR, Pos),
%     fetch_neighbours(RoleId, Tower, TowerName),
%     slave_work(RoleId, {?MODULE, aoi_entry, [RoleId, Pos, Tower, TowerName]}).


% %% @doc 离开
% leave(RoleId, SceneId, LineId, Ets) ->
%     case pos_get(RoleId, ?CURR) of
%         false ->
%             ?ERROR_MSG("has none pos before leave:~p~n", [{RoleId, SceneId, LineId, Ets}]),
%             ok;
%         Pos ->
%             pos_clean(RoleId),

%             TowerName = tower_name(Ets, LineId),

%             Tower = tower_where(Pos, SceneId),

%             update_role_scene_info(RoleId, Tower, 0, TowerName),
%             line_update_role(-1, SceneId, LineId, Ets),

%             slave_work(RoleId,
%                 {?MODULE, aoi_leave, [RoleId, Tower, TowerName]}),
%             slave_release(RoleId)
%     end.

% %% @doc 开始移动
% move({RoleId, TargetPos}, SceneId, LineId, Ets) ->
%     case pos_get(RoleId, ?CURR) of
%         false ->
%             ok;
%         Pos ->
%             pos_put(RoleId, ?TARGET, TargetPos),
%             TowerName = tower_name(Ets, LineId),
%             Tower = tower_where(Pos, SceneId),
%             slave_work(RoleId, {?MODULE, aoi_move, [RoleId, Pos, TargetPos, Tower, TowerName]})
%     end.

% %% @doc 同步位置
% sync(RoleId, CurrPos, SceneId, LineId, Ets) ->
%     case pos_get(RoleId, ?CURR) of
%         false -> ok;
%         OldPos ->
%             pos_put(RoleId, ?CURR, CurrPos),
%             TargetPos = pos_get(RoleId, ?TARGET),

%             OldTower = tower_where(OldPos, SceneId),
%             NewTower = tower_where(CurrPos, SceneId),
%             TowerName = tower_name(Ets, LineId),
%             update_role_scene_info(RoleId, OldTower, NewTower, TowerName),
%             slave_work(RoleId, {?MODULE, aoi_update_pos, [RoleId, CurrPos, TargetPos, OldTower, NewTower, TowerName]})
%     end.

% stop(RoleId, SceneId, LineId, Ets) ->
%     case pos_get(RoleId, ?CURR) of
%         false -> ok;
%         OldPos ->
%             TargetPos = pos_get(RoleId, ?TARGET),
%             case TargetPos of
%                 {0, 0} -> ok;
%                 _ -> pos_put(RoleId, ?CURR, TargetPos)
%             end,

%             OldTower = tower_where(OldPos, SceneId),
%             NewTower = tower_where(TargetPos, SceneId),
%             TowerName = tower_name(Ets, LineId),

%             % 在前后端位置有误差的时候, stop 会直接把玩家挪到最后一次记录的目的位置,可能会切换灯塔
%             update_role_scene_info(RoleId, OldTower, NewTower, TowerName),

%             slave_work(RoleId, {?MODULE, aoi_update_pos, [RoleId, TargetPos, TargetPos, OldTower, NewTower, TowerName]})
%     end.



% %%%===================================================================
% %%% aoi
% %%%===================================================================

% % aoi组装消息
% aoi_entry(RoleId, Pos, Tower, TowerName) ->
%     aoi_update_pos(RoleId, Pos, {0, 0}, Tower, Tower, TowerName).

% aoi_move(RoleId, Pos, TargetPos, Tower, TowerName) ->
%     Msg = #m__scene__move__s2c{role_summary=role_p_pos(RoleId, Pos, TargetPos)},
%     aoi(Tower, Tower, Msg, TowerName, RoleId).

% aoi_leave(RoleId, Tower, TowerName) ->
%     Msg = #m__scene__leave__s2c{role_id=RoleId},
%     aoi(Tower, Tower, Msg, TowerName, RoleId).

% aoi_update_pos(RoleId, Pos, TargetPos, OldTower, NewTower, TowerName) ->
%     Msg = #m__scene__update_pos__s2c{role_summary=role_p_pos(RoleId, Pos, TargetPos)},
%     aoi(OldTower, NewTower, Msg, TowerName, RoleId).

% %% aoi 广播
% aoi(OldTower, NewTower, Msg, TowerName, AvoidRoleId) ->
%     TowerList = tower_neighbour(OldTower, NewTower),
%     [begin
%         case ets:lookup(TowerName, Tower) of
%             [{_, Neighbours}] ->
%                 [ begin
%                     send_msg(Neighbour, Msg)
%                   end || Neighbour <- Neighbours, Neighbour /= AvoidRoleId ];
%             [] ->
%                 false
%         end
%     end || Tower <- TowerList].


% %%%===================================================================
% %%% neighbours
% %%%===================================================================

% fetch_neighbours(RoleId, RoleTower, TowerName) ->
%     TowerList = tower_neighbour(RoleTower),
%     fetch_neighbours2(RoleId, TowerList, TowerName).

% fetch_neighbours(RoleId, OldTower, NewTower, TowerName) ->
%     TowerList = tower_new_neighbour(OldTower, NewTower),
%     fetch_neighbours2(RoleId, TowerList, TowerName).

% fetch_neighbours2(RoleId, TowerList, TowerName) ->
%     NeighboursInfo = lists:concat(
%         [begin
%             case ets:lookup(TowerName, Tower) of
%                 [{_, Neighbours}] ->
%                     lists:filter(fun(Id) -> Id /= RoleId end, Neighbours);
%                 _ ->
%                     []
%             end
%         end || Tower <- TowerList]),

%     case lists:filter(fun(R) -> R /= false end, [ role_p_pos(NRoleId) || NRoleId <- NeighboursInfo]) of
%         [] -> ok;
%         Roles ->
%             Msg = #m__scene__neighbours__s2c{roles=Roles},
%             % ?INFO_MSG("scene_mod:fetch_neighbours2=====~p",[Roles]),
%             send_msg(RoleId, Msg)
%     end.


% send_msg(RoleId, Msg) ->
%     case goddess_misc:get_role_pid(RoleId) of
%         false -> false;
%         Pid -> Pid ! {send, Msg}
%     end.

% role_p_pos(RoleId) ->
%     case pos_get(RoleId, ?CURR) of
%         false -> false;
%         {X, Y} ->
%             {X1,Y1} = pos_get(RoleId, ?TARGET),
%             role_p_pos(RoleId, {X, Y}, {X1, Y1})
%     end.

% role_p_pos(RoleId, {X, Y}, {Dx, Dy}) ->
%     case ets:lookup(?ETS_ONLINE_PLAYER, RoleId) of
%         [R] ->
%             #online{role=Role, equip=Equip, wing = Wing} = R,
%             #p_pos{
%                 role_id=Role#role.role_id,
%                 role_name = Role#role.role_name,
%                 job = Role#role.job,
%                 level = Role#role.level,
%                 pos_x = X,
%                 pos_y = Y,
%                 dest_x = Dx,
%                 dest_y = Dy,
%                 weapon = Equip#equip.weapon,
%                 armor = Equip#equip.armor,
%                 wing = Wing,
%                 title_id = Role#role.title_id
%             };
%         _ -> false
%     end.


% %%% =====================================================================
% %%% update_role_scene_info
% %%% =====================================================================


% %% @doc 离开tower
% -spec update_role_scene_info(_, 0 | {integer(),integer()},0 | {integer(),integer()},atom()) -> 'false' | non_neg_integer().
% update_role_scene_info(RoleId, OldTower, 0, TowerName) ->
%     case ets:lookup(TowerName, OldTower) of
%         [{_, L}] ->
%             NL = lists:filter(fun(Id) -> Id /= RoleId end, L),
%             ets:insert(TowerName, {OldTower, NL}),
%             erlang:length(NL);
%         [] ->
%             false
%     end;

% %% @doc 进入tower
% update_role_scene_info(RoleId, 0, NewTower, TowerName) ->
%     case ets:lookup(TowerName, NewTower) of
%         [{_, L}] ->
%             NL = lists:filter(fun(Id) -> Id /= RoleId end, L),
%             ets:insert(TowerName, {NewTower, [RoleId | NL]}),
%             erlang:length(NL)+1;
%         [] ->
%             false
%     end;

% %% @doc 在同一个tower里移动
% update_role_scene_info(_RoleId, OldTower1, OldTower2, _TowerName)
%     when OldTower1 == OldTower2 -> false;

% %% @doc 切换tower
% update_role_scene_info(Role, OldTower, NewTower, TowerName) ->
%     update_role_scene_info(Role, OldTower, 0, TowerName),
%     update_role_scene_info(Role, 0, NewTower, TowerName),
%     fetch_neighbours(Role, OldTower, NewTower, TowerName),
%     false.


% %%%===================================================================
% %%% init
% %%%===================================================================

% init_scene(Ets, SceneId) ->
%     %Opt = [named_table, ordered_set, {read_concurrency, true}],
%     %PathName = path_name(SceneId),
%     %ets:new(PathName, Opt),
%     Cfg = scene_info_cfg:get(SceneId),
%     LineCfg = line_cfg:get(SceneId),

%     Cfg#scene_info_cfg.height,

%     % M = SceneName:scene(),
%     %[ets:insert(PathName,  {Y, lists:nth(Y, M)}) || Y <- lists:seq(1, SceneInfo#scene_info.height)],

%     % 为每个线建立一个灯塔ets
%     Size = {Cfg#scene_info_cfg.width, Cfg#scene_info_cfg.height, Cfg#scene_info_cfg.tower_width, Cfg#scene_info_cfg.tower_height},
%     [begin
%         Enable = if L == 1 -> ?YES; true -> ?NO end,
%         K = tower_name(Ets, L),
%         cache:insert_other(K, #scene_line{lineid=L, enable=Enable}),
%         ets:new(K, [named_table, ordered_set, {read_concurrency, true}]),
%         [ets:insert(K, {Tower, []}) || Tower <- tower_all(edge(Size))]
%     end || L <- lists:seq(1, LineCfg#line_cfg.max_line)].

% %%%===================================================================
% %%% map util
% %%%===================================================================

% ceil(X, OX) when X =< OX -> 1;
% ceil(X, OX) ->
%     case X rem OX of
%         0 -> X div OX;
%         _Num -> X div OX + 1
%     end.

% %% dist({X,Y}, {X,Y}, _) -> false;
% %% dist({OX, OY}, {X, Y}, {TowerWidth, TowerHeight}) ->
% %%     abs(OX - X) =< TowerWidth andalso abs(OY - Y) =< TowerHeight.

% %% reachable({0, _}, _) -> false;
% %% reachable({_, 0}, _) -> false;
% %% reachable({X, Y}, PathName) ->
% %%     case ets:lookup(PathName, Y) of
% %%         [{_, Row}] ->
% %%             case erlang:length(Row) < X of
% %%                 true ->
% %%                     false;
% %%                 false ->
% %%                     case lists:nth(X, Row) of
% %%                         0 -> true;
% %%                         _Other ->
% %%                             false
% %%                     end
% %%             end;
% %%         [] -> false
% %%     end.

% edge({Mw, Mh, Tw, Th}) ->
%     {1, ceil(Mw, Tw), 1, ceil(Mh, Th)}.

% tower_where({MX, MY}, SceneId) ->
%     #scene_info_cfg{tower_width=TW, tower_height=TH} = scene_info_cfg:get(SceneId),
%     {ceil(MX, TW), ceil(MY, TH)}.

% tower_all({MinX, MaxX, MinY, MaxY}) ->
%     [{T_x, T_y} || T_x <- lists:seq(MinX, MaxX),
%         T_y <- lists:seq(MinY, MaxY)].

% tower_neighbour({T_x, T_y}) ->
%     [{N_T_x, N_T_y} ||
%         N_T_x <- [T_x-1, T_x, T_x+1],
%         N_T_y <- [T_y-1, T_y, T_y+1]].

% tower_neighbour(O, O) -> tower_neighbour(O);
% tower_neighbour(O, N) ->
%     lists:umerge(tower_neighbour(O), tower_neighbour(N)).

% tower_new_neighbour(O, N) ->
%     tower_neighbour(N) -- tower_neighbour(O).


% %% is_legal({OX, OY}, {X, Y}, SceneInfo, PathName) ->
% %%     #scene_info{width=W, height=H, tower_width=Tw, tower_height=Th} = SceneInfo,
% %%     case X =< 0 orelse Y =< 0 orelse X > W orelse Y > H of
% %%         true ->
% %%             false;
% %%         false ->
% %%             dist({OX, OY}, {X, Y}, {Tw, Th}) andalso reachable({X, Y}, PathName)
% %%     end.


% %%%===================================================================
% %%% line
% %%%===================================================================

% %% @doc 能否切入
% is_full(SceneId, LineId, Ets) ->
%     #line_cfg{full=Full} = line_cfg:get(SceneId),
%     case line_get(Ets, LineId) of
%         #scene_line{num=Num, enable=?YES} when Num >= Full -> true;
%         _ -> false
%     end.

% %% @doc 选择一个不繁忙的线进入
% pick_line(SceneId, Ets) ->
%     #line_cfg{max_line=MaxLine, busy=Busy} = line_cfg:get(SceneId),
%     AllLines = lists:seq(1, MaxLine),
%     case pick_line(SceneId, AllLines, Busy, Ets) of
%         false ->
%             % 都处于繁忙状态,开启新线
%             open_line(SceneId, AllLines, Ets);
%         LineId -> LineId
%     end.

% pick_line(_, [], _, _) -> false;
% pick_line(SceneId, [LineId|T], Limit, Ets) ->
%     case line_get(Ets, LineId) of
%         #scene_line{num=Num, enable=?YES} when Num < Limit ->
%             LineId;
%         _ -> pick_line(SceneId, T, Limit, Ets)
%     end.

% %% @doc 选最通畅的线进入
% pick_good_line(SceneId, Ets) ->
%     #line_cfg{max_line=MaxLine, busy=Busy} = line_cfg:get(SceneId),

%     AllLines = lists:seq(1, MaxLine),
%     {GLineId, GNum} = lists:foldl(
%         fun(LineId, {LLid, Min}) ->
%             case line_get(Ets, LineId) of
%                 #scene_line{num=Num, enable=?YES} when Num < Min ->
%                     {LineId, Num};
%                 _ ->
%                     {LLid, Min}
%             end
%         end, {0, Busy}, AllLines),

%     %% 找不到线路 或者 找到的线路人满为患, 开条新线出来
%     if GLineId == 0 orelse GNum >= Busy ->
%         open_line(SceneId, AllLines, Ets);
%         true -> GLineId
%     end.

% %% @doc 更新线路人数, 触发关掉空线
% line_update_role(N, SceneId, LineId, Ets) ->
%     case line_get(Ets, LineId) of
%         false ->
%             ?ERROR_MSG("line_update_role fail  ~p ~p ~n", [Ets, LineId]),
%             ok;
%         R ->
%             Num = R#scene_line.num + N,
%             ?DEBUG_MSG("line_update_role  ~p ~p ~p ~n", [R, N, Num]),
%             line_put(Ets, LineId, R#scene_line{num=Num}),
%             case Num =< 0 andalso LineId /= 1 of
%                 true ->
%                     line_check(SceneId, LineId, Ets);
%                 _ -> false
%             end
%     end.

% %% @doc 检测人数,关闭线路
% line_check(SceneId, CurrentLine, Ets) ->
%     #line_cfg{max_line=MaxLine, full=Full, close=Close} = line_cfg:get(SceneId),
%    {Counter, Num} = lists:foldl(
%         fun(LineId, {Counter, Num}) ->
%             case line_get(Ets, LineId) of
%                 #scene_line{num=N, enable=?YES} when LineId /= CurrentLine  ->
%                 {Counter+1, Num+N};
%             _ -> {Counter, Num}
%             end
%         end, {0, 0}, lists:seq(1, MaxLine)),

%     R = Num < (Full * Counter * Close),
%     if R -> close_line(SceneId, CurrentLine); true -> false end.


% %% @doc 找到一条未启用的线路打开
% open_line(_, [], _) -> false;
% open_line(SceneId, [LineId| T], Ets) ->
%     case line_get(Ets, LineId) of
%         #scene_line{enable=?NO}=D ->
%             line_put(Ets, LineId, D#scene_line{enable=?YES}),
%             self() ! {open_line, LineId},
%             LineId;
%         _ ->
%             open_line(SceneId, T, Ets)
%     end.

% %% @doc 关闭线
% close_line(_, 1) -> ok;
% close_line(Ets, LineId) ->
%     self() ! {close_line, LineId},
%     line_put(Ets, LineId, #scene_line{lineid=LineId}),
%     {closeline, LineId}.


% line_get(Ets, LineId) ->
%     cache:find_other(tower_name(Ets, LineId), scene_line).
% line_put(Ets, LineId, D) ->
%     cache:insert_other(tower_name(Ets, LineId), D).

% %% pos cache
% pos_get(RoleId, Tag) ->
%     case cache:find_other({RoleId, Tag}, scene_cache_pos) of
%         #scene_cache_pos{pos=Pos} ->
%             Pos;
%         _ when Tag == ?TARGET ->
%             pos_get(RoleId, ?CURR);
%         _ -> false
%     end.
% pos_put(RoleId, Tag, Pos) ->
%     cache:insert_other({RoleId, Tag}, #scene_cache_pos{pos=Pos}).
% pos_clean(RoleId) ->
%     cache:destory_other({RoleId, ?CURR}, scene_cache_pos),
%     cache:destory_other({RoleId, ?TARGET}, scene_cache_pos).


% %%%===================================================================
% %%% name
% %%%===================================================================


% scene_name(Id) -> list_to_atom("scene_" ++ util:to_list(Id)).
% %% path_name(Id) -> list_to_atom("path_"++ util:to_list(Id)).

% tower_name(Ets, Line) ->
%     list_to_atom("tower_" ++ util:to_list(Ets) ++ util:to_list(Line)).


% %%%===================================================================
% %%% slave
% %%%===================================================================

% %% scene slave
% slave_work(RoleId, MFA) ->
%     case cache:find_other(RoleId, scene_slave) of
%         false ->
%             {ok, Pid} = slave_srv:start_link(),
%             cache:insert_other(RoleId, #scene_slave{pid=Pid});
%         #scene_slave{pid=OPid}->
%             case is_process_alive(OPid) of
%                 true ->
%                     Pid = OPid;
%                 false ->
%                     {ok, Pid} = slave_srv:start_link(),
%                     cache:insert_other(RoleId, #scene_slave{pid=Pid})
%             end
%     end,
%     slave_srv:work(Pid, MFA).

% slave_release(RoleId) ->
%     case cache:find_other(RoleId, scene_slave) of
%         false -> ok;
%         #scene_slave{pid=Pid} ->
%             cache:destory_other(RoleId, scene_slave),
% %%             exit(Pid, kill)  %% 强力杀死
%             slave_srv:release(Pid)
%     end.
