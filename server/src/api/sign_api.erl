%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-12 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(sign_api).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% % -export([show/2, get/2, show/1]).

% %% API
% -export([info/2, sign/2, info/1]).
% -export([handle_throw/1]).

% -define(SIGN_GENERAL,  1).     % 普通签到类型
% -define(SIGN_VIP,  2).     % 豪华签到类型
% -define(SIGN_NUMS,  20).     % 签到次数

% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__sign__info__c2s{}, Sender) ->
%     #game_info{sign=Sign, daily=Daily} = role_api:get_user_data(),
%     Data = get_sign_info(Sign, Daily),
%     Sender ! {send, Data}.

% info(Sender) ->
%     #game_info{sign=Sign, daily=Daily} = role_api:get_user_data(),
%     Data = get_sign_info(Sign, Daily),
%     Sender ! {send, Data}.

% sign(#m__sign__sign__c2s{type=Type}, Sender) ->
%     F = fun() ->
%         #game_info{sign=Sign, daily=Daily} = role_api:get_user_data(),

%         Times = case Type =:= ?SIGN_GENERAL of
%                     true -> Sign#sign.general + 1;
%                     _ -> Sign#sign.vip + 1
%                 end,

%         Cfg = sign_cfg:get(Times),
%         case Type of
%             ?SIGN_GENERAL -> case Sign#sign.general >= ?SIGN_NUMS orelse Daily#daily.sign_general /= 1 of
%                                 true -> throw({msg, ?SIGN_GET_FAIL, Sender});
%                                 _ -> ok
%                             end;
%             ?SIGN_VIP -> case Sign#sign.vip >= ?SIGN_NUMS orelse Daily#daily.sign_vip /= 1 orelse Daily#daily.charge < Cfg#sign_cfg.request_charge of
%                              true -> throw({msg, ?SIGN_GET_FAIL, Sender});
%                              _ -> ok
%                          end;
%             _ -> throw({msg, ?PARAMS_ERROR, Sender})
%         end,

%         Items = case Type of
%                     ?SIGN_GENERAL -> Cfg#sign_cfg.general_awards;
%                     ?SIGN_VIP -> Cfg#sign_cfg.vip_awards;
%                     _ -> throw({msg, ?PARAMS_ERROR, Sender})
%                 end,

%         {NewDaily, NewSign} = 
%             case Type of
%                 ?SIGN_GENERAL -> {Daily#daily{sign_general = 2}, Sign#sign{general = Sign#sign.general + 1}};
%                 ?SIGN_VIP -> {Daily#daily{sign_vip = 2}, Sign#sign{vip = Sign#sign.vip + 1}};
%                 _ -> throw({msg, ?PARAMS_ERROR, Sender})
%             end,
                                
%         case package_api:check_slots_enough(length(Items)) of
%             false ->
%                 throw({msg, ?SLOT_NOT_ENOUGH, Sender});
%             true -> ok
%         end,

%         role_api:get_award(Items, ?CURR_MODE_FUNC, Sender),
        
%         game_info:update(NewSign),
%         game_info:update(NewDaily),
%         sign_db:update(NewSign),
%         living_api:sign(Sender),
%         notify(?SIGN_GET_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% % show(#m__sign__show__c2s{}, Sender) ->
% %     #game_info{sign=Sign} = role_api:get_user_data(),
% %     {Date, _} = erlang:localtime(),
% %     {Days, IsGot, IsBreak} = check(Date, Sign),
% %     Days2 = if Days > 7 -> 1; true -> Days end,
% %     Sender ! {send, #m__sign__show__s2c{days=Days2, isgot=IsGot, isbreak=IsBreak}}.
    
% % %% @doc 签到领奖, 中断连续登陆 初始化
% % get(#m__sign__get__c2s{}, Sender) ->
% %     #game_info{sign=Sign} = role_api:get_user_data(),
% %     {Date, _} = erlang:localtime(),
% %     {Days, IsGot, _IsBreak} = check(Date, Sign),
% %     ?DEBUG_MSG("~p ~n", [Sign]),
% %     case IsGot == ?NO of
% %         true ->
% %             % 正常签到
% %             Days2 = if Days > 7 -> 1; true -> Days end,

% %             Cfg = sign_cfg:get(Days2),
% %             case role_api:get_award(Cfg#sign_cfg.award, Sender) of
% %                 false -> ok;
% % %%                     notify(?SIGN_GET_FAIL, Sender);
% %                 _ ->
% %                     Sign2 = Sign#sign{days=Days2, date=Date}, % 天数加1, 更新日期
% %                     game_info:update(Sign2),
% %                     sign_db:update(Sign2),
% %                     living_api:sign(Sender),
% %                     notify(?SIGN_GET_SUCC, Sender)
% %             end;
% %         false ->
% %             % 已经领取过了
% %             notify(?SIGN_GET_FAIL, Sender)
% %     end,
% %     ok.

% %% %% @doc 取消补签，签到记录清除
% %% clean(#m__sign__clean__c2s{}, Sender) ->
% %%     #game_info{role=Role} = role_api:get_user_data(),
% %%     Sign = #sign{role_id=Role#role.role_id, days=0, date=undefined},
% %%     game_info:update(Sign),
% %%     Msg = #m__sign__show__c2s{},
% %%     sign_api:show(Msg, Sender),
% %%     ok.
% %%
% %% %% @doc 补签
% %% pay(#m__sign__pay__c2s{}, Sender) ->
% %%     #game_info{sign=Sign} = role_api:get_user_data(),
% %%     {Date, Time} = erlang:localtime(),
% %%     {Days, _, IsBreak} = check(Date, Sign),
% %%     case IsBreak == ?YES of
% %%         true ->
% %%             Days2 = if Days+1 > 7 -> 7; true -> Days + 1 end,
% %%
% %%             Cfg = sign_cfg:get(Days2),
% %%             case role_api:is_enough_coin(Cfg#sign_cfg.pay) of
% %%                 false ->
% %%                     notify(?NO_MONEY, Sender);
% %%                 true ->
% %%                     Now = util:datetime_to_timestamp({Date, Time}),
% %%                     {Yesterday, _} = util:timestamp_to_datetime(Now - 86400),
% %%
% %%                     role_api:pay_coin(Cfg#sign_cfg.pay, ?CURR_FUNC, Sender),
% %%                     Sign2 = Sign#sign{date=Yesterday},
% %%                     game_info:update(Sign2),
% %%                     sign_db:update(Sign2),
% %%
% %%                     Msg = #m__sign__show__c2s{},
% %%                     sign_api:show(Msg, Sender)
% %%             end;
% %%         false ->
% %%             notify(?SIGN_PAY_FAIL, Sender)
% %%     end.

% %%===================================================================
% %% Internal functions
% %%===================================================================
% get_sign_info(Sign, Daily) ->
%     Sign1 = case Sign#sign.general >= ?SIGN_NUMS of
%                 true -> 0;
%                 _ -> Daily#daily.sign_general
%              end,

%     Cfg = sign_cfg:get(Sign#sign.vip + 1),
%     Sign2 = case Sign#sign.vip >= ?SIGN_NUMS orelse Daily#daily.charge < Cfg#sign_cfg.request_charge of
%                 true -> 0;
%                 _ -> Daily#daily.sign_vip
%             end,
%     #m__sign__info__s2c{general=Sign#sign.general, vip=Sign#sign.vip, isgengot=Sign1, isvipgot=Sign2, charge = Daily#daily.charge}.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.

% % check(_, #sign{date=undefined}) -> {1, ?NO, ?NO};
% % check(Date1, #sign{days=Days, date=Date2}) when Date1 == Date2 -> {Days, ?YES, ?NO};
% % check(_, #sign{days=Days}) -> {Days+1, ?NO, ?NO}.
% % %% check(Date1, #sign{days=Days, date=Date2}) ->
% % %%     case calendar:time_difference({Date1, {0,0,0}}, {Date2, {0,0,0}}) of
% % %%         {-1, _} -> {Days, ?NO, ?NO};
% % %%         _ -> {Days, ?NO, ?YES}
% % %%     end.
