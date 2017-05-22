%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2014, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2014-7-2 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(treasure_mod).
% -include("common.hrl").
% -include("logger.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("cfg_record.hrl").
% -include("msg_code.hrl").

% %% API
% -export([build_p_treasure/1, build_p_treasures/1, build_guarders/1, random_treasure/0, build_p_log/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% build_p_treasure(false) -> 
%     #p_treasure{
%         id = 0,
%         role_id = "",
%         treasure_id = 0,
%         time = 0,
%         explore_time = 0,
%         guarders = []
%     };
% build_p_treasure(Treasure) ->
%     Time = case Treasure#treasure.guarders of 
%         [] -> 0;
%         L -> lists:min([X#treasure_guarder.start || X <- L])
%     end,
%     #p_treasure{
%         id = Treasure#treasure.id,
%         role_id = Treasure#treasure.role_id,
%         treasure_id = Treasure#treasure.treasure_id,
%         time = Time,
%         explore_time = Treasure#treasure.explore_time,
%         guarders = build_guarders(Treasure#treasure.guarders)
%     }.

% build_p_treasures(Treasures) ->
%     [build_p_treasure(X) || X <- Treasures].

% build_guarders(Guarders) ->
%     F = fun(X) ->
%             RoleId = X#treasure_guarder.role_id,
%             RoleWarrior = warrior_db:get_role(RoleId),
%             Strength = RoleWarrior#role_warrior.strength,

%             Idx = X#treasure_guarder.idx,
%             Warrior = warrior_db:get_one(RoleId, Idx),
%             if Warrior =:= false -> ?ERROR_MSG("warrior not in db:~p~n", [{RoleId, Idx}]); true -> ok end,
%             #p_treasure_guarder{
%                 role_id = RoleId,
%                 role_name = X#treasure_guarder.role_name,
%                 level = X#treasure_guarder.level,
%                 warrior = warrior_api:build_p_warrior_info(Warrior, Strength)
%             }
%     end,
%     [F(X) || X <- Guarders].

% build_p_log(L = #loot_log{}) ->
%     #p_treasure_log{
%         looter_name = L#loot_log.looter_name,
%         time = L#loot_log.time,
%         start_time = L#loot_log.start_time,
%         treasure_id = L#loot_log.treasure_id,
%         result = L#loot_log.result
%     }.

% random_treasure() ->
%     All = treasure_cfg:get_all(),
%     Cfgs = [treasure_cfg:get(X) || X <- All],
%     random_item(Cfgs).

% random_item([]) -> false;
% random_item(SItems) ->
%     T = lists:sum([ R || #treasure_cfg{rate = R} <- SItems]),
%     R = rand_srv:random(T),
%     find_out(R, SItems, 0).

% find_out(R, [#treasure_cfg{rate=Rate} = Item|_Rest], T) when R >= T, R =< T + Rate -> 
%     Item;
% find_out(R, [#treasure_cfg{rate=Rate}|Rest], T) -> 
%     find_out(R, Rest, T + Rate).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
