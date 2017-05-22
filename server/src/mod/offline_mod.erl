%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(offline_mod).

% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("game_pb.hrl").

% %% API
% -export([
%     build_p_offline/3
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% build_p_offline(#offline{}=Offline, #buffs{}=Buffs, #daily{}=Daily) ->
%     OffexpTime = Offline#offline.offexp_time,

%     Overleap = case lists:keyfind(?OVERLEAP_BUFF_ID, #buff.buff_id, Buffs#buffs.all) of
%         false ->
%             #p_overleap{
%                 state=0,
%                 mission=0,
%                 start=0,
%                 last=0,
%                 all_times=0,
%                 times=0,
%                 daily_limit=0
%             };
%         Buff ->
%             [MissionId, AllTimes] = [util:to_integer(X) || X <- string:tokens(util:to_list(Buff#buff.info), ",")],
%             MissionDaily = lists:keyfind(MissionId, 1, Daily#daily.mission),
%             DailyLimit = case MissionDaily of
%                 {_, Num, _} -> Num;
%                 false -> 0
%             end,
%             #p_overleap{
%                 state=1,
%                 mission=MissionId,
%                 start=Buff#buff.created_at,
%                 last=Buff#buff.last_time,
%                 all_times=AllTimes,
%                 times=Buff#buff.run_times,
%                 daily_limit=DailyLimit
%             }
%     end,
%     #p_offline{
%         offtime = OffexpTime,
%         overleap = Overleap
%     }.



% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

