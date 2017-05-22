-module(skill_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({120001,0,10001}) ->
    #skill_cfg{
        skill_id=120001,
        level=0,
        job=10001,
        max=100,
        cost=0,
        gold=0,
        spells=#spell_random{id=110201,value=1}};

get({120001,1,10001}) ->
    #skill_cfg{
        skill_id=120001,
        level=1,
        job=10001,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110202,value=1}};

get({120001,2,10001}) ->
    #skill_cfg{
        skill_id=120001,
        level=2,
        job=10001,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110203,value=1}};

get({120001,3,10001}) ->
    #skill_cfg{
        skill_id=120001,
        level=3,
        job=10001,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110204,value=1}};

get({120002,0,10001}) ->
    #skill_cfg{
        skill_id=120002,
        level=0,
        job=10001,
        max=100,
        cost=0,
        gold=0,
        spells=#spell_random{id=110205,value=1}};

get({120002,1,10001}) ->
    #skill_cfg{
        skill_id=120002,
        level=1,
        job=10001,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110206,value=1}};

get({120002,2,10001}) ->
    #skill_cfg{
        skill_id=120002,
        level=2,
        job=10001,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110207,value=1}};

get({120002,3,10001}) ->
    #skill_cfg{
        skill_id=120002,
        level=3,
        job=10001,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110208,value=1}};

get({120003,0,10001}) ->
    #skill_cfg{
        skill_id=120003,
        level=0,
        job=10001,
        max=100,
        cost=0,
        gold=0,
        spells=#spell_random{id=110209,value=1}};

get({120003,1,10001}) ->
    #skill_cfg{
        skill_id=120003,
        level=1,
        job=10001,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110210,value=1}};

get({120003,2,10001}) ->
    #skill_cfg{
        skill_id=120003,
        level=2,
        job=10001,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110211,value=1}};

get({120003,3,10001}) ->
    #skill_cfg{
        skill_id=120003,
        level=3,
        job=10001,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110212,value=1}};

get({120004,0,10002}) ->
    #skill_cfg{
        skill_id=120004,
        level=0,
        job=10002,
        max=100,
        cost=0,
        gold=0,
        spells=#spell_random{id=110213,value=1}};

get({120004,1,10002}) ->
    #skill_cfg{
        skill_id=120004,
        level=1,
        job=10002,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110214,value=1}};

get({120004,2,10002}) ->
    #skill_cfg{
        skill_id=120004,
        level=2,
        job=10002,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110215,value=1}};

get({120004,3,10002}) ->
    #skill_cfg{
        skill_id=120004,
        level=3,
        job=10002,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110216,value=1}};

get({120005,0,10002}) ->
    #skill_cfg{
        skill_id=120005,
        level=0,
        job=10002,
        max=0,
        cost=0,
        gold=0,
        spells=#spell_random{id=110217,value=1}};

get({120005,1,10002}) ->
    #skill_cfg{
        skill_id=120005,
        level=1,
        job=10002,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110218,value=1}};

get({120005,2,10002}) ->
    #skill_cfg{
        skill_id=120005,
        level=2,
        job=10002,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110219,value=1}};

get({120005,3,10002}) ->
    #skill_cfg{
        skill_id=120005,
        level=3,
        job=10002,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110220,value=1}};

get({120006,0,10002}) ->
    #skill_cfg{
        skill_id=120006,
        level=0,
        job=10002,
        max=0,
        cost=0,
        gold=0,
        spells=#spell_random{id=110221,value=1}};

get({120006,1,10002}) ->
    #skill_cfg{
        skill_id=120006,
        level=1,
        job=10002,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110222,value=1}};

get({120006,2,10002}) ->
    #skill_cfg{
        skill_id=120006,
        level=2,
        job=10002,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110223,value=1}};

get({120006,3,10002}) ->
    #skill_cfg{
        skill_id=120006,
        level=3,
        job=10002,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110224,value=1}};

get({120007,0,10003}) ->
    #skill_cfg{
        skill_id=120007,
        level=0,
        job=10003,
        max=0,
        cost=0,
        gold=0,
        spells=#spell_random{id=110225,value=1}};

get({120007,1,10003}) ->
    #skill_cfg{
        skill_id=120007,
        level=1,
        job=10003,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110226,value=1}};

get({120007,2,10003}) ->
    #skill_cfg{
        skill_id=120007,
        level=2,
        job=10003,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110227,value=1}};

get({120007,3,10003}) ->
    #skill_cfg{
        skill_id=120007,
        level=3,
        job=10003,
        max=100,
        cost=20,
        gold=100,
        spells=#spell_random{id=110228,value=1}};

get({120008,0,10003}) ->
    #skill_cfg{
        skill_id=120008,
        level=0,
        job=10003,
        max=0,
        cost=0,
        gold=0,
        spells=#spell_random{id=110229,value=1}};

get({120008,1,10003}) ->
    #skill_cfg{
        skill_id=120008,
        level=1,
        job=10003,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110230,value=1}};

get({120008,2,10003}) ->
    #skill_cfg{
        skill_id=120008,
        level=2,
        job=10003,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110231,value=1}};

get({120008,3,10003}) ->
    #skill_cfg{
        skill_id=120008,
        level=3,
        job=10003,
        max=100,
        cost=500,
        gold=5000,
        spells=#spell_random{id=110232,value=1}};

get({120009,0,10003}) ->
    #skill_cfg{
        skill_id=120009,
        level=0,
        job=10003,
        max=0,
        cost=0,
        gold=0,
        spells=#spell_random{id=110233,value=1}};

get({120009,1,10003}) ->
    #skill_cfg{
        skill_id=120009,
        level=1,
        job=10003,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110234,value=1}};

get({120009,2,10003}) ->
    #skill_cfg{
        skill_id=120009,
        level=2,
        job=10003,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110235,value=1}};

get({120009,3,10003}) ->
    #skill_cfg{
        skill_id=120009,
        level=3,
        job=10003,
        max=100,
        cost=1000,
        gold=10000,
        spells=#spell_random{id=110236,value=1}};

get(_) -> false.

get_all() ->
    [{120001,0,10001},{120001,1,10001},{120001,2,10001},{120001,3,10001},{120002,0,10001},{120002,1,10001},{120002,2,10001},{120002,3,10001},{120003,0,10001},{120003,1,10001},{120003,2,10001},{120003,3,10001},{120004,0,10002},{120004,1,10002},{120004,2,10002},{120004,3,10002},{120005,0,10002},{120005,1,10002},{120005,2,10002},{120005,3,10002},{120006,0,10002},{120006,1,10002},{120006,2,10002},{120006,3,10002},{120007,0,10003},{120007,1,10003},{120007,2,10003},{120007,3,10003},{120008,0,10003},{120008,1,10003},{120008,2,10003},{120008,3,10003},{120009,0,10003},{120009,1,10003},{120009,2,10003},{120009,3,10003}].

