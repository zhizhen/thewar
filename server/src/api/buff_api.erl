%%%----------------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-19 by goddess <goddess@rekoo.com>
%%%----------------------------------------------------------------------------
-module(buff_api).

% -include("common.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").

% %% API
% -export([
%     add_buff/1,
%     remove_buff/1,
%     start_buff/0,
%     tick/1
% ]).

% add_buff(Buff) ->
%     #game_info{buff=Buffs} = role_api:get_user_data(),
%     NewBuffs = case lists:keyfind(Buff#buff.buff_id, #buff.buff_id, Buffs#buffs.all) of
%         false ->
%             Buffs#buffs{all=Buffs#buffs.all++[Buff]};
%         _ ->
%             Buffs#buffs{all=lists:keyreplace(Buff#buff.buff_id, #buff.buff_id, Buffs#buffs.all, Buff)}
%     end,
%     game_info:update(NewBuffs),
%     self() ! {change_tick_state, true}.

% remove_buff(BuffId) ->
%     #game_info{buff=Buffs} = role_api:get_user_data(),

%     Buff = lists:keyfind(BuffId, #buff.buff_id, Buffs#buffs.all),
%     case Buff of
%         false -> ok;
%         _ ->
%             NewBuffs = Buffs#buffs{all=lists:keydelete(BuffId, #buff.buff_id, Buffs#buffs.all)},
%             buff_db:delete(Buff),
%             game_info:update(NewBuffs)
%     end.


% %% @doc 创建buff
% start_buff() ->
%     #game_info{buff=Buffs} = role_api:get_user_data(),
%     case Buffs#buffs.all of
%         [] -> self() ! {change_tick_state, false};
%         _ -> self() ! {change_tick_state, true}
%     end.

% tick(State) ->
%     #game_info{buff=Buffs} = role_api:get_user_data(),
%     NewBuffList = route(Buffs#buffs.all, []),
%     game_info:update(Buffs#buffs{all=NewBuffList}),
%     case NewBuffList of
%         [] ->
%             case State of
%                 true -> self() ! {change_tick_state, false};
%                 false -> ok
%             end;
%         _ ->
%             case State of
%                 false -> self() ! {change_tick_state, true};
%                 true -> ok
%             end
%     end.


% route([], NewBuffs) -> NewBuffs;
% route([Buff|Buffs], NewBuffs) ->
%     NewBuff = case Buff#buff.buff_id of
%         ?OVERLEAP_BUFF_ID -> overleap_buff_api:tick(Buff);
%         _ -> delete
%     end,

%     case NewBuff of
%         delete ->
%             buff_db:delete(Buff),
%             route(Buffs, NewBuffs);
%         _ ->
%             route(Buffs, NewBuffs++[NewBuff])
%     end.
