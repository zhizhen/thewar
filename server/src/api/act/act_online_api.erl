% %% Copyright
-module(act_online_api).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("logger.hrl").
% -include("msg_code.hrl").


% -behaviour(gen_act).

% %% API
% -export([get/2]).

% %% call back
% -export([
%     new/0, toData/1, toStr/1,

%     show/2,

%     % proc_tick_state/1,
%     % proc_tick/2,

%     handle_tick/3,
%     handle_open/2,
%     handle_close/2]).

% -export([handle_throw/1]).

% -record(act_data, {got=0, time=0, can_get=?NO}).

% -define(ACT_ONLINE_ID,  1001).  % 在线礼包

% %% api
% get(#m__act_online__get__c2s{id=Id}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         case gen_act:get_act_data(?ACT_ONLINE_ID) of
%             {ok, Act} -> ok;
%             _ ->
%                 Act = undefined,
%                 throw({msg, ?ACT_NO_LEGAL1, Sender})
%         end,

%         #act_data{got=Got, time=Time, can_get=CanGet} = Act#activity.act_data,
%         Now = ?NOW,
%         Cfg = act_online_cfg:get(Id),

%         case CanGet of
%             ?NO ->
%                 Start = if Got == 0 -> Role#role.login_time; true -> Time end,

%                 if Id /= Got+1 -> throw({msg, ?ACT_GET_FAIL1, Sender}); true -> ok end,

%                 Cd = Cfg#act_online_cfg.cd * 60,

%                 if (Now-Start) < Cd -> throw({msg, ?ACT_GET_FAIL2, Sender}); true -> ok end;
%             ?YES -> ok
%         end,

%         role_api:get_award(Cfg#act_online_cfg.award, ?CURR_MODE_FUNC, Sender),
%         ActData = #act_data{
%             got = Id,
%             time = Now
%         },

%         gen_act:put_act_data(Act#activity{act_data=ActData}),
%         notify(?ACT_GET_SUCC, Sender)
%     end,
%     ?PERFORM(F).


% %%%===================================================================
% %%% callback
% %%%===================================================================

% show(Sender, _) ->
%     case gen_act:get_act_data(?ACT_ONLINE_ID) of
%         {ok, Act} ->
%             #act_data{got=Got, can_get=CanGet} = Act#activity.act_data,
%             Sender ! {send, #m__act_online__show__s2c{got=Got, canget=CanGet}};
%         _ -> ok
%     end.

% %% act srv
% % proc_tick_state(_) -> 0.
% % proc_tick(_, _) -> {false, 0}.

% %% role process
% handle_tick(#activity{}=_ActData, _TickState, _Sender) -> ok.

% handle_open(#activity{}=ActData, Sender) ->
%     {ActData, Sender}.
% handle_close(ActId, Sender) ->
%     {ActId, Sender}.

% new() -> #act_data{}.
% toData(Str) ->
%     [A, B] = string:tokens(Str, "-"),
%     Got = erlang:list_to_integer(A),
%     CanGet = erlang:list_to_integer(B),
%     #act_data{got=Got, can_get=CanGet}.

% toStr(#act_data{got=Got, can_get=?YES}) ->
%     L = [erlang:integer_to_list(Got), erlang:integer_to_list(?YES)],
%     string:join(L, "-");
% toStr(#act_data{got=Got, time=Time}) ->
%     case act_online_cfg:get(Got+1) of
%         false -> CanGet = ?NO;
%         Cfg ->
%             Now = ?NOW,
%             Cd = Cfg#act_online_cfg.cd * 60,
%             #game_info{role=Role} = role_api:get_user_data(),
%             Start = if Got == 0 -> Role#role.login_time; true -> Time end,
%             CanGet = if (Now-Start) < Cd -> ?NO; true -> ?YES end
%     end,
%     L = [erlang:integer_to_list(Got), erlang:integer_to_list(CanGet)],
%     string:join(L, "-").

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
