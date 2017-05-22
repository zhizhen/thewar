-module(intensify_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({1,1}) ->
    #intensify_cfg{
        type=1,
        level=1,
        attr1idx=3,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=4,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({1,2}) ->
    #intensify_cfg{
        type=1,
        level=2,
        attr1idx=3,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=4,
        attr2ratio=0.1,
        attr2num=4,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({1,3}) ->
    #intensify_cfg{
        type=1,
        level=3,
        attr1idx=3,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=4,
        attr2ratio=0.2,
        attr2num=8,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({1,4}) ->
    #intensify_cfg{
        type=1,
        level=4,
        attr1idx=3,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=4,
        attr2ratio=0.3,
        attr2num=12,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({1,5}) ->
    #intensify_cfg{
        type=1,
        level=5,
        attr1idx=3,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=4,
        attr2ratio=0.4,
        attr2num=16,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({1,6}) ->
    #intensify_cfg{
        type=1,
        level=6,
        attr1idx=3,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=4,
        attr2ratio=0.5,
        attr2num=20,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({1,7}) ->
    #intensify_cfg{
        type=1,
        level=7,
        attr1idx=3,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=4,
        attr2ratio=0.6,
        attr2num=24,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({1,8}) ->
    #intensify_cfg{
        type=1,
        level=8,
        attr1idx=3,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=4,
        attr2ratio=0.7,
        attr2num=28,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({1,9}) ->
    #intensify_cfg{
        type=1,
        level=9,
        attr1idx=3,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=4,
        attr2ratio=0.8,
        attr2num=32,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({1,10}) ->
    #intensify_cfg{
        type=1,
        level=10,
        attr1idx=3,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=4,
        attr2ratio=0.9,
        attr2num=36,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({1,11}) ->
    #intensify_cfg{
        type=1,
        level=11,
        attr1idx=3,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=4,
        attr2ratio=1.0,
        attr2num=40,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({1,12}) ->
    #intensify_cfg{
        type=1,
        level=12,
        attr1idx=3,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=4,
        attr2ratio=1.1,
        attr2num=44,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({1,13}) ->
    #intensify_cfg{
        type=1,
        level=13,
        attr1idx=3,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=4,
        attr2ratio=1.2,
        attr2num=48,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({1,14}) ->
    #intensify_cfg{
        type=1,
        level=14,
        attr1idx=3,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=4,
        attr2ratio=1.3,
        attr2num=52,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({1,15}) ->
    #intensify_cfg{
        type=1,
        level=15,
        attr1idx=3,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=4,
        attr2ratio=1.4,
        attr2num=56,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({1,16}) ->
    #intensify_cfg{
        type=1,
        level=16,
        attr1idx=3,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=4,
        attr2ratio=1.5,
        attr2num=60,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({1,17}) ->
    #intensify_cfg{
        type=1,
        level=17,
        attr1idx=3,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=4,
        attr2ratio=1.6,
        attr2num=64,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({1,18}) ->
    #intensify_cfg{
        type=1,
        level=18,
        attr1idx=3,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=4,
        attr2ratio=1.7,
        attr2num=68,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({1,19}) ->
    #intensify_cfg{
        type=1,
        level=19,
        attr1idx=3,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=4,
        attr2ratio=1.8,
        attr2num=72,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({1,20}) ->
    #intensify_cfg{
        type=1,
        level=20,
        attr1idx=3,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=4,
        attr2ratio=1.9,
        attr2num=76,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({1,21}) ->
    #intensify_cfg{
        type=1,
        level=21,
        attr1idx=3,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=4,
        attr2ratio=2.0,
        attr2num=80,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({1,22}) ->
    #intensify_cfg{
        type=1,
        level=22,
        attr1idx=3,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=4,
        attr2ratio=2.1,
        attr2num=85,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({1,23}) ->
    #intensify_cfg{
        type=1,
        level=23,
        attr1idx=3,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=4,
        attr2ratio=2.2,
        attr2num=90,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({1,24}) ->
    #intensify_cfg{
        type=1,
        level=24,
        attr1idx=3,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=4,
        attr2ratio=2.3,
        attr2num=95,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({1,25}) ->
    #intensify_cfg{
        type=1,
        level=25,
        attr1idx=3,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=4,
        attr2ratio=2.4,
        attr2num=100,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({1,26}) ->
    #intensify_cfg{
        type=1,
        level=26,
        attr1idx=3,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=4,
        attr2ratio=2.5,
        attr2num=105,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({1,27}) ->
    #intensify_cfg{
        type=1,
        level=27,
        attr1idx=3,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=4,
        attr2ratio=2.6,
        attr2num=110,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({1,28}) ->
    #intensify_cfg{
        type=1,
        level=28,
        attr1idx=3,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=4,
        attr2ratio=2.7,
        attr2num=115,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({1,29}) ->
    #intensify_cfg{
        type=1,
        level=29,
        attr1idx=3,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=4,
        attr2ratio=2.8,
        attr2num=120,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({1,30}) ->
    #intensify_cfg{
        type=1,
        level=30,
        attr1idx=3,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=4,
        attr2ratio=2.9,
        attr2num=125,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({1,31}) ->
    #intensify_cfg{
        type=1,
        level=31,
        attr1idx=3,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=4,
        attr2ratio=3.0,
        attr2num=130,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({1,32}) ->
    #intensify_cfg{
        type=1,
        level=32,
        attr1idx=3,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=4,
        attr2ratio=3.1,
        attr2num=135,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({1,33}) ->
    #intensify_cfg{
        type=1,
        level=33,
        attr1idx=3,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=4,
        attr2ratio=3.2,
        attr2num=140,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({1,34}) ->
    #intensify_cfg{
        type=1,
        level=34,
        attr1idx=3,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=4,
        attr2ratio=3.3,
        attr2num=145,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({1,35}) ->
    #intensify_cfg{
        type=1,
        level=35,
        attr1idx=3,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=4,
        attr2ratio=3.4,
        attr2num=150,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({1,36}) ->
    #intensify_cfg{
        type=1,
        level=36,
        attr1idx=3,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=4,
        attr2ratio=3.5,
        attr2num=155,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({1,37}) ->
    #intensify_cfg{
        type=1,
        level=37,
        attr1idx=3,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=4,
        attr2ratio=3.6,
        attr2num=160,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({1,38}) ->
    #intensify_cfg{
        type=1,
        level=38,
        attr1idx=3,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=4,
        attr2ratio=3.7,
        attr2num=165,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({1,39}) ->
    #intensify_cfg{
        type=1,
        level=39,
        attr1idx=3,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=4,
        attr2ratio=3.8,
        attr2num=170,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({1,40}) ->
    #intensify_cfg{
        type=1,
        level=40,
        attr1idx=3,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=4,
        attr2ratio=3.9,
        attr2num=175,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({1,41}) ->
    #intensify_cfg{
        type=1,
        level=41,
        attr1idx=3,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=4,
        attr2ratio=4.0,
        attr2num=180,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({1,42}) ->
    #intensify_cfg{
        type=1,
        level=42,
        attr1idx=3,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=4,
        attr2ratio=4.1,
        attr2num=186,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({1,43}) ->
    #intensify_cfg{
        type=1,
        level=43,
        attr1idx=3,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=4,
        attr2ratio=4.2,
        attr2num=192,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({1,44}) ->
    #intensify_cfg{
        type=1,
        level=44,
        attr1idx=3,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=4,
        attr2ratio=4.3,
        attr2num=198,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({1,45}) ->
    #intensify_cfg{
        type=1,
        level=45,
        attr1idx=3,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=4,
        attr2ratio=4.4,
        attr2num=204,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({1,46}) ->
    #intensify_cfg{
        type=1,
        level=46,
        attr1idx=3,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=4,
        attr2ratio=4.5,
        attr2num=210,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({1,47}) ->
    #intensify_cfg{
        type=1,
        level=47,
        attr1idx=3,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=4,
        attr2ratio=4.6,
        attr2num=216,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({1,48}) ->
    #intensify_cfg{
        type=1,
        level=48,
        attr1idx=3,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=4,
        attr2ratio=4.7,
        attr2num=222,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({1,49}) ->
    #intensify_cfg{
        type=1,
        level=49,
        attr1idx=3,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=4,
        attr2ratio=4.8,
        attr2num=228,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({1,50}) ->
    #intensify_cfg{
        type=1,
        level=50,
        attr1idx=3,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=4,
        attr2ratio=4.9,
        attr2num=234,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({1,51}) ->
    #intensify_cfg{
        type=1,
        level=51,
        attr1idx=3,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=4,
        attr2ratio=5.0,
        attr2num=240,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({1,52}) ->
    #intensify_cfg{
        type=1,
        level=52,
        attr1idx=3,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=4,
        attr2ratio=5.1,
        attr2num=246,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({1,53}) ->
    #intensify_cfg{
        type=1,
        level=53,
        attr1idx=3,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=4,
        attr2ratio=5.2,
        attr2num=252,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({1,54}) ->
    #intensify_cfg{
        type=1,
        level=54,
        attr1idx=3,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=4,
        attr2ratio=5.3,
        attr2num=258,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({1,55}) ->
    #intensify_cfg{
        type=1,
        level=55,
        attr1idx=3,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=4,
        attr2ratio=5.4,
        attr2num=264,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({1,56}) ->
    #intensify_cfg{
        type=1,
        level=56,
        attr1idx=3,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=4,
        attr2ratio=5.5,
        attr2num=270,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({1,57}) ->
    #intensify_cfg{
        type=1,
        level=57,
        attr1idx=3,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=4,
        attr2ratio=5.6,
        attr2num=276,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({1,58}) ->
    #intensify_cfg{
        type=1,
        level=58,
        attr1idx=3,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=4,
        attr2ratio=5.7,
        attr2num=282,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({1,59}) ->
    #intensify_cfg{
        type=1,
        level=59,
        attr1idx=3,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=4,
        attr2ratio=5.8,
        attr2num=288,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({1,60}) ->
    #intensify_cfg{
        type=1,
        level=60,
        attr1idx=3,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=4,
        attr2ratio=5.9,
        attr2num=294,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({1,61}) ->
    #intensify_cfg{
        type=1,
        level=61,
        attr1idx=3,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=4,
        attr2ratio=6.0,
        attr2num=300,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({1,62}) ->
    #intensify_cfg{
        type=1,
        level=62,
        attr1idx=3,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=4,
        attr2ratio=6.1,
        attr2num=307,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({1,63}) ->
    #intensify_cfg{
        type=1,
        level=63,
        attr1idx=3,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=4,
        attr2ratio=6.2,
        attr2num=314,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({1,64}) ->
    #intensify_cfg{
        type=1,
        level=64,
        attr1idx=3,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=4,
        attr2ratio=6.3,
        attr2num=321,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({1,65}) ->
    #intensify_cfg{
        type=1,
        level=65,
        attr1idx=3,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=4,
        attr2ratio=6.4,
        attr2num=328,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({1,66}) ->
    #intensify_cfg{
        type=1,
        level=66,
        attr1idx=3,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=4,
        attr2ratio=6.5,
        attr2num=335,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({1,67}) ->
    #intensify_cfg{
        type=1,
        level=67,
        attr1idx=3,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=4,
        attr2ratio=6.6,
        attr2num=342,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({1,68}) ->
    #intensify_cfg{
        type=1,
        level=68,
        attr1idx=3,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=4,
        attr2ratio=6.7,
        attr2num=349,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({1,69}) ->
    #intensify_cfg{
        type=1,
        level=69,
        attr1idx=3,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=4,
        attr2ratio=6.8,
        attr2num=356,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({1,70}) ->
    #intensify_cfg{
        type=1,
        level=70,
        attr1idx=3,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=4,
        attr2ratio=6.9,
        attr2num=363,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({1,71}) ->
    #intensify_cfg{
        type=1,
        level=71,
        attr1idx=3,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=4,
        attr2ratio=7.0,
        attr2num=370,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({1,72}) ->
    #intensify_cfg{
        type=1,
        level=72,
        attr1idx=3,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=4,
        attr2ratio=7.1,
        attr2num=377,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({1,73}) ->
    #intensify_cfg{
        type=1,
        level=73,
        attr1idx=3,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=4,
        attr2ratio=7.2,
        attr2num=384,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({1,74}) ->
    #intensify_cfg{
        type=1,
        level=74,
        attr1idx=3,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=4,
        attr2ratio=7.3,
        attr2num=391,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({1,75}) ->
    #intensify_cfg{
        type=1,
        level=75,
        attr1idx=3,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=4,
        attr2ratio=7.4,
        attr2num=398,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({1,76}) ->
    #intensify_cfg{
        type=1,
        level=76,
        attr1idx=3,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=4,
        attr2ratio=7.5,
        attr2num=405,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({1,77}) ->
    #intensify_cfg{
        type=1,
        level=77,
        attr1idx=3,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=4,
        attr2ratio=7.6,
        attr2num=412,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({1,78}) ->
    #intensify_cfg{
        type=1,
        level=78,
        attr1idx=3,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=4,
        attr2ratio=7.7,
        attr2num=419,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({1,79}) ->
    #intensify_cfg{
        type=1,
        level=79,
        attr1idx=3,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=4,
        attr2ratio=7.8,
        attr2num=426,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({1,80}) ->
    #intensify_cfg{
        type=1,
        level=80,
        attr1idx=3,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=4,
        attr2ratio=7.9,
        attr2num=433,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({1,81}) ->
    #intensify_cfg{
        type=1,
        level=81,
        attr1idx=3,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=4,
        attr2ratio=8.0,
        attr2num=440,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({1,82}) ->
    #intensify_cfg{
        type=1,
        level=82,
        attr1idx=3,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=4,
        attr2ratio=8.1,
        attr2num=448,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({1,83}) ->
    #intensify_cfg{
        type=1,
        level=83,
        attr1idx=3,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=4,
        attr2ratio=8.2,
        attr2num=456,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({1,84}) ->
    #intensify_cfg{
        type=1,
        level=84,
        attr1idx=3,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=4,
        attr2ratio=8.3,
        attr2num=464,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({1,85}) ->
    #intensify_cfg{
        type=1,
        level=85,
        attr1idx=3,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=4,
        attr2ratio=8.4,
        attr2num=472,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({1,86}) ->
    #intensify_cfg{
        type=1,
        level=86,
        attr1idx=3,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=4,
        attr2ratio=8.5,
        attr2num=480,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({1,87}) ->
    #intensify_cfg{
        type=1,
        level=87,
        attr1idx=3,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=4,
        attr2ratio=8.6,
        attr2num=488,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({1,88}) ->
    #intensify_cfg{
        type=1,
        level=88,
        attr1idx=3,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=4,
        attr2ratio=8.7,
        attr2num=496,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({1,89}) ->
    #intensify_cfg{
        type=1,
        level=89,
        attr1idx=3,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=4,
        attr2ratio=8.8,
        attr2num=504,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({1,90}) ->
    #intensify_cfg{
        type=1,
        level=90,
        attr1idx=3,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=4,
        attr2ratio=8.9,
        attr2num=512,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({1,91}) ->
    #intensify_cfg{
        type=1,
        level=91,
        attr1idx=3,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=4,
        attr2ratio=9.0,
        attr2num=520,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({1,92}) ->
    #intensify_cfg{
        type=1,
        level=92,
        attr1idx=3,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=4,
        attr2ratio=9.1,
        attr2num=528,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({1,93}) ->
    #intensify_cfg{
        type=1,
        level=93,
        attr1idx=3,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=4,
        attr2ratio=9.2,
        attr2num=536,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({1,94}) ->
    #intensify_cfg{
        type=1,
        level=94,
        attr1idx=3,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=4,
        attr2ratio=9.3,
        attr2num=544,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({1,95}) ->
    #intensify_cfg{
        type=1,
        level=95,
        attr1idx=3,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=4,
        attr2ratio=9.4,
        attr2num=552,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({1,96}) ->
    #intensify_cfg{
        type=1,
        level=96,
        attr1idx=3,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=4,
        attr2ratio=9.5,
        attr2num=560,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({1,97}) ->
    #intensify_cfg{
        type=1,
        level=97,
        attr1idx=3,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=4,
        attr2ratio=9.6,
        attr2num=568,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({1,98}) ->
    #intensify_cfg{
        type=1,
        level=98,
        attr1idx=3,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=4,
        attr2ratio=9.7,
        attr2num=576,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({1,99}) ->
    #intensify_cfg{
        type=1,
        level=99,
        attr1idx=3,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=4,
        attr2ratio=9.8,
        attr2num=584,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({1,100}) ->
    #intensify_cfg{
        type=1,
        level=100,
        attr1idx=3,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=4,
        attr2ratio=9.9,
        attr2num=592,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({1,101}) ->
    #intensify_cfg{
        type=1,
        level=101,
        attr1idx=3,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=4,
        attr2ratio=10.0,
        attr2num=600,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get({2,1}) ->
    #intensify_cfg{
        type=2,
        level=1,
        attr1idx=4,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=5,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({2,2}) ->
    #intensify_cfg{
        type=2,
        level=2,
        attr1idx=4,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=5,
        attr2ratio=0.1,
        attr2num=4,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({2,3}) ->
    #intensify_cfg{
        type=2,
        level=3,
        attr1idx=4,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=5,
        attr2ratio=0.2,
        attr2num=8,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({2,4}) ->
    #intensify_cfg{
        type=2,
        level=4,
        attr1idx=4,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=5,
        attr2ratio=0.3,
        attr2num=12,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({2,5}) ->
    #intensify_cfg{
        type=2,
        level=5,
        attr1idx=4,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=5,
        attr2ratio=0.4,
        attr2num=16,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({2,6}) ->
    #intensify_cfg{
        type=2,
        level=6,
        attr1idx=4,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=5,
        attr2ratio=0.5,
        attr2num=20,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({2,7}) ->
    #intensify_cfg{
        type=2,
        level=7,
        attr1idx=4,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=5,
        attr2ratio=0.6,
        attr2num=24,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({2,8}) ->
    #intensify_cfg{
        type=2,
        level=8,
        attr1idx=4,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=5,
        attr2ratio=0.7,
        attr2num=28,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({2,9}) ->
    #intensify_cfg{
        type=2,
        level=9,
        attr1idx=4,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=5,
        attr2ratio=0.8,
        attr2num=32,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({2,10}) ->
    #intensify_cfg{
        type=2,
        level=10,
        attr1idx=4,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=5,
        attr2ratio=0.9,
        attr2num=36,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({2,11}) ->
    #intensify_cfg{
        type=2,
        level=11,
        attr1idx=4,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=5,
        attr2ratio=1.0,
        attr2num=40,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({2,12}) ->
    #intensify_cfg{
        type=2,
        level=12,
        attr1idx=4,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=5,
        attr2ratio=1.1,
        attr2num=44,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({2,13}) ->
    #intensify_cfg{
        type=2,
        level=13,
        attr1idx=4,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=5,
        attr2ratio=1.2,
        attr2num=48,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({2,14}) ->
    #intensify_cfg{
        type=2,
        level=14,
        attr1idx=4,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=5,
        attr2ratio=1.3,
        attr2num=52,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({2,15}) ->
    #intensify_cfg{
        type=2,
        level=15,
        attr1idx=4,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=5,
        attr2ratio=1.4,
        attr2num=56,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({2,16}) ->
    #intensify_cfg{
        type=2,
        level=16,
        attr1idx=4,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=5,
        attr2ratio=1.5,
        attr2num=60,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({2,17}) ->
    #intensify_cfg{
        type=2,
        level=17,
        attr1idx=4,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=5,
        attr2ratio=1.6,
        attr2num=64,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({2,18}) ->
    #intensify_cfg{
        type=2,
        level=18,
        attr1idx=4,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=5,
        attr2ratio=1.7,
        attr2num=68,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({2,19}) ->
    #intensify_cfg{
        type=2,
        level=19,
        attr1idx=4,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=5,
        attr2ratio=1.8,
        attr2num=72,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({2,20}) ->
    #intensify_cfg{
        type=2,
        level=20,
        attr1idx=4,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=5,
        attr2ratio=1.9,
        attr2num=76,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({2,21}) ->
    #intensify_cfg{
        type=2,
        level=21,
        attr1idx=4,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=5,
        attr2ratio=2.0,
        attr2num=80,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({2,22}) ->
    #intensify_cfg{
        type=2,
        level=22,
        attr1idx=4,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=5,
        attr2ratio=2.1,
        attr2num=85,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({2,23}) ->
    #intensify_cfg{
        type=2,
        level=23,
        attr1idx=4,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=5,
        attr2ratio=2.2,
        attr2num=90,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({2,24}) ->
    #intensify_cfg{
        type=2,
        level=24,
        attr1idx=4,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=5,
        attr2ratio=2.3,
        attr2num=95,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({2,25}) ->
    #intensify_cfg{
        type=2,
        level=25,
        attr1idx=4,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=5,
        attr2ratio=2.4,
        attr2num=100,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({2,26}) ->
    #intensify_cfg{
        type=2,
        level=26,
        attr1idx=4,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=5,
        attr2ratio=2.5,
        attr2num=105,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({2,27}) ->
    #intensify_cfg{
        type=2,
        level=27,
        attr1idx=4,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=5,
        attr2ratio=2.6,
        attr2num=110,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({2,28}) ->
    #intensify_cfg{
        type=2,
        level=28,
        attr1idx=4,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=5,
        attr2ratio=2.7,
        attr2num=115,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({2,29}) ->
    #intensify_cfg{
        type=2,
        level=29,
        attr1idx=4,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=5,
        attr2ratio=2.8,
        attr2num=120,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({2,30}) ->
    #intensify_cfg{
        type=2,
        level=30,
        attr1idx=4,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=5,
        attr2ratio=2.9,
        attr2num=125,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({2,31}) ->
    #intensify_cfg{
        type=2,
        level=31,
        attr1idx=4,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=5,
        attr2ratio=3.0,
        attr2num=130,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({2,32}) ->
    #intensify_cfg{
        type=2,
        level=32,
        attr1idx=4,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=5,
        attr2ratio=3.1,
        attr2num=135,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({2,33}) ->
    #intensify_cfg{
        type=2,
        level=33,
        attr1idx=4,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=5,
        attr2ratio=3.2,
        attr2num=140,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({2,34}) ->
    #intensify_cfg{
        type=2,
        level=34,
        attr1idx=4,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=5,
        attr2ratio=3.3,
        attr2num=145,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({2,35}) ->
    #intensify_cfg{
        type=2,
        level=35,
        attr1idx=4,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=5,
        attr2ratio=3.4,
        attr2num=150,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({2,36}) ->
    #intensify_cfg{
        type=2,
        level=36,
        attr1idx=4,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=5,
        attr2ratio=3.5,
        attr2num=155,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({2,37}) ->
    #intensify_cfg{
        type=2,
        level=37,
        attr1idx=4,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=5,
        attr2ratio=3.6,
        attr2num=160,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({2,38}) ->
    #intensify_cfg{
        type=2,
        level=38,
        attr1idx=4,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=5,
        attr2ratio=3.7,
        attr2num=165,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({2,39}) ->
    #intensify_cfg{
        type=2,
        level=39,
        attr1idx=4,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=5,
        attr2ratio=3.8,
        attr2num=170,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({2,40}) ->
    #intensify_cfg{
        type=2,
        level=40,
        attr1idx=4,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=5,
        attr2ratio=3.9,
        attr2num=175,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({2,41}) ->
    #intensify_cfg{
        type=2,
        level=41,
        attr1idx=4,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=5,
        attr2ratio=4.0,
        attr2num=180,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({2,42}) ->
    #intensify_cfg{
        type=2,
        level=42,
        attr1idx=4,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=5,
        attr2ratio=4.1,
        attr2num=186,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({2,43}) ->
    #intensify_cfg{
        type=2,
        level=43,
        attr1idx=4,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=5,
        attr2ratio=4.2,
        attr2num=192,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({2,44}) ->
    #intensify_cfg{
        type=2,
        level=44,
        attr1idx=4,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=5,
        attr2ratio=4.3,
        attr2num=198,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({2,45}) ->
    #intensify_cfg{
        type=2,
        level=45,
        attr1idx=4,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=5,
        attr2ratio=4.4,
        attr2num=204,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({2,46}) ->
    #intensify_cfg{
        type=2,
        level=46,
        attr1idx=4,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=5,
        attr2ratio=4.5,
        attr2num=210,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({2,47}) ->
    #intensify_cfg{
        type=2,
        level=47,
        attr1idx=4,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=5,
        attr2ratio=4.6,
        attr2num=216,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({2,48}) ->
    #intensify_cfg{
        type=2,
        level=48,
        attr1idx=4,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=5,
        attr2ratio=4.7,
        attr2num=222,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({2,49}) ->
    #intensify_cfg{
        type=2,
        level=49,
        attr1idx=4,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=5,
        attr2ratio=4.8,
        attr2num=228,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({2,50}) ->
    #intensify_cfg{
        type=2,
        level=50,
        attr1idx=4,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=5,
        attr2ratio=4.9,
        attr2num=234,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({2,51}) ->
    #intensify_cfg{
        type=2,
        level=51,
        attr1idx=4,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=5,
        attr2ratio=5.0,
        attr2num=240,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({2,52}) ->
    #intensify_cfg{
        type=2,
        level=52,
        attr1idx=4,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=5,
        attr2ratio=5.1,
        attr2num=246,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({2,53}) ->
    #intensify_cfg{
        type=2,
        level=53,
        attr1idx=4,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=5,
        attr2ratio=5.2,
        attr2num=252,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({2,54}) ->
    #intensify_cfg{
        type=2,
        level=54,
        attr1idx=4,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=5,
        attr2ratio=5.3,
        attr2num=258,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({2,55}) ->
    #intensify_cfg{
        type=2,
        level=55,
        attr1idx=4,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=5,
        attr2ratio=5.4,
        attr2num=264,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({2,56}) ->
    #intensify_cfg{
        type=2,
        level=56,
        attr1idx=4,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=5,
        attr2ratio=5.5,
        attr2num=270,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({2,57}) ->
    #intensify_cfg{
        type=2,
        level=57,
        attr1idx=4,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=5,
        attr2ratio=5.6,
        attr2num=276,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({2,58}) ->
    #intensify_cfg{
        type=2,
        level=58,
        attr1idx=4,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=5,
        attr2ratio=5.7,
        attr2num=282,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({2,59}) ->
    #intensify_cfg{
        type=2,
        level=59,
        attr1idx=4,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=5,
        attr2ratio=5.8,
        attr2num=288,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({2,60}) ->
    #intensify_cfg{
        type=2,
        level=60,
        attr1idx=4,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=5,
        attr2ratio=5.9,
        attr2num=294,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({2,61}) ->
    #intensify_cfg{
        type=2,
        level=61,
        attr1idx=4,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=5,
        attr2ratio=6.0,
        attr2num=300,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({2,62}) ->
    #intensify_cfg{
        type=2,
        level=62,
        attr1idx=4,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=5,
        attr2ratio=6.1,
        attr2num=307,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({2,63}) ->
    #intensify_cfg{
        type=2,
        level=63,
        attr1idx=4,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=5,
        attr2ratio=6.2,
        attr2num=314,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({2,64}) ->
    #intensify_cfg{
        type=2,
        level=64,
        attr1idx=4,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=5,
        attr2ratio=6.3,
        attr2num=321,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({2,65}) ->
    #intensify_cfg{
        type=2,
        level=65,
        attr1idx=4,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=5,
        attr2ratio=6.4,
        attr2num=328,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({2,66}) ->
    #intensify_cfg{
        type=2,
        level=66,
        attr1idx=4,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=5,
        attr2ratio=6.5,
        attr2num=335,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({2,67}) ->
    #intensify_cfg{
        type=2,
        level=67,
        attr1idx=4,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=5,
        attr2ratio=6.6,
        attr2num=342,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({2,68}) ->
    #intensify_cfg{
        type=2,
        level=68,
        attr1idx=4,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=5,
        attr2ratio=6.7,
        attr2num=349,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({2,69}) ->
    #intensify_cfg{
        type=2,
        level=69,
        attr1idx=4,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=5,
        attr2ratio=6.8,
        attr2num=356,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({2,70}) ->
    #intensify_cfg{
        type=2,
        level=70,
        attr1idx=4,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=5,
        attr2ratio=6.9,
        attr2num=363,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({2,71}) ->
    #intensify_cfg{
        type=2,
        level=71,
        attr1idx=4,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=5,
        attr2ratio=7.0,
        attr2num=370,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({2,72}) ->
    #intensify_cfg{
        type=2,
        level=72,
        attr1idx=4,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=5,
        attr2ratio=7.1,
        attr2num=377,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({2,73}) ->
    #intensify_cfg{
        type=2,
        level=73,
        attr1idx=4,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=5,
        attr2ratio=7.2,
        attr2num=384,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({2,74}) ->
    #intensify_cfg{
        type=2,
        level=74,
        attr1idx=4,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=5,
        attr2ratio=7.3,
        attr2num=391,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({2,75}) ->
    #intensify_cfg{
        type=2,
        level=75,
        attr1idx=4,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=5,
        attr2ratio=7.4,
        attr2num=398,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({2,76}) ->
    #intensify_cfg{
        type=2,
        level=76,
        attr1idx=4,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=5,
        attr2ratio=7.5,
        attr2num=405,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({2,77}) ->
    #intensify_cfg{
        type=2,
        level=77,
        attr1idx=4,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=5,
        attr2ratio=7.6,
        attr2num=412,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({2,78}) ->
    #intensify_cfg{
        type=2,
        level=78,
        attr1idx=4,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=5,
        attr2ratio=7.7,
        attr2num=419,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({2,79}) ->
    #intensify_cfg{
        type=2,
        level=79,
        attr1idx=4,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=5,
        attr2ratio=7.8,
        attr2num=426,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({2,80}) ->
    #intensify_cfg{
        type=2,
        level=80,
        attr1idx=4,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=5,
        attr2ratio=7.9,
        attr2num=433,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({2,81}) ->
    #intensify_cfg{
        type=2,
        level=81,
        attr1idx=4,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=5,
        attr2ratio=8.0,
        attr2num=440,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({2,82}) ->
    #intensify_cfg{
        type=2,
        level=82,
        attr1idx=4,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=5,
        attr2ratio=8.1,
        attr2num=448,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({2,83}) ->
    #intensify_cfg{
        type=2,
        level=83,
        attr1idx=4,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=5,
        attr2ratio=8.2,
        attr2num=456,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({2,84}) ->
    #intensify_cfg{
        type=2,
        level=84,
        attr1idx=4,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=5,
        attr2ratio=8.3,
        attr2num=464,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({2,85}) ->
    #intensify_cfg{
        type=2,
        level=85,
        attr1idx=4,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=5,
        attr2ratio=8.4,
        attr2num=472,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({2,86}) ->
    #intensify_cfg{
        type=2,
        level=86,
        attr1idx=4,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=5,
        attr2ratio=8.5,
        attr2num=480,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({2,87}) ->
    #intensify_cfg{
        type=2,
        level=87,
        attr1idx=4,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=5,
        attr2ratio=8.6,
        attr2num=488,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({2,88}) ->
    #intensify_cfg{
        type=2,
        level=88,
        attr1idx=4,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=5,
        attr2ratio=8.7,
        attr2num=496,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({2,89}) ->
    #intensify_cfg{
        type=2,
        level=89,
        attr1idx=4,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=5,
        attr2ratio=8.8,
        attr2num=504,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({2,90}) ->
    #intensify_cfg{
        type=2,
        level=90,
        attr1idx=4,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=5,
        attr2ratio=8.9,
        attr2num=512,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({2,91}) ->
    #intensify_cfg{
        type=2,
        level=91,
        attr1idx=4,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=5,
        attr2ratio=9.0,
        attr2num=520,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({2,92}) ->
    #intensify_cfg{
        type=2,
        level=92,
        attr1idx=4,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=5,
        attr2ratio=9.1,
        attr2num=528,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({2,93}) ->
    #intensify_cfg{
        type=2,
        level=93,
        attr1idx=4,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=5,
        attr2ratio=9.2,
        attr2num=536,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({2,94}) ->
    #intensify_cfg{
        type=2,
        level=94,
        attr1idx=4,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=5,
        attr2ratio=9.3,
        attr2num=544,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({2,95}) ->
    #intensify_cfg{
        type=2,
        level=95,
        attr1idx=4,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=5,
        attr2ratio=9.4,
        attr2num=552,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({2,96}) ->
    #intensify_cfg{
        type=2,
        level=96,
        attr1idx=4,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=5,
        attr2ratio=9.5,
        attr2num=560,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({2,97}) ->
    #intensify_cfg{
        type=2,
        level=97,
        attr1idx=4,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=5,
        attr2ratio=9.6,
        attr2num=568,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({2,98}) ->
    #intensify_cfg{
        type=2,
        level=98,
        attr1idx=4,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=5,
        attr2ratio=9.7,
        attr2num=576,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({2,99}) ->
    #intensify_cfg{
        type=2,
        level=99,
        attr1idx=4,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=5,
        attr2ratio=9.8,
        attr2num=584,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({2,100}) ->
    #intensify_cfg{
        type=2,
        level=100,
        attr1idx=4,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=5,
        attr2ratio=9.9,
        attr2num=592,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({2,101}) ->
    #intensify_cfg{
        type=2,
        level=101,
        attr1idx=4,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=5,
        attr2ratio=10.0,
        attr2num=600,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get({3,1}) ->
    #intensify_cfg{
        type=3,
        level=1,
        attr1idx=5,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=6,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({3,2}) ->
    #intensify_cfg{
        type=3,
        level=2,
        attr1idx=5,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=6,
        attr2ratio=0.1,
        attr2num=4,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({3,3}) ->
    #intensify_cfg{
        type=3,
        level=3,
        attr1idx=5,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=6,
        attr2ratio=0.2,
        attr2num=8,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({3,4}) ->
    #intensify_cfg{
        type=3,
        level=4,
        attr1idx=5,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=6,
        attr2ratio=0.3,
        attr2num=12,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({3,5}) ->
    #intensify_cfg{
        type=3,
        level=5,
        attr1idx=5,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=6,
        attr2ratio=0.4,
        attr2num=16,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({3,6}) ->
    #intensify_cfg{
        type=3,
        level=6,
        attr1idx=5,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=6,
        attr2ratio=0.5,
        attr2num=20,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({3,7}) ->
    #intensify_cfg{
        type=3,
        level=7,
        attr1idx=5,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=6,
        attr2ratio=0.6,
        attr2num=24,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({3,8}) ->
    #intensify_cfg{
        type=3,
        level=8,
        attr1idx=5,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=6,
        attr2ratio=0.7,
        attr2num=28,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({3,9}) ->
    #intensify_cfg{
        type=3,
        level=9,
        attr1idx=5,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=6,
        attr2ratio=0.8,
        attr2num=32,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({3,10}) ->
    #intensify_cfg{
        type=3,
        level=10,
        attr1idx=5,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=6,
        attr2ratio=0.9,
        attr2num=36,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({3,11}) ->
    #intensify_cfg{
        type=3,
        level=11,
        attr1idx=5,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=6,
        attr2ratio=1.0,
        attr2num=40,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({3,12}) ->
    #intensify_cfg{
        type=3,
        level=12,
        attr1idx=5,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=6,
        attr2ratio=1.1,
        attr2num=44,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({3,13}) ->
    #intensify_cfg{
        type=3,
        level=13,
        attr1idx=5,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=6,
        attr2ratio=1.2,
        attr2num=48,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({3,14}) ->
    #intensify_cfg{
        type=3,
        level=14,
        attr1idx=5,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=6,
        attr2ratio=1.3,
        attr2num=52,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({3,15}) ->
    #intensify_cfg{
        type=3,
        level=15,
        attr1idx=5,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=6,
        attr2ratio=1.4,
        attr2num=56,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({3,16}) ->
    #intensify_cfg{
        type=3,
        level=16,
        attr1idx=5,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=6,
        attr2ratio=1.5,
        attr2num=60,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({3,17}) ->
    #intensify_cfg{
        type=3,
        level=17,
        attr1idx=5,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=6,
        attr2ratio=1.6,
        attr2num=64,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({3,18}) ->
    #intensify_cfg{
        type=3,
        level=18,
        attr1idx=5,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=6,
        attr2ratio=1.7,
        attr2num=68,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({3,19}) ->
    #intensify_cfg{
        type=3,
        level=19,
        attr1idx=5,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=6,
        attr2ratio=1.8,
        attr2num=72,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({3,20}) ->
    #intensify_cfg{
        type=3,
        level=20,
        attr1idx=5,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=6,
        attr2ratio=1.9,
        attr2num=76,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({3,21}) ->
    #intensify_cfg{
        type=3,
        level=21,
        attr1idx=5,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=6,
        attr2ratio=2.0,
        attr2num=80,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({3,22}) ->
    #intensify_cfg{
        type=3,
        level=22,
        attr1idx=5,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=6,
        attr2ratio=2.1,
        attr2num=85,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({3,23}) ->
    #intensify_cfg{
        type=3,
        level=23,
        attr1idx=5,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=6,
        attr2ratio=2.2,
        attr2num=90,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({3,24}) ->
    #intensify_cfg{
        type=3,
        level=24,
        attr1idx=5,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=6,
        attr2ratio=2.3,
        attr2num=95,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({3,25}) ->
    #intensify_cfg{
        type=3,
        level=25,
        attr1idx=5,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=6,
        attr2ratio=2.4,
        attr2num=100,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({3,26}) ->
    #intensify_cfg{
        type=3,
        level=26,
        attr1idx=5,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=6,
        attr2ratio=2.5,
        attr2num=105,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({3,27}) ->
    #intensify_cfg{
        type=3,
        level=27,
        attr1idx=5,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=6,
        attr2ratio=2.6,
        attr2num=110,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({3,28}) ->
    #intensify_cfg{
        type=3,
        level=28,
        attr1idx=5,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=6,
        attr2ratio=2.7,
        attr2num=115,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({3,29}) ->
    #intensify_cfg{
        type=3,
        level=29,
        attr1idx=5,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=6,
        attr2ratio=2.8,
        attr2num=120,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({3,30}) ->
    #intensify_cfg{
        type=3,
        level=30,
        attr1idx=5,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=6,
        attr2ratio=2.9,
        attr2num=125,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({3,31}) ->
    #intensify_cfg{
        type=3,
        level=31,
        attr1idx=5,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=6,
        attr2ratio=3.0,
        attr2num=130,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({3,32}) ->
    #intensify_cfg{
        type=3,
        level=32,
        attr1idx=5,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=6,
        attr2ratio=3.1,
        attr2num=135,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({3,33}) ->
    #intensify_cfg{
        type=3,
        level=33,
        attr1idx=5,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=6,
        attr2ratio=3.2,
        attr2num=140,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({3,34}) ->
    #intensify_cfg{
        type=3,
        level=34,
        attr1idx=5,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=6,
        attr2ratio=3.3,
        attr2num=145,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({3,35}) ->
    #intensify_cfg{
        type=3,
        level=35,
        attr1idx=5,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=6,
        attr2ratio=3.4,
        attr2num=150,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({3,36}) ->
    #intensify_cfg{
        type=3,
        level=36,
        attr1idx=5,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=6,
        attr2ratio=3.5,
        attr2num=155,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({3,37}) ->
    #intensify_cfg{
        type=3,
        level=37,
        attr1idx=5,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=6,
        attr2ratio=3.6,
        attr2num=160,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({3,38}) ->
    #intensify_cfg{
        type=3,
        level=38,
        attr1idx=5,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=6,
        attr2ratio=3.7,
        attr2num=165,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({3,39}) ->
    #intensify_cfg{
        type=3,
        level=39,
        attr1idx=5,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=6,
        attr2ratio=3.8,
        attr2num=170,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({3,40}) ->
    #intensify_cfg{
        type=3,
        level=40,
        attr1idx=5,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=6,
        attr2ratio=3.9,
        attr2num=175,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({3,41}) ->
    #intensify_cfg{
        type=3,
        level=41,
        attr1idx=5,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=6,
        attr2ratio=4.0,
        attr2num=180,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({3,42}) ->
    #intensify_cfg{
        type=3,
        level=42,
        attr1idx=5,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=6,
        attr2ratio=4.1,
        attr2num=186,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({3,43}) ->
    #intensify_cfg{
        type=3,
        level=43,
        attr1idx=5,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=6,
        attr2ratio=4.2,
        attr2num=192,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({3,44}) ->
    #intensify_cfg{
        type=3,
        level=44,
        attr1idx=5,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=6,
        attr2ratio=4.3,
        attr2num=198,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({3,45}) ->
    #intensify_cfg{
        type=3,
        level=45,
        attr1idx=5,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=6,
        attr2ratio=4.4,
        attr2num=204,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({3,46}) ->
    #intensify_cfg{
        type=3,
        level=46,
        attr1idx=5,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=6,
        attr2ratio=4.5,
        attr2num=210,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({3,47}) ->
    #intensify_cfg{
        type=3,
        level=47,
        attr1idx=5,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=6,
        attr2ratio=4.6,
        attr2num=216,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({3,48}) ->
    #intensify_cfg{
        type=3,
        level=48,
        attr1idx=5,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=6,
        attr2ratio=4.7,
        attr2num=222,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({3,49}) ->
    #intensify_cfg{
        type=3,
        level=49,
        attr1idx=5,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=6,
        attr2ratio=4.8,
        attr2num=228,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({3,50}) ->
    #intensify_cfg{
        type=3,
        level=50,
        attr1idx=5,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=6,
        attr2ratio=4.9,
        attr2num=234,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({3,51}) ->
    #intensify_cfg{
        type=3,
        level=51,
        attr1idx=5,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=6,
        attr2ratio=5.0,
        attr2num=240,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({3,52}) ->
    #intensify_cfg{
        type=3,
        level=52,
        attr1idx=5,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=6,
        attr2ratio=5.1,
        attr2num=246,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({3,53}) ->
    #intensify_cfg{
        type=3,
        level=53,
        attr1idx=5,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=6,
        attr2ratio=5.2,
        attr2num=252,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({3,54}) ->
    #intensify_cfg{
        type=3,
        level=54,
        attr1idx=5,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=6,
        attr2ratio=5.3,
        attr2num=258,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({3,55}) ->
    #intensify_cfg{
        type=3,
        level=55,
        attr1idx=5,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=6,
        attr2ratio=5.4,
        attr2num=264,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({3,56}) ->
    #intensify_cfg{
        type=3,
        level=56,
        attr1idx=5,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=6,
        attr2ratio=5.5,
        attr2num=270,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({3,57}) ->
    #intensify_cfg{
        type=3,
        level=57,
        attr1idx=5,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=6,
        attr2ratio=5.6,
        attr2num=276,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({3,58}) ->
    #intensify_cfg{
        type=3,
        level=58,
        attr1idx=5,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=6,
        attr2ratio=5.7,
        attr2num=282,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({3,59}) ->
    #intensify_cfg{
        type=3,
        level=59,
        attr1idx=5,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=6,
        attr2ratio=5.8,
        attr2num=288,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({3,60}) ->
    #intensify_cfg{
        type=3,
        level=60,
        attr1idx=5,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=6,
        attr2ratio=5.9,
        attr2num=294,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({3,61}) ->
    #intensify_cfg{
        type=3,
        level=61,
        attr1idx=5,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=6,
        attr2ratio=6.0,
        attr2num=300,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({3,62}) ->
    #intensify_cfg{
        type=3,
        level=62,
        attr1idx=5,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=6,
        attr2ratio=6.1,
        attr2num=307,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({3,63}) ->
    #intensify_cfg{
        type=3,
        level=63,
        attr1idx=5,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=6,
        attr2ratio=6.2,
        attr2num=314,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({3,64}) ->
    #intensify_cfg{
        type=3,
        level=64,
        attr1idx=5,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=6,
        attr2ratio=6.3,
        attr2num=321,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({3,65}) ->
    #intensify_cfg{
        type=3,
        level=65,
        attr1idx=5,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=6,
        attr2ratio=6.4,
        attr2num=328,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({3,66}) ->
    #intensify_cfg{
        type=3,
        level=66,
        attr1idx=5,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=6,
        attr2ratio=6.5,
        attr2num=335,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({3,67}) ->
    #intensify_cfg{
        type=3,
        level=67,
        attr1idx=5,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=6,
        attr2ratio=6.6,
        attr2num=342,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({3,68}) ->
    #intensify_cfg{
        type=3,
        level=68,
        attr1idx=5,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=6,
        attr2ratio=6.7,
        attr2num=349,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({3,69}) ->
    #intensify_cfg{
        type=3,
        level=69,
        attr1idx=5,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=6,
        attr2ratio=6.8,
        attr2num=356,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({3,70}) ->
    #intensify_cfg{
        type=3,
        level=70,
        attr1idx=5,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=6,
        attr2ratio=6.9,
        attr2num=363,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({3,71}) ->
    #intensify_cfg{
        type=3,
        level=71,
        attr1idx=5,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=6,
        attr2ratio=7.0,
        attr2num=370,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({3,72}) ->
    #intensify_cfg{
        type=3,
        level=72,
        attr1idx=5,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=6,
        attr2ratio=7.1,
        attr2num=377,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({3,73}) ->
    #intensify_cfg{
        type=3,
        level=73,
        attr1idx=5,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=6,
        attr2ratio=7.2,
        attr2num=384,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({3,74}) ->
    #intensify_cfg{
        type=3,
        level=74,
        attr1idx=5,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=6,
        attr2ratio=7.3,
        attr2num=391,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({3,75}) ->
    #intensify_cfg{
        type=3,
        level=75,
        attr1idx=5,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=6,
        attr2ratio=7.4,
        attr2num=398,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({3,76}) ->
    #intensify_cfg{
        type=3,
        level=76,
        attr1idx=5,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=6,
        attr2ratio=7.5,
        attr2num=405,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({3,77}) ->
    #intensify_cfg{
        type=3,
        level=77,
        attr1idx=5,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=6,
        attr2ratio=7.6,
        attr2num=412,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({3,78}) ->
    #intensify_cfg{
        type=3,
        level=78,
        attr1idx=5,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=6,
        attr2ratio=7.7,
        attr2num=419,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({3,79}) ->
    #intensify_cfg{
        type=3,
        level=79,
        attr1idx=5,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=6,
        attr2ratio=7.8,
        attr2num=426,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({3,80}) ->
    #intensify_cfg{
        type=3,
        level=80,
        attr1idx=5,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=6,
        attr2ratio=7.9,
        attr2num=433,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({3,81}) ->
    #intensify_cfg{
        type=3,
        level=81,
        attr1idx=5,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=6,
        attr2ratio=8.0,
        attr2num=440,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({3,82}) ->
    #intensify_cfg{
        type=3,
        level=82,
        attr1idx=5,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=6,
        attr2ratio=8.1,
        attr2num=448,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({3,83}) ->
    #intensify_cfg{
        type=3,
        level=83,
        attr1idx=5,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=6,
        attr2ratio=8.2,
        attr2num=456,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({3,84}) ->
    #intensify_cfg{
        type=3,
        level=84,
        attr1idx=5,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=6,
        attr2ratio=8.3,
        attr2num=464,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({3,85}) ->
    #intensify_cfg{
        type=3,
        level=85,
        attr1idx=5,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=6,
        attr2ratio=8.4,
        attr2num=472,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({3,86}) ->
    #intensify_cfg{
        type=3,
        level=86,
        attr1idx=5,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=6,
        attr2ratio=8.5,
        attr2num=480,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({3,87}) ->
    #intensify_cfg{
        type=3,
        level=87,
        attr1idx=5,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=6,
        attr2ratio=8.6,
        attr2num=488,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({3,88}) ->
    #intensify_cfg{
        type=3,
        level=88,
        attr1idx=5,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=6,
        attr2ratio=8.7,
        attr2num=496,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({3,89}) ->
    #intensify_cfg{
        type=3,
        level=89,
        attr1idx=5,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=6,
        attr2ratio=8.8,
        attr2num=504,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({3,90}) ->
    #intensify_cfg{
        type=3,
        level=90,
        attr1idx=5,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=6,
        attr2ratio=8.9,
        attr2num=512,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({3,91}) ->
    #intensify_cfg{
        type=3,
        level=91,
        attr1idx=5,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=6,
        attr2ratio=9.0,
        attr2num=520,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({3,92}) ->
    #intensify_cfg{
        type=3,
        level=92,
        attr1idx=5,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=6,
        attr2ratio=9.1,
        attr2num=528,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({3,93}) ->
    #intensify_cfg{
        type=3,
        level=93,
        attr1idx=5,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=6,
        attr2ratio=9.2,
        attr2num=536,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({3,94}) ->
    #intensify_cfg{
        type=3,
        level=94,
        attr1idx=5,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=6,
        attr2ratio=9.3,
        attr2num=544,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({3,95}) ->
    #intensify_cfg{
        type=3,
        level=95,
        attr1idx=5,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=6,
        attr2ratio=9.4,
        attr2num=552,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({3,96}) ->
    #intensify_cfg{
        type=3,
        level=96,
        attr1idx=5,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=6,
        attr2ratio=9.5,
        attr2num=560,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({3,97}) ->
    #intensify_cfg{
        type=3,
        level=97,
        attr1idx=5,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=6,
        attr2ratio=9.6,
        attr2num=568,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({3,98}) ->
    #intensify_cfg{
        type=3,
        level=98,
        attr1idx=5,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=6,
        attr2ratio=9.7,
        attr2num=576,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({3,99}) ->
    #intensify_cfg{
        type=3,
        level=99,
        attr1idx=5,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=6,
        attr2ratio=9.8,
        attr2num=584,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({3,100}) ->
    #intensify_cfg{
        type=3,
        level=100,
        attr1idx=5,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=6,
        attr2ratio=9.9,
        attr2num=592,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({3,101}) ->
    #intensify_cfg{
        type=3,
        level=101,
        attr1idx=5,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=6,
        attr2ratio=10.0,
        attr2num=600,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get({4,1}) ->
    #intensify_cfg{
        type=4,
        level=1,
        attr1idx=3,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=6,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({4,2}) ->
    #intensify_cfg{
        type=4,
        level=2,
        attr1idx=3,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=6,
        attr2ratio=0.1,
        attr2num=4,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({4,3}) ->
    #intensify_cfg{
        type=4,
        level=3,
        attr1idx=3,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=6,
        attr2ratio=0.2,
        attr2num=8,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({4,4}) ->
    #intensify_cfg{
        type=4,
        level=4,
        attr1idx=3,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=6,
        attr2ratio=0.3,
        attr2num=12,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({4,5}) ->
    #intensify_cfg{
        type=4,
        level=5,
        attr1idx=3,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=6,
        attr2ratio=0.4,
        attr2num=16,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({4,6}) ->
    #intensify_cfg{
        type=4,
        level=6,
        attr1idx=3,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=6,
        attr2ratio=0.5,
        attr2num=20,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({4,7}) ->
    #intensify_cfg{
        type=4,
        level=7,
        attr1idx=3,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=6,
        attr2ratio=0.6,
        attr2num=24,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({4,8}) ->
    #intensify_cfg{
        type=4,
        level=8,
        attr1idx=3,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=6,
        attr2ratio=0.7,
        attr2num=28,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({4,9}) ->
    #intensify_cfg{
        type=4,
        level=9,
        attr1idx=3,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=6,
        attr2ratio=0.8,
        attr2num=32,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({4,10}) ->
    #intensify_cfg{
        type=4,
        level=10,
        attr1idx=3,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=6,
        attr2ratio=0.9,
        attr2num=36,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({4,11}) ->
    #intensify_cfg{
        type=4,
        level=11,
        attr1idx=3,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=6,
        attr2ratio=1.0,
        attr2num=40,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({4,12}) ->
    #intensify_cfg{
        type=4,
        level=12,
        attr1idx=3,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=6,
        attr2ratio=1.1,
        attr2num=44,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({4,13}) ->
    #intensify_cfg{
        type=4,
        level=13,
        attr1idx=3,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=6,
        attr2ratio=1.2,
        attr2num=48,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({4,14}) ->
    #intensify_cfg{
        type=4,
        level=14,
        attr1idx=3,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=6,
        attr2ratio=1.3,
        attr2num=52,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({4,15}) ->
    #intensify_cfg{
        type=4,
        level=15,
        attr1idx=3,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=6,
        attr2ratio=1.4,
        attr2num=56,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({4,16}) ->
    #intensify_cfg{
        type=4,
        level=16,
        attr1idx=3,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=6,
        attr2ratio=1.5,
        attr2num=60,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({4,17}) ->
    #intensify_cfg{
        type=4,
        level=17,
        attr1idx=3,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=6,
        attr2ratio=1.6,
        attr2num=64,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({4,18}) ->
    #intensify_cfg{
        type=4,
        level=18,
        attr1idx=3,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=6,
        attr2ratio=1.7,
        attr2num=68,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({4,19}) ->
    #intensify_cfg{
        type=4,
        level=19,
        attr1idx=3,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=6,
        attr2ratio=1.8,
        attr2num=72,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({4,20}) ->
    #intensify_cfg{
        type=4,
        level=20,
        attr1idx=3,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=6,
        attr2ratio=1.9,
        attr2num=76,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({4,21}) ->
    #intensify_cfg{
        type=4,
        level=21,
        attr1idx=3,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=6,
        attr2ratio=2.0,
        attr2num=80,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({4,22}) ->
    #intensify_cfg{
        type=4,
        level=22,
        attr1idx=3,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=6,
        attr2ratio=2.1,
        attr2num=85,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({4,23}) ->
    #intensify_cfg{
        type=4,
        level=23,
        attr1idx=3,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=6,
        attr2ratio=2.2,
        attr2num=90,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({4,24}) ->
    #intensify_cfg{
        type=4,
        level=24,
        attr1idx=3,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=6,
        attr2ratio=2.3,
        attr2num=95,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({4,25}) ->
    #intensify_cfg{
        type=4,
        level=25,
        attr1idx=3,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=6,
        attr2ratio=2.4,
        attr2num=100,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({4,26}) ->
    #intensify_cfg{
        type=4,
        level=26,
        attr1idx=3,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=6,
        attr2ratio=2.5,
        attr2num=105,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({4,27}) ->
    #intensify_cfg{
        type=4,
        level=27,
        attr1idx=3,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=6,
        attr2ratio=2.6,
        attr2num=110,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({4,28}) ->
    #intensify_cfg{
        type=4,
        level=28,
        attr1idx=3,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=6,
        attr2ratio=2.7,
        attr2num=115,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({4,29}) ->
    #intensify_cfg{
        type=4,
        level=29,
        attr1idx=3,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=6,
        attr2ratio=2.8,
        attr2num=120,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({4,30}) ->
    #intensify_cfg{
        type=4,
        level=30,
        attr1idx=3,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=6,
        attr2ratio=2.9,
        attr2num=125,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({4,31}) ->
    #intensify_cfg{
        type=4,
        level=31,
        attr1idx=3,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=6,
        attr2ratio=3.0,
        attr2num=130,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({4,32}) ->
    #intensify_cfg{
        type=4,
        level=32,
        attr1idx=3,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=6,
        attr2ratio=3.1,
        attr2num=135,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({4,33}) ->
    #intensify_cfg{
        type=4,
        level=33,
        attr1idx=3,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=6,
        attr2ratio=3.2,
        attr2num=140,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({4,34}) ->
    #intensify_cfg{
        type=4,
        level=34,
        attr1idx=3,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=6,
        attr2ratio=3.3,
        attr2num=145,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({4,35}) ->
    #intensify_cfg{
        type=4,
        level=35,
        attr1idx=3,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=6,
        attr2ratio=3.4,
        attr2num=150,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({4,36}) ->
    #intensify_cfg{
        type=4,
        level=36,
        attr1idx=3,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=6,
        attr2ratio=3.5,
        attr2num=155,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({4,37}) ->
    #intensify_cfg{
        type=4,
        level=37,
        attr1idx=3,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=6,
        attr2ratio=3.6,
        attr2num=160,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({4,38}) ->
    #intensify_cfg{
        type=4,
        level=38,
        attr1idx=3,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=6,
        attr2ratio=3.7,
        attr2num=165,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({4,39}) ->
    #intensify_cfg{
        type=4,
        level=39,
        attr1idx=3,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=6,
        attr2ratio=3.8,
        attr2num=170,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({4,40}) ->
    #intensify_cfg{
        type=4,
        level=40,
        attr1idx=3,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=6,
        attr2ratio=3.9,
        attr2num=175,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({4,41}) ->
    #intensify_cfg{
        type=4,
        level=41,
        attr1idx=3,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=6,
        attr2ratio=4.0,
        attr2num=180,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({4,42}) ->
    #intensify_cfg{
        type=4,
        level=42,
        attr1idx=3,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=6,
        attr2ratio=4.1,
        attr2num=186,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({4,43}) ->
    #intensify_cfg{
        type=4,
        level=43,
        attr1idx=3,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=6,
        attr2ratio=4.2,
        attr2num=192,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({4,44}) ->
    #intensify_cfg{
        type=4,
        level=44,
        attr1idx=3,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=6,
        attr2ratio=4.3,
        attr2num=198,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({4,45}) ->
    #intensify_cfg{
        type=4,
        level=45,
        attr1idx=3,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=6,
        attr2ratio=4.4,
        attr2num=204,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({4,46}) ->
    #intensify_cfg{
        type=4,
        level=46,
        attr1idx=3,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=6,
        attr2ratio=4.5,
        attr2num=210,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({4,47}) ->
    #intensify_cfg{
        type=4,
        level=47,
        attr1idx=3,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=6,
        attr2ratio=4.6,
        attr2num=216,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({4,48}) ->
    #intensify_cfg{
        type=4,
        level=48,
        attr1idx=3,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=6,
        attr2ratio=4.7,
        attr2num=222,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({4,49}) ->
    #intensify_cfg{
        type=4,
        level=49,
        attr1idx=3,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=6,
        attr2ratio=4.8,
        attr2num=228,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({4,50}) ->
    #intensify_cfg{
        type=4,
        level=50,
        attr1idx=3,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=6,
        attr2ratio=4.9,
        attr2num=234,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({4,51}) ->
    #intensify_cfg{
        type=4,
        level=51,
        attr1idx=3,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=6,
        attr2ratio=5.0,
        attr2num=240,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({4,52}) ->
    #intensify_cfg{
        type=4,
        level=52,
        attr1idx=3,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=6,
        attr2ratio=5.1,
        attr2num=246,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({4,53}) ->
    #intensify_cfg{
        type=4,
        level=53,
        attr1idx=3,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=6,
        attr2ratio=5.2,
        attr2num=252,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({4,54}) ->
    #intensify_cfg{
        type=4,
        level=54,
        attr1idx=3,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=6,
        attr2ratio=5.3,
        attr2num=258,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({4,55}) ->
    #intensify_cfg{
        type=4,
        level=55,
        attr1idx=3,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=6,
        attr2ratio=5.4,
        attr2num=264,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({4,56}) ->
    #intensify_cfg{
        type=4,
        level=56,
        attr1idx=3,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=6,
        attr2ratio=5.5,
        attr2num=270,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({4,57}) ->
    #intensify_cfg{
        type=4,
        level=57,
        attr1idx=3,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=6,
        attr2ratio=5.6,
        attr2num=276,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({4,58}) ->
    #intensify_cfg{
        type=4,
        level=58,
        attr1idx=3,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=6,
        attr2ratio=5.7,
        attr2num=282,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({4,59}) ->
    #intensify_cfg{
        type=4,
        level=59,
        attr1idx=3,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=6,
        attr2ratio=5.8,
        attr2num=288,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({4,60}) ->
    #intensify_cfg{
        type=4,
        level=60,
        attr1idx=3,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=6,
        attr2ratio=5.9,
        attr2num=294,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({4,61}) ->
    #intensify_cfg{
        type=4,
        level=61,
        attr1idx=3,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=6,
        attr2ratio=6.0,
        attr2num=300,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({4,62}) ->
    #intensify_cfg{
        type=4,
        level=62,
        attr1idx=3,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=6,
        attr2ratio=6.1,
        attr2num=307,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({4,63}) ->
    #intensify_cfg{
        type=4,
        level=63,
        attr1idx=3,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=6,
        attr2ratio=6.2,
        attr2num=314,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({4,64}) ->
    #intensify_cfg{
        type=4,
        level=64,
        attr1idx=3,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=6,
        attr2ratio=6.3,
        attr2num=321,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({4,65}) ->
    #intensify_cfg{
        type=4,
        level=65,
        attr1idx=3,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=6,
        attr2ratio=6.4,
        attr2num=328,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({4,66}) ->
    #intensify_cfg{
        type=4,
        level=66,
        attr1idx=3,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=6,
        attr2ratio=6.5,
        attr2num=335,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({4,67}) ->
    #intensify_cfg{
        type=4,
        level=67,
        attr1idx=3,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=6,
        attr2ratio=6.6,
        attr2num=342,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({4,68}) ->
    #intensify_cfg{
        type=4,
        level=68,
        attr1idx=3,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=6,
        attr2ratio=6.7,
        attr2num=349,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({4,69}) ->
    #intensify_cfg{
        type=4,
        level=69,
        attr1idx=3,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=6,
        attr2ratio=6.8,
        attr2num=356,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({4,70}) ->
    #intensify_cfg{
        type=4,
        level=70,
        attr1idx=3,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=6,
        attr2ratio=6.9,
        attr2num=363,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({4,71}) ->
    #intensify_cfg{
        type=4,
        level=71,
        attr1idx=3,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=6,
        attr2ratio=7.0,
        attr2num=370,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({4,72}) ->
    #intensify_cfg{
        type=4,
        level=72,
        attr1idx=3,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=6,
        attr2ratio=7.1,
        attr2num=377,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({4,73}) ->
    #intensify_cfg{
        type=4,
        level=73,
        attr1idx=3,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=6,
        attr2ratio=7.2,
        attr2num=384,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({4,74}) ->
    #intensify_cfg{
        type=4,
        level=74,
        attr1idx=3,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=6,
        attr2ratio=7.3,
        attr2num=391,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({4,75}) ->
    #intensify_cfg{
        type=4,
        level=75,
        attr1idx=3,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=6,
        attr2ratio=7.4,
        attr2num=398,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({4,76}) ->
    #intensify_cfg{
        type=4,
        level=76,
        attr1idx=3,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=6,
        attr2ratio=7.5,
        attr2num=405,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({4,77}) ->
    #intensify_cfg{
        type=4,
        level=77,
        attr1idx=3,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=6,
        attr2ratio=7.6,
        attr2num=412,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({4,78}) ->
    #intensify_cfg{
        type=4,
        level=78,
        attr1idx=3,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=6,
        attr2ratio=7.7,
        attr2num=419,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({4,79}) ->
    #intensify_cfg{
        type=4,
        level=79,
        attr1idx=3,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=6,
        attr2ratio=7.8,
        attr2num=426,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({4,80}) ->
    #intensify_cfg{
        type=4,
        level=80,
        attr1idx=3,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=6,
        attr2ratio=7.9,
        attr2num=433,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({4,81}) ->
    #intensify_cfg{
        type=4,
        level=81,
        attr1idx=3,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=6,
        attr2ratio=8.0,
        attr2num=440,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({4,82}) ->
    #intensify_cfg{
        type=4,
        level=82,
        attr1idx=3,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=6,
        attr2ratio=8.1,
        attr2num=448,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({4,83}) ->
    #intensify_cfg{
        type=4,
        level=83,
        attr1idx=3,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=6,
        attr2ratio=8.2,
        attr2num=456,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({4,84}) ->
    #intensify_cfg{
        type=4,
        level=84,
        attr1idx=3,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=6,
        attr2ratio=8.3,
        attr2num=464,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({4,85}) ->
    #intensify_cfg{
        type=4,
        level=85,
        attr1idx=3,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=6,
        attr2ratio=8.4,
        attr2num=472,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({4,86}) ->
    #intensify_cfg{
        type=4,
        level=86,
        attr1idx=3,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=6,
        attr2ratio=8.5,
        attr2num=480,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({4,87}) ->
    #intensify_cfg{
        type=4,
        level=87,
        attr1idx=3,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=6,
        attr2ratio=8.6,
        attr2num=488,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({4,88}) ->
    #intensify_cfg{
        type=4,
        level=88,
        attr1idx=3,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=6,
        attr2ratio=8.7,
        attr2num=496,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({4,89}) ->
    #intensify_cfg{
        type=4,
        level=89,
        attr1idx=3,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=6,
        attr2ratio=8.8,
        attr2num=504,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({4,90}) ->
    #intensify_cfg{
        type=4,
        level=90,
        attr1idx=3,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=6,
        attr2ratio=8.9,
        attr2num=512,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({4,91}) ->
    #intensify_cfg{
        type=4,
        level=91,
        attr1idx=3,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=6,
        attr2ratio=9.0,
        attr2num=520,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({4,92}) ->
    #intensify_cfg{
        type=4,
        level=92,
        attr1idx=3,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=6,
        attr2ratio=9.1,
        attr2num=528,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({4,93}) ->
    #intensify_cfg{
        type=4,
        level=93,
        attr1idx=3,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=6,
        attr2ratio=9.2,
        attr2num=536,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({4,94}) ->
    #intensify_cfg{
        type=4,
        level=94,
        attr1idx=3,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=6,
        attr2ratio=9.3,
        attr2num=544,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({4,95}) ->
    #intensify_cfg{
        type=4,
        level=95,
        attr1idx=3,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=6,
        attr2ratio=9.4,
        attr2num=552,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({4,96}) ->
    #intensify_cfg{
        type=4,
        level=96,
        attr1idx=3,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=6,
        attr2ratio=9.5,
        attr2num=560,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({4,97}) ->
    #intensify_cfg{
        type=4,
        level=97,
        attr1idx=3,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=6,
        attr2ratio=9.6,
        attr2num=568,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({4,98}) ->
    #intensify_cfg{
        type=4,
        level=98,
        attr1idx=3,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=6,
        attr2ratio=9.7,
        attr2num=576,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({4,99}) ->
    #intensify_cfg{
        type=4,
        level=99,
        attr1idx=3,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=6,
        attr2ratio=9.8,
        attr2num=584,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({4,100}) ->
    #intensify_cfg{
        type=4,
        level=100,
        attr1idx=3,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=6,
        attr2ratio=9.9,
        attr2num=592,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({4,101}) ->
    #intensify_cfg{
        type=4,
        level=101,
        attr1idx=3,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=6,
        attr2ratio=10.0,
        attr2num=600,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get({5,1}) ->
    #intensify_cfg{
        type=5,
        level=1,
        attr1idx=7,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({5,2}) ->
    #intensify_cfg{
        type=5,
        level=2,
        attr1idx=7,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({5,3}) ->
    #intensify_cfg{
        type=5,
        level=3,
        attr1idx=7,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({5,4}) ->
    #intensify_cfg{
        type=5,
        level=4,
        attr1idx=7,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({5,5}) ->
    #intensify_cfg{
        type=5,
        level=5,
        attr1idx=7,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({5,6}) ->
    #intensify_cfg{
        type=5,
        level=6,
        attr1idx=7,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({5,7}) ->
    #intensify_cfg{
        type=5,
        level=7,
        attr1idx=7,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({5,8}) ->
    #intensify_cfg{
        type=5,
        level=8,
        attr1idx=7,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({5,9}) ->
    #intensify_cfg{
        type=5,
        level=9,
        attr1idx=7,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({5,10}) ->
    #intensify_cfg{
        type=5,
        level=10,
        attr1idx=7,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({5,11}) ->
    #intensify_cfg{
        type=5,
        level=11,
        attr1idx=7,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({5,12}) ->
    #intensify_cfg{
        type=5,
        level=12,
        attr1idx=7,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({5,13}) ->
    #intensify_cfg{
        type=5,
        level=13,
        attr1idx=7,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({5,14}) ->
    #intensify_cfg{
        type=5,
        level=14,
        attr1idx=7,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({5,15}) ->
    #intensify_cfg{
        type=5,
        level=15,
        attr1idx=7,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({5,16}) ->
    #intensify_cfg{
        type=5,
        level=16,
        attr1idx=7,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({5,17}) ->
    #intensify_cfg{
        type=5,
        level=17,
        attr1idx=7,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({5,18}) ->
    #intensify_cfg{
        type=5,
        level=18,
        attr1idx=7,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({5,19}) ->
    #intensify_cfg{
        type=5,
        level=19,
        attr1idx=7,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({5,20}) ->
    #intensify_cfg{
        type=5,
        level=20,
        attr1idx=7,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({5,21}) ->
    #intensify_cfg{
        type=5,
        level=21,
        attr1idx=7,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({5,22}) ->
    #intensify_cfg{
        type=5,
        level=22,
        attr1idx=7,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({5,23}) ->
    #intensify_cfg{
        type=5,
        level=23,
        attr1idx=7,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({5,24}) ->
    #intensify_cfg{
        type=5,
        level=24,
        attr1idx=7,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({5,25}) ->
    #intensify_cfg{
        type=5,
        level=25,
        attr1idx=7,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({5,26}) ->
    #intensify_cfg{
        type=5,
        level=26,
        attr1idx=7,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({5,27}) ->
    #intensify_cfg{
        type=5,
        level=27,
        attr1idx=7,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({5,28}) ->
    #intensify_cfg{
        type=5,
        level=28,
        attr1idx=7,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({5,29}) ->
    #intensify_cfg{
        type=5,
        level=29,
        attr1idx=7,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({5,30}) ->
    #intensify_cfg{
        type=5,
        level=30,
        attr1idx=7,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({5,31}) ->
    #intensify_cfg{
        type=5,
        level=31,
        attr1idx=7,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({5,32}) ->
    #intensify_cfg{
        type=5,
        level=32,
        attr1idx=7,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({5,33}) ->
    #intensify_cfg{
        type=5,
        level=33,
        attr1idx=7,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({5,34}) ->
    #intensify_cfg{
        type=5,
        level=34,
        attr1idx=7,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({5,35}) ->
    #intensify_cfg{
        type=5,
        level=35,
        attr1idx=7,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({5,36}) ->
    #intensify_cfg{
        type=5,
        level=36,
        attr1idx=7,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({5,37}) ->
    #intensify_cfg{
        type=5,
        level=37,
        attr1idx=7,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({5,38}) ->
    #intensify_cfg{
        type=5,
        level=38,
        attr1idx=7,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({5,39}) ->
    #intensify_cfg{
        type=5,
        level=39,
        attr1idx=7,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({5,40}) ->
    #intensify_cfg{
        type=5,
        level=40,
        attr1idx=7,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({5,41}) ->
    #intensify_cfg{
        type=5,
        level=41,
        attr1idx=7,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({5,42}) ->
    #intensify_cfg{
        type=5,
        level=42,
        attr1idx=7,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({5,43}) ->
    #intensify_cfg{
        type=5,
        level=43,
        attr1idx=7,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({5,44}) ->
    #intensify_cfg{
        type=5,
        level=44,
        attr1idx=7,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({5,45}) ->
    #intensify_cfg{
        type=5,
        level=45,
        attr1idx=7,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({5,46}) ->
    #intensify_cfg{
        type=5,
        level=46,
        attr1idx=7,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({5,47}) ->
    #intensify_cfg{
        type=5,
        level=47,
        attr1idx=7,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({5,48}) ->
    #intensify_cfg{
        type=5,
        level=48,
        attr1idx=7,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({5,49}) ->
    #intensify_cfg{
        type=5,
        level=49,
        attr1idx=7,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({5,50}) ->
    #intensify_cfg{
        type=5,
        level=50,
        attr1idx=7,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({5,51}) ->
    #intensify_cfg{
        type=5,
        level=51,
        attr1idx=7,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({5,52}) ->
    #intensify_cfg{
        type=5,
        level=52,
        attr1idx=7,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({5,53}) ->
    #intensify_cfg{
        type=5,
        level=53,
        attr1idx=7,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({5,54}) ->
    #intensify_cfg{
        type=5,
        level=54,
        attr1idx=7,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({5,55}) ->
    #intensify_cfg{
        type=5,
        level=55,
        attr1idx=7,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({5,56}) ->
    #intensify_cfg{
        type=5,
        level=56,
        attr1idx=7,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({5,57}) ->
    #intensify_cfg{
        type=5,
        level=57,
        attr1idx=7,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({5,58}) ->
    #intensify_cfg{
        type=5,
        level=58,
        attr1idx=7,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({5,59}) ->
    #intensify_cfg{
        type=5,
        level=59,
        attr1idx=7,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({5,60}) ->
    #intensify_cfg{
        type=5,
        level=60,
        attr1idx=7,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({5,61}) ->
    #intensify_cfg{
        type=5,
        level=61,
        attr1idx=7,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({5,62}) ->
    #intensify_cfg{
        type=5,
        level=62,
        attr1idx=7,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({5,63}) ->
    #intensify_cfg{
        type=5,
        level=63,
        attr1idx=7,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({5,64}) ->
    #intensify_cfg{
        type=5,
        level=64,
        attr1idx=7,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({5,65}) ->
    #intensify_cfg{
        type=5,
        level=65,
        attr1idx=7,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({5,66}) ->
    #intensify_cfg{
        type=5,
        level=66,
        attr1idx=7,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({5,67}) ->
    #intensify_cfg{
        type=5,
        level=67,
        attr1idx=7,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({5,68}) ->
    #intensify_cfg{
        type=5,
        level=68,
        attr1idx=7,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({5,69}) ->
    #intensify_cfg{
        type=5,
        level=69,
        attr1idx=7,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({5,70}) ->
    #intensify_cfg{
        type=5,
        level=70,
        attr1idx=7,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({5,71}) ->
    #intensify_cfg{
        type=5,
        level=71,
        attr1idx=7,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({5,72}) ->
    #intensify_cfg{
        type=5,
        level=72,
        attr1idx=7,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({5,73}) ->
    #intensify_cfg{
        type=5,
        level=73,
        attr1idx=7,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({5,74}) ->
    #intensify_cfg{
        type=5,
        level=74,
        attr1idx=7,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({5,75}) ->
    #intensify_cfg{
        type=5,
        level=75,
        attr1idx=7,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({5,76}) ->
    #intensify_cfg{
        type=5,
        level=76,
        attr1idx=7,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({5,77}) ->
    #intensify_cfg{
        type=5,
        level=77,
        attr1idx=7,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({5,78}) ->
    #intensify_cfg{
        type=5,
        level=78,
        attr1idx=7,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({5,79}) ->
    #intensify_cfg{
        type=5,
        level=79,
        attr1idx=7,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({5,80}) ->
    #intensify_cfg{
        type=5,
        level=80,
        attr1idx=7,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({5,81}) ->
    #intensify_cfg{
        type=5,
        level=81,
        attr1idx=7,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({5,82}) ->
    #intensify_cfg{
        type=5,
        level=82,
        attr1idx=7,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({5,83}) ->
    #intensify_cfg{
        type=5,
        level=83,
        attr1idx=7,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({5,84}) ->
    #intensify_cfg{
        type=5,
        level=84,
        attr1idx=7,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({5,85}) ->
    #intensify_cfg{
        type=5,
        level=85,
        attr1idx=7,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({5,86}) ->
    #intensify_cfg{
        type=5,
        level=86,
        attr1idx=7,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({5,87}) ->
    #intensify_cfg{
        type=5,
        level=87,
        attr1idx=7,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({5,88}) ->
    #intensify_cfg{
        type=5,
        level=88,
        attr1idx=7,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({5,89}) ->
    #intensify_cfg{
        type=5,
        level=89,
        attr1idx=7,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({5,90}) ->
    #intensify_cfg{
        type=5,
        level=90,
        attr1idx=7,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({5,91}) ->
    #intensify_cfg{
        type=5,
        level=91,
        attr1idx=7,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({5,92}) ->
    #intensify_cfg{
        type=5,
        level=92,
        attr1idx=7,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({5,93}) ->
    #intensify_cfg{
        type=5,
        level=93,
        attr1idx=7,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({5,94}) ->
    #intensify_cfg{
        type=5,
        level=94,
        attr1idx=7,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({5,95}) ->
    #intensify_cfg{
        type=5,
        level=95,
        attr1idx=7,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({5,96}) ->
    #intensify_cfg{
        type=5,
        level=96,
        attr1idx=7,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({5,97}) ->
    #intensify_cfg{
        type=5,
        level=97,
        attr1idx=7,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({5,98}) ->
    #intensify_cfg{
        type=5,
        level=98,
        attr1idx=7,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({5,99}) ->
    #intensify_cfg{
        type=5,
        level=99,
        attr1idx=7,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({5,100}) ->
    #intensify_cfg{
        type=5,
        level=100,
        attr1idx=7,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({5,101}) ->
    #intensify_cfg{
        type=5,
        level=101,
        attr1idx=7,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=0,
        attr2ratio=0.0,
        attr2num=0,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get({6,1}) ->
    #intensify_cfg{
        type=6,
        level=1,
        attr1idx=3,
        attr1ratio=0.0,
        attr1num=0,
        attr2idx=4,
        attr2ratio=0.0,
        attr2num=0,
        require_level=1,
        gold1=174,
        gold2=188,
        gold3=203,
        gold4=219,
        gold5=237,
        gold6=256,
        gold7=276};

get({6,2}) ->
    #intensify_cfg{
        type=6,
        level=2,
        attr1idx=3,
        attr1ratio=0.1,
        attr1num=4,
        attr2idx=4,
        attr2ratio=0.1,
        attr2num=4,
        require_level=2,
        gold1=272,
        gold2=294,
        gold3=317,
        gold4=343,
        gold5=370,
        gold6=400,
        gold7=432};

get({6,3}) ->
    #intensify_cfg{
        type=6,
        level=3,
        attr1idx=3,
        attr1ratio=0.2,
        attr1num=8,
        attr2idx=4,
        attr2ratio=0.2,
        attr2num=8,
        require_level=3,
        gold1=371,
        gold2=401,
        gold3=433,
        gold4=467,
        gold5=505,
        gold6=545,
        gold7=589};

get({6,4}) ->
    #intensify_cfg{
        type=6,
        level=4,
        attr1idx=3,
        attr1ratio=0.3,
        attr1num=12,
        attr2idx=4,
        attr2ratio=0.3,
        attr2num=12,
        require_level=4,
        gold1=470,
        gold2=508,
        gold3=548,
        gold4=592,
        gold5=639,
        gold6=691,
        gold7=746};

get({6,5}) ->
    #intensify_cfg{
        type=6,
        level=5,
        attr1idx=3,
        attr1ratio=0.4,
        attr1num=16,
        attr2idx=4,
        attr2ratio=0.4,
        attr2num=16,
        require_level=5,
        gold1=570,
        gold2=616,
        gold3=665,
        gold4=718,
        gold5=775,
        gold6=838,
        gold7=905};

get({6,6}) ->
    #intensify_cfg{
        type=6,
        level=6,
        attr1idx=3,
        attr1ratio=0.5,
        attr1num=20,
        attr2idx=4,
        attr2ratio=0.5,
        attr2num=20,
        require_level=6,
        gold1=671,
        gold2=725,
        gold3=783,
        gold4=845,
        gold5=913,
        gold6=986,
        gold7=1065};

get({6,7}) ->
    #intensify_cfg{
        type=6,
        level=7,
        attr1idx=3,
        attr1ratio=0.6,
        attr1num=24,
        attr2idx=4,
        attr2ratio=0.6,
        attr2num=24,
        require_level=7,
        gold1=773,
        gold2=835,
        gold3=902,
        gold4=974,
        gold5=1052,
        gold6=1136,
        gold7=1227};

get({6,8}) ->
    #intensify_cfg{
        type=6,
        level=8,
        attr1idx=3,
        attr1ratio=0.7,
        attr1num=28,
        attr2idx=4,
        attr2ratio=0.7,
        attr2num=28,
        require_level=8,
        gold1=876,
        gold2=946,
        gold3=1022,
        gold4=1104,
        gold5=1192,
        gold6=1287,
        gold7=1390};

get({6,9}) ->
    #intensify_cfg{
        type=6,
        level=9,
        attr1idx=3,
        attr1ratio=0.8,
        attr1num=32,
        attr2idx=4,
        attr2ratio=0.8,
        attr2num=32,
        require_level=9,
        gold1=980,
        gold2=1058,
        gold3=1143,
        gold4=1235,
        gold5=1333,
        gold6=1440,
        gold7=1555};

get({6,10}) ->
    #intensify_cfg{
        type=6,
        level=10,
        attr1idx=3,
        attr1ratio=0.9,
        attr1num=36,
        attr2idx=4,
        attr2ratio=0.9,
        attr2num=36,
        require_level=10,
        gold1=1085,
        gold2=1172,
        gold3=1266,
        gold4=1367,
        gold5=1476,
        gold6=1594,
        gold7=1722};

get({6,11}) ->
    #intensify_cfg{
        type=6,
        level=11,
        attr1idx=3,
        attr1ratio=1.0,
        attr1num=40,
        attr2idx=4,
        attr2ratio=1.0,
        attr2num=40,
        require_level=11,
        gold1=1192,
        gold2=1287,
        gold3=1390,
        gold4=1502,
        gold5=1622,
        gold6=1751,
        gold7=1892};

get({6,12}) ->
    #intensify_cfg{
        type=6,
        level=12,
        attr1idx=3,
        attr1ratio=1.1,
        attr1num=44,
        attr2idx=4,
        attr2ratio=1.1,
        attr2num=44,
        require_level=12,
        gold1=1710,
        gold2=1847,
        gold3=1995,
        gold4=2154,
        gold5=2326,
        gold6=2513,
        gold7=2714};

get({6,13}) ->
    #intensify_cfg{
        type=6,
        level=13,
        attr1idx=3,
        attr1ratio=1.2,
        attr1num=48,
        attr2idx=4,
        attr2ratio=1.2,
        attr2num=48,
        require_level=13,
        gold1=2230,
        gold2=2408,
        gold3=2601,
        gold4=2809,
        gold5=3034,
        gold6=3277,
        gold7=3539};

get({6,14}) ->
    #intensify_cfg{
        type=6,
        level=14,
        attr1idx=3,
        attr1ratio=1.3,
        attr1num=52,
        attr2idx=4,
        attr2ratio=1.3,
        attr2num=52,
        require_level=14,
        gold1=2751,
        gold2=2971,
        gold3=3209,
        gold4=3465,
        gold5=3743,
        gold6=4042,
        gold7=4365};

get({6,15}) ->
    #intensify_cfg{
        type=6,
        level=15,
        attr1idx=3,
        attr1ratio=1.4,
        attr1num=56,
        attr2idx=4,
        attr2ratio=1.4,
        attr2num=56,
        require_level=15,
        gold1=3275,
        gold2=3537,
        gold3=3820,
        gold4=4126,
        gold5=4456,
        gold6=4812,
        gold7=5197};

get({6,16}) ->
    #intensify_cfg{
        type=6,
        level=16,
        attr1idx=3,
        attr1ratio=1.5,
        attr1num=60,
        attr2idx=4,
        attr2ratio=1.5,
        attr2num=60,
        require_level=16,
        gold1=3801,
        gold2=4105,
        gold3=4433,
        gold4=4788,
        gold5=5171,
        gold6=5585,
        gold7=6032};

get({6,17}) ->
    #intensify_cfg{
        type=6,
        level=17,
        attr1idx=3,
        attr1ratio=1.6,
        attr1num=64,
        attr2idx=4,
        attr2ratio=1.6,
        attr2num=64,
        require_level=17,
        gold1=4329,
        gold2=4675,
        gold3=5049,
        gold4=5453,
        gold5=5890,
        gold6=6361,
        gold7=6870};

get({6,18}) ->
    #intensify_cfg{
        type=6,
        level=18,
        attr1idx=3,
        attr1ratio=1.7,
        attr1num=68,
        attr2idx=4,
        attr2ratio=1.7,
        attr2num=68,
        require_level=18,
        gold1=4860,
        gold2=5249,
        gold3=5669,
        gold4=6122,
        gold5=6612,
        gold6=7141,
        gold7=7712};

get({6,19}) ->
    #intensify_cfg{
        type=6,
        level=19,
        attr1idx=3,
        attr1ratio=1.8,
        attr1num=72,
        attr2idx=4,
        attr2ratio=1.8,
        attr2num=72,
        require_level=19,
        gold1=5393,
        gold2=5824,
        gold3=6290,
        gold4=6794,
        gold5=7337,
        gold6=7924,
        gold7=8558};

get({6,20}) ->
    #intensify_cfg{
        type=6,
        level=20,
        attr1idx=3,
        attr1ratio=1.9,
        attr1num=76,
        attr2idx=4,
        attr2ratio=1.9,
        attr2num=76,
        require_level=20,
        gold1=6430,
        gold2=6944,
        gold3=7500,
        gold4=8100,
        gold5=8748,
        gold6=9448,
        gold7=10204};

get({6,21}) ->
    #intensify_cfg{
        type=6,
        level=21,
        attr1idx=3,
        attr1ratio=2.0,
        attr1num=80,
        attr2idx=4,
        attr2ratio=2.0,
        attr2num=80,
        require_level=21,
        gold1=7470,
        gold2=8068,
        gold3=8713,
        gold4=9410,
        gold5=10163,
        gold6=10976,
        gold7=11854};

get({6,22}) ->
    #intensify_cfg{
        type=6,
        level=22,
        attr1idx=3,
        attr1ratio=2.1,
        attr1num=85,
        attr2idx=4,
        attr2ratio=2.1,
        attr2num=85,
        require_level=22,
        gold1=8513,
        gold2=9194,
        gold3=9930,
        gold4=10724,
        gold5=11582,
        gold6=12508,
        gold7=13509};

get({6,23}) ->
    #intensify_cfg{
        type=6,
        level=23,
        attr1idx=3,
        attr1ratio=2.2,
        attr1num=90,
        attr2idx=4,
        attr2ratio=2.2,
        attr2num=90,
        require_level=23,
        gold1=9561,
        gold2=10326,
        gold3=11152,
        gold4=12044,
        gold5=13008,
        gold6=14048,
        gold7=15172};

get({6,24}) ->
    #intensify_cfg{
        type=6,
        level=24,
        attr1idx=3,
        attr1ratio=2.3,
        attr1num=95,
        attr2idx=4,
        attr2ratio=2.3,
        attr2num=95,
        require_level=24,
        gold1=10613,
        gold2=11462,
        gold3=12379,
        gold4=13369,
        gold5=14439,
        gold6=15594,
        gold7=16841};

get({6,25}) ->
    #intensify_cfg{
        type=6,
        level=25,
        attr1idx=3,
        attr1ratio=2.4,
        attr1num=100,
        attr2idx=4,
        attr2ratio=2.4,
        attr2num=100,
        require_level=25,
        gold1=13671,
        gold2=14765,
        gold3=15946,
        gold4=17222,
        gold5=18599,
        gold6=20087,
        gold7=21694};

get({6,26}) ->
    #intensify_cfg{
        type=6,
        level=26,
        attr1idx=3,
        attr1ratio=2.5,
        attr1num=105,
        attr2idx=4,
        attr2ratio=2.5,
        attr2num=105,
        require_level=26,
        gold1=16733,
        gold2=18072,
        gold3=19517,
        gold4=21079,
        gold5=22765,
        gold6=24586,
        gold7=26553};

get({6,27}) ->
    #intensify_cfg{
        type=6,
        level=27,
        attr1idx=3,
        attr1ratio=2.6,
        attr1num=110,
        attr2idx=4,
        attr2ratio=2.6,
        attr2num=110,
        require_level=27,
        gold1=19802,
        gold2=21386,
        gold3=23097,
        gold4=24945,
        gold5=26940,
        gold6=29096,
        gold7=31423};

get({6,28}) ->
    #intensify_cfg{
        type=6,
        level=28,
        attr1idx=3,
        attr1ratio=2.7,
        attr1num=115,
        attr2idx=4,
        attr2ratio=2.7,
        attr2num=115,
        require_level=28,
        gold1=22876,
        gold2=24706,
        gold3=26683,
        gold4=28817,
        gold5=31123,
        gold6=33612,
        gold7=36301};

get({6,29}) ->
    #intensify_cfg{
        type=6,
        level=29,
        attr1idx=3,
        attr1ratio=2.8,
        attr1num=120,
        attr2idx=4,
        attr2ratio=2.8,
        attr2num=120,
        require_level=29,
        gold1=25958,
        gold2=28035,
        gold3=30277,
        gold4=32700,
        gold5=35316,
        gold6=38141,
        gold7=41192};

get({6,30}) ->
    #intensify_cfg{
        type=6,
        level=30,
        attr1idx=3,
        attr1ratio=2.9,
        attr1num=125,
        attr2idx=4,
        attr2ratio=2.9,
        attr2num=125,
        require_level=30,
        gold1=29048,
        gold2=31372,
        gold3=33882,
        gold4=36592,
        gold5=39519,
        gold6=42681,
        gold7=46096};

get({6,31}) ->
    #intensify_cfg{
        type=6,
        level=31,
        attr1idx=3,
        attr1ratio=3.0,
        attr1num=130,
        attr2idx=4,
        attr2ratio=3.0,
        attr2num=130,
        require_level=31,
        gold1=33146,
        gold2=35798,
        gold3=38661,
        gold4=41754,
        gold5=45095,
        gold6=48702,
        gold7=52599};

get({6,32}) ->
    #intensify_cfg{
        type=6,
        level=32,
        attr1idx=3,
        attr1ratio=3.1,
        attr1num=135,
        attr2idx=4,
        attr2ratio=3.1,
        attr2num=135,
        require_level=32,
        gold1=38253,
        gold2=41313,
        gold3=44618,
        gold4=48188,
        gold5=52043,
        gold6=56206,
        gold7=60703};

get({6,33}) ->
    #intensify_cfg{
        type=6,
        level=33,
        attr1idx=3,
        attr1ratio=3.2,
        attr1num=140,
        attr2idx=4,
        attr2ratio=3.2,
        attr2num=140,
        require_level=33,
        gold1=45371,
        gold2=49001,
        gold3=52921,
        gold4=57154,
        gold5=61727,
        gold6=66665,
        gold7=71998};

get({6,34}) ->
    #intensify_cfg{
        type=6,
        level=34,
        attr1idx=3,
        attr1ratio=3.3,
        attr1num=145,
        attr2idx=4,
        attr2ratio=3.3,
        attr2num=145,
        require_level=34,
        gold1=52499,
        gold2=56699,
        gold3=61235,
        gold4=66134,
        gold5=71424,
        gold6=77138,
        gold7=83309};

get({6,35}) ->
    #intensify_cfg{
        type=6,
        level=35,
        attr1idx=3,
        attr1ratio=3.4,
        attr1num=150,
        attr2idx=4,
        attr2ratio=3.4,
        attr2num=150,
        require_level=35,
        gold1=59640,
        gold2=64411,
        gold3=69564,
        gold4=75129,
        gold5=81140,
        gold6=87631,
        gold7=94641};

get({6,36}) ->
    #intensify_cfg{
        type=6,
        level=36,
        attr1idx=3,
        attr1ratio=3.5,
        attr1num=155,
        attr2idx=4,
        attr2ratio=3.5,
        attr2num=155,
        require_level=36,
        gold1=66794,
        gold2=72138,
        gold3=77909,
        gold4=84141,
        gold5=90872,
        gold6=98142,
        gold7=105994};

get({6,37}) ->
    #intensify_cfg{
        type=6,
        level=37,
        attr1idx=3,
        attr1ratio=3.6,
        attr1num=160,
        attr2idx=4,
        attr2ratio=3.6,
        attr2num=160,
        require_level=37,
        gold1=73963,
        gold2=79880,
        gold3=86270,
        gold4=93172,
        gold5=100626,
        gold6=108676,
        gold7=117370};

get({6,38}) ->
    #intensify_cfg{
        type=6,
        level=38,
        attr1idx=3,
        attr1ratio=3.7,
        attr1num=165,
        attr2idx=4,
        attr2ratio=3.7,
        attr2num=165,
        require_level=38,
        gold1=81148,
        gold2=87640,
        gold3=94651,
        gold4=102223,
        gold5=110401,
        gold6=119233,
        gold7=128772};

get({6,39}) ->
    #intensify_cfg{
        type=6,
        level=39,
        attr1idx=3,
        attr1ratio=3.8,
        attr1num=170,
        attr2idx=4,
        attr2ratio=3.8,
        attr2num=170,
        require_level=39,
        gold1=88350,
        gold2=95418,
        gold3=103051,
        gold4=111296,
        gold5=120199,
        gold6=129815,
        gold7=140200};

get({6,40}) ->
    #intensify_cfg{
        type=6,
        level=40,
        attr1idx=3,
        attr1ratio=3.9,
        attr1num=175,
        attr2idx=4,
        attr2ratio=3.9,
        attr2num=175,
        require_level=40,
        gold1=95571,
        gold2=103217,
        gold3=111474,
        gold4=120392,
        gold5=130023,
        gold6=140425,
        gold7=151659};

get({6,41}) ->
    #intensify_cfg{
        type=6,
        level=41,
        attr1idx=3,
        attr1ratio=4.0,
        attr1num=180,
        attr2idx=4,
        attr2ratio=4.0,
        attr2num=180,
        require_level=41,
        gold1=103814,
        gold2=112119,
        gold3=121089,
        gold4=130776,
        gold5=141238,
        gold6=152537,
        gold7=164740};

get({6,42}) ->
    #intensify_cfg{
        type=6,
        level=42,
        attr1idx=3,
        attr1ratio=4.1,
        attr1num=186,
        attr2idx=4,
        attr2ratio=4.1,
        attr2num=186,
        require_level=42,
        gold1=114079,
        gold2=123205,
        gold3=133062,
        gold4=143707,
        gold5=155203,
        gold6=167619,
        gold7=181029};

get({6,43}) ->
    #intensify_cfg{
        type=6,
        level=43,
        attr1idx=3,
        attr1ratio=4.2,
        attr1num=192,
        attr2idx=4,
        attr2ratio=4.2,
        attr2num=192,
        require_level=43,
        gold1=124370,
        gold2=134320,
        gold3=145065,
        gold4=156670,
        gold5=169204,
        gold6=182740,
        gold7=197360};

get({6,44}) ->
    #intensify_cfg{
        type=6,
        level=44,
        attr1idx=3,
        attr1ratio=4.3,
        attr1num=198,
        attr2idx=4,
        attr2ratio=4.3,
        attr2num=198,
        require_level=44,
        gold1=134689,
        gold2=145464,
        gold3=157101,
        gold4=169669,
        gold5=183243,
        gold6=197902,
        gold7=213735};

get({6,45}) ->
    #intensify_cfg{
        type=6,
        level=45,
        attr1idx=3,
        attr1ratio=4.4,
        attr1num=204,
        attr2idx=4,
        attr2ratio=4.4,
        attr2num=204,
        require_level=45,
        gold1=145037,
        gold2=156640,
        gold3=169171,
        gold4=182705,
        gold5=197321,
        gold6=213107,
        gold7=230155};

get({6,46}) ->
    #intensify_cfg{
        type=6,
        level=46,
        attr1idx=3,
        attr1ratio=4.5,
        attr1num=210,
        attr2idx=4,
        attr2ratio=4.5,
        attr2num=210,
        require_level=46,
        gold1=155419,
        gold2=167853,
        gold3=181281,
        gold4=195783,
        gold5=211446,
        gold6=228362,
        gold7=246630};

get({6,47}) ->
    #intensify_cfg{
        type=6,
        level=47,
        attr1idx=3,
        attr1ratio=4.6,
        attr1num=216,
        attr2idx=4,
        attr2ratio=4.6,
        attr2num=216,
        require_level=47,
        gold1=165838,
        gold2=179105,
        gold3=193433,
        gold4=208908,
        gold5=225621,
        gold6=243670,
        gold7=263164};

get({6,48}) ->
    #intensify_cfg{
        type=6,
        level=48,
        attr1idx=3,
        attr1ratio=4.7,
        attr1num=222,
        attr2idx=4,
        attr2ratio=4.7,
        attr2num=222,
        require_level=48,
        gold1=176296,
        gold2=190400,
        gold3=205632,
        gold4=222082,
        gold5=239849,
        gold6=259037,
        gold7=279760};

get({6,49}) ->
    #intensify_cfg{
        type=6,
        level=49,
        attr1idx=3,
        attr1ratio=4.8,
        attr1num=228,
        attr2idx=4,
        attr2ratio=4.8,
        attr2num=228,
        require_level=49,
        gold1=186798,
        gold2=201742,
        gold3=217881,
        gold4=235312,
        gold5=254137,
        gold6=274468,
        gold7=296425};

get({6,50}) ->
    #intensify_cfg{
        type=6,
        level=50,
        attr1idx=3,
        attr1ratio=4.9,
        attr1num=234,
        attr2idx=4,
        attr2ratio=4.9,
        attr2num=234,
        require_level=50,
        gold1=197347,
        gold2=213135,
        gold3=230186,
        gold4=248600,
        gold5=268488,
        gold6=289967,
        gold7=313165};

get({6,51}) ->
    #intensify_cfg{
        type=6,
        level=51,
        attr1idx=3,
        attr1ratio=5.0,
        attr1num=240,
        attr2idx=4,
        attr2ratio=5.0,
        attr2num=240,
        require_level=51,
        gold1=207949,
        gold2=224585,
        gold3=242552,
        gold4=261956,
        gold5=282912,
        gold6=305545,
        gold7=329989};

get({6,52}) ->
    #intensify_cfg{
        type=6,
        level=52,
        attr1idx=3,
        attr1ratio=5.1,
        attr1num=246,
        attr2idx=4,
        attr2ratio=5.1,
        attr2num=246,
        require_level=52,
        gold1=218608,
        gold2=236097,
        gold3=254984,
        gold4=275383,
        gold5=297414,
        gold6=321207,
        gold7=346903};

get({6,53}) ->
    #intensify_cfg{
        type=6,
        level=53,
        attr1idx=3,
        attr1ratio=5.2,
        attr1num=252,
        attr2idx=4,
        attr2ratio=5.2,
        attr2num=252,
        require_level=53,
        gold1=229331,
        gold2=247677,
        gold3=267492,
        gold4=288891,
        gold5=312002,
        gold6=336962,
        gold7=363919};

get({6,54}) ->
    #intensify_cfg{
        type=6,
        level=54,
        attr1idx=3,
        attr1ratio=5.3,
        attr1num=258,
        attr2idx=4,
        attr2ratio=5.3,
        attr2num=258,
        require_level=54,
        gold1=240121,
        gold2=259331,
        gold3=280077,
        gold4=302483,
        gold5=326682,
        gold6=352817,
        gold7=381042};

get({6,55}) ->
    #intensify_cfg{
        type=6,
        level=55,
        attr1idx=3,
        attr1ratio=5.4,
        attr1num=264,
        attr2idx=4,
        attr2ratio=5.4,
        attr2num=264,
        require_level=55,
        gold1=250988,
        gold2=271067,
        gold3=292752,
        gold4=316173,
        gold5=341466,
        gold6=368784,
        gold7=398286};

get({6,56}) ->
    #intensify_cfg{
        type=6,
        level=56,
        attr1idx=3,
        attr1ratio=5.5,
        attr1num=270,
        attr2idx=4,
        attr2ratio=5.5,
        attr2num=270,
        require_level=56,
        gold1=261937,
        gold2=282892,
        gold3=305523,
        gold4=329965,
        gold5=356362,
        gold6=384871,
        gold7=415661};

get({6,57}) ->
    #intensify_cfg{
        type=6,
        level=57,
        attr1idx=3,
        attr1ratio=5.6,
        attr1num=276,
        attr2idx=4,
        attr2ratio=5.6,
        attr2num=276,
        require_level=57,
        gold1=272976,
        gold2=294814,
        gold3=318399,
        gold4=343871,
        gold5=371381,
        gold6=401091,
        gold7=433179};

get({6,58}) ->
    #intensify_cfg{
        type=6,
        level=58,
        attr1idx=3,
        attr1ratio=5.7,
        attr1num=282,
        attr2idx=4,
        attr2ratio=5.7,
        attr2num=282,
        require_level=58,
        gold1=284115,
        gold2=306844,
        gold3=331392,
        gold4=357903,
        gold5=386535,
        gold6=417458,
        gold7=450855};

get({6,59}) ->
    #intensify_cfg{
        type=6,
        level=59,
        attr1idx=3,
        attr1ratio=5.8,
        attr1num=288,
        attr2idx=4,
        attr2ratio=5.8,
        attr2num=288,
        require_level=59,
        gold1=295362,
        gold2=318991,
        gold3=344510,
        gold4=372071,
        gold5=401837,
        gold6=433984,
        gold7=468702};

get({6,60}) ->
    #intensify_cfg{
        type=6,
        level=60,
        attr1idx=3,
        attr1ratio=5.9,
        attr1num=294,
        attr2idx=4,
        attr2ratio=5.9,
        attr2num=294,
        require_level=60,
        gold1=306728,
        gold2=331266,
        gold3=357768,
        gold4=386389,
        gold5=417300,
        gold6=450684,
        gold7=486739};

get({6,61}) ->
    #intensify_cfg{
        type=6,
        level=61,
        attr1idx=3,
        attr1ratio=6.0,
        attr1num=300,
        attr2idx=4,
        attr2ratio=6.0,
        attr2num=300,
        require_level=61,
        gold1=318224,
        gold2=343682,
        gold3=371176,
        gold4=400871,
        gold5=432940,
        gold6=467575,
        gold7=504981};

get({6,62}) ->
    #intensify_cfg{
        type=6,
        level=62,
        attr1idx=3,
        attr1ratio=6.1,
        attr1num=307,
        attr2idx=4,
        attr2ratio=6.1,
        attr2num=307,
        require_level=62,
        gold1=329863,
        gold2=356252,
        gold3=384752,
        gold4=415532,
        gold5=448775,
        gold6=484677,
        gold7=523451};

get({6,63}) ->
    #intensify_cfg{
        type=6,
        level=63,
        attr1idx=3,
        attr1ratio=6.2,
        attr1num=314,
        attr2idx=4,
        attr2ratio=6.2,
        attr2num=314,
        require_level=63,
        gold1=341659,
        gold2=368992,
        gold3=398511,
        gold4=430392,
        gold5=464823,
        gold6=502009,
        gold7=542170};

get({6,64}) ->
    #intensify_cfg{
        type=6,
        level=64,
        attr1idx=3,
        attr1ratio=6.3,
        attr1num=321,
        attr2idx=4,
        attr2ratio=6.3,
        attr2num=321,
        require_level=64,
        gold1=353625,
        gold2=381915,
        gold3=412468,
        gold4=445466,
        gold5=481103,
        gold6=519591,
        gold7=561158};

get({6,65}) ->
    #intensify_cfg{
        type=6,
        level=65,
        attr1idx=3,
        attr1ratio=6.4,
        attr1num=328,
        attr2idx=4,
        attr2ratio=6.4,
        attr2num=328,
        require_level=65,
        gold1=365780,
        gold2=395042,
        gold3=426646,
        gold4=460777,
        gold5=497640,
        gold6=537451,
        gold7=580447};

get({6,66}) ->
    #intensify_cfg{
        type=6,
        level=66,
        attr1idx=3,
        attr1ratio=6.5,
        attr1num=335,
        attr2idx=4,
        attr2ratio=6.5,
        attr2num=335,
        require_level=66,
        gold1=378139,
        gold2=408390,
        gold3=441061,
        gold4=476346,
        gold5=514454,
        gold6=555610,
        gold7=600059};

get({6,67}) ->
    #intensify_cfg{
        type=6,
        level=67,
        attr1idx=3,
        attr1ratio=6.6,
        attr1num=342,
        attr2idx=4,
        attr2ratio=6.6,
        attr2num=342,
        require_level=67,
        gold1=390724,
        gold2=421982,
        gold3=455740,
        gold4=492200,
        gold5=531576,
        gold6=574102,
        gold7=620030};

get({6,68}) ->
    #intensify_cfg{
        type=6,
        level=68,
        attr1idx=3,
        attr1ratio=6.7,
        attr1num=349,
        attr2idx=4,
        attr2ratio=6.7,
        attr2num=349,
        require_level=68,
        gold1=403556,
        gold2=435840,
        gold3=470708,
        gold4=508364,
        gold5=549033,
        gold6=592956,
        gold7=640393};

get({6,69}) ->
    #intensify_cfg{
        type=6,
        level=69,
        attr1idx=3,
        attr1ratio=6.8,
        attr1num=356,
        attr2idx=4,
        attr2ratio=6.8,
        attr2num=356,
        require_level=69,
        gold1=416657,
        gold2=449990,
        gold3=485989,
        gold4=524868,
        gold5=566857,
        gold6=612206,
        gold7=661182};

get({6,70}) ->
    #intensify_cfg{
        type=6,
        level=70,
        attr1idx=3,
        attr1ratio=6.9,
        attr1num=363,
        attr2idx=4,
        attr2ratio=6.9,
        attr2num=363,
        require_level=70,
        gold1=430055,
        gold2=464459,
        gold3=501616,
        gold4=541745,
        gold5=585085,
        gold6=631892,
        gold7=682443};

get({6,71}) ->
    #intensify_cfg{
        type=6,
        level=71,
        attr1idx=3,
        attr1ratio=7.0,
        attr1num=370,
        attr2idx=4,
        attr2ratio=7.0,
        attr2num=370,
        require_level=71,
        gold1=443777,
        gold2=479279,
        gold3=517621,
        gold4=559031,
        gold5=603754,
        gold6=652054,
        gold7=704218};

get({6,72}) ->
    #intensify_cfg{
        type=6,
        level=72,
        attr1idx=3,
        attr1ratio=7.1,
        attr1num=377,
        attr2idx=4,
        attr2ratio=7.1,
        attr2num=377,
        require_level=72,
        gold1=457854,
        gold2=494482,
        gold3=534041,
        gold4=576764,
        gold5=622905,
        gold6=672738,
        gold7=726557};

get({6,73}) ->
    #intensify_cfg{
        type=6,
        level=73,
        attr1idx=3,
        attr1ratio=7.2,
        attr1num=384,
        attr2idx=4,
        attr2ratio=7.2,
        attr2num=384,
        require_level=73,
        gold1=472320,
        gold2=510106,
        gold3=550914,
        gold4=594987,
        gold5=642586,
        gold6=693993,
        gold7=749512};

get({6,74}) ->
    #intensify_cfg{
        type=6,
        level=74,
        attr1idx=3,
        attr1ratio=7.3,
        attr1num=391,
        attr2idx=4,
        attr2ratio=7.3,
        attr2num=391,
        require_level=74,
        gold1=487212,
        gold2=526189,
        gold3=568284,
        gold4=613747,
        gold5=662847,
        gold6=715874,
        gold7=773144};

get({6,75}) ->
    #intensify_cfg{
        type=6,
        level=75,
        attr1idx=3,
        attr1ratio=7.4,
        attr1num=398,
        attr2idx=4,
        attr2ratio=7.4,
        attr2num=398,
        require_level=75,
        gold1=502571,
        gold2=542777,
        gold3=586199,
        gold4=633095,
        gold5=683742,
        gold6=738442,
        gold7=797517};

get({6,76}) ->
    #intensify_cfg{
        type=6,
        level=76,
        attr1idx=3,
        attr1ratio=7.5,
        attr1num=405,
        attr2idx=4,
        attr2ratio=7.5,
        attr2num=405,
        require_level=76,
        gold1=518442,
        gold2=559917,
        gold3=604711,
        gold4=653088,
        gold5=705335,
        gold6=761761,
        gold7=822702};

get({6,77}) ->
    #intensify_cfg{
        type=6,
        level=77,
        attr1idx=3,
        attr1ratio=7.6,
        attr1num=412,
        attr2idx=4,
        attr2ratio=7.6,
        attr2num=412,
        require_level=77,
        gold1=534872,
        gold2=577662,
        gold3=623875,
        gold4=673785,
        gold5=727687,
        gold6=785902,
        gold7=848775};

get({6,78}) ->
    #intensify_cfg{
        type=6,
        level=78,
        attr1idx=3,
        attr1ratio=7.7,
        attr1num=419,
        attr2idx=4,
        attr2ratio=7.7,
        attr2num=419,
        require_level=78,
        gold1=551916,
        gold2=596069,
        gold3=643755,
        gold4=695255,
        gold5=750876,
        gold6=810946,
        gold7=875821};

get({6,79}) ->
    #intensify_cfg{
        type=6,
        level=79,
        attr1idx=3,
        attr1ratio=7.8,
        attr1num=426,
        attr2idx=4,
        attr2ratio=7.8,
        attr2num=426,
        require_level=79,
        gold1=569633,
        gold2=615204,
        gold3=664420,
        gold4=717574,
        gold5=774979,
        gold6=836978,
        gold7=903936};

get({6,80}) ->
    #intensify_cfg{
        type=6,
        level=80,
        attr1idx=3,
        attr1ratio=7.9,
        attr1num=433,
        attr2idx=4,
        attr2ratio=7.9,
        attr2num=433,
        require_level=80,
        gold1=588086,
        gold2=635133,
        gold3=685944,
        gold4=740819,
        gold5=800085,
        gold6=864091,
        gold7=933219};

get({6,81}) ->
    #intensify_cfg{
        type=6,
        level=81,
        attr1idx=3,
        attr1ratio=8.0,
        attr1num=440,
        attr2idx=4,
        attr2ratio=8.0,
        attr2num=440,
        require_level=81,
        gold1=607346,
        gold2=655934,
        gold3=708408,
        gold4=765081,
        gold5=826288,
        gold6=892391,
        gold7=963782};

get({6,82}) ->
    #intensify_cfg{
        type=6,
        level=82,
        attr1idx=3,
        attr1ratio=8.1,
        attr1num=448,
        attr2idx=4,
        attr2ratio=8.1,
        attr2num=448,
        require_level=82,
        gold1=627489,
        gold2=677688,
        gold3=731903,
        gold4=790455,
        gold5=853692,
        gold6=921987,
        gold7=995746};

get({6,83}) ->
    #intensify_cfg{
        type=6,
        level=83,
        attr1idx=3,
        attr1ratio=8.2,
        attr1num=456,
        attr2idx=4,
        attr2ratio=8.2,
        attr2num=456,
        require_level=83,
        gold1=648600,
        gold2=700488,
        gold3=756527,
        gold4=817049,
        gold5=882413,
        gold6=953006,
        gold7=1029247};

get({6,84}) ->
    #intensify_cfg{
        type=6,
        level=84,
        attr1idx=3,
        attr1ratio=8.3,
        attr1num=464,
        attr2idx=4,
        attr2ratio=8.3,
        attr2num=464,
        require_level=84,
        gold1=670772,
        gold2=724434,
        gold3=782388,
        gold4=844980,
        gold5=912578,
        gold6=985584,
        gold7=1064431};

get({6,85}) ->
    #intensify_cfg{
        type=6,
        level=85,
        attr1idx=3,
        attr1ratio=8.4,
        attr1num=472,
        attr2idx=4,
        attr2ratio=8.4,
        attr2num=472,
        require_level=85,
        gold1=694106,
        gold2=749634,
        gold3=809605,
        gold4=874374,
        gold5=944324,
        gold6=1019869,
        gold7=1101459};

get({6,86}) ->
    #intensify_cfg{
        type=6,
        level=86,
        attr1idx=3,
        attr1ratio=8.5,
        attr1num=480,
        attr2idx=4,
        attr2ratio=8.5,
        attr2num=480,
        require_level=86,
        gold1=718712,
        gold2=776209,
        gold3=838306,
        gold4=905370,
        gold5=977800,
        gold6=1056024,
        gold7=1140506};

get({6,87}) ->
    #intensify_cfg{
        type=6,
        level=87,
        attr1idx=3,
        attr1ratio=8.6,
        attr1num=488,
        attr2idx=4,
        attr2ratio=8.6,
        attr2num=488,
        require_level=87,
        gold1=744711,
        gold2=804288,
        gold3=868631,
        gold4=938121,
        gold5=1013171,
        gold6=1094225,
        gold7=1181763};

get({6,88}) ->
    #intensify_cfg{
        type=6,
        level=88,
        attr1idx=3,
        attr1ratio=8.7,
        attr1num=496,
        attr2idx=4,
        attr2ratio=8.7,
        attr2num=496,
        require_level=88,
        gold1=772238,
        gold2=834017,
        gold3=900738,
        gold4=972797,
        gold5=1050621,
        gold6=1134671,
        gold7=1225445};

get({6,89}) ->
    #intensify_cfg{
        type=6,
        level=89,
        attr1idx=3,
        attr1ratio=8.8,
        attr1num=504,
        attr2idx=4,
        attr2ratio=8.8,
        attr2num=504,
        require_level=89,
        gold1=801438,
        gold2=865553,
        gold3=934797,
        gold4=1009581,
        gold5=1090348,
        gold6=1177575,
        gold7=1271781};

get({6,90}) ->
    #intensify_cfg{
        type=6,
        level=90,
        attr1idx=3,
        attr1ratio=8.9,
        attr1num=512,
        attr2idx=4,
        attr2ratio=8.9,
        attr2num=512,
        require_level=90,
        gold1=832470,
        gold2=899068,
        gold3=970993,
        gold4=1048672,
        gold5=1132566,
        gold6=1223172,
        gold7=1321025};

get({6,91}) ->
    #intensify_cfg{
        type=6,
        level=91,
        attr1idx=3,
        attr1ratio=9.0,
        attr1num=520,
        attr2idx=4,
        attr2ratio=9.0,
        attr2num=520,
        require_level=91,
        gold1=865510,
        gold2=934751,
        gold3=1009531,
        gold4=1090293,
        gold5=1177517,
        gold6=1271718,
        gold7=1373456};

get({6,92}) ->
    #intensify_cfg{
        type=6,
        level=92,
        attr1idx=3,
        attr1ratio=9.1,
        attr1num=528,
        attr2idx=4,
        attr2ratio=9.1,
        attr2num=528,
        require_level=92,
        gold1=900748,
        gold2=972808,
        gold3=1050632,
        gold4=1134683,
        gold5=1225458,
        gold6=1323494,
        gold7=1429374};

get({6,93}) ->
    #intensify_cfg{
        type=6,
        level=93,
        attr1idx=3,
        attr1ratio=9.2,
        attr1num=536,
        attr2idx=4,
        attr2ratio=9.2,
        attr2num=536,
        require_level=93,
        gold1=938395,
        gold2=1013467,
        gold3=1094544,
        gold4=1182107,
        gold5=1276676,
        gold6=1378810,
        gold7=1489115};

get({6,94}) ->
    #intensify_cfg{
        type=6,
        level=94,
        attr1idx=3,
        attr1ratio=9.3,
        attr1num=544,
        attr2idx=4,
        attr2ratio=9.3,
        attr2num=544,
        require_level=94,
        gold1=978681,
        gold2=1056975,
        gold3=1141534,
        gold4=1232856,
        gold5=1331485,
        gold6=1438003,
        gold7=1553044};

get({6,95}) ->
    #intensify_cfg{
        type=6,
        level=95,
        attr1idx=3,
        attr1ratio=9.4,
        attr1num=552,
        attr2idx=4,
        attr2ratio=9.4,
        attr2num=552,
        require_level=95,
        gold1=1021858,
        gold2=1103607,
        gold3=1191895,
        gold4=1287247,
        gold5=1390227,
        gold6=1501445,
        gold7=1621560};

get({6,96}) ->
    #intensify_cfg{
        type=6,
        level=96,
        attr1idx=3,
        attr1ratio=9.5,
        attr1num=560,
        attr2idx=4,
        attr2ratio=9.5,
        attr2num=560,
        require_level=96,
        gold1=1068200,
        gold2=1153656,
        gold3=1245948,
        gold4=1345624,
        gold5=1453274,
        gold6=1569536,
        gold7=1695099};

get({6,97}) ->
    #intensify_cfg{
        type=6,
        level=97,
        attr1idx=3,
        attr1ratio=9.6,
        attr1num=568,
        attr2idx=4,
        attr2ratio=9.6,
        attr2num=568,
        require_level=97,
        gold1=1118012,
        gold2=1207453,
        gold3=1304049,
        gold4=1408373,
        gold5=1521043,
        gold6=1642726,
        gold7=1774145};

get({6,98}) ->
    #intensify_cfg{
        type=6,
        level=98,
        attr1idx=3,
        attr1ratio=9.7,
        attr1num=576,
        attr2idx=4,
        attr2ratio=9.7,
        attr2num=576,
        require_level=98,
        gold1=1171623,
        gold2=1265353,
        gold3=1366581,
        gold4=1475908,
        gold5=1593980,
        gold6=1721499,
        gold7=1859218};

get({6,99}) ->
    #intensify_cfg{
        type=6,
        level=99,
        attr1idx=3,
        attr1ratio=9.8,
        attr1num=584,
        attr2idx=4,
        attr2ratio=9.8,
        attr2num=584,
        require_level=99,
        gold1=1229397,
        gold2=1327749,
        gold3=1433969,
        gold4=1548686,
        gold5=1672581,
        gold6=1806388,
        gold7=1950899};

get({6,100}) ->
    #intensify_cfg{
        type=6,
        level=100,
        attr1idx=3,
        attr1ratio=9.9,
        attr1num=592,
        attr2idx=4,
        attr2ratio=9.9,
        attr2num=592,
        require_level=100,
        gold1=1299753,
        gold2=1403733,
        gold3=1516032,
        gold4=1637314,
        gold5=1768300,
        gold6=1909764,
        gold7=2062545};

get({6,101}) ->
    #intensify_cfg{
        type=6,
        level=101,
        attr1idx=3,
        attr1ratio=10.0,
        attr1num=600,
        attr2idx=4,
        attr2ratio=10.0,
        attr2num=600,
        require_level=101,
        gold1=0,
        gold2=0,
        gold3=0,
        gold4=0,
        gold5=0,
        gold6=0,
        gold7=0};

get(_) -> false.


