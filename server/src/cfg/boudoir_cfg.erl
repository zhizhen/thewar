-module(boudoir_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({1,0}) ->
    #boudoir_cfg{
        floor_id=1,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=400}]};

get({1,1}) ->
    #boudoir_cfg{
        floor_id=1,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73100,num=1},#upgrade_need{item_id=73051,num=5},#upgrade_need{item_id=73052,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=3,value=400}]};

get({1,2}) ->
    #boudoir_cfg{
        floor_id=1,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73101,num=1},#upgrade_need{item_id=73052,num=5},#upgrade_need{item_id=73053,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=4,value=400}]};

get({1,3}) ->
    #boudoir_cfg{
        floor_id=1,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73102,num=1},#upgrade_need{item_id=73053,num=5},#upgrade_need{item_id=73054,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=5,value=800}]};

get({1,4}) ->
    #boudoir_cfg{
        floor_id=1,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73103,num=1},#upgrade_need{item_id=73054,num=5},#upgrade_need{item_id=73055,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=6,value=800}]};

get({1,5}) ->
    #boudoir_cfg{
        floor_id=1,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73104,num=1},#upgrade_need{item_id=73055,num=5},#upgrade_need{item_id=73056,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=7,value=4000}]};

get({1,6}) ->
    #boudoir_cfg{
        floor_id=1,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73105,num=1},#upgrade_need{item_id=73056,num=5},#upgrade_need{item_id=73051,num=5},#upgrade_need{item_id=73057,num=5}],
        plus_attr=[#plus_attr{type=62,value=400}]};

get({2,0}) ->
    #boudoir_cfg{
        floor_id=2,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=500}]};

get({2,1}) ->
    #boudoir_cfg{
        floor_id=2,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73106,num=1},#upgrade_need{item_id=73058,num=10},#upgrade_need{item_id=73059,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=3,value=600}]};

get({2,2}) ->
    #boudoir_cfg{
        floor_id=2,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73107,num=1},#upgrade_need{item_id=73059,num=10},#upgrade_need{item_id=73060,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=4,value=600}]};

get({2,3}) ->
    #boudoir_cfg{
        floor_id=2,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73108,num=1},#upgrade_need{item_id=73060,num=10},#upgrade_need{item_id=73061,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=5,value=1000}]};

get({2,4}) ->
    #boudoir_cfg{
        floor_id=2,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73109,num=1},#upgrade_need{item_id=73061,num=10},#upgrade_need{item_id=73062,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=6,value=1000}]};

get({2,5}) ->
    #boudoir_cfg{
        floor_id=2,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73110,num=1},#upgrade_need{item_id=73062,num=10},#upgrade_need{item_id=73063,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=7,value=5000}]};

get({2,6}) ->
    #boudoir_cfg{
        floor_id=2,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73111,num=1},#upgrade_need{item_id=73063,num=10},#upgrade_need{item_id=73058,num=10},#upgrade_need{item_id=73064,num=10}],
        plus_attr=[#plus_attr{type=62,value=500}]};

get({3,0}) ->
    #boudoir_cfg{
        floor_id=3,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=600}]};

get({3,1}) ->
    #boudoir_cfg{
        floor_id=3,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73112,num=1},#upgrade_need{item_id=73065,num=15},#upgrade_need{item_id=73066,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=3,value=800}]};

get({3,2}) ->
    #boudoir_cfg{
        floor_id=3,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73113,num=1},#upgrade_need{item_id=73066,num=15},#upgrade_need{item_id=73067,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=4,value=800}]};

get({3,3}) ->
    #boudoir_cfg{
        floor_id=3,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73114,num=1},#upgrade_need{item_id=73067,num=15},#upgrade_need{item_id=73068,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=5,value=1200}]};

get({3,4}) ->
    #boudoir_cfg{
        floor_id=3,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73115,num=1},#upgrade_need{item_id=73068,num=15},#upgrade_need{item_id=73069,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=6,value=1200}]};

get({3,5}) ->
    #boudoir_cfg{
        floor_id=3,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73116,num=1},#upgrade_need{item_id=73069,num=15},#upgrade_need{item_id=73070,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=7,value=7000}]};

get({3,6}) ->
    #boudoir_cfg{
        floor_id=3,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73117,num=1},#upgrade_need{item_id=73070,num=15},#upgrade_need{item_id=73065,num=15},#upgrade_need{item_id=73071,num=15}],
        plus_attr=[#plus_attr{type=62,value=600}]};

get({4,0}) ->
    #boudoir_cfg{
        floor_id=4,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=700}]};

get({4,1}) ->
    #boudoir_cfg{
        floor_id=4,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73118,num=1},#upgrade_need{item_id=73072,num=20},#upgrade_need{item_id=73073,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=3,value=1200}]};

get({4,2}) ->
    #boudoir_cfg{
        floor_id=4,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73119,num=1},#upgrade_need{item_id=73073,num=20},#upgrade_need{item_id=73074,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=4,value=1200}]};

get({4,3}) ->
    #boudoir_cfg{
        floor_id=4,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73120,num=1},#upgrade_need{item_id=73074,num=20},#upgrade_need{item_id=73075,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=5,value=1600}]};

get({4,4}) ->
    #boudoir_cfg{
        floor_id=4,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73121,num=1},#upgrade_need{item_id=73075,num=20},#upgrade_need{item_id=73076,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=6,value=1600}]};

get({4,5}) ->
    #boudoir_cfg{
        floor_id=4,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73122,num=1},#upgrade_need{item_id=73076,num=20},#upgrade_need{item_id=73077,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=7,value=10000}]};

get({4,6}) ->
    #boudoir_cfg{
        floor_id=4,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73123,num=1},#upgrade_need{item_id=73077,num=20},#upgrade_need{item_id=73072,num=20},#upgrade_need{item_id=73078,num=20}],
        plus_attr=[#plus_attr{type=62,value=700}]};

get({5,0}) ->
    #boudoir_cfg{
        floor_id=5,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=800}]};

get({5,1}) ->
    #boudoir_cfg{
        floor_id=5,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73124,num=1},#upgrade_need{item_id=73079,num=25},#upgrade_need{item_id=73080,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=3,value=1400}]};

get({5,2}) ->
    #boudoir_cfg{
        floor_id=5,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73125,num=1},#upgrade_need{item_id=73080,num=25},#upgrade_need{item_id=73081,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=4,value=1400}]};

get({5,3}) ->
    #boudoir_cfg{
        floor_id=5,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73126,num=1},#upgrade_need{item_id=73081,num=25},#upgrade_need{item_id=73082,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=5,value=1900}]};

get({5,4}) ->
    #boudoir_cfg{
        floor_id=5,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73127,num=1},#upgrade_need{item_id=73082,num=25},#upgrade_need{item_id=73083,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=6,value=1900}]};

get({5,5}) ->
    #boudoir_cfg{
        floor_id=5,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73128,num=1},#upgrade_need{item_id=73083,num=25},#upgrade_need{item_id=73084,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=7,value=14000}]};

get({5,6}) ->
    #boudoir_cfg{
        floor_id=5,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73129,num=1},#upgrade_need{item_id=73084,num=25},#upgrade_need{item_id=73079,num=25},#upgrade_need{item_id=73085,num=25}],
        plus_attr=[#plus_attr{type=62,value=800}]};

get({6,0}) ->
    #boudoir_cfg{
        floor_id=6,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=900}]};

get({6,1}) ->
    #boudoir_cfg{
        floor_id=6,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73130,num=1},#upgrade_need{item_id=73086,num=30},#upgrade_need{item_id=73087,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=3,value=1600}]};

get({6,2}) ->
    #boudoir_cfg{
        floor_id=6,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73131,num=1},#upgrade_need{item_id=73087,num=30},#upgrade_need{item_id=73088,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=4,value=1600}]};

get({6,3}) ->
    #boudoir_cfg{
        floor_id=6,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73132,num=1},#upgrade_need{item_id=73088,num=30},#upgrade_need{item_id=73089,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=5,value=2000}]};

get({6,4}) ->
    #boudoir_cfg{
        floor_id=6,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73133,num=1},#upgrade_need{item_id=73089,num=30},#upgrade_need{item_id=73090,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=6,value=2000}]};

get({6,5}) ->
    #boudoir_cfg{
        floor_id=6,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73134,num=1},#upgrade_need{item_id=73090,num=30},#upgrade_need{item_id=73091,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=7,value=18000}]};

get({6,6}) ->
    #boudoir_cfg{
        floor_id=6,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73135,num=1},#upgrade_need{item_id=73091,num=30},#upgrade_need{item_id=73086,num=30},#upgrade_need{item_id=73092,num=30}],
        plus_attr=[#plus_attr{type=62,value=900}]};

get({7,0}) ->
    #boudoir_cfg{
        floor_id=7,
        id=0,
        upgrade_needs=[],
        plus_attr=[#plus_attr{type=63,value=1000}]};

get({7,1}) ->
    #boudoir_cfg{
        floor_id=7,
        id=1,
        upgrade_needs=[#upgrade_need{item_id=73136,num=1},#upgrade_need{item_id=73093,num=35},#upgrade_need{item_id=73094,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=3,value=2200}]};

get({7,2}) ->
    #boudoir_cfg{
        floor_id=7,
        id=2,
        upgrade_needs=[#upgrade_need{item_id=73137,num=1},#upgrade_need{item_id=73094,num=35},#upgrade_need{item_id=73095,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=4,value=2200}]};

get({7,3}) ->
    #boudoir_cfg{
        floor_id=7,
        id=3,
        upgrade_needs=[#upgrade_need{item_id=73138,num=1},#upgrade_need{item_id=73095,num=35},#upgrade_need{item_id=73096,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=5,value=2400}]};

get({7,4}) ->
    #boudoir_cfg{
        floor_id=7,
        id=4,
        upgrade_needs=[#upgrade_need{item_id=73139,num=1},#upgrade_need{item_id=73096,num=35},#upgrade_need{item_id=73097,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=6,value=2400}]};

get({7,5}) ->
    #boudoir_cfg{
        floor_id=7,
        id=5,
        upgrade_needs=[#upgrade_need{item_id=73140,num=1},#upgrade_need{item_id=73097,num=35},#upgrade_need{item_id=73098,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=7,value=22000}]};

get({7,6}) ->
    #boudoir_cfg{
        floor_id=7,
        id=6,
        upgrade_needs=[#upgrade_need{item_id=73141,num=1},#upgrade_need{item_id=73098,num=35},#upgrade_need{item_id=73093,num=35},#upgrade_need{item_id=73099,num=35}],
        plus_attr=[#plus_attr{type=62,value=1000}]};

get(_) -> false.


