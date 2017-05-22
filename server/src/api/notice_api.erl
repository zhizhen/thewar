%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-9-26 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(notice_api).

% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("logger.hrl").
% -include("common.hrl").

% %% API
% -export([list/2]).
% %% GM
% -export([build_p_notices/1]).
% %-export([test/0]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %% @doc 所有系统通知
% list(#m__notice__list__c2s{}, Sender) ->
%     Notices = notice_srv:get_notices(),

%     Data = #m__notice__list__s2c{notices = build_p_notices(Notices#notices.all)},
%     Sender ! {send, Data}.


% build_p_notices(Notices) ->
%     Fun = fun(Notice)->
%         #p_notice{
%             id = Notice#notice.id,
%             type = Notice#notice.type,
%             created_at = Notice#notice.created_at,
%             started_at = Notice#notice.started_at,
%             expired_at = Notice#notice.expired_at,
%             title = Notice#notice.title,
%             msg = Notice#notice.msg,
%             show_interval = Notice#notice.show_interval
%         }
%     end,
%     [Fun(Notice) || Notice <- Notices].


