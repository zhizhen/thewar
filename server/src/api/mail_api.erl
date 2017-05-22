%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mail_api).

% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").

% %% API
% -export([
%     info/2,
%     send_mail/5,
%     clean_mail/0,
%     open_function/1,
%     read/2,
%     get_attachment/2,
%     delete/2
% ]).
% -export([
%     handle_throw/1,
%     reload_mails/1
% ]).

% -include("game_pb.hrl").

% %%%===================================================================
% %%% API
% %%%===================================================================

% info(#m__mail__info__c2s{}, ClientSender) ->
%     #game_info{mail = Mails} = role_api:get_user_data(),
%     MailInfo = mail_mod:build_p_mail(Mails),
%     Data = #m__mail__info__s2c{mails = MailInfo},
%     ClientSender ! {send, Data}.

% read(#m__mail__read__c2s{mail_id=OldMailId}, ClientSender) ->
%     F = fun() ->
%         MailId = util:to_binary(OldMailId),
%         #game_info{mail = Mails} = role_api:get_user_data(),
%         MailInfo = lists:keyfind(MailId, #mail.id, Mails#mails.all),
%         if MailInfo == false ->
%             throw({msg, ?MAIL_PARAMS_ERROR1, ClientSender});
%             true -> ok
%         end,

%         if MailInfo#mail.state /= ?MAILING_NEW ->
%             throw({msg, ?MAIL_PARAMS_ERROR2, ClientSender});
%             true -> ok
%         end,

%         NewMailInfo = MailInfo#mail{state=?MAILING_READ},
%         NewMails = Mails#mails{all=lists:keyreplace(MailId, #mail.id, Mails#mails.all, NewMailInfo)},
%         game_info:update(NewMails),
%         mail_db:update(NewMailInfo),
%         ClientSender ! {send, #m__system__notify__s2c{code=?MAILING_READ_SUCESS}}
%      end,
%     ?PERFORM(F).

% get_attachment(#m__mail__get_attachment__c2s{mail_id=OldMailId}, ClientSender) ->
%     F = fun() ->
%         MailId = util:to_binary(OldMailId),
%         #game_info{mail = Mails} = role_api:get_user_data(),
%         MailInfo = lists:keyfind(util:to_binary(MailId), #mail.id, Mails#mails.all),
%         if MailInfo == false ->
%             throw({msg, ?MAIL_PARAMS_ERROR3, ClientSender});
%             true -> ok
%         end,

%         if MailInfo#mail.state == ?MAILING_ALREADY_GET ->
%             throw({msg, ?MAIL_PARAMS_ERROR4, ClientSender});
%             true -> ok
%         end,

%         NewMailInfo = MailInfo#mail{state=?MAILING_ALREADY_GET},
%         NewMails = Mails#mails{all=lists:keyreplace(MailId, #mail.id, Mails#mails.all, NewMailInfo)},
%         role_api:get_award(string:tokens(util:to_list(MailInfo#mail.attachments), ","), ?CURR_MODE_FUNC, ClientSender),
%         game_info:update(NewMails),
%         mail_db:update(NewMailInfo),
%         ClientSender ! {send, #m__system__notify__s2c{code=?MAILING_GET_ATTACHMENT}}
%     end,
%     ?PERFORM(F).


% delete(#m__mail__delete__c2s{mail_id=OldMailId}, ClientSender) ->
%     F = fun() ->
%         MailId = util:to_binary(OldMailId),
%         #game_info{mail = Mails} = role_api:get_user_data(),
%         MailInfo = lists:keyfind(MailId, #mail.id, Mails#mails.all),
%         if MailInfo == false ->
%             throw({msg, ?MAIL_PARAMS_ERROR5, ClientSender});
%             true -> ok
%         end,

%         if MailInfo#mail.state == ?MAILING_DELETE ->
%             throw({msg, ?MAIL_PARAMS_ERROR6, ClientSender});
%             true -> ok
%         end,

%         NewMailInfo = MailInfo#mail{state=?MAILING_DELETE},
%         NewMails = Mails#mails{all=lists:keyreplace(MailId, #mail.id, Mails#mails.all, NewMailInfo)},
%         game_info:update(NewMails),
%         mail_db:update(NewMailInfo),
%         ClientSender ! {send, #m__system__notify__s2c{code=?MAILING_DELETE_SUCESS}}
%     end,
%     ?PERFORM(F).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% send_mail(IdList, Title, Msg, Type, Attachments) ->
%     ?DEBUG_MSG("send mail:~p~n", [{IdList, Title, Msg, Type, Attachments}]),
%     F = fun(RoleId) ->
%         %MailCounts = erlang:length(Attachments) div ?MAIL_MAX_ATTACHMENTS_COUNT + 1,
%         %AttachLists = [lists:sublist(Attachments, X, ?MAIL_MAX_ATTACHMENTS_COUNT) || X <- lists:seq(1, MailCounts)],
%         Attachs = Attachments,

%         %[begin
%                     Data = #mail{
%                         id = id_srv:gen_mail_id(),
%                         role_id = RoleId,
%                         state = ?MAILING_NEW,
%                         type = Type,
%                         title = Title,
%                         msg = Msg,
%                         attachments = Attachs,
%                         create_time = util:unixtime(),
%                         read_time = 0
%                     },
%                     mail_db:update(Data),
%          %   end
%          %   || Attachs <- AttachLists],
%         Pid = goddess_misc:get_role_pid(RoleId),
%         case Pid of
%             false -> false;
%             _ -> Pid ! {process, mail_api, reload_mails, []}
%         end
%     end,
%     [F(X) || X <- IdList].

% reload_mails(ClientSender) ->
%     #game_info{role=Role} = role_api:get_user_data(),
%     NewMails = mail_db:get(Role#role.role_id),
%     game_info:update(NewMails),
%     ClientSender ! {send, #m__system__notify__s2c{code=?MAILING_HAS_NEW}}.

% %% 清理10天内的
% clean_mail() ->
%     mail_db:delete().

% open_function(_FuncId) ->
%     ok.


% handle_throw({msg, Code, Sender}) -> notify(Code, Sender);
% handle_throw(ignore) -> ok;
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
