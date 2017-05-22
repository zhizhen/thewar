%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mail_mod).

% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").

% %% API
% -export([
%     build_p_mail/1
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% build_p_mail(#mails{all=Mails}) ->
%     Fun = fun(X) ->
%         #p_mail{
%             id = X#mail.id,
%             role_id = X#mail.role_id,
%             title = X#mail.title,
%             state = X#mail.state,
%             type = X#mail.type,
%             msg = X#mail.msg,
%             attachments = X#mail.attachments,
%             create_time = X#mail.create_time,
%             read_time = X#mail.read_time
%         }
%         end,
%         [Fun(Mail) || Mail <- Mails].

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

