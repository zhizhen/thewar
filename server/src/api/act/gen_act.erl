%% Copyright
-module(gen_act).

% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% -export([
%     build/3,
%     all_available/0,
%     get_act_data/1,
%     put_act_data/1,
%     save2db/1,
%     % go_tick_state/1,
%     % go_tick/2,
%     do_tick/3,
%     do_update/3,
%     check_release_act/1,
%     save/1,
%     get_all_open_mod/0,
%     trigger_level_acts/2,
%     trigger_login_acts/1
% ]).

% -export([behaviour_info/1]).

% behaviour_info(callbacks) ->
%     [{new, 0},
%     {toData,1},
%     {toStr, 1},
%     {show, 2},
%     % {proc_tick_state, 1},
%     % {proc_tick, 2},
%     {handle_tick, 3},
%     {handle_open, 2},
%     {handle_close, 2}];
% behaviour_info(_) ->
%     undefined.

% %%%===================================================================
% %%% build
% %%%===================================================================
% build(RoleId, ActId, ActData) ->
%     case is_available(ActId) of
%         true ->
%             Mod = (act_cfg:get(ActId))#act_cfg.mod,
%             Data = 
%                 case ActData of
%                     [] -> Mod:new();
%                     _ -> Mod:toData(util:to_list(ActData))
%                 end,
%             {ok, #activity{
%                     role_id = RoleId,
%                     act_id  = ActId,
%                     act_data = Data
%             }};
%         Other -> {false, Other}
%     end.

% all_available() ->
%     % ActIds = act_cfg:get_all(),
%     % [Id || Id <- ActIds, is_available(Id)].
%     {ok, List} = act_srv:get_all_available(),
%     List.

% %%%===================================================================
% %%% act data op
% %%%===================================================================
% %% @doc 试试中文
% get_act_data(ActId) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     case is_available(ActId) andalso is_level_ok(Role, ActId) of
%         true ->
%             Acts = GameInfo#game_info.acts,
%             case lists:keyfind(ActId, #activity.act_id, Acts#acts.all) of
%                 #activity{} = ActData ->
%                     case (act_cfg:get(ActId))#act_cfg.type of
%                         ?ACT_RECHARGE_BACK -> handle_recharge_back(ActData, GameInfo);
%                         _ -> {ok, ActData}
%                     end;
%                 false ->
%                     case act_db:get(Role#role.role_id, ActId) of
%                         {ok, ActData} ->
%                             Acts = GameInfo#game_info.acts,
%                             game_info:update(#acts{all=[ActData|Acts#acts.all]}),
%                             {ok, ActData};
%                         Other -> Other
%                     end

%             end;
%         Other -> Other
%     end.

% handle_recharge_back(ActData, GameInfo) ->
%     {Rec,Canget,Data,His} = ActData#activity.act_data,
%     case act_mod:check_act_end(ActData#activity.act_id) andalso Canget =:= ?NO of
%         true -> 
%             Acts = GameInfo#game_info.acts#acts.all,
%             NewAct = ActData#activity{act_data={Rec,?YES,Data,His}},
%             game_info:update(#acts{all=lists:keyreplace(ActData#activity.act_id, #activity.act_id, Acts, NewAct)}),
%             {ok, NewAct};
%         false -> {ok, ActData}
%     end.

% %% @doc 存储
% put_act_data(#activity{act_id=ActId} = ActData) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,

%     case is_available(ActId) andalso is_level_ok(Role, ActId) of
%         true -> true;
%         Other -> throw(Other)
%     end,

%     Acts = GameInfo#game_info.acts,
%     All = lists:keyreplace(ActId, #activity.act_id, Acts#acts.all, ActData),
%     game_info:update(#acts{all=All}).

% save(Acts) ->
%     [ save2db(Act) || Act <- Acts#acts.all].

% save2db(#activity{act_id=ActId, act_data=ActData}=D) ->
%     Mod = (act_cfg:get(ActId))#act_cfg.mod,
%     Data = Mod:toStr(ActData),
%     act_db:save(D#activity{act_data=Data}).

% check_release_act(Sender) ->
%     {ok, Ids} = act_srv:get_all_available(),
%     [((act_cfg:get(Id))#act_cfg.mod):show(Sender, Id)|| Id <- Ids].

% trigger_level_acts(Lv, Sender) ->
%     lists:foreach(fun(Type) -> act_release_api:trigger(Type, Lv, Sender) end, [?ACT_RELEASE3, ?ACT_RELEASE4]).

% trigger_login_acts(Sender) ->
%     lists:foreach(fun(Type) -> act_release_api:trigger(Type, Sender) end, [?ACT_RELEASE2]).

% get_all_open_mod() ->
%     ActIds = act_cfg:get_all(),
%     [(act_cfg:get(Id))#act_cfg.mod || Id <- ActIds].


% %%%===================================================================
% %%% tick, used by act server
% %%%===================================================================
% % go_tick_state(ActId) ->
% %     Mod = (act_cfg:get(ActId))#act_cfg.mod,
% %     Mod:proc_tick_state(ActId).
% % go_tick(ActId, Data) ->
% %     Mod = (act_cfg:get(ActId))#act_cfg.mod,
% %     Mod:proc_tick(ActId, Data).

% %%%===================================================================
% %%% tick, used by role process
% %%%===================================================================
% do_tick(ActId, TickState, Sender) ->
%     Mod = (act_cfg:get(ActId))#act_cfg.mod,
%     case get_act_data(ActId) of
%         {ok, ActData} ->
%             Mod:handle_tick(ActData, TickState, Sender);
%         _ -> ok
%     end.

% %% @doc
% -spec
% do_update([integer()], [integer()], pid()) -> ok.
% do_update(Opens, Closes, Sender) ->
%     [begin
%         % case get_act_data(ActId) of
%         %     {ok, ActData} ->
%         %         Mod = (act_cfg:get(ActId))#act_cfg.mod,
%         %         Mod:handle_open(ActData, Sender);
%         %     _Other -> ok
%         % end
%         case role_handle_act_open(ActId) of
%             {ok, ActData} ->
%                 Mod = (act_cfg:get(ActId))#act_cfg.mod,
%                 Mod:handle_open(ActData, Sender);
%             _Other -> ok
%         end
%     end || ActId <- Opens],

%     [begin
%         Mod = (act_cfg:get(ActId))#act_cfg.mod,
%         Mod:handle_close(ActId, Sender)
%     end || ActId <- Closes],
%     ok.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% role_handle_act_open(ActId) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     case is_level_ok(Role, ActId) of
%         true ->
%             Acts = GameInfo#game_info.acts,
%             case lists:keyfind(ActId, #activity.act_id, Acts#acts.all) of
%                 #activity{} = ActData ->
%                     {ok, ActData};
%                 false ->
%                     case act_db:get(Role#role.role_id, ActId) of
%                         {ok, ActData} ->
%                             Acts = GameInfo#game_info.acts,
%                             game_info:update(#acts{all=[ActData|Acts#acts.all]}),
%                             {ok, ActData};
%                         Other -> Other
%                     end

%             end;
%         Other -> Other
%     end.

% is_level_ok(Role, ActId) ->
%     Cfg = act_cfg:get(ActId),
%     Role#role.level >= Cfg#act_cfg.level_required.

% is_available(ActId) ->
%     {ok, State} = act_srv:get_act_open_state(ActId),
%     State =:= ?ACTIVITY_OPEN.
