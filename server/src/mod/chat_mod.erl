%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-29 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(chat_mod).

% -include("common.hrl").
% -include("game_pb.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("logger.hrl").

% %% API
% -export([make_show_msg/2]).
% -export([make_msg/3, make_msg/2, make_msg/1, make_msg/4, make_msg/5]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% make_show_msg(TmpId, ChatContent) ->
%     make_msg(?CHAT_OTHER, TmpId, [], ChatContent).

% make_msg(Channel, ItemList, ChatContent) -> make_msg(Channel, 1, ItemList, ChatContent).
% make_msg(ItemList, ChatContent) -> make_msg(?CHAT_OTHER, 1, ItemList, ChatContent).
% make_msg(ChatContent) -> make_msg(?CHAT_OTHER, 1, [], ChatContent).

% make_msg(Channel, TplId, ItemList, ChatContent) ->
%     {L1, L2} = make_list(TplId, ChatContent),
%     #m__chat__chat__s2c{channel=Channel, tpl_id=TplId, list1=L1, list2=L2, list3=ItemList, interval=0}.

% make_msg(Channel, TplId, ItemList, ChatContent, SendInterval) ->
%     {L1, L2} = make_list(TplId, ChatContent),
%     #m__chat__chat__s2c{channel=Channel, tpl_id=TplId, list1=L1, list2=L2, list3=ItemList, interval=SendInterval}.

% make_list(TplId, #chat_content{}=C) ->
%     Cfg = chat_template_cfg:get(TplId),
%     Keys = Cfg#chat_template_cfg.keys,
%     lists:foldr(
%         fun(I, {A1, A2}) ->
%             E = erlang:element(I+1, C),
%             case erlang:is_tuple(E) of
%                 true ->
%                     E1 = erlang:element(2, E),
%                     E2 = erlang:element(3, E),
%                     {[E1|A1], [E2|A2]};
%                 false ->
%                     {[E|A1], A2}
%             end
%         end,{[], []}, Keys
%     ).




% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
