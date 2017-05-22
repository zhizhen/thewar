-module(main_character_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(10001) ->
    #main_character_cfg{
        job=10001,
        speed=8,
        base_critical_attack_chance=0.05,
        base_critical_defense_chance=0.0,
        base_resist_chance=0.0,
        base_attack_chance=0.1,
        base_penetration_chance=0.0,
        physic_attack_factor=1.4,
        skill_attack_factor=1.3,
        physic_defence_factor=1.3,
        skill_defence_factor=1.2};

get(10002) ->
    #main_character_cfg{
        job=10002,
        speed=8,
        base_critical_attack_chance=0.05,
        base_critical_defense_chance=0.0,
        base_resist_chance=0.15,
        base_attack_chance=0.0,
        base_penetration_chance=0.0,
        physic_attack_factor=1.5,
        skill_attack_factor=1.0,
        physic_defence_factor=1.85,
        skill_defence_factor=1.7};

get(10003) ->
    #main_character_cfg{
        job=10003,
        speed=8,
        base_critical_attack_chance=0.1,
        base_critical_defense_chance=0.0,
        base_resist_chance=0.0,
        base_attack_chance=0.0,
        base_penetration_chance=0.0,
        physic_attack_factor=1.25,
        skill_attack_factor=1.35,
        physic_defence_factor=1.2,
        skill_defence_factor=1.0};

get(10004) ->
    #main_character_cfg{
        job=10004,
        speed=8,
        base_critical_attack_chance=0.05,
        base_critical_defense_chance=0.0,
        base_resist_chance=0.0,
        base_attack_chance=0.15,
        base_penetration_chance=0.0,
        physic_attack_factor=1.0,
        skill_attack_factor=1.8,
        physic_defence_factor=1.0,
        skill_defence_factor=1.2};

get(_) -> false.


