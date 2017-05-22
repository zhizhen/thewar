%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-14 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(rank_api).
% -include("game_pb.hrl").
% -include("common.hrl").
% -include("msg_code.hrl").
% -include("logger.hrl").
% -include("table_etc.hrl").
% -include("table_record.hrl").
% -include("cfg_record.hrl").

% %% PROTO API
% -export([info/2]).

% %% PROCESS API
% -export([get/1, get/3, open_function/1, rank_title/0, add_title/3]).
% %%%===================================================================
% %%% PROTO API
% %%%===================================================================
% info(#m__rank__info__c2s{len = Len}, Sender) when Len > ?RANK_DEFAULT_NUM ->
%     Sender ! {send, #m__system__notify__s2c{code=?RANK_NUM_TOO_HIGH}};
% info(#m__rank__info__c2s{type = Type, start = Start, len = Len}, Sender) ->
%     #game_info{role = Role} = role_api:get_user_data(),
%     RoleId = Role#role.role_id,
%     Ranks = rank_api:get(Type, Start, Len),
%     Pranks = rank_mod:build_p_rank(Ranks, Start),
%     Now = util:unixtime(),
%     Left = case rank_api:get({last_fresh_point, Type}) of
%         [] -> 0;
%         L -> L + rank_mod:get_rank_frequency(Type) div 1000 - Now
%     end,
%     My = get_my_rank(RoleId, Type),
%     Data = #m__rank__info__s2c{time = Left, myrank = My, ranks = Pranks},
%     Sender ! {send, Data}.

% %%%===================================================================
% %%% PROCESS API
% %%%===================================================================
% get(_, 0, _) -> [];
% get(Type, Start, Len) ->
%     case rank_api:get(Type) of
%         [] -> [];
%         A ->
%             case Start > erlang:length(A) of
%                 true -> [];
%                 false -> lists:sublist(A, Start, Len)
%             end

%     end.

% get(Type) ->
%     case ets:lookup(?ETS_RANK, Type) of
%         [] -> [];
%         [{Type, L}|_] -> L
%     end.
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% get_my_rank(RoleId, Type) ->
%     Ranks = rank_api:get(Type, 1, ?RANK_MAX_NUM),
%     Pranks = rank_mod:build_p_rank(Ranks, 1),

%     case lists:keyfind(RoleId, #p_rank.role_id, Pranks) of
%         false -> 0;
%         Prank -> Prank#p_rank.rank
%     end.

% open_function(_FuncId) ->
%     ok.

% rank_title() ->
%     Ranks = rank_api:get(?RANK_TYPE_FIGHT, 1, 1),
%     case Ranks of
%         [] -> ok;
%         [First|_] -> 
%             mail_srv:send_mail([First#rank.role_id], "system_award_fight_rank_one", "system_award_fight_rank_one", ?MAILING_TYPE_BULLETIN, ""),
%             add_title(First#rank.role_id, ?FIGHT_RANK1, fight_rank1)
%     end,

%     Ranks1 = rank_api:get(?RANK_TYPE_ARENA, 1, 10),
%     case Ranks1 of
%         [] -> ok;
%         [ArenaFirst|Rest] -> 
%             mail_srv:send_mail([ArenaFirst#rank.role_id], "system_award_arena_rank_one", "system_award_arena_rank_one", ?MAILING_TYPE_BULLETIN, ""),
%             add_title(ArenaFirst#rank.role_id, ?ATHEN_RANK1, athen_rank1),
%             lists:map(fun(R)-> 
%                         mail_srv:send_mail([R#rank.role_id], "system_award_arena_rank2_20", "system_award_arena_rank2_20", ?MAILING_TYPE_BULLETIN, ""),
%                         add_title(R#rank.role_id, ?ATHEN_RANK2, athen_rank2)
%                     end, Rest)
%     end.

% add_title(RoleId, TitleId, FunName) ->
%      case goddess_misc:get_role_pid(RoleId) of
%         false ->
%             Title_Cfg = title_cfg:get(TitleId),
%             ValidTime = 
%                 case Title_Cfg#title_cfg.status > 0 of
%                     true -> ?NOW + Title_Cfg#title_cfg.valid_time;
%                     false -> 0
%                 end,
%             Title = #title{role_id = RoleId, title_id = TitleId, hold_time = ValidTime},
%             IsHave = title_db:get_by_id(TitleId, RoleId),
%             case IsHave of
%                 false -> title_db:add(Title);
%                 _ -> title_db:update(Title)
%             end;
%         Pid -> Pid ! {process, title_api, FunName, []}
%     end.

