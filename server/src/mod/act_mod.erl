%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(act_mod).

% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("logger.hrl").

% %% API
% -export([
%     % do_release6_act_tick/1,
%     do_release6_act_tick/0,
%     do_recharge_back_act_tick/1,
%     check_act_end/1,
%     get_act_get_state/2,
%     get_act_get_state1/2,
%     get_act_time_zone/1
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% % do_release6_act_tick(ActData) -> 
% %     Old = lists:keyfind(?ACT_RELEASE6, #activity.act_id, ActData),
% %     case check_act_end(?ACT_RELEASE6) andalso Old#activity.act_data =:= 0 of
% %         true -> 
% %             % 到点了，开始取数据清算玩家礼包
% %             Ranks = rank_api:get(?RANK_TYPE_ARENA, 1, 3),
% %             F = fun(#rank{role_id=RoleId}, Index) ->
% %                     {TitleId, FunName} = lists:nth(Index, ?ACT_RELEASE_TITLE),
% %                     MailMsg = lists:nth(Index,?ACT_RELEASE_TITLE_MAIL),
% %                     rank_api:add_title(RoleId, TitleId, FunName),
% %                     mail_srv:send_mail([RoleId], MailMsg, MailMsg, ?MAILING_TYPE_BULLETIN, ""),
% %                     Index + 1
% %                 end,
% %             lists:foldl(F, 1, Ranks),
% %             lists:keyreplace(?ACT_RELEASE6, #activity.act_id, ActData, Old#activity{act_data=1});
% %         false -> ActData
% %     end.
% do_release6_act_tick() -> 
%     % 到点了，开始取数据清算玩家礼包
%     Ranks = rank_api:get(?RANK_TYPE_ARENA, 1, 3),
%     F = fun(#rank{role_id=RoleId}, Index) ->
%             {TitleId, FunName} = lists:nth(Index, ?ACT_RELEASE_TITLE),
%             MailMsg = lists:nth(Index,?ACT_RELEASE_TITLE_MAIL),
%             rank_api:add_title(RoleId, TitleId, FunName),
%             mail_srv:send_mail([RoleId], MailMsg, MailMsg, ?MAILING_TYPE_BULLETIN, ""),
%             Index + 1
%         end,
%     lists:foldl(F, 1, Ranks).

% do_recharge_back_act_tick(ActData) -> 
%     ActIds = [Id || Id <- act_cfg:get_all(), lists:member((act_cfg:get(Id))#act_cfg.type, [?ACT_RECHARGE_BACK])],
%     F = fun(ActId, Data) ->
%             Old = lists:keyfind(ActId, #activity.act_id, Data),
%             case check_act_end(ActId) andalso Old#activity.act_data =:= 0 of
%                 true -> 
%                     % 到点了，更改整个活动的领取状态，玩家才可以领取
%                     lists:keyreplace(ActId, #activity.act_id, Data, Old#activity{act_data=1});
%                 false -> Data
%             end
%         end,
%     lists:foldl(F, ActData, ActIds).


% check_act_end(ActId) -> 
%     Cfg = act_cfg:get(ActId),
%     case Cfg of
%         false -> false;
%         #act_cfg{} -> 
%             #date_cfg{year = Y, month = M, day = D, hour = H, minute = M1, second = S} = lists:nth(2, Cfg#act_cfg.date1), % 活动清算时间
%             St = util:datetime_to_timestamp({{Y,M,D}, {H,M1,S}}),
%             St =< ?NOW
%     end.

% % 这里有个很尼玛坑爹的算法来计算玩家获取礼物的状态
% % 主要是针对欢乐七天送
% % 0-不可领，1-可领； 当前状态canget = 2（“10”），history=[1,3],说明第二个可以领取，第一个和第三个已经领取了,生成新的领取状态为“1010” -> 10.
% get_act_get_state(CanGet, History) -> 
%     case History of
%         [] when CanGet =:= 0 -> 1;
%         _ ->
%             D1 = lists:foldl(fun(X, Sum) -> util:bit_set(Sum, X) end, CanGet, History),
%             D2 = util:bit_set(D1, length(erlang:integer_to_list(D1, 2))+1),
%             D2 - lists:foldl(fun(X, Sum) -> util:bit_set(Sum, X) end, 0, History)
%     end.

% get_act_get_state1(ActId, History) ->
%     {{Y, M, D}, {H, _, _}} = erlang:localtime(),
%     {{Y1, M1, D1}, _} = util:timestamp_to_datetime(goddess_env:server_open_time()),
%     {DD, _} = calendar:time_difference({{Y, M, D}, {0,0,0}}, {{Y1, M1, D1}, {0, 0, 0}}),
%     Cfg = act_detail_cfg:get({ActId, DD}),
%     case Cfg of
%         false -> 0;
%         #act_detail_cfg{} -> 
%             [_, Start, End, _] = Cfg#act_detail_cfg.conds,
%             case Start =< H andalso End > H of
%                 false -> 0;
%                 true -> util:bit_set(0, lists:max(History) + 1)
%             end
%     end.

% get_act_time_zone(ActId) ->
%     {ok, TimeZone} = act_srv:get_act_time_zone(ActId),
%     TimeZone.

%%%===================================================================
%%% Internal functions
%%%===================================================================

