-module(suit_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({10001,1}) ->
    #suit_cfg{
        id=10001,
        sid=1,
        items=[70000, 70001, 70002, 70003, 70004, 70005],
        add2=[[0, 0]],
        add3=[[5, 43]],
        add4=[[0, 0]],
        add5=[[0, 0]],
        add6=[[62, 26]]};

get({10001,2}) ->
    #suit_cfg{
        id=10001,
        sid=2,
        items=[70018, 70019, 70020, 70021, 70022, 70023],
        add2=[[3, 80]],
        add3=[[0, 0]],
        add4=[[7, 1618]],
        add5=[[0, 0]],
        add6=[[62, 52]]};

get({10001,3}) ->
    #suit_cfg{
        id=10001,
        sid=3,
        items=[70036, 70037, 70038, 70039, 70040, 70041],
        add2=[[3, 160]],
        add3=[[0, 0]],
        add4=[[7, 3236]],
        add5=[[0, 0]],
        add6=[[62, 104]]};

get({10001,4}) ->
    #suit_cfg{
        id=10001,
        sid=4,
        items=[70054, 70055, 70056, 70057, 70058, 70059],
        add2=[[3, 320]],
        add3=[[0, 0]],
        add4=[[7, 6472]],
        add5=[[4, 264]],
        add6=[[62, 208]]};

get({10001,5}) ->
    #suit_cfg{
        id=10001,
        sid=5,
        items=[70072, 70073, 70074, 70075, 70076, 70077],
        add2=[[3, 480]],
        add3=[[5, 516]],
        add4=[[7, 9708]],
        add5=[[4, 396]],
        add6=[[62, 312]]};

get({10002,1}) ->
    #suit_cfg{
        id=10002,
        sid=1,
        items=[70006, 70007, 70008, 70009, 70010, 70011],
        add2=[[0, 0]],
        add3=[[3, 42]],
        add4=[[0, 0]],
        add5=[[0, 0]],
        add6=[[63, 12]]};

get({10002,2}) ->
    #suit_cfg{
        id=10002,
        sid=2,
        items=[70024, 70025, 70026, 70027, 70028, 70029],
        add2=[[6, 36]],
        add3=[[0, 0]],
        add4=[[5, 84]],
        add5=[[0, 0]],
        add6=[[63, 24]]};

get({10002,3}) ->
    #suit_cfg{
        id=10002,
        sid=3,
        items=[70042, 70043, 70044, 70045, 70046, 70047],
        add2=[[6, 72]],
        add3=[[0, 0]],
        add4=[[5, 168]],
        add5=[[0, 0]],
        add6=[[63, 48]]};

get({10002,4}) ->
    #suit_cfg{
        id=10002,
        sid=4,
        items=[70060, 70061, 70062, 70063, 70064, 70065],
        add2=[[6, 144]],
        add3=[[0, 0]],
        add4=[[5, 336]],
        add5=[[7, 6320]],
        add6=[[63, 96]]};

get({10002,5}) ->
    #suit_cfg{
        id=10002,
        sid=5,
        items=[70078, 70079, 70080, 70081, 70082, 70083],
        add2=[[6, 288]],
        add3=[[3, 672]],
        add4=[[5, 672]],
        add5=[[7, 12640]],
        add6=[[63, 192]]};

get({10003,1}) ->
    #suit_cfg{
        id=10003,
        sid=1,
        items=[70012, 70013, 70014, 70015, 70016, 70017],
        add2=[[0, 0]],
        add3=[[3, 42]],
        add4=[[0, 0]],
        add5=[[0, 0]],
        add6=[[62, 26]]};

get({10003,2}) ->
    #suit_cfg{
        id=10003,
        sid=2,
        items=[70030, 70031, 70032, 70033, 70034, 70035],
        add2=[[5, 50]],
        add3=[[0, 0]],
        add4=[[4, 52]],
        add5=[[0, 0]],
        add6=[[62, 52]]};

get({10003,3}) ->
    #suit_cfg{
        id=10003,
        sid=3,
        items=[70048, 70049, 70050, 70051, 70052, 70053],
        add2=[[5, 100]],
        add3=[[0, 0]],
        add4=[[4, 104]],
        add5=[[0, 0]],
        add6=[[62, 104]]};

get({10003,4}) ->
    #suit_cfg{
        id=10003,
        sid=4,
        items=[70066, 70067, 70068, 70069, 70070, 70071],
        add2=[[5, 200]],
        add3=[[0, 0]],
        add4=[[4, 208]],
        add5=[[63, 96]],
        add6=[[62, 208]]};

get({10003,5}) ->
    #suit_cfg{
        id=10003,
        sid=5,
        items=[70084, 70085, 70086, 70087, 70088, 70089],
        add2=[[5, 400]],
        add3=[[3, 672]],
        add4=[[4, 416]],
        add5=[[63, 192]],
        add6=[[62, 416]]};

get(_) -> false.

get_all() ->
    [{10001,1},{10001,2},{10001,3},{10001,4},{10001,5},{10002,1},{10002,2},{10002,3},{10002,4},{10002,5},{10003,1},{10003,2},{10003,3},{10003,4},{10003,5}].
