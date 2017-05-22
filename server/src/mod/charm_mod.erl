%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-26 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(charm_mod).
% -include("game_pb.hrl").
% -include("table_record.hrl").
% %% API
% -export([build_p_charm/2, build_p_charm_log/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% build_p_charm_log(Logs) ->
%     F = fun(Log) ->
%             #p_charm_log{
%                 role_id = Log#charm_log.sender,
%                 role_name = Log#charm_log.sender_name,
%                 job = Log#charm_log.sender_job,
%                 time = Log#charm_log.time,
%                 object = Log#charm_log.object,
%                 num = Log#charm_log.num
%             }
%     end,
%     [F(X) || X <- Logs].

% build_p_charm(Total, Logs) ->
%     Plogs = charm_mod:build_p_charm_log(Logs),
%     #p_charm{total = Total, logs = Plogs}.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
