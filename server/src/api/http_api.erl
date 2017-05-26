%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2015, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2015-1-22 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(http_api).
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").

% %% API
% -compile([export_all]).

% %%%===================================================================
% %%% HTTP API
% %%%===================================================================
% handle_http_request(Method, Socket, Packet) ->
%     try
%         case auth_check(Socket) of
%             false ->
%                 ?ERROR_MSG("illegal http request:~p~n", [{inet:peername(Socket), Method, Packet}]),
%                 throw("auth fail");
%             _ ->
%                 case get_cmd_parm(Method, Packet) of
%                     [[], _] -> gen_tcp:send(Socket, httpResponeBin("false"));
%                     [Cmd, Param] ->
%                         ?DEBUG_MSG("http requests:~p~n", [{Cmd, Param}]),
%                         handle_http(util:to_atom(Cmd), Param, Socket);
%                     _ ->
%                         gen_tcp:send(Socket, httpResponeBin("false"))
%                 end
%         end
%     catch
%         _:Reason ->
%             ?DEBUG_MSG("catch error:~p~n", [{Reason, erlang:get_stacktrace()}]),
%             Reason
%     end.

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% auth_check(null) -> false;
% auth_check(Socket) ->
%     ClientIp = util:ip(Socket),
%     lists:any(fun(Ip) -> util:to_binary(ClientIp)=:=util:to_binary(Ip) end, ?GM_CLIENT_IPS).

% get_cmd_parm(get, Packet) ->
%     PacketList = string:to_lower(util:to_list(Packet)),
%     case string:str(PacketList, " ") of
%         0 ->
%             no_cmd;
%         N ->
%             CM = string:substr(PacketList, 2, N-2),
%             case string:str(CM, "?") of
%                 0 -> [CM, ""];
%                 N1 -> [string:substr(CM, 1, N1-1),  string:substr(CM, N1+1)]
%             end
%     end;

% get_cmd_parm(post, Packet) ->
%     PacketList = string:to_lower(util:to_list(Packet)),

%     CMD = case string:str(PacketList, " http") of
%         0 ->
%             no_cmd;
%         CMDN ->
%             string:substr(PacketList, 3, CMDN-3)
%     end,
%     Params = case string:str(PacketList, "\r\n\r\n") of
%         0 ->
%             no_cmd;
%         ParamsN ->
%             string:substr(PacketList, ParamsN+4)
%     end,
%     [CMD, Params].


% handle_http(Cmd, Param, Socket) ->
%     ParamList = util:trans_http_parms(Param),
%     Result =
%         case lists:member(Cmd, [admin_value, admin_change_state]) of
%             true -> 
%                 RoleId = util:to_list(util:get_field(ParamList, "role_id")),
%                 case goddess_misc:get_role_pid(RoleId) of
%                     false -> handle_admin_cmd_offline(Cmd, ParamList);
%                     Pid -> gen_server:call(Pid, {process, http_api, Cmd, ParamList})
%                 end;
%             false -> apply(http_api, Cmd, [ParamList, Socket])
%         end,

%     case Result of 
%         error -> gen_tcp:send(Socket, httpResponeBin("error"));
%         R -> gen_tcp:send(Socket, httpResponeBin(util:to_list(R)))
%     end.

% httpResponeBin(L) ->
%     HeaderBin= util:to_binary(io_lib:format("HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: ~p\r\n\r\n",[length(L)])),
%     Bin = util:to_binary(L),
%     <<HeaderBin/binary,Bin/binary>>.

% %%%===================================================================
% %%% Handle Http Requests Functions
% %%%===================================================================


% %% -------------------------------------------------------------------
% %% 充值回调接口
% %% -------------------------------------------------------------------
% notification(ParamList, Socket) ->
%     OrderId = proplists:get_value("order", ParamList),
%     Amount = util:to_integer(proplists:get_value("amount", ParamList)),
%     Ticket = proplists:get_value("ticket", ParamList),
%     Auth = check_pay_ticket(OrderId, Amount, Ticket),

%     case Auth andalso pay_db:get_by_id(OrderId) of
%         false ->
%             ?ERROR_MSG("pay auth failed:~p~n", [{ParamList}]), 
%             gen_tcp:send(Socket, httpResponeBin("error"));
%         #order{state = S} = Order when S /= 0 ->
%             ?INFO_MSG("re notification:~p~n", [{ParamList, Order}]), 
%             gen_tcp:send(Socket, httpResponeBin("success"));
%         #order{state = 0, num = Amount} = Order ->
%             ?INFO_MSG("notification:~p~n", [{ParamList, Order}]),
%             handle_charge_success(Order, Amount),
%             gen_tcp:send(Socket, httpResponeBin("success"));
%         #order{state = 0, num = Num} = Order when Amount > Num ->
%             %% 有可能实际金额大于订单金额
%             ?INFO_MSG("notification diffrent amount:~p~n", [{ParamList, Order}]), 
%             handle_charge_success(Order, Amount),
%             gen_tcp:send(Socket, httpResponeBin("success"));
%         Order ->
%             ?ERROR_MSG("notification other:~p~n", [{ParamList, Order}]), 
%             gen_tcp:send(Socket, httpResponeBin("error"))
%     end.

% handle_charge_success(#order{role_id=RoleId} = Order, Amount) ->
%     pay_db:update(Order#order{state = 1, num = Amount}),
%     % case goddess_misc:get_role_pid(RoleId) of
%     %     false -> ok;
%     %     Pid -> Pid ! {process, vip_api, refresh_pay, [#m__vip__refresh_pay__c2s{}]}
%     % end,
%     ok.

% % handle_charge_success_offline(RoleId, Money) -> 
% %     Old = role_db:get(RoleId),
% %     Extra = vip_api:get_extra_coin(Money),
% %     NewCoin = Old#role.coin + Money * 10 + Extra,
% %     role_db:set(RoleId, "coin", NewCoin).

% %% -------------------------------------------------------------------
% %% GM命令修改角色数值
% %% -------------------------------------------------------------------
% admin_value(Params, Sender) ->
%     _RoleId = util:to_list(util:get_field(Params, "role_id")),
%     Type = util:to_integer(util:get_field(Params, "type")),
%     Num = util:to_integer(util:get_field(Params, "num")),

%     case get_mod_func(Type) of
%         false -> error;
%         {Mod, Func} -> apply(Mod, Func, [Num, Sender])
%     end.

% %% -------------------------------------------------------------------
% %% 跑马灯，系统公告接口
% %% -------------------------------------------------------------------
% admin_system_notice(Params, _Sender) ->
%     Type = util:to_integer(util:get_field(Params, "type")),
%     CreatedAt = util:to_list(util:get_field(Params, "created_at")),
%     StartedAt = util:to_integer(util:get_field(Params, "start_at")),
%     ExpiredAt = util:to_list(util:get_field(Params, "expired_at")),
%     Title = util:to_list(util:get_field(Params, "title")),
%     Msg = util:to_list(util:get_field(Params, "msg")),
%     ShowInterval = util:to_integer(util:get_field(Params, "show_interval")),
    
%     notice_srv:add_notice(Type, CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval).

% admin_update_notice(Params, _Sender) ->
%     NoticeId = util:to_list(util:get_field(Params, "notice_id")),
%     Type = util:to_integer(util:get_field(Params, "type")),
%     CreatedAt = util:to_list(util:get_field(Params, "created_at")),
%     StartedAt = util:to_integer(util:get_field(Params, "start_at")),
%     ExpiredAt = util:to_list(util:get_field(Params, "expired_at")),
%     Title = util:to_list(util:get_field(Params, "title")),
%     Msg = util:to_list(util:get_field(Params, "msg")),
%     ShowInterval = util:to_integer(util:get_field(Params, "show_interval")),

%     notice_srv:update_notice(NoticeId, Type, CreatedAt, StartedAt, ExpiredAt, Title, Msg, ShowInterval).

% admin_delete_notice(Params, _Sender) ->
%     NoticeId = util:to_integer(util:get_field(Params, "notice_id")),

%     notice_srv:delete_notice(NoticeId).

% %% -------------------------------------------------------------------
% %% 角色封禁接口
% %% -------------------------------------------------------------------
% admin_change_state(Params, _Sender) ->
%     State = util:to_integer(util:get_field(Params, "state")),
%     StateTime = util:to_integer(util:get_field(Params, "state_time")),
%     Type = util:to_integer(util:get_field(Params, "type")),
%     case Type of 
%         1 -> role_api:role_locked(State, StateTime);
%         2 -> apply(ban_chat_api, ban, [StateTime])
%     end.


% %% -------------------------------------------------------------------
% %% 邮件
% %% -------------------------------------------------------------------
% admin_send_mail(Params, _Sender) ->
%     RoleIds = string:tokens(util:to_list(util:get_field(Params, "roles")), ","),
%     Title = util:to_list(util:get_field(Params, "title")),
%     Msg = util:to_list(util:get_field(Params, "msg")),
%     Type = util:to_list(util:get_field(Params, "type")),
%     Attachments = util:to_list(util:get_field(Params, "attachments")),
        
%     mail_srv:send_mail(RoleIds, Title, Msg, Type, Attachments).

% %% -------------------------------------------------------------------
% %% 后台操作活动接口
% %% -------------------------------------------------------------------
% admin_activity_add(Params, _Sender) ->
%     ActId = util:to_integer(util:get_field(Params, "act_id")),
%     Start = util:to_integer(util:get_field(Params, "start")),
%     End = util:to_integer(util:get_field(Params, "end")),
%     Begin = util:to_integer(util:get_field(Params, "begin")),
%     Expired = util:to_integer(util:get_field(Params, "expire")),
%     Remark = util:to_list(util:get_field(Params, "remark")),
    
%     act_srv:add_activity(ActId, Start, End, Begin, Expired, Remark).

% admin_activity_delete(Params, _Sender) ->
%     ActId = util:to_integer(util:get_field(Params, "act_id")),

%     act_srv:delete_activity(ActId).

% % feedback_reply(Params, _) ->
% %     Id = util:to_list(util:get_field(Params, "id")),
% %     Reply = util:to_list(util:get_field(Params, "reply")),
    
% %     feedback_api:admin_reply(Id, Reply).
% %% =============================================================================
% get_mod_func(?EXP)      -> {role_api, admin_add_exp};
% get_mod_func(?GOLD)     -> {role_api, admin_add_gold};
% get_mod_func(?COIN)     -> {role_api, admin_add_coin};
% get_mod_func(?POWER)    -> {role_api, admin_add_power};
% get_mod_func(?VIP_EXP)  -> {role_api, admin_add_vip_exp};
% get_mod_func(?HONOR)    -> {role_api, admin_add_honor};
% get_mod_func(?VIGOR)    -> {role_api, admin_add_vigor};
% get_mod_func(?FEATS)    -> {role_api, admin_add_feats};
% get_mod_func(?POWER2)   -> {role_api, admin_change_power2};
% get_mod_func(_)         -> false.

% handle_admin_cmd_offline(admin_change_state, Params) ->
%     _RoleId = util:to_list(util:get_field(Params, "role_id")),
%     _Type = util:to_integer(util:get_field(Params, "type")),
%     _Num = util:to_integer(util:get_field(Params, "num")),
%     ok.

% check_pay_ticket(OrderId, Amount, Ticket) ->
%     HashStr = io_lib:format("~s~s~s", [?SECRET_KEY, util:to_list(OrderId), util:to_list(Amount)]),
%     ServerHash = util:md5_to_hex(HashStr),
%     string:to_upper(util:to_list(ServerHash)) == string:to_upper(util:to_list(Ticket)).
