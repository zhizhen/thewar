%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(arena_mod).

% -include("logger.hrl").
% -include("common.hrl").
% -include("game_pb.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").

% %% API
% -export([
%     build_logs/1,
%     build_challengers/1 ,
%     add_awards/2,
%     get_cfg_by_rank/1,
%     build_computer/0,
%     random_arena_challenger/1,
%     random_role_name/0
% ]).

% %%%============================================================================
% %%% API
% %%%============================================================================

% build_logs(Logs) ->
%     F = fun(Log) ->
%         #p_arena_logs{
%             type = Log#arena_log.type,
%             success = Log#arena_log.success,
%             pk_time = Log#arena_log.pk_time,
%             my_rank = Log#arena_log.my_rank,
%             my_level = Log#arena_log.my_level,
%             rival_role_id = Log#arena_log.rival_role_id,
%             rival_role_name = Log#arena_log.rival_role_name,
%             rival_rank = Log#arena_log.rival_rank,
%             rival_job = Log#arena_log.rival_job
%         }
%     end,
%     [F(X) || X <- Logs].

% build_challengers(Challengers) ->
%     F = fun(Challenger) ->
%         #p_arena_info{
%             rank = Challenger#sys_arena_rank.rank,
%             role_id = Challenger#sys_arena_rank.role_id,
%             role_name = Challenger#sys_arena_rank.role_name,
%             job = Challenger#sys_arena_rank.job,
%             armor = Challenger#sys_arena_rank.armor,
%             level = Challenger#sys_arena_rank.level,
%             type = Challenger#sys_arena_rank.type,
%             total_gold = Challenger#sys_arena_rank.total_gold,
%             total_honor = Challenger#sys_arena_rank.total_honor,
%             total_exp = Challenger#sys_arena_rank.total_exp,
%             daily_times = 0,
%             add_times = 0,
%             fight = Challenger#sys_arena_rank.fight
%         }
%     end,
%     [F(X) || X <- Challengers].


% get_cfg_by_rank(Rank) ->
%     AllIds = rank_award_cfg:get_all(),
%     CfgId = lists:max([Id || Id <- AllIds, Id =< Rank]),
%     rank_award_cfg:get(CfgId).


% add_awards(AllInfo, 0) ->
%     AllInfo;
% add_awards(AllInfo, Num) ->
%     NewAllInfo = add_award(AllInfo, AllInfo),
%     add_awards(NewAllInfo, Num-1).

% add_award(AllInfo, []) ->
%     AllInfo;

% add_award(AllInfo, [RankInfo|RankInfos]) ->
%     Cfg = get_cfg_by_rank(RankInfo#sys_arena_rank.rank),
%     NewRankInfo = RankInfo#sys_arena_rank{
%         total_gold = RankInfo#sys_arena_rank.total_gold + Cfg#rank_award_cfg.gold,
%         total_honor = RankInfo#sys_arena_rank.total_honor + Cfg#rank_award_cfg.honor,
%         total_exp = RankInfo#sys_arena_rank.total_exp + Cfg#rank_award_cfg.exp
%     },
%     NewAllInfo = lists:keyreplace(RankInfo#sys_arena_rank.rank, #sys_arena_rank.rank, AllInfo, NewRankInfo),
%     add_award(NewAllInfo, RankInfos).

% build_computer() ->
%     {Job, _} = rand_srv:random_list(arena_virtual_role_cfg:get_all()),
%     #sys_arena_rank{
%         rank = id_srv:gen_arena_rank(),
%         role_id = "0",
%         role_name = random_role_name(),
%         job = Job,
%         armor = 0,
%         level = ?ARENA_COMPUTER_INIT_LEVEL,
%         type = ?ARENA_COMPUTER,
%         total_gold = 0,
%         total_honor = 0,
%         total_exp = 0
%     }.

% random_role_name() ->
%     FamilyNameCfg = role_family_name_cfg:get(rand_srv:random_list(role_family_name_cfg:get_all())),
%     FamilyName = FamilyNameCfg#role_family_name_cfg.char,
%     NameCfg = role_name_cfg:get(rand_srv:random_list(role_name_cfg:get_all())),
%     Name = NameCfg#role_name_cfg.char,
%     Extension = string:concat(".s", util:to_list(goddess_env:server_id())),
%     lists:concat([util:to_list(Name), util:to_list(FamilyName), util:to_list(Extension)]).


% random_arena_challenger(Rank) ->
%     if
%         Rank =< 5 ->
%             lists:delete(Rank, lists:seq(1, 6));
%         Rank =< 100 ->
%             lists:seq(Rank-5, Rank-1);
%         Rank =< 500 ->
%             rand_srv:random_list(5, lists:seq(Rank-10, Rank-1));
%         Rank =< 1000 ->
%             rand_srv:random_list(5, lists:seq(Rank-20, Rank-1));
%         Rank > 1000 ->
%             rand_srv:random_list(5, lists:seq(Rank-50, Rank-1));
%         true ->
%             []
%     end.

