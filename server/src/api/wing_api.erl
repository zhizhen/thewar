%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-5-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(wing_api).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([dress/2, undress/2, intensify/2, inc_rate/2, synthesis/2]).
% -export([handle_throw/1, open_function/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% dress(#m__wing__dress__c2s{id = Id}, Sender) ->
%     Fun = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         Item = item_api:get_info_by_id(Id, [?ITEM_AVAILABLE]),
%         item_guard(Item, Sender),

%         guard(item_api:use(Id), ?PARAMS_ERROR, Sender),
%         game_info:update(Role#role{wing = Id}),
%         notify(?WING_DRESS_SUCC, Sender)
%     end,
%     ?PERFORM(Fun).

% undress(#m__wing__undress__c2s{}, Sender) ->
%     Fun = fun() ->
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         Item = item_api:get_info_by_id(Role#role.wing, [?ITEM_USE]),
%         item_guard(Item, Sender),

%         NewItem = item_api:revert_to_pack(Item#item.id),
%         guard(NewItem, ?PARAMS_ERROR, Sender),
%         game_info:update(Role#role{wing = <<"0">>}),

%         PItem = item_mod:build_p_item(NewItem),
%         Sender ! {send, #m__wing__undress__s2c{wing = PItem}}
%     end,
%     ?PERFORM(Fun).

% %% @doc 强化
% intensify(#m__wing__intensify__c2s{id = Id}, Sender) ->
%     Fun = fun() ->
%         Item = item_api:get_info_by_id(Id, [?ITEM_USE, ?ITEM_AVAILABLE]),
%         item_guard(Item, Sender),

%         WingCfg = wing_cfg:get({Item#item.item_id, Item#item.level}),
%         guard(WingCfg, ?PARAMS_ERROR, Sender),

%         #wing_cfg{intensive_item = ItemId, item_num = Num} = WingCfg,
%         guard(item_api:get_num_by_item_id(ItemId) >= Num, ?PARAMS_ERROR, Sender),

%         RemoveList = item_api:remove_by_item_id(ItemId, Num),
%         guard(RemoveList, ?PARAMS_ERROR, Sender),

%         Random = rand_srv:random(100),
%         NewLv = 
%         case Item#item.wing_rate =:= 1 orelse Random =< WingCfg#wing_cfg.rate of
%             true -> Item#item.level + 1;
%             false -> WingCfg#wing_cfg.fail_lv
%         end,

%         ?DEBUG_MSG("wing intensify rate:~p~n", 
%             [{Item#item.wing_rate, Random, WingCfg#wing_cfg.rate}]),

%         item_api:update_item(Item#item{level = NewLv, wing_rate = 0}),
 
%         Sender ! {send, #m__package__consume__s2c{items=[#p_item_num{
%                         id=DId, num=DNum} || {DId, DNum} <- RemoveList]}},

%         Sender ! {send, #m__wing__intensify__s2c{id = Id, level = NewLv}}
%     end,
%     ?PERFORM(Fun).

% %% @doc 100%
% inc_rate(#m__wing__inc_rate__c2s{id = Id}, Sender) ->
%     Fun = fun() ->
%         Item = item_api:get_info_by_id(Id, [?ITEM_USE, ?ITEM_AVAILABLE]),
%         item_guard(Item, Sender),
%         Cfg = item_cfg:get(Item#item.item_id),
%         guard(Cfg#item_cfg.type =:= ?ITEM_TYPE_WING, ?PARAMS_ERROR, Sender),

%         WingCfg = wing_cfg:get({Item#item.item_id, Item#item.level}),
%         guard(WingCfg, ?PARAMS_ERROR, Sender),

%         guard(role_api:is_enough_coin(WingCfg#wing_cfg.inc_rate_cost), 
%             ?PARAMS_ERROR, Sender),

%         role_api:pay_coin(WingCfg#wing_cfg.inc_rate_cost, #coin_cost{desc = ?CURR_MODE_FUNC}, Sender),
%         item_api:update_item(Item#item{wing_rate = 1}),
%         notify(?WING_INC_RATE_SUCC, Sender)
%     end,
%     ?PERFORM(Fun).

% synthesis(#m__wing__synthesis__c2s{item_id = ItemId, type = Type}, Sender) ->
%     Fun = fun() ->
%         ICfg = item_cfg:get(ItemId),
%         guard(ICfg, ?PARAMS_ERROR, Sender),

%         Cfg = wing_synthesis_cfg:get(ItemId),
%         guard(Cfg, ?PARAMS_ERROR, Sender),

%         Num = item_api:get_num_by_item_id(ItemId),
%         guard(Num >= Cfg#wing_synthesis_cfg.num, ?PARAMS_ERROR, Sender),



%         {RemoveList, Msg1} =
%         case Type of 
%             1 ->
%                 guard(role_api:is_enough_gold(Cfg#wing_synthesis_cfg.cost), ?PARAMS_ERROR, Sender),
%                 {msg, Msg} = item_api:add_items([#item{
%                             item_id = ICfg#item_cfg.next, 
%                             role_id = role_api:get_role_id(),
%                             num = 1}], Sender, quiet, false),

%                 role_api:pay_gold(Cfg#wing_synthesis_cfg.cost, Sender),
%                 {item_api:remove_by_item_id(ItemId, Cfg#wing_synthesis_cfg.num), Msg};
%             0 ->
%                 CreateNum = 10,
%                 CanNum = Num div Cfg#wing_synthesis_cfg.num,
%                 guard(CanNum >= CreateNum, ?PARAMS_ERROR, Sender),

%                 guard(role_api:is_enough_gold(CreateNum * Cfg#wing_synthesis_cfg.cost),
%                     ?PARAMS_ERROR, Sender),
%                 {msg, Msg} =
%                 item_api:add_items([#item{
%                         item_id = ICfg#item_cfg.next,
%                         role_id = role_api:get_role_id(),
%                         num = CreateNum}], Sender, quite, false),
%                 role_api:pay_gold(CreateNum * Cfg#wing_synthesis_cfg.cost, Sender),
%                 {item_api:remove_by_item_id(ItemId, CreateNum * Cfg#wing_synthesis_cfg.num),Msg}
%         end,
 
%         Sender ! {send_list, [Msg1, #m__wing__synthesis__s2c{items=[#p_item_num{
%                         id=DId, num=DNum} || {DId, DNum} <- RemoveList]}]}

%     end,
%     ?PERFORM(Fun).

% open_function(_) -> ok.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     ?ERROR_MSG("unhandled throw error:~ts~n", [Reason]).

% item_guard(false, Sender) -> throw({msg, ?ITEM_NOT_EXIST, Sender});
% item_guard(_, _) -> ok.

% guard(false, Code, Sender) -> throw({msg, Code, Sender});
% guard(_, _, _) -> ok.

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.

