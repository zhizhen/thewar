-module(enemy_team_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(40001) ->
    #enemy_team_cfg{
        id=40001,
        enemies=[#enemy_info{enemy_id=50001,num=3},#enemy_info{enemy_id=50002,num=5},#enemy_info{enemy_id=50003,num=1},#enemy_info{enemy_id=50004,num=2}]};

get(40002) ->
    #enemy_team_cfg{
        id=40002,
        enemies=[#enemy_info{enemy_id=50001,num=1},#enemy_info{enemy_id=50002,num=2},#enemy_info{enemy_id=50003,num=0}]};

get(40003) ->
    #enemy_team_cfg{
        id=40003,
        enemies=[#enemy_info{enemy_id=50001,num=3}]};

get(40004) ->
    #enemy_team_cfg{
        id=40004,
        enemies=[#enemy_info{enemy_id=50001,num=1},#enemy_info{enemy_id=50002,num=5},#enemy_info{enemy_id=50003,num=1},#enemy_info{enemy_id=50004,num=2}]};

get(40005) ->
    #enemy_team_cfg{
        id=40005,
        enemies=[#enemy_info{enemy_id=50001,num=1},#enemy_info{enemy_id=50002,num=4}]};

get(40006) ->
    #enemy_team_cfg{
        id=40006,
        enemies=[#enemy_info{enemy_id=50001,num=2},#enemy_info{enemy_id=50002,num=7},#enemy_info{enemy_id=50003,num=1},#enemy_info{enemy_id=50004,num=2}]};

get(40007) ->
    #enemy_team_cfg{
        id=40007,
        enemies=[#enemy_info{enemy_id=50001,num=3},#enemy_info{enemy_id=50002,num=2}]};

get(_) -> false.


