-module(clifford_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #clifford_cfg{
        id=1,
        consume=0,
        discount=0,
        item_chances=[#item_chance{chance=60,item_id=77040,num=1,notice=0},#item_chance{chance=60,item_id=77043,num=1,notice=0},#item_chance{chance=30,item_id=77044,num=1,notice=1},#item_chance{chance=300,item_id=77050,num=1,notice=0},#item_chance{chance=250,item_id=77052,num=1,notice=0},#item_chance{chance=300,item_id=77056,num=1,notice=0},#item_chance{chance=60,item_id=77058,num=1,notice=0},#item_chance{chance=240,item_id=77063,num=1,notice=0},#item_chance{chance=60,item_id=77065,num=1,notice=0},#item_chance{chance=300,item_id=77070,num=1,notice=0},#item_chance{chance=200,item_id=76997,num=1,notice=0},#item_chance{chance=25,item_id=76999,num=1,notice=1}]};

get(2) ->
    #clifford_cfg{
        id=2,
        consume=15,
        discount=100,
        item_chances=[#item_chance{chance=60,item_id=77040,num=1,notice=0},#item_chance{chance=60,item_id=77043,num=1,notice=0},#item_chance{chance=30,item_id=77044,num=1,notice=1},#item_chance{chance=300,item_id=77050,num=1,notice=0},#item_chance{chance=250,item_id=77052,num=1,notice=0},#item_chance{chance=300,item_id=77056,num=1,notice=0},#item_chance{chance=60,item_id=77058,num=1,notice=0},#item_chance{chance=240,item_id=77063,num=1,notice=0},#item_chance{chance=60,item_id=77065,num=1,notice=0},#item_chance{chance=300,item_id=77070,num=1,notice=0},#item_chance{chance=200,item_id=76997,num=1,notice=0},#item_chance{chance=25,item_id=76999,num=1,notice=1}]};

get(3) ->
    #clifford_cfg{
        id=3,
        consume=150,
        discount=80,
        item_chances=[#item_chance{chance=60,item_id=77040,num=1,notice=0},#item_chance{chance=60,item_id=77043,num=1,notice=0},#item_chance{chance=30,item_id=77044,num=1,notice=1},#item_chance{chance=300,item_id=77050,num=1,notice=0},#item_chance{chance=250,item_id=77052,num=1,notice=0},#item_chance{chance=300,item_id=77056,num=1,notice=0},#item_chance{chance=60,item_id=77058,num=1,notice=0},#item_chance{chance=240,item_id=77063,num=1,notice=0},#item_chance{chance=60,item_id=77065,num=1,notice=0},#item_chance{chance=300,item_id=77070,num=1,notice=0},#item_chance{chance=200,item_id=76997,num=1,notice=0},#item_chance{chance=25,item_id=76999,num=1,notice=1}]};

get(_) -> false.


