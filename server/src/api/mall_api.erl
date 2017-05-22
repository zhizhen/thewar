%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%% 商城
%%% @end
%%% Created : 2013-10-31 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mall_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([info/2, buy/2]).
% -export([handle_throw/1, open_function/1]).

% -define(MALL_TYPE_LIMIT,    6).
% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% @spec
% %% @end
% %%--------------------------------------------------------------------
% info(#m__mall__info__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Daily = GameInfo#game_info.daily,
%     PMalls = build_p_malls(Daily#daily.mall_buy),
%     PMalls2 = build_p_malls2(GameInfo#game_info.mall#mall.logs),
%     Sender ! {send, #m__mall__info__s2c{items = PMalls, items2 = PMalls2}}.

% buy(#m__mall__buy__c2s{type = Type, item_id = ItemId, num = Num}, Sender) ->
%     F = fun() ->
%         Cfg = mall_cfg:get({Type, ItemId}),
%         common_guard(Cfg, ?MALL_PARAMS_ERROR1, "mall cfg error!\n", Sender),
        
%         ItemCfg = item_cfg:get(ItemId),
%         common_guard(ItemCfg, ?MALL_PARAMS_ERROR2, "item cfg error! \n", Sender),
    
%         GameInfo = role_api:get_user_data(),
%         #game_info{role=Role, daily=Daily, mall=Mall} = GameInfo,
%         % TODO 检测玩家是否能购买该道具，之前只有每日限购检测，新增加职业，VIP等级，终身限购
%         IsOK = check_role_buy_limits(Cfg, Role, Mall, ItemId, Num),
%         common_guard(IsOK, ?MALL_PARAMS_ERROR3, "limit error1!\n", Sender),

%         if  Type =:= ?MALL_TYPE_LIMIT ->
%                 N = get_item_aready_buy(Daily#daily.mall_buy, ItemId),
%                 D =
%                     case Cfg#mall_cfg.daily_limit of 
%                         0 -> true;
%                         _ ->  N + Num =< Cfg#mall_cfg.daily_limit
%                     end,
%                 common_guard(D, ?MALL_PARAMS_ERROR3, "limit error!\n", Sender);
%             true -> ok
%         end,

%         C = case Cfg#mall_cfg.type of
%             ?GOLD -> role_api:is_enough_gold(Num * Cfg#mall_cfg.cost);
%             ?COIN -> role_api:is_enough_coin(Num * Cfg#mall_cfg.cost);
%             ?HONOR -> role_api:is_enough_honor(Num * Cfg#mall_cfg.cost);
%             _ -> false
%         end,
%         common_guard(C, ?MALL_PARAMS_ERROR4, "type error!\n", Sender),

%         S = package_api:check_slots_enough(Num, ItemId),
%         common_guard(S, ?MALL_PARAMS_ERROR5, "slot not enough!\n", Sender),

%         case Cfg#mall_cfg.type of
%             ?GOLD -> role_api:pay_gold(Num * Cfg#mall_cfg.cost, Sender);
%             ?COIN -> role_api:pay_coin(Num * Cfg#mall_cfg.cost, #coin_cost{item_id = ItemId, num = Num, desc = ?CURR_MODE_FUNC}, Sender);
%             ?HONOR -> role_api:minus_honor(Num * Cfg#mall_cfg.cost, Sender)
%         end,
        
%         SNum = ItemCfg#item_cfg.stack_num,
%         Div = Num div SNum,
%         Rem = Num rem SNum,

%         Item = #item{
%             role_id = Role#role.role_id,
%             item_id = ItemId
%         },
%         Fix = if Rem == 0 -> []; true -> [Item#item{num = Rem}] end,
%         item_api:add_items([Item#item{num = SNum} || _ <- lists:seq(1, Div)] ++ Fix),

%         Limits = [Cfg#mall_cfg.vip_limit, Cfg#mall_cfg.job_limit, Cfg#mall_cfg.buy_limit],
%         case lists:any(fun(A) -> A =/= 0 end, Limits) of
%             false -> ok;
%             true -> 
%                 NewLogs = 
%                     case lists:keyfind(ItemId, #mall_item.item_id, Mall#mall.logs) of
%                         false -> Mall#mall.logs ++ [{mall_item, ItemId, Num}];
%                         #mall_item{num=LogNum} = LogItem-> 
%                             lists:keyreplace(ItemId, #mall_item.item_id, Mall#mall.logs, LogItem#mall_item{num=LogNum+Num})
%                     end,
%                 game_info:update(Mall#mall{logs = NewLogs})
%         end,
        
%         %item_api:add_items([Item#item{num = 1} || _ <- lists:seq(1, Num)]),
%         %if  Type =:= ?MALL_TYPE_LIMIT ->

%         % 商品限购物品需要记录
%         if Cfg#mall_cfg.daily_limit =/= 0 ->
%             MallBuy = add_item_aready_buy(Daily#daily.mall_buy, ItemId, Num),
%             game_info:update(Daily#daily{mall_buy = MallBuy});
%             true -> ok
%         end,
        
%         living_api:mall_buy(Sender),
%         ?MALL_MSG(Role#role.role_id, ItemId, Num),
%         notify(?MALL_BUY_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(_FuncId) ->
%     ok.

% % 先检查职业，然后vip，最后限购
% check_role_buy_limits(Cfg, Role, Mall, ItemId, Num) -> 
%     case Cfg#mall_cfg.job_limit of 
%         0 -> true;
%         _ when Cfg#mall_cfg.job_limit =/= Role#role.job -> false;
%         _ ->
%             if Cfg#mall_cfg.vip_limit > Role#role.vip -> 
%                 false;
%                 true -> 
%                     case Cfg#mall_cfg.buy_limit =:= 0 of
%                         true -> true;           % 数量为0是不限购的
%                         false -> 
%                             case lists:keyfind(ItemId, #mall_item.item_id, Mall#mall.logs) of
%                                 false -> Num =< Cfg#mall_cfg.buy_limit;
%                                 #mall_item{num=Num1} -> Num1 + Num =< Cfg#mall_cfg.buy_limit
%                             end
%                     end
%             end
%     end.

% common_guard(false, Code, Reason, Sender) -> 
%     notify(Code, Sender),
%     throw({guard_error, Reason});
% common_guard(_, _Code, _Reason, _Sender) -> ok.

% handle_throw({guard_error, Reason}) ->
%     ?ERROR_MSG("mall_guard_error, reason:~p~n", [Reason]);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~p~n", [Reason]).

% get_item_aready_buy(MallBuy, ItemId) ->
%     case lists:keyfind(ItemId, 1, MallBuy) of
%         false -> 0;
%         {_, Num} -> Num
%     end.

% add_item_aready_buy(MallBuy, ItemId, Num) ->
%     case lists:keyfind(ItemId, 1, MallBuy) of
%         false -> [{ItemId, Num} | MallBuy];
%         {I, N} -> lists:keyreplace(ItemId, 1, MallBuy, {I, N + Num})
%     end.

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.


% build_p_malls(MallBuy) ->
%     Fun = fun({ItemId, Num}) ->
%             #p_mall{item_id = ItemId, num = Num}
%     end,
%     [Fun(X) || X <- MallBuy].

% build_p_malls2(MallBuy)->
%     Fun = fun({_, ItemId, Num}) ->
%             #p_mall{item_id = ItemId, num = Num}
%     end,
%     [Fun(X) || X <- MallBuy].
