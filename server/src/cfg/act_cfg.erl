-module(act_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get(1001) ->
    #act_cfg{
        act_id=1001,
        type=1,
        enable=1,
        version=1,
        level_required=10,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_online_api};

get(1002) ->
    #act_cfg{
        act_id=1002,
        type=2,
        enable=0,
        version=1,
        level_required=1,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(1003) ->
    #act_cfg{
        act_id=1003,
        type=3,
        enable=1,
        version=1,
        level_required=1,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(1004) ->
    #act_cfg{
        act_id=1004,
        type=4,
        enable=1,
        version=1,
        level_required=1,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(1005) ->
    #act_cfg{
        act_id=1005,
        type=5,
        enable=1,
        version=1,
        level_required=1,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(1006) ->
    #act_cfg{
        act_id=1006,
        type=6,
        enable=0,
        version=1,
        level_required=1,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(1007) ->
    #act_cfg{
        act_id=1007,
        type=3,
        enable=1,
        version=1,
        level_required=10,
        date1=[#date_cfg{year=2015,month=3,day=20,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=20,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(2001) ->
    #act_cfg{
        act_id=2001,
        type=7,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_recharge_api};

get(2002) ->
    #act_cfg{
        act_id=2002,
        type=8,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=7,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(2003) ->
    #act_cfg{
        act_id=2003,
        type=9,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=7,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(2004) ->
    #act_cfg{
        act_id=2004,
        type=10,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=7,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(2005) ->
    #act_cfg{
        act_id=2005,
        type=12,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=10,hour=23,minute=59,second=59}],
        mod=act_recharge_api};

get(2006) ->
    #act_cfg{
        act_id=2006,
        type=11,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=22,minute=0,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2015,month=4,day=6,hour=23,minute=59,second=59}],
        mod=act_recharge_api};

get(2008) ->
    #act_cfg{
        act_id=2008,
        type=13,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=14,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=15,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(2009) ->
    #act_cfg{
        act_id=2009,
        type=8,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=14,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=15,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(2010) ->
    #act_cfg{
        act_id=2010,
        type=9,
        enable=1,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=14,hour=23,minute=59,second=59}],
        date2=[#date_cfg{year=2015,month=4,day=7,hour=7,minute=0,second=0},#date_cfg{year=2015,month=4,day=15,hour=2,minute=59,second=59}],
        mod=act_recharge_api};

get(3001) ->
    #act_cfg{
        act_id=3001,
        type=3,
        enable=0,
        version=1,
        level_required=0,
        date1=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        date2=[#date_cfg{year=2015,month=3,day=30,hour=9,minute=30,second=0},#date_cfg{year=2016,month=3,day=20,hour=9,minute=30,second=0}],
        mod=act_release_api};

get(_) -> false.

get_all() ->
    [1001,1002,1003,1004,1005,1006,1007,2001,2002,2003,2004,2005,2006,2008,2009,2010,3001].

