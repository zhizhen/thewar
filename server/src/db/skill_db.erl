%% Copyright
-module(skill_db).
-include("table_record.hrl").
-include("table_etc.hrl").
-include("logger.hrl").
-include("common.hrl").

-define(DATA_VERSION, 1).

%% API
-export([create/0, get/1, add/1, update/1, save/1]).

create() -> ok.

get(RoleId) ->
    Template = <<"select * from skills where role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_skills_data(Rows).

% todo check does {roleid, skillid} already exist?
add(Skill) ->
    NewSkill = Skill#skill{affix = serialize_affix(Skill#skill.affix), skills = serialize_spell(Skill#skill.skills)},
    Query = ?FILTER_SQL(?update_skill_sql, ?TAIL(NewSkill)),
    mysql_db:update(Query).

update(Skill) ->
    NewSkill = Skill#skill{affix = serialize_affix(Skill#skill.affix), skills = serialize_spell(Skill#skill.skills)},
    Query = ?FILTER_SQL(?update_skill_sql, ?TAIL(NewSkill)),
    mysql_db:update(Query).

save(#skills{all=All}) ->
    lists:foreach(fun(Skill) -> update(Skill) end, All).

%% internal
build_skills_data(Rows) ->
    All = [build_skill_data(Row) || Row <- Rows],
    #skills{all=All}.

build_skill_data([RoleId, SkillId, Level, Slot, Affix, Spells]) ->
    #skill{
        role_id=RoleId, 
        skill_id=SkillId, 
        level=Level, 
        slot=Slot,
        affix = deserialize_affix(Affix),
        skills = deserialize_spell(Spells, SkillId)
    }.


%% 序列化和反序列化
serialize_affix([]) -> "";
serialize_affix(L) ->
    S = string:join([begin
                    string:join([util:to_list(Id), util:to_list(Value)], "-")
            end || {Id, Value} <- L], ","),
    util:to_list(?DATA_VERSION) ++ "," ++ S.

deserialize_affix(S) ->
    case string:tokens(util:to_list(S), ",") of
        [] -> [];
        [DataVersion|SList] ->
            diff_version_deserialize(util:to_integer(DataVersion), SList)
    end.

diff_version_deserialize(?DATA_VERSION, SList) ->
    F = fun(X) ->
        S2 = re:split(X, "-", [{return, list}]),
        [Id, Value] = [util:to_integer(Y) ||Y<-S2],
        {Id, Value}
    end,
    [F(X)||X<-SList].

serialize_spell([]) -> "";
serialize_spell(L) ->
    S = string:join([begin
                    string:join([util:to_list(X#spell.spell_id), util:to_list(X#spell.level)], "-")
            end || X <- L], ","),
    util:to_list(?DATA_VERSION) ++ "," ++ S.

deserialize_spell(S, SkillId) ->
    case string:tokens(util:to_list(S), ",") of
        [] -> [];
        [DataVersion|SList] ->
            diff_version_deserialize(util:to_integer(DataVersion), SList, SkillId)
    end.

diff_version_deserialize(?DATA_VERSION, SList, SkillId) ->
    F = fun(X) ->
        S2 = re:split(X, "-", [{return, list}]),
        [SpellId, Level] = [util:to_integer(Y) ||Y<-S2],
        #spell{skill_id = SkillId, spell_id = SpellId, level = Level}
    end,
    [F(X)||X<-SList].

