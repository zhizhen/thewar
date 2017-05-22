%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(skill_mod).
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("cfg_record.hrl").
% -include("logger.hrl").

% %% API
% -export([build_p_skills/1, build_p_skill_detail/1, build_p_affix/1, update_spell/2]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% build_p_skills(Skills) ->
%     Len = erlang:length(Skills#skills.all),
%     Slots = 
%     if Len < 3 ->
%         [X#skill.skill_id || X <- Skills#skills.all] ++ [0 || _<- lists:seq(1, 3 - Len)];
%     true ->
%         [X#skill.skill_id || X <- Skills#skills.all]
%     end,
%     Affix = [skill_mod:build_p_skill_detail(X) || X <- Skills#skills.all],
%     #p_skill{slots = Slots, affix = Affix}.

% build_p_skill_detail(Skill) ->
%     #p_skill_detail{
%         skill_id = Skill#skill.skill_id,
%         level = Skill#skill.level,
%         aff = [build_p_affix(X) || X <- Skill#skill.affix ++ Skill#skill.skills]
%     }.

% build_p_affix(#spell{spell_id = Id, level = Num}) -> #p_affix{id = Id, num = Num};
% build_p_affix({Id, Num}) -> #p_affix{id = Id, num = Num}.

% update_spell([], _) -> false;
% update_spell(Spell, Skill) ->
%     case spell_cfg:get({Spell#spell_random.id, 1}) of
%         #spell_cfg{} ->
%             case lists:keyfind(Spell#spell_random.id, #spell.spell_id, Skill#skill.skills) of
%                 false -> 
%                     Spell1 = #spell{
%                         skill_id = Skill#skill.skill_id,
%                         spell_id = Spell#spell_random.id,
%                         level = Spell#spell_random.value
%                     },
%                     Affix = {Spell1#spell.spell_id, Spell1#spell.level},
%                     {Affix, Skill#skill{level = Skill#skill.level + 1, skills = Skill#skill.skills ++ [Spell1]}};
%                 _ -> 
%                     ?INFO_MSG("=========Spell Cfg Error:repeat spell.~p======", [Spell#spell_random.id])
%             end;
%         _ -> ?INFO_MSG("=========Spell Cfg Error:~p======", [Spell])
%     end.

