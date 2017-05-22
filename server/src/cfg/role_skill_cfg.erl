-module(role_skill_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({10001,1}) ->
    #role_skill_cfg{
        job=10001,
        level=1,
        skills=[#role_skill_id{skill_id=110000},#role_skill_id{skill_id=110003},#role_skill_id{skill_id=110006},#role_skill_id{skill_id=110001},#role_skill_id{skill_id=110004},#role_skill_id{skill_id=110007},#role_skill_id{skill_id=110002},#role_skill_id{skill_id=110005},#role_skill_id{skill_id=110008}]};

get({10001,2}) ->
    #role_skill_cfg{
        job=10001,
        level=2,
        skills=[]};

get({10001,3}) ->
    #role_skill_cfg{
        job=10001,
        level=3,
        skills=[]};

get({10001,4}) ->
    #role_skill_cfg{
        job=10001,
        level=4,
        skills=[]};

get({10001,5}) ->
    #role_skill_cfg{
        job=10001,
        level=5,
        skills=[]};

get({10001,6}) ->
    #role_skill_cfg{
        job=10001,
        level=6,
        skills=[]};

get({10001,7}) ->
    #role_skill_cfg{
        job=10001,
        level=7,
        skills=[]};

get({10001,8}) ->
    #role_skill_cfg{
        job=10001,
        level=8,
        skills=[]};

get({10001,9}) ->
    #role_skill_cfg{
        job=10001,
        level=9,
        skills=[]};

get({10002,1}) ->
    #role_skill_cfg{
        job=10002,
        level=1,
        skills=[#role_skill_id{skill_id=110018},#role_skill_id{skill_id=110021},#role_skill_id{skill_id=110024},#role_skill_id{skill_id=110019},#role_skill_id{skill_id=110022},#role_skill_id{skill_id=110025},#role_skill_id{skill_id=110020},#role_skill_id{skill_id=110023},#role_skill_id{skill_id=110026}]};

get({10002,2}) ->
    #role_skill_cfg{
        job=10002,
        level=2,
        skills=[]};

get({10002,3}) ->
    #role_skill_cfg{
        job=10002,
        level=3,
        skills=[]};

get({10002,4}) ->
    #role_skill_cfg{
        job=10002,
        level=4,
        skills=[]};

get({10002,5}) ->
    #role_skill_cfg{
        job=10002,
        level=5,
        skills=[]};

get({10002,6}) ->
    #role_skill_cfg{
        job=10002,
        level=6,
        skills=[]};

get({10002,7}) ->
    #role_skill_cfg{
        job=10002,
        level=7,
        skills=[]};

get({10002,8}) ->
    #role_skill_cfg{
        job=10002,
        level=8,
        skills=[]};

get({10002,9}) ->
    #role_skill_cfg{
        job=10002,
        level=9,
        skills=[]};

get({10003,1}) ->
    #role_skill_cfg{
        job=10003,
        level=1,
        skills=[#role_skill_id{skill_id=110027},#role_skill_id{skill_id=110030},#role_skill_id{skill_id=110033},#role_skill_id{skill_id=110028},#role_skill_id{skill_id=110031},#role_skill_id{skill_id=110034},#role_skill_id{skill_id=110029},#role_skill_id{skill_id=110032},#role_skill_id{skill_id=110035}]};

get({10003,2}) ->
    #role_skill_cfg{
        job=10003,
        level=2,
        skills=[]};

get({10003,3}) ->
    #role_skill_cfg{
        job=10003,
        level=3,
        skills=[]};

get({10003,4}) ->
    #role_skill_cfg{
        job=10003,
        level=4,
        skills=[]};

get({10003,5}) ->
    #role_skill_cfg{
        job=10003,
        level=5,
        skills=[]};

get({10003,6}) ->
    #role_skill_cfg{
        job=10003,
        level=6,
        skills=[]};

get({10003,7}) ->
    #role_skill_cfg{
        job=10003,
        level=7,
        skills=[]};

get({10003,8}) ->
    #role_skill_cfg{
        job=10003,
        level=8,
        skills=[]};

get({10003,9}) ->
    #role_skill_cfg{
        job=10003,
        level=9,
        skills=[]};

get(_) -> false.

get_all() ->
    [{10001,1},{10001,2},{10001,3},{10001,4},{10001,5},{10001,6},{10001,7},{10001,8},{10001,9},{10002,1},{10002,2},{10002,3},{10002,4},{10002,5},{10002,6},{10002,7},{10002,8},{10002,9},{10003,1},{10003,2},{10003,3},{10003,4},{10003,5},{10003,6},{10003,7},{10003,8},{10003,9}].

