-module(quality_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({1,0}) ->
    #quality_cfg{
        type=1,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({1,1}) ->
    #quality_cfg{
        type=1,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({1,2}) ->
    #quality_cfg{
        type=1,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({1,3}) ->
    #quality_cfg{
        type=1,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({1,4}) ->
    #quality_cfg{
        type=1,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({1,5}) ->
    #quality_cfg{
        type=1,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({1,6}) ->
    #quality_cfg{
        type=1,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get({2,0}) ->
    #quality_cfg{
        type=2,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({2,1}) ->
    #quality_cfg{
        type=2,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({2,2}) ->
    #quality_cfg{
        type=2,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({2,3}) ->
    #quality_cfg{
        type=2,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({2,4}) ->
    #quality_cfg{
        type=2,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({2,5}) ->
    #quality_cfg{
        type=2,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({2,6}) ->
    #quality_cfg{
        type=2,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get({3,0}) ->
    #quality_cfg{
        type=3,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({3,1}) ->
    #quality_cfg{
        type=3,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({3,2}) ->
    #quality_cfg{
        type=3,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({3,3}) ->
    #quality_cfg{
        type=3,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({3,4}) ->
    #quality_cfg{
        type=3,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({3,5}) ->
    #quality_cfg{
        type=3,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({3,6}) ->
    #quality_cfg{
        type=3,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get({4,0}) ->
    #quality_cfg{
        type=4,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({4,1}) ->
    #quality_cfg{
        type=4,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({4,2}) ->
    #quality_cfg{
        type=4,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({4,3}) ->
    #quality_cfg{
        type=4,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({4,4}) ->
    #quality_cfg{
        type=4,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({4,5}) ->
    #quality_cfg{
        type=4,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({4,6}) ->
    #quality_cfg{
        type=4,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get({5,0}) ->
    #quality_cfg{
        type=5,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({5,1}) ->
    #quality_cfg{
        type=5,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({5,2}) ->
    #quality_cfg{
        type=5,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({5,3}) ->
    #quality_cfg{
        type=5,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({5,4}) ->
    #quality_cfg{
        type=5,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({5,5}) ->
    #quality_cfg{
        type=5,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({5,6}) ->
    #quality_cfg{
        type=5,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get({6,0}) ->
    #quality_cfg{
        type=6,
        star=0,
        max_instensify=20,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73000,num=5},#quality_need_item{item_id=73001,num=5},#quality_need_item{item_id=73002,num=5}]};

get({6,1}) ->
    #quality_cfg{
        type=6,
        star=1,
        max_instensify=40,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73003,num=20},#quality_need_item{item_id=73004,num=20},#quality_need_item{item_id=73005,num=20}]};

get({6,2}) ->
    #quality_cfg{
        type=6,
        star=2,
        max_instensify=60,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73006,num=30},#quality_need_item{item_id=73007,num=30},#quality_need_item{item_id=73008,num=30}]};

get({6,3}) ->
    #quality_cfg{
        type=6,
        star=3,
        max_instensify=80,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73009,num=50},#quality_need_item{item_id=73010,num=50},#quality_need_item{item_id=73011,num=50}]};

get({6,4}) ->
    #quality_cfg{
        type=6,
        star=4,
        max_instensify=100,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73012,num=75},#quality_need_item{item_id=73013,num=75},#quality_need_item{item_id=73014,num=75}]};

get({6,5}) ->
    #quality_cfg{
        type=6,
        star=5,
        max_instensify=120,
        level_reduce=5,
        need_item=[#quality_need_item{item_id=73015,num=100},#quality_need_item{item_id=73016,num=100},#quality_need_item{item_id=73017,num=100}]};

get({6,6}) ->
    #quality_cfg{
        type=6,
        star=6,
        max_instensify=150,
        level_reduce=5,
        need_item=[]};

get(_) -> false.

get_all() ->
    [{1,0},{1,1},{1,2},{1,3},{1,4},{1,5},{1,6},{2,0},{2,1},{2,2},{2,3},{2,4},{2,5},{2,6},{3,0},{3,1},{3,2},{3,3},{3,4},{3,5},{3,6},{4,0},{4,1},{4,2},{4,3},{4,4},{4,5},{4,6},{5,0},{5,1},{5,2},{5,3},{5,4},{5,5},{5,6},{6,0},{6,1},{6,2},{6,3},{6,4},{6,5},{6,6}].

