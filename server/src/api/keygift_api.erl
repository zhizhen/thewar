%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-12-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(keygift_api).
% -include("game_pb.hrl").
% -include("cfg_record.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("logger.hrl").
% -include("msg_code.hrl").
% -include("common.hrl").

% %% API
% -export([get/2]).
% -export([open_function/0, handle_throw/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================

% %%--------------------------------------------------------------------
% %% @doc
% %% @spec
% %% @end
% %%--------------------------------------------------------------------
% get(#m__keygift__get__c2s{key=Key}, Sender) ->
%     Fun = fun() ->
%         #game_info{role=Role} = role_api:get_user_data(),
%         Already = keygift_db:get(Key, Role#role.role_id) == [],
%         guard(Already, ?KEYGIFT_ALREADY_GET, Sender),

%         Len = string:len(Key) =:= 13,
%         guard(Len, ?KEYGIFT_NOT_EXIST, Sender),

%         KeyGift = keygift_db:get_by_key(Key),
%         Used = KeyGift /= [],
%         guard(Used, ?KEYGIFT_USED, Sender),

%         Items = KeyGift#keygift.items,
%         mail_srv:send_mail([Role#role.role_id], "system_award_keygift", "system_award_keygift", ?MAILING_TYPE_AWARD, Items),
%         keygift_db:save(KeyGift#keygift{role_id = Role#role.role_id}),
%         Sender ! {send, #m__system__notify__s2c{code = ?KEYGIFT_GET_SUCC}}
%     end,
%     ?PERFORM(Fun).

% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% guard(false, Code, Sender) -> throw({msg, Code, Sender});
% guard(_, _, _) -> ok.

% open_function() -> ok.

% handle_throw({msg, Code, Sender}) ->
%     Sender ! {send, #m__system__notify__s2c{code = Code}};
% handle_throw({ignore}) ->
%     ok;
% handle_throw(Reason) ->
%     throw(Reason).

