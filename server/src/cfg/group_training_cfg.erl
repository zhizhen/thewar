-module(group_training_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({3,1}) ->
    #group_training_cfg{
        id=3,
        level=1,
        group_level=1,
        num=20,
        value=20};

get({3,2}) ->
    #group_training_cfg{
        id=3,
        level=2,
        group_level=1,
        num=40,
        value=30};

get({3,3}) ->
    #group_training_cfg{
        id=3,
        level=3,
        group_level=1,
        num=60,
        value=76};

get({3,4}) ->
    #group_training_cfg{
        id=3,
        level=4,
        group_level=1,
        num=80,
        value=175};

get({3,5}) ->
    #group_training_cfg{
        id=3,
        level=5,
        group_level=1,
        num=100,
        value=340};

get({3,6}) ->
    #group_training_cfg{
        id=3,
        level=6,
        group_level=1,
        num=120,
        value=579};

get({3,7}) ->
    #group_training_cfg{
        id=3,
        level=7,
        group_level=1,
        num=140,
        value=901};

get({3,8}) ->
    #group_training_cfg{
        id=3,
        level=8,
        group_level=1,
        num=160,
        value=1316};

get({3,9}) ->
    #group_training_cfg{
        id=3,
        level=9,
        group_level=1,
        num=180,
        value=1830};

get({3,10}) ->
    #group_training_cfg{
        id=3,
        level=10,
        group_level=1,
        num=200,
        value=2450};

get({3,11}) ->
    #group_training_cfg{
        id=3,
        level=11,
        group_level=2,
        num=240,
        value=3182};

get({3,12}) ->
    #group_training_cfg{
        id=3,
        level=12,
        group_level=2,
        num=280,
        value=4033};

get({3,13}) ->
    #group_training_cfg{
        id=3,
        level=13,
        group_level=2,
        num=320,
        value=5008};

get({3,14}) ->
    #group_training_cfg{
        id=3,
        level=14,
        group_level=2,
        num=360,
        value=6113};

get({3,15}) ->
    #group_training_cfg{
        id=3,
        level=15,
        group_level=2,
        num=400,
        value=7353};

get({3,16}) ->
    #group_training_cfg{
        id=3,
        level=16,
        group_level=2,
        num=440,
        value=8734};

get({3,17}) ->
    #group_training_cfg{
        id=3,
        level=17,
        group_level=2,
        num=480,
        value=10260};

get({3,18}) ->
    #group_training_cfg{
        id=3,
        level=18,
        group_level=2,
        num=520,
        value=11935};

get({3,19}) ->
    #group_training_cfg{
        id=3,
        level=19,
        group_level=2,
        num=560,
        value=13766};

get({3,20}) ->
    #group_training_cfg{
        id=3,
        level=20,
        group_level=2,
        num=600,
        value=15755};

get({3,21}) ->
    #group_training_cfg{
        id=3,
        level=21,
        group_level=3,
        num=700,
        value=17908};

get({3,22}) ->
    #group_training_cfg{
        id=3,
        level=22,
        group_level=3,
        num=800,
        value=20229};

get({3,23}) ->
    #group_training_cfg{
        id=3,
        level=23,
        group_level=3,
        num=900,
        value=22721};

get({3,24}) ->
    #group_training_cfg{
        id=3,
        level=24,
        group_level=3,
        num=1000,
        value=25389};

get({3,25}) ->
    #group_training_cfg{
        id=3,
        level=25,
        group_level=3,
        num=1100,
        value=28238};

get({3,26}) ->
    #group_training_cfg{
        id=3,
        level=26,
        group_level=3,
        num=1200,
        value=31270};

get({3,27}) ->
    #group_training_cfg{
        id=3,
        level=27,
        group_level=3,
        num=1300,
        value=34489};

get({3,28}) ->
    #group_training_cfg{
        id=3,
        level=28,
        group_level=3,
        num=1400,
        value=37899};

get({3,29}) ->
    #group_training_cfg{
        id=3,
        level=29,
        group_level=3,
        num=1500,
        value=41505};

get({3,30}) ->
    #group_training_cfg{
        id=3,
        level=30,
        group_level=3,
        num=1600,
        value=45309};

get({3,31}) ->
    #group_training_cfg{
        id=3,
        level=31,
        group_level=4,
        num=1800,
        value=49315};

get({3,32}) ->
    #group_training_cfg{
        id=3,
        level=32,
        group_level=4,
        num=2000,
        value=53526};

get({3,33}) ->
    #group_training_cfg{
        id=3,
        level=33,
        group_level=4,
        num=2200,
        value=57946};

get({3,34}) ->
    #group_training_cfg{
        id=3,
        level=34,
        group_level=4,
        num=2400,
        value=62578};

get({3,35}) ->
    #group_training_cfg{
        id=3,
        level=35,
        group_level=4,
        num=2600,
        value=67425};

get({3,36}) ->
    #group_training_cfg{
        id=3,
        level=36,
        group_level=4,
        num=2800,
        value=72491};

get({3,37}) ->
    #group_training_cfg{
        id=3,
        level=37,
        group_level=4,
        num=3000,
        value=77779};

get({3,38}) ->
    #group_training_cfg{
        id=3,
        level=38,
        group_level=4,
        num=3200,
        value=83293};

get({3,39}) ->
    #group_training_cfg{
        id=3,
        level=39,
        group_level=4,
        num=3400,
        value=89034};

get({3,40}) ->
    #group_training_cfg{
        id=3,
        level=40,
        group_level=4,
        num=3600,
        value=95006};

get({3,41}) ->
    #group_training_cfg{
        id=3,
        level=41,
        group_level=5,
        num=4000,
        value=101212};

get({3,42}) ->
    #group_training_cfg{
        id=3,
        level=42,
        group_level=5,
        num=4400,
        value=107656};

get({3,43}) ->
    #group_training_cfg{
        id=3,
        level=43,
        group_level=5,
        num=4800,
        value=114340};

get({3,44}) ->
    #group_training_cfg{
        id=3,
        level=44,
        group_level=5,
        num=5200,
        value=121267};

get({3,45}) ->
    #group_training_cfg{
        id=3,
        level=45,
        group_level=5,
        num=5600,
        value=128439};

get({3,46}) ->
    #group_training_cfg{
        id=3,
        level=46,
        group_level=5,
        num=6000,
        value=135861};

get({3,47}) ->
    #group_training_cfg{
        id=3,
        level=47,
        group_level=5,
        num=6400,
        value=143534};

get({3,48}) ->
    #group_training_cfg{
        id=3,
        level=48,
        group_level=5,
        num=6800,
        value=151461};

get({3,49}) ->
    #group_training_cfg{
        id=3,
        level=49,
        group_level=5,
        num=7200,
        value=159645};

get({3,50}) ->
    #group_training_cfg{
        id=3,
        level=50,
        group_level=5,
        num=7600,
        value=168090};

get({4,1}) ->
    #group_training_cfg{
        id=4,
        level=1,
        group_level=1,
        num=10,
        value=20};

get({4,2}) ->
    #group_training_cfg{
        id=4,
        level=2,
        group_level=1,
        num=20,
        value=30};

get({4,3}) ->
    #group_training_cfg{
        id=4,
        level=3,
        group_level=1,
        num=30,
        value=76};

get({4,4}) ->
    #group_training_cfg{
        id=4,
        level=4,
        group_level=1,
        num=40,
        value=175};

get({4,5}) ->
    #group_training_cfg{
        id=4,
        level=5,
        group_level=1,
        num=50,
        value=340};

get({4,6}) ->
    #group_training_cfg{
        id=4,
        level=6,
        group_level=1,
        num=60,
        value=579};

get({4,7}) ->
    #group_training_cfg{
        id=4,
        level=7,
        group_level=1,
        num=70,
        value=901};

get({4,8}) ->
    #group_training_cfg{
        id=4,
        level=8,
        group_level=1,
        num=80,
        value=1316};

get({4,9}) ->
    #group_training_cfg{
        id=4,
        level=9,
        group_level=1,
        num=90,
        value=1830};

get({4,10}) ->
    #group_training_cfg{
        id=4,
        level=10,
        group_level=1,
        num=100,
        value=2450};

get({4,11}) ->
    #group_training_cfg{
        id=4,
        level=11,
        group_level=2,
        num=120,
        value=3182};

get({4,12}) ->
    #group_training_cfg{
        id=4,
        level=12,
        group_level=2,
        num=140,
        value=4033};

get({4,13}) ->
    #group_training_cfg{
        id=4,
        level=13,
        group_level=2,
        num=160,
        value=5008};

get({4,14}) ->
    #group_training_cfg{
        id=4,
        level=14,
        group_level=2,
        num=180,
        value=6113};

get({4,15}) ->
    #group_training_cfg{
        id=4,
        level=15,
        group_level=2,
        num=200,
        value=7353};

get({4,16}) ->
    #group_training_cfg{
        id=4,
        level=16,
        group_level=2,
        num=220,
        value=8734};

get({4,17}) ->
    #group_training_cfg{
        id=4,
        level=17,
        group_level=2,
        num=240,
        value=10260};

get({4,18}) ->
    #group_training_cfg{
        id=4,
        level=18,
        group_level=2,
        num=260,
        value=11935};

get({4,19}) ->
    #group_training_cfg{
        id=4,
        level=19,
        group_level=2,
        num=280,
        value=13766};

get({4,20}) ->
    #group_training_cfg{
        id=4,
        level=20,
        group_level=2,
        num=300,
        value=15755};

get({4,21}) ->
    #group_training_cfg{
        id=4,
        level=21,
        group_level=3,
        num=350,
        value=17908};

get({4,22}) ->
    #group_training_cfg{
        id=4,
        level=22,
        group_level=3,
        num=400,
        value=20229};

get({4,23}) ->
    #group_training_cfg{
        id=4,
        level=23,
        group_level=3,
        num=450,
        value=22721};

get({4,24}) ->
    #group_training_cfg{
        id=4,
        level=24,
        group_level=3,
        num=500,
        value=25389};

get({4,25}) ->
    #group_training_cfg{
        id=4,
        level=25,
        group_level=3,
        num=550,
        value=28238};

get({4,26}) ->
    #group_training_cfg{
        id=4,
        level=26,
        group_level=3,
        num=600,
        value=31270};

get({4,27}) ->
    #group_training_cfg{
        id=4,
        level=27,
        group_level=3,
        num=650,
        value=34489};

get({4,28}) ->
    #group_training_cfg{
        id=4,
        level=28,
        group_level=3,
        num=700,
        value=37899};

get({4,29}) ->
    #group_training_cfg{
        id=4,
        level=29,
        group_level=3,
        num=750,
        value=41505};

get({4,30}) ->
    #group_training_cfg{
        id=4,
        level=30,
        group_level=3,
        num=800,
        value=45309};

get({4,31}) ->
    #group_training_cfg{
        id=4,
        level=31,
        group_level=4,
        num=900,
        value=49315};

get({4,32}) ->
    #group_training_cfg{
        id=4,
        level=32,
        group_level=4,
        num=1000,
        value=53526};

get({4,33}) ->
    #group_training_cfg{
        id=4,
        level=33,
        group_level=4,
        num=1100,
        value=57946};

get({4,34}) ->
    #group_training_cfg{
        id=4,
        level=34,
        group_level=4,
        num=1200,
        value=62578};

get({4,35}) ->
    #group_training_cfg{
        id=4,
        level=35,
        group_level=4,
        num=1300,
        value=67425};

get({4,36}) ->
    #group_training_cfg{
        id=4,
        level=36,
        group_level=4,
        num=1400,
        value=72491};

get({4,37}) ->
    #group_training_cfg{
        id=4,
        level=37,
        group_level=4,
        num=1500,
        value=77779};

get({4,38}) ->
    #group_training_cfg{
        id=4,
        level=38,
        group_level=4,
        num=1600,
        value=83293};

get({4,39}) ->
    #group_training_cfg{
        id=4,
        level=39,
        group_level=4,
        num=1700,
        value=89034};

get({4,40}) ->
    #group_training_cfg{
        id=4,
        level=40,
        group_level=4,
        num=1800,
        value=95006};

get({4,41}) ->
    #group_training_cfg{
        id=4,
        level=41,
        group_level=5,
        num=2000,
        value=101212};

get({4,42}) ->
    #group_training_cfg{
        id=4,
        level=42,
        group_level=5,
        num=2200,
        value=107656};

get({4,43}) ->
    #group_training_cfg{
        id=4,
        level=43,
        group_level=5,
        num=2400,
        value=114340};

get({4,44}) ->
    #group_training_cfg{
        id=4,
        level=44,
        group_level=5,
        num=2600,
        value=121267};

get({4,45}) ->
    #group_training_cfg{
        id=4,
        level=45,
        group_level=5,
        num=2800,
        value=128439};

get({4,46}) ->
    #group_training_cfg{
        id=4,
        level=46,
        group_level=5,
        num=3000,
        value=135861};

get({4,47}) ->
    #group_training_cfg{
        id=4,
        level=47,
        group_level=5,
        num=3200,
        value=143534};

get({4,48}) ->
    #group_training_cfg{
        id=4,
        level=48,
        group_level=5,
        num=3400,
        value=151461};

get({4,49}) ->
    #group_training_cfg{
        id=4,
        level=49,
        group_level=5,
        num=3600,
        value=159645};

get({4,50}) ->
    #group_training_cfg{
        id=4,
        level=50,
        group_level=5,
        num=3800,
        value=168090};

get({5,1}) ->
    #group_training_cfg{
        id=5,
        level=1,
        group_level=1,
        num=25,
        value=20};

get({5,2}) ->
    #group_training_cfg{
        id=5,
        level=2,
        group_level=1,
        num=50,
        value=30};

get({5,3}) ->
    #group_training_cfg{
        id=5,
        level=3,
        group_level=1,
        num=75,
        value=76};

get({5,4}) ->
    #group_training_cfg{
        id=5,
        level=4,
        group_level=1,
        num=100,
        value=175};

get({5,5}) ->
    #group_training_cfg{
        id=5,
        level=5,
        group_level=1,
        num=125,
        value=340};

get({5,6}) ->
    #group_training_cfg{
        id=5,
        level=6,
        group_level=1,
        num=150,
        value=579};

get({5,7}) ->
    #group_training_cfg{
        id=5,
        level=7,
        group_level=1,
        num=175,
        value=901};

get({5,8}) ->
    #group_training_cfg{
        id=5,
        level=8,
        group_level=1,
        num=200,
        value=1316};

get({5,9}) ->
    #group_training_cfg{
        id=5,
        level=9,
        group_level=1,
        num=225,
        value=1830};

get({5,10}) ->
    #group_training_cfg{
        id=5,
        level=10,
        group_level=1,
        num=250,
        value=2450};

get({5,11}) ->
    #group_training_cfg{
        id=5,
        level=11,
        group_level=2,
        num=300,
        value=3182};

get({5,12}) ->
    #group_training_cfg{
        id=5,
        level=12,
        group_level=2,
        num=350,
        value=4033};

get({5,13}) ->
    #group_training_cfg{
        id=5,
        level=13,
        group_level=2,
        num=400,
        value=5008};

get({5,14}) ->
    #group_training_cfg{
        id=5,
        level=14,
        group_level=2,
        num=450,
        value=6113};

get({5,15}) ->
    #group_training_cfg{
        id=5,
        level=15,
        group_level=2,
        num=500,
        value=7353};

get({5,16}) ->
    #group_training_cfg{
        id=5,
        level=16,
        group_level=2,
        num=550,
        value=8734};

get({5,17}) ->
    #group_training_cfg{
        id=5,
        level=17,
        group_level=2,
        num=600,
        value=10260};

get({5,18}) ->
    #group_training_cfg{
        id=5,
        level=18,
        group_level=2,
        num=650,
        value=11935};

get({5,19}) ->
    #group_training_cfg{
        id=5,
        level=19,
        group_level=2,
        num=700,
        value=13766};

get({5,20}) ->
    #group_training_cfg{
        id=5,
        level=20,
        group_level=2,
        num=750,
        value=15755};

get({5,21}) ->
    #group_training_cfg{
        id=5,
        level=21,
        group_level=3,
        num=875,
        value=17908};

get({5,22}) ->
    #group_training_cfg{
        id=5,
        level=22,
        group_level=3,
        num=1000,
        value=20229};

get({5,23}) ->
    #group_training_cfg{
        id=5,
        level=23,
        group_level=3,
        num=1125,
        value=22721};

get({5,24}) ->
    #group_training_cfg{
        id=5,
        level=24,
        group_level=3,
        num=1250,
        value=25389};

get({5,25}) ->
    #group_training_cfg{
        id=5,
        level=25,
        group_level=3,
        num=1375,
        value=28238};

get({5,26}) ->
    #group_training_cfg{
        id=5,
        level=26,
        group_level=3,
        num=1500,
        value=31270};

get({5,27}) ->
    #group_training_cfg{
        id=5,
        level=27,
        group_level=3,
        num=1625,
        value=34489};

get({5,28}) ->
    #group_training_cfg{
        id=5,
        level=28,
        group_level=3,
        num=1750,
        value=37899};

get({5,29}) ->
    #group_training_cfg{
        id=5,
        level=29,
        group_level=3,
        num=1875,
        value=41505};

get({5,30}) ->
    #group_training_cfg{
        id=5,
        level=30,
        group_level=3,
        num=2000,
        value=45309};

get({5,31}) ->
    #group_training_cfg{
        id=5,
        level=31,
        group_level=4,
        num=2250,
        value=49315};

get({5,32}) ->
    #group_training_cfg{
        id=5,
        level=32,
        group_level=4,
        num=2500,
        value=53526};

get({5,33}) ->
    #group_training_cfg{
        id=5,
        level=33,
        group_level=4,
        num=2750,
        value=57946};

get({5,34}) ->
    #group_training_cfg{
        id=5,
        level=34,
        group_level=4,
        num=3000,
        value=62578};

get({5,35}) ->
    #group_training_cfg{
        id=5,
        level=35,
        group_level=4,
        num=3250,
        value=67425};

get({5,36}) ->
    #group_training_cfg{
        id=5,
        level=36,
        group_level=4,
        num=3500,
        value=72491};

get({5,37}) ->
    #group_training_cfg{
        id=5,
        level=37,
        group_level=4,
        num=3750,
        value=77779};

get({5,38}) ->
    #group_training_cfg{
        id=5,
        level=38,
        group_level=4,
        num=4000,
        value=83293};

get({5,39}) ->
    #group_training_cfg{
        id=5,
        level=39,
        group_level=4,
        num=4250,
        value=89034};

get({5,40}) ->
    #group_training_cfg{
        id=5,
        level=40,
        group_level=4,
        num=4500,
        value=95006};

get({5,41}) ->
    #group_training_cfg{
        id=5,
        level=41,
        group_level=5,
        num=5000,
        value=101212};

get({5,42}) ->
    #group_training_cfg{
        id=5,
        level=42,
        group_level=5,
        num=5500,
        value=107656};

get({5,43}) ->
    #group_training_cfg{
        id=5,
        level=43,
        group_level=5,
        num=6000,
        value=114340};

get({5,44}) ->
    #group_training_cfg{
        id=5,
        level=44,
        group_level=5,
        num=6500,
        value=121267};

get({5,45}) ->
    #group_training_cfg{
        id=5,
        level=45,
        group_level=5,
        num=7000,
        value=128439};

get({5,46}) ->
    #group_training_cfg{
        id=5,
        level=46,
        group_level=5,
        num=7500,
        value=135861};

get({5,47}) ->
    #group_training_cfg{
        id=5,
        level=47,
        group_level=5,
        num=8000,
        value=143534};

get({5,48}) ->
    #group_training_cfg{
        id=5,
        level=48,
        group_level=5,
        num=8500,
        value=151461};

get({5,49}) ->
    #group_training_cfg{
        id=5,
        level=49,
        group_level=5,
        num=9000,
        value=159645};

get({5,50}) ->
    #group_training_cfg{
        id=5,
        level=50,
        group_level=5,
        num=9500,
        value=168090};

get({6,1}) ->
    #group_training_cfg{
        id=6,
        level=1,
        group_level=1,
        num=15,
        value=20};

get({6,2}) ->
    #group_training_cfg{
        id=6,
        level=2,
        group_level=1,
        num=30,
        value=30};

get({6,3}) ->
    #group_training_cfg{
        id=6,
        level=3,
        group_level=1,
        num=45,
        value=76};

get({6,4}) ->
    #group_training_cfg{
        id=6,
        level=4,
        group_level=1,
        num=60,
        value=175};

get({6,5}) ->
    #group_training_cfg{
        id=6,
        level=5,
        group_level=1,
        num=75,
        value=340};

get({6,6}) ->
    #group_training_cfg{
        id=6,
        level=6,
        group_level=1,
        num=90,
        value=579};

get({6,7}) ->
    #group_training_cfg{
        id=6,
        level=7,
        group_level=1,
        num=105,
        value=901};

get({6,8}) ->
    #group_training_cfg{
        id=6,
        level=8,
        group_level=1,
        num=120,
        value=1316};

get({6,9}) ->
    #group_training_cfg{
        id=6,
        level=9,
        group_level=1,
        num=135,
        value=1830};

get({6,10}) ->
    #group_training_cfg{
        id=6,
        level=10,
        group_level=1,
        num=150,
        value=2450};

get({6,11}) ->
    #group_training_cfg{
        id=6,
        level=11,
        group_level=2,
        num=180,
        value=3182};

get({6,12}) ->
    #group_training_cfg{
        id=6,
        level=12,
        group_level=2,
        num=210,
        value=4033};

get({6,13}) ->
    #group_training_cfg{
        id=6,
        level=13,
        group_level=2,
        num=240,
        value=5008};

get({6,14}) ->
    #group_training_cfg{
        id=6,
        level=14,
        group_level=2,
        num=270,
        value=6113};

get({6,15}) ->
    #group_training_cfg{
        id=6,
        level=15,
        group_level=2,
        num=300,
        value=7353};

get({6,16}) ->
    #group_training_cfg{
        id=6,
        level=16,
        group_level=2,
        num=330,
        value=8734};

get({6,17}) ->
    #group_training_cfg{
        id=6,
        level=17,
        group_level=2,
        num=360,
        value=10260};

get({6,18}) ->
    #group_training_cfg{
        id=6,
        level=18,
        group_level=2,
        num=390,
        value=11935};

get({6,19}) ->
    #group_training_cfg{
        id=6,
        level=19,
        group_level=2,
        num=420,
        value=13766};

get({6,20}) ->
    #group_training_cfg{
        id=6,
        level=20,
        group_level=2,
        num=450,
        value=15755};

get({6,21}) ->
    #group_training_cfg{
        id=6,
        level=21,
        group_level=3,
        num=525,
        value=17908};

get({6,22}) ->
    #group_training_cfg{
        id=6,
        level=22,
        group_level=3,
        num=600,
        value=20229};

get({6,23}) ->
    #group_training_cfg{
        id=6,
        level=23,
        group_level=3,
        num=675,
        value=22721};

get({6,24}) ->
    #group_training_cfg{
        id=6,
        level=24,
        group_level=3,
        num=750,
        value=25389};

get({6,25}) ->
    #group_training_cfg{
        id=6,
        level=25,
        group_level=3,
        num=825,
        value=28238};

get({6,26}) ->
    #group_training_cfg{
        id=6,
        level=26,
        group_level=3,
        num=900,
        value=31270};

get({6,27}) ->
    #group_training_cfg{
        id=6,
        level=27,
        group_level=3,
        num=975,
        value=34489};

get({6,28}) ->
    #group_training_cfg{
        id=6,
        level=28,
        group_level=3,
        num=1050,
        value=37899};

get({6,29}) ->
    #group_training_cfg{
        id=6,
        level=29,
        group_level=3,
        num=1125,
        value=41505};

get({6,30}) ->
    #group_training_cfg{
        id=6,
        level=30,
        group_level=3,
        num=1200,
        value=45309};

get({6,31}) ->
    #group_training_cfg{
        id=6,
        level=31,
        group_level=4,
        num=1350,
        value=49315};

get({6,32}) ->
    #group_training_cfg{
        id=6,
        level=32,
        group_level=4,
        num=1500,
        value=53526};

get({6,33}) ->
    #group_training_cfg{
        id=6,
        level=33,
        group_level=4,
        num=1650,
        value=57946};

get({6,34}) ->
    #group_training_cfg{
        id=6,
        level=34,
        group_level=4,
        num=1800,
        value=62578};

get({6,35}) ->
    #group_training_cfg{
        id=6,
        level=35,
        group_level=4,
        num=1950,
        value=67425};

get({6,36}) ->
    #group_training_cfg{
        id=6,
        level=36,
        group_level=4,
        num=2100,
        value=72491};

get({6,37}) ->
    #group_training_cfg{
        id=6,
        level=37,
        group_level=4,
        num=2250,
        value=77779};

get({6,38}) ->
    #group_training_cfg{
        id=6,
        level=38,
        group_level=4,
        num=2400,
        value=83293};

get({6,39}) ->
    #group_training_cfg{
        id=6,
        level=39,
        group_level=4,
        num=2550,
        value=89034};

get({6,40}) ->
    #group_training_cfg{
        id=6,
        level=40,
        group_level=4,
        num=2700,
        value=95006};

get({6,41}) ->
    #group_training_cfg{
        id=6,
        level=41,
        group_level=5,
        num=3000,
        value=101212};

get({6,42}) ->
    #group_training_cfg{
        id=6,
        level=42,
        group_level=5,
        num=3300,
        value=107656};

get({6,43}) ->
    #group_training_cfg{
        id=6,
        level=43,
        group_level=5,
        num=3600,
        value=114340};

get({6,44}) ->
    #group_training_cfg{
        id=6,
        level=44,
        group_level=5,
        num=3900,
        value=121267};

get({6,45}) ->
    #group_training_cfg{
        id=6,
        level=45,
        group_level=5,
        num=4200,
        value=128439};

get({6,46}) ->
    #group_training_cfg{
        id=6,
        level=46,
        group_level=5,
        num=4500,
        value=135861};

get({6,47}) ->
    #group_training_cfg{
        id=6,
        level=47,
        group_level=5,
        num=4800,
        value=143534};

get({6,48}) ->
    #group_training_cfg{
        id=6,
        level=48,
        group_level=5,
        num=5100,
        value=151461};

get({6,49}) ->
    #group_training_cfg{
        id=6,
        level=49,
        group_level=5,
        num=5400,
        value=159645};

get({6,50}) ->
    #group_training_cfg{
        id=6,
        level=50,
        group_level=5,
        num=5700,
        value=168090};

get({7,1}) ->
    #group_training_cfg{
        id=7,
        level=1,
        group_level=1,
        num=200,
        value=20};

get({7,2}) ->
    #group_training_cfg{
        id=7,
        level=2,
        group_level=1,
        num=400,
        value=30};

get({7,3}) ->
    #group_training_cfg{
        id=7,
        level=3,
        group_level=1,
        num=600,
        value=76};

get({7,4}) ->
    #group_training_cfg{
        id=7,
        level=4,
        group_level=1,
        num=800,
        value=175};

get({7,5}) ->
    #group_training_cfg{
        id=7,
        level=5,
        group_level=1,
        num=1000,
        value=340};

get({7,6}) ->
    #group_training_cfg{
        id=7,
        level=6,
        group_level=1,
        num=1200,
        value=579};

get({7,7}) ->
    #group_training_cfg{
        id=7,
        level=7,
        group_level=1,
        num=1400,
        value=901};

get({7,8}) ->
    #group_training_cfg{
        id=7,
        level=8,
        group_level=1,
        num=1600,
        value=1316};

get({7,9}) ->
    #group_training_cfg{
        id=7,
        level=9,
        group_level=1,
        num=1800,
        value=1830};

get({7,10}) ->
    #group_training_cfg{
        id=7,
        level=10,
        group_level=1,
        num=2000,
        value=2450};

get({7,11}) ->
    #group_training_cfg{
        id=7,
        level=11,
        group_level=2,
        num=2400,
        value=3182};

get({7,12}) ->
    #group_training_cfg{
        id=7,
        level=12,
        group_level=2,
        num=2800,
        value=4033};

get({7,13}) ->
    #group_training_cfg{
        id=7,
        level=13,
        group_level=2,
        num=3200,
        value=5008};

get({7,14}) ->
    #group_training_cfg{
        id=7,
        level=14,
        group_level=2,
        num=3600,
        value=6113};

get({7,15}) ->
    #group_training_cfg{
        id=7,
        level=15,
        group_level=2,
        num=4000,
        value=7353};

get({7,16}) ->
    #group_training_cfg{
        id=7,
        level=16,
        group_level=2,
        num=4400,
        value=8734};

get({7,17}) ->
    #group_training_cfg{
        id=7,
        level=17,
        group_level=2,
        num=4800,
        value=10260};

get({7,18}) ->
    #group_training_cfg{
        id=7,
        level=18,
        group_level=2,
        num=5200,
        value=11935};

get({7,19}) ->
    #group_training_cfg{
        id=7,
        level=19,
        group_level=2,
        num=5600,
        value=13766};

get({7,20}) ->
    #group_training_cfg{
        id=7,
        level=20,
        group_level=2,
        num=6000,
        value=15755};

get({7,21}) ->
    #group_training_cfg{
        id=7,
        level=21,
        group_level=3,
        num=7000,
        value=17908};

get({7,22}) ->
    #group_training_cfg{
        id=7,
        level=22,
        group_level=3,
        num=8000,
        value=20229};

get({7,23}) ->
    #group_training_cfg{
        id=7,
        level=23,
        group_level=3,
        num=9000,
        value=22721};

get({7,24}) ->
    #group_training_cfg{
        id=7,
        level=24,
        group_level=3,
        num=10000,
        value=25389};

get({7,25}) ->
    #group_training_cfg{
        id=7,
        level=25,
        group_level=3,
        num=11000,
        value=28238};

get({7,26}) ->
    #group_training_cfg{
        id=7,
        level=26,
        group_level=3,
        num=12000,
        value=31270};

get({7,27}) ->
    #group_training_cfg{
        id=7,
        level=27,
        group_level=3,
        num=13000,
        value=34489};

get({7,28}) ->
    #group_training_cfg{
        id=7,
        level=28,
        group_level=3,
        num=14000,
        value=37899};

get({7,29}) ->
    #group_training_cfg{
        id=7,
        level=29,
        group_level=3,
        num=15000,
        value=41505};

get({7,30}) ->
    #group_training_cfg{
        id=7,
        level=30,
        group_level=3,
        num=16000,
        value=45309};

get({7,31}) ->
    #group_training_cfg{
        id=7,
        level=31,
        group_level=4,
        num=18000,
        value=49315};

get({7,32}) ->
    #group_training_cfg{
        id=7,
        level=32,
        group_level=4,
        num=20000,
        value=53526};

get({7,33}) ->
    #group_training_cfg{
        id=7,
        level=33,
        group_level=4,
        num=22000,
        value=57946};

get({7,34}) ->
    #group_training_cfg{
        id=7,
        level=34,
        group_level=4,
        num=24000,
        value=62578};

get({7,35}) ->
    #group_training_cfg{
        id=7,
        level=35,
        group_level=4,
        num=26000,
        value=67425};

get({7,36}) ->
    #group_training_cfg{
        id=7,
        level=36,
        group_level=4,
        num=28000,
        value=72491};

get({7,37}) ->
    #group_training_cfg{
        id=7,
        level=37,
        group_level=4,
        num=30000,
        value=77779};

get({7,38}) ->
    #group_training_cfg{
        id=7,
        level=38,
        group_level=4,
        num=32000,
        value=83293};

get({7,39}) ->
    #group_training_cfg{
        id=7,
        level=39,
        group_level=4,
        num=34000,
        value=89034};

get({7,40}) ->
    #group_training_cfg{
        id=7,
        level=40,
        group_level=4,
        num=36000,
        value=95006};

get({7,41}) ->
    #group_training_cfg{
        id=7,
        level=41,
        group_level=5,
        num=40000,
        value=101212};

get({7,42}) ->
    #group_training_cfg{
        id=7,
        level=42,
        group_level=5,
        num=44000,
        value=107656};

get({7,43}) ->
    #group_training_cfg{
        id=7,
        level=43,
        group_level=5,
        num=48000,
        value=114340};

get({7,44}) ->
    #group_training_cfg{
        id=7,
        level=44,
        group_level=5,
        num=52000,
        value=121267};

get({7,45}) ->
    #group_training_cfg{
        id=7,
        level=45,
        group_level=5,
        num=56000,
        value=128439};

get({7,46}) ->
    #group_training_cfg{
        id=7,
        level=46,
        group_level=5,
        num=60000,
        value=135861};

get({7,47}) ->
    #group_training_cfg{
        id=7,
        level=47,
        group_level=5,
        num=64000,
        value=143534};

get({7,48}) ->
    #group_training_cfg{
        id=7,
        level=48,
        group_level=5,
        num=68000,
        value=151461};

get({7,49}) ->
    #group_training_cfg{
        id=7,
        level=49,
        group_level=5,
        num=72000,
        value=159645};

get({7,50}) ->
    #group_training_cfg{
        id=7,
        level=50,
        group_level=5,
        num=76000,
        value=168090};

get(_) -> false.

get_all() ->
    [{3,1},{3,2},{3,3},{3,4},{3,5},{3,6},{3,7},{3,8},{3,9},{3,10},{3,11},{3,12},{3,13},{3,14},{3,15},{3,16},{3,17},{3,18},{3,19},{3,20},{3,21},{3,22},{3,23},{3,24},{3,25},{3,26},{3,27},{3,28},{3,29},{3,30},{3,31},{3,32},{3,33},{3,34},{3,35},{3,36},{3,37},{3,38},{3,39},{3,40},{3,41},{3,42},{3,43},{3,44},{3,45},{3,46},{3,47},{3,48},{3,49},{3,50},{4,1},{4,2},{4,3},{4,4},{4,5},{4,6},{4,7},{4,8},{4,9},{4,10},{4,11},{4,12},{4,13},{4,14},{4,15},{4,16},{4,17},{4,18},{4,19},{4,20},{4,21},{4,22},{4,23},{4,24},{4,25},{4,26},{4,27},{4,28},{4,29},{4,30},{4,31},{4,32},{4,33},{4,34},{4,35},{4,36},{4,37},{4,38},{4,39},{4,40},{4,41},{4,42},{4,43},{4,44},{4,45},{4,46},{4,47},{4,48},{4,49},{4,50},{5,1},{5,2},{5,3},{5,4},{5,5},{5,6},{5,7},{5,8},{5,9},{5,10},{5,11},{5,12},{5,13},{5,14},{5,15},{5,16},{5,17},{5,18},{5,19},{5,20},{5,21},{5,22},{5,23},{5,24},{5,25},{5,26},{5,27},{5,28},{5,29},{5,30},{5,31},{5,32},{5,33},{5,34},{5,35},{5,36},{5,37},{5,38},{5,39},{5,40},{5,41},{5,42},{5,43},{5,44},{5,45},{5,46},{5,47},{5,48},{5,49},{5,50},{6,1},{6,2},{6,3},{6,4},{6,5},{6,6},{6,7},{6,8},{6,9},{6,10},{6,11},{6,12},{6,13},{6,14},{6,15},{6,16},{6,17},{6,18},{6,19},{6,20},{6,21},{6,22},{6,23},{6,24},{6,25},{6,26},{6,27},{6,28},{6,29},{6,30},{6,31},{6,32},{6,33},{6,34},{6,35},{6,36},{6,37},{6,38},{6,39},{6,40},{6,41},{6,42},{6,43},{6,44},{6,45},{6,46},{6,47},{6,48},{6,49},{6,50},{7,1},{7,2},{7,3},{7,4},{7,5},{7,6},{7,7},{7,8},{7,9},{7,10},{7,11},{7,12},{7,13},{7,14},{7,15},{7,16},{7,17},{7,18},{7,19},{7,20},{7,21},{7,22},{7,23},{7,24},{7,25},{7,26},{7,27},{7,28},{7,29},{7,30},{7,31},{7,32},{7,33},{7,34},{7,35},{7,36},{7,37},{7,38},{7,39},{7,40},{7,41},{7,42},{7,43},{7,44},{7,45},{7,46},{7,47},{7,48},{7,49},{7,50}].

