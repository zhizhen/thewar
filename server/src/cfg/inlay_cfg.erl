-module(inlay_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #inlay_cfg{
        type=1,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=11,
        gem_type2=11,
        gem_type3=11,
        gem_type4=11,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(2) ->
    #inlay_cfg{
        type=2,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=10,
        gem_type2=10,
        gem_type3=10,
        gem_type4=10,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(3) ->
    #inlay_cfg{
        type=3,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=16,
        gem_type2=16,
        gem_type3=16,
        gem_type4=16,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(4) ->
    #inlay_cfg{
        type=4,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=13,
        gem_type2=13,
        gem_type3=13,
        gem_type4=13,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(5) ->
    #inlay_cfg{
        type=5,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=14,
        gem_type2=14,
        gem_type3=14,
        gem_type4=14,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(6) ->
    #inlay_cfg{
        type=6,
        max_punch=5,
        punch_consume=[#consume{gold=0,coin=0},#consume{gold=0,coin=10},#consume{gold=0,coin=20},#consume{gold=0,coin=50},#consume{gold=0,coin=100}],
        inlay_consume=[#consume{gold=5000,coin=0},#consume{gold=20000,coin=0},#consume{gold=50000,coin=0},#consume{gold=100000,coin=0},#consume{gold=200000,coin=0},#consume{gold=0,coin=20},#consume{gold=0,coin=40},#consume{gold=0,coin=60},#consume{gold=0,coin=80},#consume{gold=0,coin=100}],
        gem_type1=12,
        gem_type2=12,
        gem_type3=12,
        gem_type4=12,
        gem_type5=15,
        gem_remove_cost=[#consume{gold=0,coin=1},#consume{gold=0,coin=3},#consume{gold=0,coin=9},#consume{gold=0,coin=27},#consume{gold=0,coin=81},#consume{gold=0,coin=243},#consume{gold=0,coin=729},#consume{gold=0,coin=2187},#consume{gold=0,coin=6561},#consume{gold=0,coin=19683}]};

get(_) -> false.


