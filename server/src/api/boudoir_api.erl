%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 女神系统
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(boudoir_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([unfasten/2, handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% unfasten(#m__boudoir__unfasten__c2s{seal_id=SealId}, ClientSender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Boudoir = GameInfo#game_info.boudoir,
%         CurrentFloor = Boudoir#boudoir.floor,
%         OpenedSeals = Boudoir#boudoir.opened_seals,

% %%         IsOpened = util:get_state_by_binary(OpenedSeals, SealId, ?BOUDOIR_SEAL_NUM),
%         IsOpened = util:bit_test(OpenedSeals, SealId),

%         if IsOpened =:= ?BOUDOIR_OPENED ->
%             throw({msg, ?BOUDOIR_SEAL_OPENED, ClientSender});
%             true -> ok
%         end,

%         Cfg = boudoir_cfg:get({CurrentFloor, SealId}),
%         UpgradeNeeds = Cfg#boudoir_cfg.upgrade_needs,
%         [begin
%             ItemId = UpgradeNeed#upgrade_need.item_id,
%             Num = UpgradeNeed#upgrade_need.num,
%             check_item_enough(ItemId, Num, ClientSender)
%         end || UpgradeNeed <- UpgradeNeeds],

%         RemoveList = lists:concat(
%         [begin
%             ItemId = UpgradeNeed#upgrade_need.item_id,
%             Num = UpgradeNeed#upgrade_need.num,
%             item_api:remove_by_item_id(ItemId, Num)
%         end || UpgradeNeed <- UpgradeNeeds]),

%         RemoveList2 = [#p_item_num{id=DId, num=DNum} || {DId, DNum} <- RemoveList],

% %%         New = OpenedSeals + (1 bsl (SealId-1)),
%         New = util:bit_set(OpenedSeals, SealId),

%         {NewFloor, NewOpened} = update_new_boudoir(CurrentFloor, New),
%         game_info:update(Boudoir#boudoir{floor=NewFloor, opened_seals=NewOpened}),
%         %% 更新挑战成就任务 女神解封
%         if New =:= ?BOUDOIR_ALL_OPENED ->
%             challenge_api:update_task_process(?CHALLENGE_TYPE_BOUDOIR_GIRL, CurrentFloor, 1);
%             true -> false
%         end,
        
%         notify(?BOUDOIR_OPEN_SUCCESS, ClientSender),
%         Msg = #m__package__consume__s2c{items=RemoveList2},
%         ClientSender ! {send, Msg}
%     end,    
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% check_item_enough(Tv, Num, ClientSender) ->
%     case item_api:is_item_enough(itemid, Tv, Num) of
%         true -> ok;
%         false ->
%             throw({msg, ?ITEM_USE_FAILED, ClientSender})
%     end.

% update_new_boudoir(CurrentFloor, OpenedSeals) -> 
%     if OpenedSeals =:= ?BOUDOIR_ALL_OPENED ->
%         {CurrentFloor+1, 0};
%         true -> 
%             {CurrentFloor, OpenedSeals}
%     end.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.
