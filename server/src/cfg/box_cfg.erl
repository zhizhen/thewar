-module(box_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(77000) ->
    #box_cfg{
        item_id=77000,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=20000},#box_item{rate=100,item_id=9,num=1000},#box_item{rate=100,item_id=12,num=10000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77112,num=1}]};

get(77001) ->
    #box_cfg{
        item_id=77001,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=20000},#box_item{rate=100,item_id=9,num=1000},#box_item{rate=100,item_id=12,num=10000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77112,num=1}]};

get(77002) ->
    #box_cfg{
        item_id=77002,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=20000},#box_item{rate=100,item_id=9,num=1000},#box_item{rate=100,item_id=12,num=10000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77112,num=1}]};

get(77003) ->
    #box_cfg{
        item_id=77003,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=50000},#box_item{rate=100,item_id=9,num=2000},#box_item{rate=100,item_id=12,num=20000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73051,num=1},#box_item{rate=100,item_id=73052,num=1},#box_item{rate=100,item_id=73053,num=1},#box_item{rate=100,item_id=73054,num=1},#box_item{rate=100,item_id=73055,num=1},#box_item{rate=100,item_id=73056,num=1}]};

get(77004) ->
    #box_cfg{
        item_id=77004,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=50000},#box_item{rate=100,item_id=9,num=2000},#box_item{rate=100,item_id=12,num=20000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73051,num=1},#box_item{rate=100,item_id=73052,num=1},#box_item{rate=100,item_id=73053,num=1},#box_item{rate=100,item_id=73054,num=1},#box_item{rate=100,item_id=73055,num=1},#box_item{rate=100,item_id=73056,num=1}]};

get(77005) ->
    #box_cfg{
        item_id=77005,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=50000},#box_item{rate=100,item_id=9,num=2000},#box_item{rate=100,item_id=12,num=20000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73051,num=1},#box_item{rate=100,item_id=73052,num=1},#box_item{rate=100,item_id=73053,num=1},#box_item{rate=100,item_id=73054,num=1},#box_item{rate=100,item_id=73055,num=1},#box_item{rate=100,item_id=73056,num=1}]};

get(77006) ->
    #box_cfg{
        item_id=77006,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=80000},#box_item{rate=100,item_id=9,num=3000},#box_item{rate=100,item_id=12,num=30000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73058,num=1},#box_item{rate=100,item_id=73059,num=1},#box_item{rate=100,item_id=73060,num=1},#box_item{rate=100,item_id=73061,num=1},#box_item{rate=100,item_id=73062,num=1},#box_item{rate=100,item_id=73063,num=1}]};

get(77007) ->
    #box_cfg{
        item_id=77007,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=80000},#box_item{rate=100,item_id=9,num=3000},#box_item{rate=100,item_id=12,num=30000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73058,num=1},#box_item{rate=100,item_id=73059,num=1},#box_item{rate=100,item_id=73060,num=1},#box_item{rate=100,item_id=73061,num=1},#box_item{rate=100,item_id=73062,num=1},#box_item{rate=100,item_id=73063,num=1}]};

get(77008) ->
    #box_cfg{
        item_id=77008,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=80000},#box_item{rate=100,item_id=9,num=3000},#box_item{rate=100,item_id=12,num=30000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73058,num=1},#box_item{rate=100,item_id=73059,num=1},#box_item{rate=100,item_id=73060,num=1},#box_item{rate=100,item_id=73061,num=1},#box_item{rate=100,item_id=73062,num=1},#box_item{rate=100,item_id=73063,num=1}]};

get(77009) ->
    #box_cfg{
        item_id=77009,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=120000},#box_item{rate=100,item_id=9,num=4000},#box_item{rate=100,item_id=12,num=40000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73065,num=1},#box_item{rate=100,item_id=73066,num=1},#box_item{rate=100,item_id=73067,num=1},#box_item{rate=100,item_id=73068,num=1},#box_item{rate=100,item_id=73069,num=1},#box_item{rate=100,item_id=73070,num=1}]};

get(77010) ->
    #box_cfg{
        item_id=77010,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=120000},#box_item{rate=100,item_id=9,num=4000},#box_item{rate=100,item_id=12,num=40000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73065,num=1},#box_item{rate=100,item_id=73066,num=1},#box_item{rate=100,item_id=73067,num=1},#box_item{rate=100,item_id=73068,num=1},#box_item{rate=100,item_id=73069,num=1},#box_item{rate=100,item_id=73070,num=1}]};

get(77011) ->
    #box_cfg{
        item_id=77011,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=120000},#box_item{rate=100,item_id=9,num=4000},#box_item{rate=100,item_id=12,num=40000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73065,num=1},#box_item{rate=100,item_id=73066,num=1},#box_item{rate=100,item_id=73067,num=1},#box_item{rate=100,item_id=73068,num=1},#box_item{rate=100,item_id=73069,num=1},#box_item{rate=100,item_id=73070,num=1}]};

get(77012) ->
    #box_cfg{
        item_id=77012,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=160000},#box_item{rate=100,item_id=9,num=5000},#box_item{rate=100,item_id=12,num=50000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73072,num=1},#box_item{rate=100,item_id=73073,num=1},#box_item{rate=100,item_id=73074,num=1},#box_item{rate=100,item_id=73075,num=1},#box_item{rate=100,item_id=73076,num=1},#box_item{rate=100,item_id=73077,num=1}]};

get(77013) ->
    #box_cfg{
        item_id=77013,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=160000},#box_item{rate=100,item_id=9,num=5000},#box_item{rate=100,item_id=12,num=50000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73072,num=1},#box_item{rate=100,item_id=73073,num=1},#box_item{rate=100,item_id=73074,num=1},#box_item{rate=100,item_id=73075,num=1},#box_item{rate=100,item_id=73076,num=1},#box_item{rate=100,item_id=73077,num=1}]};

get(77014) ->
    #box_cfg{
        item_id=77014,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=160000},#box_item{rate=100,item_id=9,num=5000},#box_item{rate=100,item_id=12,num=50000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73072,num=1},#box_item{rate=100,item_id=73073,num=1},#box_item{rate=100,item_id=73074,num=1},#box_item{rate=100,item_id=73075,num=1},#box_item{rate=100,item_id=73076,num=1},#box_item{rate=100,item_id=73077,num=1}]};

get(77015) ->
    #box_cfg{
        item_id=77015,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=220000},#box_item{rate=100,item_id=9,num=6000},#box_item{rate=100,item_id=12,num=60000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73079,num=1},#box_item{rate=100,item_id=73080,num=1},#box_item{rate=100,item_id=73081,num=1},#box_item{rate=100,item_id=73082,num=1},#box_item{rate=100,item_id=73083,num=1},#box_item{rate=100,item_id=73084,num=1}]};

get(77016) ->
    #box_cfg{
        item_id=77016,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=220000},#box_item{rate=100,item_id=9,num=6000},#box_item{rate=100,item_id=12,num=60000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73079,num=1},#box_item{rate=100,item_id=73080,num=1},#box_item{rate=100,item_id=73081,num=1},#box_item{rate=100,item_id=73082,num=1},#box_item{rate=100,item_id=73083,num=1},#box_item{rate=100,item_id=73084,num=1}]};

get(77017) ->
    #box_cfg{
        item_id=77017,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=220000},#box_item{rate=100,item_id=9,num=6000},#box_item{rate=100,item_id=12,num=60000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73079,num=1},#box_item{rate=100,item_id=73080,num=1},#box_item{rate=100,item_id=73081,num=1},#box_item{rate=100,item_id=73082,num=1},#box_item{rate=100,item_id=73083,num=1},#box_item{rate=100,item_id=73084,num=1}]};

get(77018) ->
    #box_cfg{
        item_id=77018,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=280000},#box_item{rate=100,item_id=9,num=7000},#box_item{rate=100,item_id=12,num=70000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73086,num=1},#box_item{rate=100,item_id=73087,num=1},#box_item{rate=100,item_id=73088,num=1},#box_item{rate=100,item_id=73089,num=1},#box_item{rate=100,item_id=73090,num=1},#box_item{rate=100,item_id=73091,num=1}]};

get(77019) ->
    #box_cfg{
        item_id=77019,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=280000},#box_item{rate=100,item_id=9,num=7000},#box_item{rate=100,item_id=12,num=70000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73086,num=1},#box_item{rate=100,item_id=73087,num=1},#box_item{rate=100,item_id=73088,num=1},#box_item{rate=100,item_id=73089,num=1},#box_item{rate=100,item_id=73090,num=1},#box_item{rate=100,item_id=73091,num=1}]};

get(77020) ->
    #box_cfg{
        item_id=77020,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=280000},#box_item{rate=100,item_id=9,num=7000},#box_item{rate=100,item_id=12,num=70000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73086,num=1},#box_item{rate=100,item_id=73087,num=1},#box_item{rate=100,item_id=73088,num=1},#box_item{rate=100,item_id=73089,num=1},#box_item{rate=100,item_id=73090,num=1},#box_item{rate=100,item_id=73091,num=1}]};

get(77021) ->
    #box_cfg{
        item_id=77021,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=360000},#box_item{rate=100,item_id=9,num=8000},#box_item{rate=100,item_id=12,num=80000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73093,num=1},#box_item{rate=100,item_id=73094,num=1},#box_item{rate=100,item_id=73095,num=1},#box_item{rate=100,item_id=73096,num=1},#box_item{rate=100,item_id=73097,num=1},#box_item{rate=100,item_id=73098,num=1}]};

get(77022) ->
    #box_cfg{
        item_id=77022,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=360000},#box_item{rate=100,item_id=9,num=8000},#box_item{rate=100,item_id=12,num=80000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73093,num=1},#box_item{rate=100,item_id=73094,num=1},#box_item{rate=100,item_id=73095,num=1},#box_item{rate=100,item_id=73096,num=1},#box_item{rate=100,item_id=73097,num=1},#box_item{rate=100,item_id=73098,num=1}]};

get(77023) ->
    #box_cfg{
        item_id=77023,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=360000},#box_item{rate=100,item_id=9,num=8000},#box_item{rate=100,item_id=12,num=80000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1},#box_item{rate=100,item_id=73093,num=1},#box_item{rate=100,item_id=73094,num=1},#box_item{rate=100,item_id=73095,num=1},#box_item{rate=100,item_id=73096,num=1},#box_item{rate=100,item_id=73097,num=1},#box_item{rate=100,item_id=73098,num=1}]};

get(77024) ->
    #box_cfg{
        item_id=77024,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=440000},#box_item{rate=100,item_id=9,num=9000},#box_item{rate=100,item_id=12,num=90000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1}]};

get(77025) ->
    #box_cfg{
        item_id=77025,
        count=2,
        items=[#box_item{rate=100,item_id=4,num=440000},#box_item{rate=100,item_id=9,num=9000},#box_item{rate=100,item_id=12,num=90000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1}]};

get(77026) ->
    #box_cfg{
        item_id=77026,
        count=3,
        items=[#box_item{rate=100,item_id=4,num=440000},#box_item{rate=100,item_id=9,num=9000},#box_item{rate=100,item_id=12,num=90000},#box_item{rate=30,item_id=77211,num=1},#box_item{rate=10,item_id=77212,num=1},#box_item{rate=50,item_id=77113,num=1}]};

get(77027) ->
    #box_cfg{
        item_id=77027,
        count=5,
        items=[#box_item{rate=100,item_id=72000,num=1},#box_item{rate=100,item_id=72010,num=1},#box_item{rate=100,item_id=72020,num=1},#box_item{rate=100,item_id=72030,num=1},#box_item{rate=100,item_id=72040,num=1},#box_item{rate=100,item_id=72050,num=1},#box_item{rate=100,item_id=72060,num=1},#box_item{rate=100,item_id=4,num=50000},#box_item{rate=10,item_id=5,num=5},#box_item{rate=25,item_id=6,num=10}]};

get(77028) ->
    #box_cfg{
        item_id=77028,
        count=5,
        items=[#box_item{rate=100,item_id=72001,num=1},#box_item{rate=100,item_id=72011,num=1},#box_item{rate=100,item_id=72021,num=1},#box_item{rate=100,item_id=72031,num=1},#box_item{rate=100,item_id=72041,num=1},#box_item{rate=100,item_id=72051,num=1},#box_item{rate=100,item_id=72061,num=1},#box_item{rate=100,item_id=4,num=100000},#box_item{rate=10,item_id=5,num=5},#box_item{rate=25,item_id=6,num=10}]};

get(77029) ->
    #box_cfg{
        item_id=77029,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=150000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77030) ->
    #box_cfg{
        item_id=77030,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=200000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77031) ->
    #box_cfg{
        item_id=77031,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=250000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77032) ->
    #box_cfg{
        item_id=77032,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=300000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77033) ->
    #box_cfg{
        item_id=77033,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=350000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77034) ->
    #box_cfg{
        item_id=77034,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=400000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77035) ->
    #box_cfg{
        item_id=77035,
        count=5,
        items=[#box_item{rate=100,item_id=4,num=450000},#box_item{rate=2,item_id=5,num=10},#box_item{rate=20,item_id=72001,num=1},#box_item{rate=20,item_id=72011,num=1},#box_item{rate=20,item_id=72021,num=1},#box_item{rate=20,item_id=72031,num=1},#box_item{rate=20,item_id=72041,num=1},#box_item{rate=20,item_id=72051,num=1},#box_item{rate=20,item_id=72061,num=1}]};

get(77036) ->
    #box_cfg{
        item_id=77036,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=1000}]};

get(77037) ->
    #box_cfg{
        item_id=77037,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=10000}]};

get(77038) ->
    #box_cfg{
        item_id=77038,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=50000}]};

get(77039) ->
    #box_cfg{
        item_id=77039,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=100000}]};

get(77040) ->
    #box_cfg{
        item_id=77040,
        count=1,
        items=[#box_item{rate=100,item_id=4,num=500000}]};

get(77041) ->
    #box_cfg{
        item_id=77041,
        count=1,
        items=[#box_item{rate=100,item_id=5,num=5}]};

get(77042) ->
    #box_cfg{
        item_id=77042,
        count=1,
        items=[#box_item{rate=100,item_id=5,num=10}]};

get(77043) ->
    #box_cfg{
        item_id=77043,
        count=1,
        items=[#box_item{rate=100,item_id=5,num=50}]};

get(77044) ->
    #box_cfg{
        item_id=77044,
        count=1,
        items=[#box_item{rate=100,item_id=5,num=100}]};

get(77045) ->
    #box_cfg{
        item_id=77045,
        count=1,
        items=[#box_item{rate=100,item_id=5,num=500}]};

get(77046) ->
    #box_cfg{
        item_id=77046,
        count=1,
        items=[#box_item{rate=100,item_id=1,num=2000}]};

get(77047) ->
    #box_cfg{
        item_id=77047,
        count=1,
        items=[#box_item{rate=100,item_id=1,num=5000}]};

get(77048) ->
    #box_cfg{
        item_id=77048,
        count=1,
        items=[#box_item{rate=100,item_id=1,num=10000}]};

get(77049) ->
    #box_cfg{
        item_id=77049,
        count=1,
        items=[#box_item{rate=100,item_id=1,num=20000}]};

get(77050) ->
    #box_cfg{
        item_id=77050,
        count=1,
        items=[#box_item{rate=100,item_id=1,num=50000}]};

get(77051) ->
    #box_cfg{
        item_id=77051,
        count=1,
        items=[#box_item{rate=100,item_id=6,num=10}]};

get(77052) ->
    #box_cfg{
        item_id=77052,
        count=1,
        items=[#box_item{rate=100,item_id=6,num=20}]};

get(77053) ->
    #box_cfg{
        item_id=77053,
        count=1,
        items=[#box_item{rate=100,item_id=6,num=50}]};

get(77054) ->
    #box_cfg{
        item_id=77054,
        count=1,
        items=[#box_item{rate=100,item_id=6,num=100}]};

get(77055) ->
    #box_cfg{
        item_id=77055,
        count=1,
        items=[#box_item{rate=100,item_id=6,num=200}]};

get(77056) ->
    #box_cfg{
        item_id=77056,
        count=1,
        items=[#box_item{rate=100,item_id=8,num=100}]};

get(77057) ->
    #box_cfg{
        item_id=77057,
        count=1,
        items=[#box_item{rate=100,item_id=8,num=200}]};

get(77058) ->
    #box_cfg{
        item_id=77058,
        count=1,
        items=[#box_item{rate=100,item_id=8,num=500}]};

get(77059) ->
    #box_cfg{
        item_id=77059,
        count=1,
        items=[#box_item{rate=100,item_id=8,num=1000}]};

get(77060) ->
    #box_cfg{
        item_id=77060,
        count=1,
        items=[#box_item{rate=100,item_id=8,num=2000}]};

get(77061) ->
    #box_cfg{
        item_id=77061,
        count=1,
        items=[#box_item{rate=100,item_id=9,num=100}]};

get(77062) ->
    #box_cfg{
        item_id=77062,
        count=1,
        items=[#box_item{rate=100,item_id=9,num=200}]};

get(77063) ->
    #box_cfg{
        item_id=77063,
        count=1,
        items=[#box_item{rate=100,item_id=9,num=500}]};

get(77064) ->
    #box_cfg{
        item_id=77064,
        count=1,
        items=[#box_item{rate=100,item_id=9,num=1000}]};

get(77065) ->
    #box_cfg{
        item_id=77065,
        count=1,
        items=[#box_item{rate=100,item_id=9,num=2000}]};

get(77066) ->
    #box_cfg{
        item_id=77066,
        count=1,
        items=[#box_item{rate=100,item_id=12,num=500}]};

get(77067) ->
    #box_cfg{
        item_id=77067,
        count=1,
        items=[#box_item{rate=100,item_id=12,num=1000}]};

get(77068) ->
    #box_cfg{
        item_id=77068,
        count=1,
        items=[#box_item{rate=100,item_id=12,num=2000}]};

get(77069) ->
    #box_cfg{
        item_id=77069,
        count=1,
        items=[#box_item{rate=100,item_id=12,num=5000}]};

get(77070) ->
    #box_cfg{
        item_id=77070,
        count=1,
        items=[#box_item{rate=100,item_id=12,num=10000}]};

get(76995) ->
    #box_cfg{
        item_id=76995,
        count=1,
        items=[#box_item{rate=100,item_id=72000,num=1},#box_item{rate=100,item_id=72010,num=1},#box_item{rate=100,item_id=72020,num=1},#box_item{rate=100,item_id=72030,num=1},#box_item{rate=100,item_id=72040,num=1},#box_item{rate=100,item_id=72050,num=1},#box_item{rate=100,item_id=72060,num=1}]};

get(76996) ->
    #box_cfg{
        item_id=76996,
        count=1,
        items=[#box_item{rate=100,item_id=72001,num=1},#box_item{rate=100,item_id=72011,num=1},#box_item{rate=100,item_id=72021,num=1},#box_item{rate=100,item_id=72031,num=1},#box_item{rate=100,item_id=72041,num=1},#box_item{rate=100,item_id=72051,num=1},#box_item{rate=100,item_id=72061,num=1}]};

get(76997) ->
    #box_cfg{
        item_id=76997,
        count=1,
        items=[#box_item{rate=100,item_id=72002,num=1},#box_item{rate=100,item_id=72012,num=1},#box_item{rate=100,item_id=72022,num=1},#box_item{rate=100,item_id=72032,num=1},#box_item{rate=100,item_id=72042,num=1},#box_item{rate=100,item_id=72052,num=1},#box_item{rate=100,item_id=72062,num=1}]};

get(76998) ->
    #box_cfg{
        item_id=76998,
        count=1,
        items=[#box_item{rate=100,item_id=72003,num=1},#box_item{rate=100,item_id=72013,num=1},#box_item{rate=100,item_id=72023,num=1},#box_item{rate=100,item_id=72033,num=1},#box_item{rate=100,item_id=72043,num=1},#box_item{rate=100,item_id=72053,num=1},#box_item{rate=100,item_id=72063,num=1}]};

get(76999) ->
    #box_cfg{
        item_id=76999,
        count=1,
        items=[#box_item{rate=100,item_id=72004,num=1},#box_item{rate=100,item_id=72014,num=1},#box_item{rate=100,item_id=72024,num=1},#box_item{rate=100,item_id=72034,num=1},#box_item{rate=100,item_id=72044,num=1},#box_item{rate=100,item_id=72054,num=1},#box_item{rate=100,item_id=72064,num=1}]};

get(76064) ->
    #box_cfg{
        item_id=76064,
        count=1,
        items=[#box_item{rate=100,item_id=77122,num=1},#box_item{rate=100,item_id=77123,num=1},#box_item{rate=100,item_id=77124,num=1},#box_item{rate=100,item_id=77125,num=1},#box_item{rate=0,item_id=77128,num=1},#box_item{rate=0,item_id=77129,num=1},#box_item{rate=0,item_id=77130,num=1},#box_item{rate=0,item_id=77131,num=1}]};

get(76065) ->
    #box_cfg{
        item_id=76065,
        count=1,
        items=[#box_item{rate=1000,item_id=9,num=2333},#box_item{rate=800,item_id=9,num=4666},#box_item{rate=600,item_id=9,num=6999},#box_item{rate=200,item_id=9,num=23333},#box_item{rate=30,item_id=77127,num=1},#box_item{rate=30,item_id=77128,num=1},#box_item{rate=30,item_id=77129,num=1},#box_item{rate=30,item_id=77130,num=1},#box_item{rate=30,item_id=77131,num=1},#box_item{rate=30,item_id=77132,num=1},#box_item{rate=30,item_id=77117,num=1}]};

get(_) -> false.


