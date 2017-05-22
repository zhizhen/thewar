%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% vip系统
%%% @end
%%% Created : 2013-7-30 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(vip_api).
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([info/2, get/2, pay/2, refresh_pay/2, login_refresh/1]).
% -export([get_extra_coin/1]).
% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% %%
% info(#m__vip__info__c2s{}, ClientSender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         DailyInfo = GameInfo#game_info.daily,
%         PMalls = build_p_malls(GameInfo#game_info.mall#mall.logs),

%         ClientSender ! {send, #m__vip__info__s2c{
%                                 got = DailyInfo#daily.vip_gift,
%                                 buy_items = PMalls
%                         }}
%     end,
%     ?PERFORM(F).

% %% @doc 领取每日礼包
% get(#m__vip__get__c2s{}, ClientSender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         DailyInfo = GameInfo#game_info.daily,
%         RoleInfo = GameInfo#game_info.role,
%         State = DailyInfo#daily.vip_gift,

%         if State =:= ?VIP_GIFT_GOT ->
%             throw({msg, ?VIP_DAILY_GIFT_ALREADY_GOT, ClientSender});
%             true -> ok
%         end,

%         Cfg = viprelate_cfg:get(RoleInfo#role.vip),

%         if Cfg == false ->
%             throw({msg, ?VIP_DAILY_GIFT_GOT_ERROR, ClientSender});
%             true -> ok
%         end,

%         IsSucc = role_api:get_award(Cfg#viprelate_cfg.gift_id, ?CURR_MODE_FUNC, ClientSender),
%         if IsSucc == false ->
%             throw({msg, ?VIP_DAILY_GIFT_GOT_ERROR, ClientSender});
%             true ->
%                 game_info:update(DailyInfo#daily{vip_gift=?VIP_GIFT_GOT}),
%                 notify(?VIP_DAILY_GIFT_GOT_SUCC, ClientSender)
%         end
%     end,
%     ?PERFORM(F).

% pay(#m__vip__pay__c2s{index = Index}, Sender) ->
% F = fun() ->
%     #game_info{role = Role} = role_api:get_user_data(),
%     Cfg = vip_recharge_cfg:get(Index),
%     case Cfg of
%         false -> throw({msg, ?RECHARGE_CFG_ERROR, Sender});
%         #vip_recharge_cfg{} -> ok
%     end,

%     Order = pay_mod:generate_order(Cfg#vip_recharge_cfg.money, Role),
%     pay_db:insert(Order),
%     S2c = #m__vip__pay__s2c{orderid = Order#order.orderid, money = Cfg#vip_recharge_cfg.money},
%     % 充值活动, 临时开启
%     % do_charge(Cfg#vip_recharge_cfg.coin, Cfg#vip_recharge_cfg.extra, 1, Sender),
%     Sender ! {send, S2c}
% end,
% ?PERFORM(F).

% refresh_pay(#m__vip__refresh_pay__c2s{}, Sender) ->
%     charge_refresh(1, Sender).

% login_refresh(Sender) ->
%     charge_refresh(0, Sender).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% charge_refresh(IsNotice, Sender) -> 
%     RoleId = role_api:get_role_id(),
%     case pay_db:get_by_roleid(RoleId, ?ORDER_AVAILABLE) of
%         [] -> false;
%         Orders ->
%             [begin
%                 Extra = get_extra_coin(Order#order.num),
%                 do_charge(Order#order.num, Extra, IsNotice, Sender),
%                 pay_db:update(Order#order{state = ?ORDER_USED})
%             end|| Order <- Orders],
%             true
%     end.

% do_charge(Num, Extra, IsNotice, Sender) ->
%     RmbToCoin = Num * 10,
%     case IsNotice of
%         1 -> 
%             role_api:add_coin(RmbToCoin + Extra, ?CURR_MODE_FUNC, Sender),
%             role_api:add_vip_exp(RmbToCoin, Sender);
%         0 -> 
%             role_api:add_coin(RmbToCoin + Extra, ?CURR_MODE_FUNC, Sender, quiet),
%             role_api:add_vip_exp(RmbToCoin, Sender, quiet)
%     end,
%     act_recharge_api:trigger(?RECHARGE_TRIGGER, RmbToCoin, Sender),
%     #game_info{daily = Daily} = role_api:get_user_data(),
%     game_info:update(Daily#daily{charge = Daily#daily.charge + RmbToCoin}).

% get_extra_coin(Money) -> 
%     All = [vip_recharge_cfg:get(Index) || Index <- vip_recharge_cfg:get_all()],
%     L = [Cfg ||Cfg <- All, Cfg#vip_recharge_cfg.money =< Money],
%     (lists:last(L))#vip_recharge_cfg.extra.


% build_p_malls(MallBuy) ->
%     Fun = fun({_, ItemId, Num}) ->
%             #p_mall{item_id = ItemId, num = Num}
%     end,
%     [Fun(X) || X <- MallBuy].

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.
