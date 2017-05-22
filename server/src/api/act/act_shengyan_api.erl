-module(act_shengyan_api).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% %% API
% -export([get/2]).

% %% api
% get(#m__act_shengyan__get__c2s{}, Sender) ->
%     #game_info{daily = Daily} = role_api:get_user_data(),
%     Cfg = act_shengyan_cfg:get(1),
%     #act_shengyan_cfg{
%         start1 = S1, 
%         end1 = E1,
%         start2 = S2,
%         end2 = E2,
%         power1 = P1,
%         power2 = P2
%     } = Cfg,

%     Now = ?NOW,
%     {_, {H, M, S}} = util:timestamp_to_datetime(Now),
%     T = (H * 60 + M ) * 60 + S,
%     if  T >= S1 andalso T =< E1 ->
%             if  Daily#daily.shengyan1 < 1 ->
%                     role_api:add_power(P1, Sender),
%                     game_info:update(Daily#daily{shengyan1 = 1}),
%                     challenge_api:update_task_process(?CHALLENGE_TYPE_SHENGYAN_NUM, 0, 1),
%                     notify(?ACTSHENGYAN_GET_SUCC, Sender);
%                 true ->
%                     notify(?ACTSHENGYAN_GET_FAIL, Sender)
%             end;
%         T >= S2 andalso T =< E2 ->
%             if  Daily#daily.shengyan2 < 1 ->
%                     role_api:add_power(P2, Sender),
%                     game_info:update(Daily#daily{shengyan2 = 1}),
%                     %% 更新挑战成就任务 盛宴X次
%                     challenge_api:update_task_process(?CHALLENGE_TYPE_SHENGYAN_NUM, 0, 1),
%                     notify(?ACTSHENGYAN_GET_SUCC, Sender);
%                 true ->
%                     notify(?ACTSHENGYAN_GET_FAIL, Sender)
%             end;
%         true ->
%             notify(?ACTSHENGYAN_GET_FAIL, Sender)
%     end.

% %%%===================================================================
% %%% callback
% %%%===================================================================
% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
