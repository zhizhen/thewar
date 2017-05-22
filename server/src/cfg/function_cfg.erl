-module(function_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1001) ->
    #function_cfg{
        id=1001,
        type=1,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="role"};

get(1002) ->
    #function_cfg{
        id=1002,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="account"};

get(1060) ->
    #function_cfg{
        id=1060,
        type=0,
        need_level=10,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="challenge"};

get(1004) ->
    #function_cfg{
        id=1004,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="chat"};

get(1005) ->
    #function_cfg{
        id=1005,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="equip"};

get(1006) ->
    #function_cfg{
        id=1006,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=7,
        tag="strongthen"};

get(1007) ->
    #function_cfg{
        id=1007,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="gm"};

get(1008) ->
    #function_cfg{
        id=1008,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="mail"};

get(1009) ->
    #function_cfg{
        id=1009,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=60002,
        need_accept_quest=0,
        need_story=1,
        tag="mission"};

get(1010) ->
    #function_cfg{
        id=1010,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="npc"};

get(1011) ->
    #function_cfg{
        id=1011,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="package"};

get(1057) ->
    #function_cfg{
        id=1057,
        type=0,
        need_level=65,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="treasure"};

get(1013) ->
    #function_cfg{
        id=1013,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=60022,
        need_story=1,
        tag="worldmap"};

get(1014) ->
    #function_cfg{
        id=1014,
        type=0,
        need_level=10,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="shop"};

get(1015) ->
    #function_cfg{
        id=1015,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=60002,
        need_accept_quest=0,
        need_story=1,
        tag="skill"};

get(1016) ->
    #function_cfg{
        id=1016,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="soul"};

get(1017) ->
    #function_cfg{
        id=1017,
        type=0,
        need_level=23,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="friend"};

get(1018) ->
    #function_cfg{
        id=1018,
        type=0,
        need_level=35,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="boudoir"};

get(1019) ->
    #function_cfg{
        id=1019,
        type=0,
        need_level=0,
        need_mission=31000,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="universe"};

get(1020) ->
    #function_cfg{
        id=1020,
        type=0,
        need_level=28,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="rank"};

get(1021) ->
    #function_cfg{
        id=1021,
        type=0,
        need_level=65,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="charm"};

get(1022) ->
    #function_cfg{
        id=1022,
        type=0,
        need_level=40,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="cultivate"};

get(1023) ->
    #function_cfg{
        id=1023,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="feedback"};

get(1024) ->
    #function_cfg{
        id=1024,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=60022,
        need_accept_quest=0,
        need_story=1,
        tag="offline"};

get(1025) ->
    #function_cfg{
        id=1025,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="coin2gold"};

get(1026) ->
    #function_cfg{
        id=1026,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="clifford"};

get(1027) ->
    #function_cfg{
        id=1027,
        type=0,
        need_level=10,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="sign"};

get(1028) ->
    #function_cfg{
        id=1028,
        type=0,
        need_level=65,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="coin2exp"};

get(1029) ->
    #function_cfg{
        id=1029,
        type=0,
        need_level=30,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="living"};

get(1030) ->
    #function_cfg{
        id=1030,
        type=0,
        need_level=33,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="golden_mission"};

get(1031) ->
    #function_cfg{
        id=1031,
        type=0,
        need_level=45,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="spirit"};

get(1032) ->
    #function_cfg{
        id=1032,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="mall"};

get(1033) ->
    #function_cfg{
        id=1033,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="vip"};

get(1034) ->
    #function_cfg{
        id=1034,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group"};

get(1035) ->
    #function_cfg{
        id=1035,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group_tree"};

get(1036) ->
    #function_cfg{
        id=1036,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group_meeting"};

get(1037) ->
    #function_cfg{
        id=1037,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group_pool"};

get(1038) ->
    #function_cfg{
        id=1038,
        type=0,
        need_level=40,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group_boss"};

get(1039) ->
    #function_cfg{
        id=1039,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="setting"};

get(1040) ->
    #function_cfg{
        id=1040,
        type=0,
        need_level=10,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="award"};

get(1041) ->
    #function_cfg{
        id=1041,
        type=0,
        need_level=90,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="assistant"};

get(1042) ->
    #function_cfg{
        id=1042,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=54,
        tag="xiangqian"};

get(1043) ->
    #function_cfg{
        id=1043,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=54,
        tag="hecheng"};

get(1003) ->
    #function_cfg{
        id=1003,
        type=0,
        need_level=30,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="arena"};

get(1045) ->
    #function_cfg{
        id=1045,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=65001,
        need_story=1,
        tag="mowang"};

get(1046) ->
    #function_cfg{
        id=1046,
        type=1,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="scene"};

get(1047) ->
    #function_cfg{
        id=1047,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="notice"};

get(1048) ->
    #function_cfg{
        id=1048,
        type=0,
        need_level=23,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="scout"};

get(1049) ->
    #function_cfg{
        id=1049,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=60006,
        need_accept_quest=0,
        need_story=1,
        tag="warrior"};

get(1050) ->
    #function_cfg{
        id=1050,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="warrior"};

get(1051) ->
    #function_cfg{
        id=1051,
        type=0,
        need_level=30,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="world_boss"};

get(1052) ->
    #function_cfg{
        id=1052,
        type=0,
        need_level=27,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="offline"};

get(1053) ->
    #function_cfg{
        id=1053,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=53,
        tag="skill"};

get(1054) ->
    #function_cfg{
        id=1054,
        type=0,
        need_level=0,
        need_mission=30008,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="skill"};

get(1055) ->
    #function_cfg{
        id=1055,
        type=0,
        need_level=35,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="group"};

get(1056) ->
    #function_cfg{
        id=1056,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="book"};

get(1044) ->
    #function_cfg{
        id=1044,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=64001,
        need_story=1,
        tag="jingying"};

get(1058) ->
    #function_cfg{
        id=1058,
        type=0,
        need_level=0,
        need_mission=30012,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="act_shengyan"};

get(1059) ->
    #function_cfg{
        id=1059,
        type=0,
        need_level=35,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="warrior"};

get(1012) ->
    #function_cfg{
        id=1012,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="quest"};

get(1061) ->
    #function_cfg{
        id=1061,
        type=0,
        need_level=30,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="wing"};

get(1062) ->
    #function_cfg{
        id=1062,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="suit"};

get(1063) ->
    #function_cfg{
        id=1063,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="keygift"};

get(1064) ->
    #function_cfg{
        id=1064,
        type=0,
        need_level=25,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="contest"};

get(1065) ->
    #function_cfg{
        id=1065,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="daily"};

get(1066) ->
    #function_cfg{
        id=1066,
        type=0,
        need_level=0,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="title"};

get(1067) ->
    #function_cfg{
        id=1067,
        type=0,
        need_level=20,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="warrior"};

get(1068) ->
    #function_cfg{
        id=1068,
        type=0,
        need_level=40,
        need_mission=0,
        need_submit_quest=0,
        need_accept_quest=0,
        need_story=1,
        tag="warrior"};

get(_) -> false.

get_all() ->
    [1001,1002,1060,1004,1005,1006,1007,1008,1009,1010,1011,1057,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1003,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1044,1058,1059,1012,1061,1062,1063,1064,1065,1066,1067,1068].

