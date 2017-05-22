%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2015, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2015-1-21 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(pay_mod).
% -include("trick.hrl").
% -include("role.hrl").
% -include("table_record.hrl").
% -include("game_pb.hrl").

% %% API
% -export([generate_order/2]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% @spec
% %% @end
% %%--------------------------------------------------------------------
% generate_order(Num, Role) ->
%     ServerIdStr = util:to_list(goddess_env:server_id()),
%     RoleIdStr = util:to_list(Role#role.role_id),
%     NumStr = util:to_list(Num),
%     TimeStr = util:to_list(util:longunixtime()),
%     OrderId = lists:concat([ServerIdStr, "_", RoleIdStr, "_", NumStr, "_", TimeStr]),
%     #order{
%         orderid = OrderId,
%         role_id = Role#role.role_id,
%         account_id = Role#role.account_id,
%         num = Num,
%         time = ?NOW,
%         state = ?ORDER_PREPARE
%     }.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
