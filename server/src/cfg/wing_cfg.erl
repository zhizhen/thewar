-module(wing_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({77201,1}) ->
    #wing_cfg{
        wing_id=77201,
        level=1,
        fail_lv=1,
        rate=100,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=62,
        attr2ratio=0,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=2,
        inc_rate_cost=0};

get({77201,2}) ->
    #wing_cfg{
        wing_id=77201,
        level=2,
        fail_lv=1,
        rate=80,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=62,
        attr2ratio=0,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=4,
        inc_rate_cost=50};

get({77201,3}) ->
    #wing_cfg{
        wing_id=77201,
        level=3,
        fail_lv=1,
        rate=60,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=62,
        attr2ratio=1,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=6,
        inc_rate_cost=100};

get({77201,4}) ->
    #wing_cfg{
        wing_id=77201,
        level=4,
        fail_lv=1,
        rate=50,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=62,
        attr2ratio=1,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=10,
        inc_rate_cost=200};

get({77201,5}) ->
    #wing_cfg{
        wing_id=77201,
        level=5,
        fail_lv=5,
        rate=60,
        attr1idx=7,
        attr1ratio=2,
        attr2idx=62,
        attr2ratio=2,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=3,
        inc_rate_cost=150};

get({77201,6}) ->
    #wing_cfg{
        wing_id=77201,
        level=6,
        fail_lv=5,
        rate=50,
        attr1idx=7,
        attr1ratio=3,
        attr2idx=62,
        attr2ratio=3,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=6,
        inc_rate_cost=360};

get({77201,7}) ->
    #wing_cfg{
        wing_id=77201,
        level=7,
        fail_lv=5,
        rate=40,
        attr1idx=7,
        attr1ratio=4,
        attr2idx=62,
        attr2ratio=4,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=9,
        inc_rate_cost=675};

get({77201,8}) ->
    #wing_cfg{
        wing_id=77201,
        level=8,
        fail_lv=5,
        rate=30,
        attr1idx=7,
        attr1ratio=6,
        attr2idx=62,
        attr2ratio=6,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=15,
        inc_rate_cost=1500};

get({77201,9}) ->
    #wing_cfg{
        wing_id=77201,
        level=9,
        fail_lv=5,
        rate=20,
        attr1idx=7,
        attr1ratio=7,
        attr2idx=62,
        attr2ratio=7,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=24,
        inc_rate_cost=3600};

get({77201,10}) ->
    #wing_cfg{
        wing_id=77201,
        level=10,
        fail_lv=10,
        rate=50,
        attr1idx=7,
        attr1ratio=8,
        attr2idx=62,
        attr2ratio=8,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=4,
        inc_rate_cost=720};

get({77201,11}) ->
    #wing_cfg{
        wing_id=77201,
        level=11,
        fail_lv=10,
        rate=40,
        attr1idx=7,
        attr1ratio=10,
        attr2idx=62,
        attr2ratio=10,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=8,
        inc_rate_cost=1800};

get({77201,12}) ->
    #wing_cfg{
        wing_id=77201,
        level=12,
        fail_lv=10,
        rate=30,
        attr1idx=7,
        attr1ratio=12,
        attr2idx=62,
        attr2ratio=12,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=12,
        inc_rate_cost=3600};

get({77201,13}) ->
    #wing_cfg{
        wing_id=77201,
        level=13,
        fail_lv=10,
        rate=25,
        attr1idx=7,
        attr1ratio=13,
        attr2idx=62,
        attr2ratio=13,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=20,
        inc_rate_cost=7200};

get({77201,14}) ->
    #wing_cfg{
        wing_id=77201,
        level=14,
        fail_lv=10,
        rate=20,
        attr1idx=7,
        attr1ratio=15,
        attr2idx=62,
        attr2ratio=15,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=32,
        inc_rate_cost=14400};

get({77201,15}) ->
    #wing_cfg{
        wing_id=77201,
        level=15,
        fail_lv=10,
        rate=0,
        attr1idx=7,
        attr1ratio=17,
        attr2idx=62,
        attr2ratio=17,
        attr3idx=0,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=0,
        item_num=0,
        inc_rate_cost=0};

get({77202,1}) ->
    #wing_cfg{
        wing_id=77202,
        level=1,
        fail_lv=1,
        rate=100,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=62,
        attr2ratio=0,
        attr3idx=63,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=2,
        inc_rate_cost=0};

get({77202,2}) ->
    #wing_cfg{
        wing_id=77202,
        level=2,
        fail_lv=1,
        rate=80,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=62,
        attr2ratio=0,
        attr3idx=63,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=4,
        inc_rate_cost=50};

get({77202,3}) ->
    #wing_cfg{
        wing_id=77202,
        level=3,
        fail_lv=1,
        rate=60,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=62,
        attr2ratio=1,
        attr3idx=63,
        attr3ratio=1,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=6,
        inc_rate_cost=100};

get({77202,4}) ->
    #wing_cfg{
        wing_id=77202,
        level=4,
        fail_lv=1,
        rate=50,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=62,
        attr2ratio=1,
        attr3idx=63,
        attr3ratio=1,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=10,
        inc_rate_cost=200};

get({77202,5}) ->
    #wing_cfg{
        wing_id=77202,
        level=5,
        fail_lv=5,
        rate=60,
        attr1idx=7,
        attr1ratio=2,
        attr2idx=62,
        attr2ratio=2,
        attr3idx=63,
        attr3ratio=2,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=3,
        inc_rate_cost=150};

get({77202,6}) ->
    #wing_cfg{
        wing_id=77202,
        level=6,
        fail_lv=5,
        rate=50,
        attr1idx=7,
        attr1ratio=3,
        attr2idx=62,
        attr2ratio=3,
        attr3idx=63,
        attr3ratio=3,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=6,
        inc_rate_cost=360};

get({77202,7}) ->
    #wing_cfg{
        wing_id=77202,
        level=7,
        fail_lv=5,
        rate=40,
        attr1idx=7,
        attr1ratio=4,
        attr2idx=62,
        attr2ratio=4,
        attr3idx=63,
        attr3ratio=4,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=9,
        inc_rate_cost=675};

get({77202,8}) ->
    #wing_cfg{
        wing_id=77202,
        level=8,
        fail_lv=5,
        rate=30,
        attr1idx=7,
        attr1ratio=6,
        attr2idx=62,
        attr2ratio=6,
        attr3idx=63,
        attr3ratio=6,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=15,
        inc_rate_cost=1500};

get({77202,9}) ->
    #wing_cfg{
        wing_id=77202,
        level=9,
        fail_lv=5,
        rate=20,
        attr1idx=7,
        attr1ratio=7,
        attr2idx=62,
        attr2ratio=7,
        attr3idx=63,
        attr3ratio=7,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=24,
        inc_rate_cost=3600};

get({77202,10}) ->
    #wing_cfg{
        wing_id=77202,
        level=10,
        fail_lv=10,
        rate=50,
        attr1idx=7,
        attr1ratio=8,
        attr2idx=62,
        attr2ratio=8,
        attr3idx=63,
        attr3ratio=8,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=4,
        inc_rate_cost=720};

get({77202,11}) ->
    #wing_cfg{
        wing_id=77202,
        level=11,
        fail_lv=10,
        rate=40,
        attr1idx=7,
        attr1ratio=10,
        attr2idx=62,
        attr2ratio=10,
        attr3idx=63,
        attr3ratio=10,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=8,
        inc_rate_cost=1800};

get({77202,12}) ->
    #wing_cfg{
        wing_id=77202,
        level=12,
        fail_lv=10,
        rate=30,
        attr1idx=7,
        attr1ratio=12,
        attr2idx=62,
        attr2ratio=12,
        attr3idx=63,
        attr3ratio=12,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=12,
        inc_rate_cost=3600};

get({77202,13}) ->
    #wing_cfg{
        wing_id=77202,
        level=13,
        fail_lv=10,
        rate=25,
        attr1idx=7,
        attr1ratio=13,
        attr2idx=62,
        attr2ratio=13,
        attr3idx=63,
        attr3ratio=13,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=20,
        inc_rate_cost=7200};

get({77202,14}) ->
    #wing_cfg{
        wing_id=77202,
        level=14,
        fail_lv=10,
        rate=20,
        attr1idx=7,
        attr1ratio=15,
        attr2idx=62,
        attr2ratio=15,
        attr3idx=63,
        attr3ratio=15,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=32,
        inc_rate_cost=14400};

get({77202,15}) ->
    #wing_cfg{
        wing_id=77202,
        level=15,
        fail_lv=10,
        rate=0,
        attr1idx=7,
        attr1ratio=17,
        attr2idx=62,
        attr2ratio=17,
        attr3idx=63,
        attr3ratio=17,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=0,
        item_num=0,
        inc_rate_cost=0};

get({77203,1}) ->
    #wing_cfg{
        wing_id=77203,
        level=1,
        fail_lv=1,
        rate=100,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=1,
        attr2ratio=0,
        attr3idx=2,
        attr3ratio=0,
        attr4idx=62,
        attr4ratio=0,
        attr5idx=63,
        attr5ratio=0,
        intensive_item=77211,
        item_num=2,
        inc_rate_cost=0};

get({77203,2}) ->
    #wing_cfg{
        wing_id=77203,
        level=2,
        fail_lv=1,
        rate=80,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=1,
        attr2ratio=0,
        attr3idx=2,
        attr3ratio=0,
        attr4idx=62,
        attr4ratio=0,
        attr5idx=63,
        attr5ratio=0,
        intensive_item=77211,
        item_num=4,
        inc_rate_cost=50};

get({77203,3}) ->
    #wing_cfg{
        wing_id=77203,
        level=3,
        fail_lv=1,
        rate=60,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=1,
        attr2ratio=1,
        attr3idx=2,
        attr3ratio=1,
        attr4idx=62,
        attr4ratio=1,
        attr5idx=63,
        attr5ratio=1,
        intensive_item=77211,
        item_num=6,
        inc_rate_cost=100};

get({77203,4}) ->
    #wing_cfg{
        wing_id=77203,
        level=4,
        fail_lv=1,
        rate=50,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=1,
        attr2ratio=1,
        attr3idx=2,
        attr3ratio=1,
        attr4idx=62,
        attr4ratio=1,
        attr5idx=63,
        attr5ratio=1,
        intensive_item=77211,
        item_num=10,
        inc_rate_cost=200};

get({77203,5}) ->
    #wing_cfg{
        wing_id=77203,
        level=5,
        fail_lv=5,
        rate=60,
        attr1idx=7,
        attr1ratio=2,
        attr2idx=1,
        attr2ratio=2,
        attr3idx=2,
        attr3ratio=2,
        attr4idx=62,
        attr4ratio=2,
        attr5idx=63,
        attr5ratio=2,
        intensive_item=77212,
        item_num=3,
        inc_rate_cost=150};

get({77203,6}) ->
    #wing_cfg{
        wing_id=77203,
        level=6,
        fail_lv=5,
        rate=50,
        attr1idx=7,
        attr1ratio=3,
        attr2idx=1,
        attr2ratio=3,
        attr3idx=2,
        attr3ratio=3,
        attr4idx=62,
        attr4ratio=3,
        attr5idx=63,
        attr5ratio=3,
        intensive_item=77212,
        item_num=6,
        inc_rate_cost=360};

get({77203,7}) ->
    #wing_cfg{
        wing_id=77203,
        level=7,
        fail_lv=5,
        rate=40,
        attr1idx=7,
        attr1ratio=4,
        attr2idx=1,
        attr2ratio=4,
        attr3idx=2,
        attr3ratio=4,
        attr4idx=62,
        attr4ratio=4,
        attr5idx=63,
        attr5ratio=4,
        intensive_item=77212,
        item_num=9,
        inc_rate_cost=675};

get({77203,8}) ->
    #wing_cfg{
        wing_id=77203,
        level=8,
        fail_lv=5,
        rate=30,
        attr1idx=7,
        attr1ratio=6,
        attr2idx=1,
        attr2ratio=6,
        attr3idx=2,
        attr3ratio=6,
        attr4idx=62,
        attr4ratio=6,
        attr5idx=63,
        attr5ratio=6,
        intensive_item=77212,
        item_num=15,
        inc_rate_cost=1500};

get({77203,9}) ->
    #wing_cfg{
        wing_id=77203,
        level=9,
        fail_lv=5,
        rate=20,
        attr1idx=7,
        attr1ratio=7,
        attr2idx=1,
        attr2ratio=7,
        attr3idx=2,
        attr3ratio=7,
        attr4idx=62,
        attr4ratio=7,
        attr5idx=63,
        attr5ratio=7,
        intensive_item=77212,
        item_num=24,
        inc_rate_cost=3600};

get({77203,10}) ->
    #wing_cfg{
        wing_id=77203,
        level=10,
        fail_lv=10,
        rate=50,
        attr1idx=7,
        attr1ratio=8,
        attr2idx=1,
        attr2ratio=8,
        attr3idx=2,
        attr3ratio=8,
        attr4idx=62,
        attr4ratio=8,
        attr5idx=63,
        attr5ratio=8,
        intensive_item=77213,
        item_num=4,
        inc_rate_cost=720};

get({77203,11}) ->
    #wing_cfg{
        wing_id=77203,
        level=11,
        fail_lv=10,
        rate=40,
        attr1idx=7,
        attr1ratio=10,
        attr2idx=1,
        attr2ratio=10,
        attr3idx=2,
        attr3ratio=10,
        attr4idx=62,
        attr4ratio=10,
        attr5idx=63,
        attr5ratio=10,
        intensive_item=77213,
        item_num=8,
        inc_rate_cost=1800};

get({77203,12}) ->
    #wing_cfg{
        wing_id=77203,
        level=12,
        fail_lv=10,
        rate=30,
        attr1idx=7,
        attr1ratio=12,
        attr2idx=1,
        attr2ratio=12,
        attr3idx=2,
        attr3ratio=12,
        attr4idx=62,
        attr4ratio=12,
        attr5idx=63,
        attr5ratio=12,
        intensive_item=77213,
        item_num=12,
        inc_rate_cost=3600};

get({77203,13}) ->
    #wing_cfg{
        wing_id=77203,
        level=13,
        fail_lv=10,
        rate=25,
        attr1idx=7,
        attr1ratio=13,
        attr2idx=1,
        attr2ratio=13,
        attr3idx=2,
        attr3ratio=13,
        attr4idx=62,
        attr4ratio=13,
        attr5idx=63,
        attr5ratio=13,
        intensive_item=77213,
        item_num=20,
        inc_rate_cost=7200};

get({77203,14}) ->
    #wing_cfg{
        wing_id=77203,
        level=14,
        fail_lv=10,
        rate=20,
        attr1idx=7,
        attr1ratio=15,
        attr2idx=1,
        attr2ratio=15,
        attr3idx=2,
        attr3ratio=15,
        attr4idx=62,
        attr4ratio=15,
        attr5idx=63,
        attr5ratio=15,
        intensive_item=77213,
        item_num=32,
        inc_rate_cost=14400};

get({77203,15}) ->
    #wing_cfg{
        wing_id=77203,
        level=15,
        fail_lv=10,
        rate=0,
        attr1idx=7,
        attr1ratio=17,
        attr2idx=1,
        attr2ratio=17,
        attr3idx=2,
        attr3ratio=17,
        attr4idx=62,
        attr4ratio=17,
        attr5idx=63,
        attr5ratio=17,
        intensive_item=0,
        item_num=0,
        inc_rate_cost=0};

get({77204,1}) ->
    #wing_cfg{
        wing_id=77204,
        level=1,
        fail_lv=1,
        rate=100,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=1,
        attr2ratio=0,
        attr3idx=2,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=2,
        inc_rate_cost=0};

get({77204,2}) ->
    #wing_cfg{
        wing_id=77204,
        level=2,
        fail_lv=1,
        rate=80,
        attr1idx=7,
        attr1ratio=0,
        attr2idx=1,
        attr2ratio=0,
        attr3idx=2,
        attr3ratio=0,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=4,
        inc_rate_cost=50};

get({77204,3}) ->
    #wing_cfg{
        wing_id=77204,
        level=3,
        fail_lv=1,
        rate=60,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=1,
        attr2ratio=1,
        attr3idx=2,
        attr3ratio=1,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=6,
        inc_rate_cost=100};

get({77204,4}) ->
    #wing_cfg{
        wing_id=77204,
        level=4,
        fail_lv=1,
        rate=50,
        attr1idx=7,
        attr1ratio=1,
        attr2idx=1,
        attr2ratio=1,
        attr3idx=2,
        attr3ratio=1,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77211,
        item_num=10,
        inc_rate_cost=200};

get({77204,5}) ->
    #wing_cfg{
        wing_id=77204,
        level=5,
        fail_lv=5,
        rate=60,
        attr1idx=7,
        attr1ratio=2,
        attr2idx=1,
        attr2ratio=2,
        attr3idx=2,
        attr3ratio=2,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=3,
        inc_rate_cost=150};

get({77204,6}) ->
    #wing_cfg{
        wing_id=77204,
        level=6,
        fail_lv=5,
        rate=50,
        attr1idx=7,
        attr1ratio=3,
        attr2idx=1,
        attr2ratio=3,
        attr3idx=2,
        attr3ratio=3,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=6,
        inc_rate_cost=360};

get({77204,7}) ->
    #wing_cfg{
        wing_id=77204,
        level=7,
        fail_lv=5,
        rate=40,
        attr1idx=7,
        attr1ratio=4,
        attr2idx=1,
        attr2ratio=4,
        attr3idx=2,
        attr3ratio=4,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=9,
        inc_rate_cost=675};

get({77204,8}) ->
    #wing_cfg{
        wing_id=77204,
        level=8,
        fail_lv=5,
        rate=30,
        attr1idx=7,
        attr1ratio=6,
        attr2idx=1,
        attr2ratio=6,
        attr3idx=2,
        attr3ratio=6,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=15,
        inc_rate_cost=1500};

get({77204,9}) ->
    #wing_cfg{
        wing_id=77204,
        level=9,
        fail_lv=5,
        rate=20,
        attr1idx=7,
        attr1ratio=7,
        attr2idx=1,
        attr2ratio=7,
        attr3idx=2,
        attr3ratio=7,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77212,
        item_num=24,
        inc_rate_cost=3600};

get({77204,10}) ->
    #wing_cfg{
        wing_id=77204,
        level=10,
        fail_lv=10,
        rate=50,
        attr1idx=7,
        attr1ratio=8,
        attr2idx=1,
        attr2ratio=8,
        attr3idx=2,
        attr3ratio=8,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=4,
        inc_rate_cost=720};

get({77204,11}) ->
    #wing_cfg{
        wing_id=77204,
        level=11,
        fail_lv=10,
        rate=40,
        attr1idx=7,
        attr1ratio=10,
        attr2idx=1,
        attr2ratio=10,
        attr3idx=2,
        attr3ratio=10,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=8,
        inc_rate_cost=1800};

get({77204,12}) ->
    #wing_cfg{
        wing_id=77204,
        level=12,
        fail_lv=10,
        rate=30,
        attr1idx=7,
        attr1ratio=12,
        attr2idx=1,
        attr2ratio=12,
        attr3idx=2,
        attr3ratio=12,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=12,
        inc_rate_cost=3600};

get({77204,13}) ->
    #wing_cfg{
        wing_id=77204,
        level=13,
        fail_lv=10,
        rate=25,
        attr1idx=7,
        attr1ratio=13,
        attr2idx=1,
        attr2ratio=13,
        attr3idx=2,
        attr3ratio=13,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=20,
        inc_rate_cost=7200};

get({77204,14}) ->
    #wing_cfg{
        wing_id=77204,
        level=14,
        fail_lv=10,
        rate=20,
        attr1idx=7,
        attr1ratio=15,
        attr2idx=1,
        attr2ratio=15,
        attr3idx=2,
        attr3ratio=15,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=77213,
        item_num=32,
        inc_rate_cost=14400};

get({77204,15}) ->
    #wing_cfg{
        wing_id=77204,
        level=15,
        fail_lv=10,
        rate=0,
        attr1idx=7,
        attr1ratio=17,
        attr2idx=1,
        attr2ratio=17,
        attr3idx=2,
        attr3ratio=17,
        attr4idx=0,
        attr4ratio=0,
        attr5idx=0,
        attr5ratio=0,
        intensive_item=0,
        item_num=0,
        inc_rate_cost=0};

get(_) -> false.


