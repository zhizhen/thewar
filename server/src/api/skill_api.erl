%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-7-4 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(skill_api).
% -include("table_record.hrl").
% -include("table_etc.hrl").
% -include("game_pb.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").
% -include("common.hrl").
% -include("logger.hrl").

% %% API
% -export([add/2, learn/2, improve/2]).
% -export([open_function/1]).
% -export([skill_info/2, spell_info/2]).

% -export([handle_throw/1]).

% %% Internal API

% %%%===================================================================
% %%% API
% %%%===================================================================

% add(SkillId, Sender) ->
%     GameInfo = role_api:get_user_data(),
%     Role = GameInfo#game_info.role,
%     Job = Role#role.job,
%     Skills = GameInfo#game_info.skills,
%     All = Skills#skills.all,
%     case skill_cfg:get({SkillId, 0, Job}) of
%         false -> false;
%         SkillCfg ->
%             case skill_info(GameInfo, SkillId) of
%                 false ->
%                     Skill = #skill{
%                         role_id = Role#role.role_id,
%                         skill_id = SkillId,
%                         level = 0,
%                         slot = erlang:length(All) + 1,
%                         affix =[],
%                         skills = []
%                     },
%                     case skill_mod:update_spell(SkillCfg#skill_cfg.spells, Skill) of
%                         false -> false;
%                         {_Affix, Skill1} ->            
%                             skill_db:add(Skill1),
%                             game_info:update(Skills#skills{all = All ++ [Skill1]}),
 
%                             quest_api:add_quest_process(?QUEST_EVENT_TYPE_STUDY_SKILL, SkillId, 1),     % 更新任务进度
%                             quest_api:add_quest_process(?QUEST_EVENT_TYPE_STUDY_ALL_SKILL, 0, 1),     % 更新任务进度

%                             Pdetail = skill_mod:build_p_skill_detail(Skill1),
%                             Sender ! {send, #m__skill__add__s2c{slot = Skill1#skill.slot, skill = Pdetail}}
%                     end;
%                 _ -> false
%             end
%     end.

% %% @doc 技能领悟
% learn(#m__skill__learn__c2s{skill_id=SkillId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         #role{job=Job} = GameInfo#game_info.role,

%         Skills = GameInfo#game_info.skills,
%         All = Skills#skills.all,
        
%         Skill = skill_info(GameInfo, SkillId),
%         guard(Skill, Sender),

%         SkillCfg = skill_cfg:get({SkillId, Skill#skill.level, Job}),
%         cfg_guard(SkillCfg, Sender),
        
%         H = role_api:is_enough_feats(SkillCfg#skill_cfg.cost),
%         G = role_api:is_enough_gold(SkillCfg#skill_cfg.gold),
%         C = H andalso G,
%         guard(C, Sender),
%         case skill_mod:update_spell(SkillCfg#skill_cfg.spells, Skill) of
%             false -> 
%                 guard(false, Sender);
%             {Affix, Skill1} ->
%                 guard(Skill1, Sender),

%                 role_api:minus_feats(SkillCfg#skill_cfg.cost, Sender),
%                 role_api:pay_gold(SkillCfg#skill_cfg.gold, Sender),

%                 Skills1 = Skills#skills{all=lists:keyreplace(SkillId, #skill.skill_id, All, Skill1)},

%                 game_info:update(Skills1),

%                 quest_api:add_quest_process(?QUEST_EVENT_TYPE_IMPROVE_SKILL, SkillId, 1),     % 更新任务进度
%                 quest_api:add_quest_process(?QUEST_EVENT_TYPE_IMPROVE_ALL_SKILL, 0, 1),     % 更新任务进度

%                 Paffix = skill_mod:build_p_affix(Affix),
%                 Sender ! {send, #m__skill__learn__s2c{aff = Paffix}}
%         end
%     end,
%     ?PERFORM(F).

% %% @doc 招式精炼
% improve(#m__skill__improve__c2s{spell_id=SpellId}, Sender) ->
%     F = fun() ->
%         GameInfo = role_api:get_user_data(),
%         case spell_info(GameInfo, SpellId) of
%             false -> throw({msg, ?SKILL_NO_LEGAL1, Sender});
%             #spell{level=Level} = Spell ->
%                 % 客户端连续点击,不管它, 正常情况下, 到达满级后, 客户端就应该禁用
%                 NextCfg = spell_cfg:get({SpellId, Level+1}),
%                 cfg_guard2(NextCfg, Sender),
                
%                 Cfg = spell_cfg:get({SpellId, Level}),
%                 cfg_guard2(Cfg, Sender),

%                 RoleLevel = GameInfo#game_info.role#role.level,
%                 if NextCfg#spell_cfg.require_level > RoleLevel ->
%                     throw({msg, ?REQUIRE_LEVEL, Sender});
%                     true -> ok
%                 end,

%                 ConsumeGold = Cfg#spell_cfg.levelup_consume_gold,
%                 ConsumeFeat = Cfg#spell_cfg.levelup_consume_feat,
%                 case role_api:is_enough_gold(ConsumeGold) andalso role_api:is_enough_feats(ConsumeFeat) of
%                     false -> throw({msg, ?NO_MONEY, Sender});
%                     true -> ok
%                 end,

%                 NewSpell = Spell#spell{level=Level+1},
%                 Skills = GameInfo#game_info.skills,
    
%                 Skill = skill_info(GameInfo, Spell#spell.skill_id),
%                 Spells = lists:keyreplace(SpellId, #spell.spell_id, Skill#skill.skills, NewSpell),
%                 NewSkill = Skill#skill{skills = Spells},
%                 All = lists:keyreplace(Skill#skill.skill_id, #skill.skill_id, Skills#skills.all, NewSkill),
%                 game_info:update(Skills#skills{all=All}),
%                 %skill_db:update(NewSkill),

%                 role_api:pay_gold(ConsumeGold, Sender),
%                 role_api:minus_feats(ConsumeFeat, Sender),

%                 quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_SKILL, SpellId, 1),     % 更新任务进度
%                 quest_api:add_quest_process(?QUEST_EVENT_TYPE_UP_ALL_SKILL, 0, 1),     % 更新任务进度

%                 notify(?SKILL_LEVELUP_SUCC, Sender)
%         end
%     end,
%     ?PERFORM(F).

% %%%===================================================================
% %%% internal API
% %%%===================================================================
% %% @doc 查询玩家拥有的技能信息
% skill_info(GameInfo, SkillId) ->
%     Skills = GameInfo#game_info.skills,
%     lists:keyfind(SkillId, #skill.skill_id, Skills#skills.all).

% %% @doc 查询玩家拥有的招式信息
% spell_info(GameInfo, SpellId) ->
%     Skills = GameInfo#game_info.skills,
%     lists:keyfind(SpellId, #spell.spell_id, lists:concat([X#skill.skills || X <- Skills#skills.all])).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% open_function(FuncId) ->
%     #game_info{role = Role} = role_api:get_user_data(),
%     Job = Role#role.job,

%     case FuncId of
%         1015 -> case Job of
%                 10001 -> skill_api:add(120001, self());
%                 10002 -> skill_api:add(120004, self());
%                 10003 -> skill_api:add(120007, self())
%              end;
%         1053 -> case Job of
%                 10001 -> skill_api:add(120002, self());
%                 10002 -> skill_api:add(120005, self());
%                 10003 -> skill_api:add(120008, self())
%              end;
%         1054 -> case Job of
%                 10001 -> skill_api:add(120003, self());
%                 10002 -> skill_api:add(120006, self());
%                 10003 -> skill_api:add(120009, self())
%              end
%     end,
%     ok.

% cfg_guard(false, Sender) -> throw({msg, ?SKILL_NO_LEGAL2, Sender});
% cfg_guard(_, _) -> ok.

% cfg_guard2(false, _Sender) -> throw({ignore});
% cfg_guard2(_, _) -> ok.

% guard(false, Sender) -> throw({msg, ?SKILL_NO_LEGAL3, Sender});
% guard(_, _) -> ok.

% handle_throw({msg, Code, Sender}) ->
%     notify(Code, Sender);
% handle_throw({ignore}) ->
%     ok;
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, Sender) ->
%     Sender ! {send, #m__system__notify__s2c{code=Code}}.
