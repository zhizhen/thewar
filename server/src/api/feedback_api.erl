%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-27 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(feedback_api).
% -include("game_pb.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% -export([submit/2, list/2]).
% -export([admin_reply/2]).  %reply/1]).
% -export([handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %% @doc 玩家提交反馈
% submit(#m__feedback__submit__c2s{type=Type, content=Content}, Sender) ->
%     F = fun() ->
%         len_guard(Content, Sender),
%         type_guard(util:to_integer(Type), Sender),
%         GameInfo = role_api:get_user_data(),
%         Role = GameInfo#game_info.role,
%         FeedBack = make_feedback(Role, Type, Content),
%         feedback_db:save(FeedBack),
%         notify(?FEEDBACK_SUBMIT_SUCC, Sender)
%     end,
%     ?PERFORM(F).

% %% @doc 获取最新的20条反馈
% list(#m__feedback__list__c2s{}, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     FeedBacks = feedback_db:get_last(Role#role.role_id),
%     Msg = #m__feedback__list__s2c{
%         feedbakcs = [build_p_feedback(I) || I <- FeedBacks]
%     },
%     Sender ! {send, Msg}.


% %%%===================================================================
% %%% INTERNAL API
% %%%===================================================================

% %% http callback
% %% @doc 给指定id 回复反馈邮件
% %% admin_reply(Id) ->
% %%     case feedback_db:get_reply_data(Id) of
% %%         [] -> ok;
% %%         [Id, RoleId, Content] ->
% %%             Title = <<"反馈回复">>,
% %%             mail_api:send_mail([RoleId], Title, Content, ?MAILING_TYPE_BULLETIN, ""),
% %%             feedback_db:update_reply(Id)
% %%     end.

% admin_reply(Id2, Content) ->
%     Id = util:to_integer(Id2),
%     case feedback_db:get(Id) of
%         [] -> ok;
%         #feedback{role_id=RoleId} = Feedback ->
%             New = Feedback#feedback{state=?YES, reply_content=Content, reply_time=?NOW},
%             feedback_db:update_reply(Id, Content, ?NOW),
%             case goddess_misc:get_role_pid(RoleId) of
%                 false -> false;
%                 Pid ->
%                     % 最简单的做法,先不考虑性能
%                     Last = feedback_db:get_last(RoleId),
%                     case lists:keyfind(Id, #feedback.id, Last) of
%                         false ->
%                             M = #m__feedback__list__s2c{
%                                 feedbakcs = [ build_p_feedback(I) || I <- [New | Last]]
%                             },
%                             Pid ! {send, M};
%                         _ ->
%                             M = #m__feedback__list__s2c{
%                                 feedbakcs = [ build_p_feedback(I) || I <- Last]
%                             },
%                             Pid ! {send, M}
%                     end
%             end
%     end.


% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% len_guard(Content, Sender) ->
%     case erlang:length(Content) < 6 of
%         true -> throw({msg, ?FEEDBACK_SUBMIT_FAIL, Sender});
%         _ -> ok
%     end.

% type_guard(T, Sender) ->
%     case lists:member(T, [1,2,3]) of
%         false -> throw({msg, ?FEEDBACK_SUBMIT_FAIL, Sender});
%         _ -> ok
%     end.

% make_feedback(Role, Type, Content) ->
%     LocalTime = erlang:localtime(),
%     #feedback{
%     type = Type,
%     server_id = util:to_list(goddess_env:server_id()),
%     role_id = Role#role.role_id,
%     role_name = Role#role.role_name,
%     content = Content,
%     time = util:datetime_to_timestamp(LocalTime),
%     date = date_str(LocalTime)
%     }.

% build_p_feedback(#feedback{type=Type, time=Time, content=Content, reply_content=ReplyContent, reply_time=T})->
%     #p_feedback{
%         type=Type,
%         time=Time,
%         question=Content,
%         reply=ReplyContent,
%         state = if T /= 0 -> ?YES; true -> ?NO end  % 根据回复时间来决定时候已经解决
%     }.

% date_str({{Y, M, D}, {H, Mi, S}}) ->
%     lists:concat([Y, '-', M, '-', D, ' ', H, ':', Mi, ':', S]).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.

% %% callback
% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw(Reason) ->
%     throw(Reason).
