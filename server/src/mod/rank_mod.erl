%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-14 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(rank_mod).
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("table_etc.hrl").
% %% API
% -export([build_p_rank/2, get_rank_frequency/1, get_rank_num/1]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% build_p_rank(Ranks, Start) ->
%     build_p_rank(Ranks, [], Start).
% build_p_rank([], L, _) ->
%     lists:reverse(L);
% build_p_rank([Rank|Rest], L, Index) ->
%     Prank = #p_rank{
%         rank = Index,
%         role_id = Rank#rank.role_id,
%         name = Rank#rank.role_name,
%         level = Rank#rank.level,
%         fight = Rank#rank.fight,
%         title = Rank#rank.title,
%         honor = Rank#rank.honor,
%         charm = Rank#rank.charm
%     },
%     build_p_rank(Rest, [Prank|L], Index + 1).

% get_rank_frequency(?RANK_TYPE_LEVEL) -> ?LEVEL_FREQUENCY;
% get_rank_frequency(?RANK_TYPE_FIGHT) -> ?FIGHT_FREQUENCY;
% get_rank_frequency(?RANK_TYPE_ARENA) -> ?ARENA_FREQUENCY;
% get_rank_frequency(?RANK_TYPE_HONOR) -> ?HONOR_FREQUENCY;
% get_rank_frequency(?RANK_TYPE_CHARM) -> ?CHARM_FREQUENCY;
% get_rank_frequency(_) -> ?RANK_DEFAULT_FREQUENCY.

% get_rank_num(?RANK_TYPE_LEVEL) -> ?LEVEL_NUM;
% get_rank_num(?RANK_TYPE_FIGHT) -> ?FIGHT_NUM;
% get_rank_num(?RANK_TYPE_ARENA) -> ?ARENA_NUM;
% get_rank_num(?RANK_TYPE_HONOR) -> ?HONOR_NUM;
% get_rank_num(?RANK_TYPE_CHARM) -> ?CHARM_NUM;
% get_rank_num(_) -> ?RANK_DEFAULT_NUM.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================

