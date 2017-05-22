-module(spirit_level_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({2,0}) ->
    #spirit_level_cfg{
        quality=2,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({2,240}) ->
    #spirit_level_cfg{
        quality=2,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=240};

get({2,480}) ->
    #spirit_level_cfg{
        quality=2,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=480};

get({2,960}) ->
    #spirit_level_cfg{
        quality=2,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=960};

get({2,1920}) ->
    #spirit_level_cfg{
        quality=2,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=1920};

get({2,3840}) ->
    #spirit_level_cfg{
        quality=2,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=3840};

get({2,7680}) ->
    #spirit_level_cfg{
        quality=2,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=7680};

get({2,15360}) ->
    #spirit_level_cfg{
        quality=2,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=15360};

get({2,30720}) ->
    #spirit_level_cfg{
        quality=2,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=30720};

get({2,61440}) ->
    #spirit_level_cfg{
        quality=2,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=61440};

get({2,122880}) ->
    #spirit_level_cfg{
        quality=2,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=122880};

get({2,245760}) ->
    #spirit_level_cfg{
        quality=2,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=245760};

get({2,491520}) ->
    #spirit_level_cfg{
        quality=2,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=491520};

get({2,983040}) ->
    #spirit_level_cfg{
        quality=2,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=983040};

get({2,1966080}) ->
    #spirit_level_cfg{
        quality=2,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=1966080};

get({2,3932160}) ->
    #spirit_level_cfg{
        quality=2,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=3932160};

get({2,7864320}) ->
    #spirit_level_cfg{
        quality=2,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=7864320};

get({2,15728640}) ->
    #spirit_level_cfg{
        quality=2,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=15728640};

get({2,31457280}) ->
    #spirit_level_cfg{
        quality=2,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=31457280};

get({2,62914560}) ->
    #spirit_level_cfg{
        quality=2,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=62914560};

get({3,0}) ->
    #spirit_level_cfg{
        quality=3,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({3,480}) ->
    #spirit_level_cfg{
        quality=3,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=480};

get({3,960}) ->
    #spirit_level_cfg{
        quality=3,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=960};

get({3,1920}) ->
    #spirit_level_cfg{
        quality=3,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=1920};

get({3,3840}) ->
    #spirit_level_cfg{
        quality=3,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=3840};

get({3,7680}) ->
    #spirit_level_cfg{
        quality=3,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=7680};

get({3,15360}) ->
    #spirit_level_cfg{
        quality=3,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=15360};

get({3,30720}) ->
    #spirit_level_cfg{
        quality=3,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=30720};

get({3,61440}) ->
    #spirit_level_cfg{
        quality=3,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=61440};

get({3,122880}) ->
    #spirit_level_cfg{
        quality=3,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=122880};

get({3,245760}) ->
    #spirit_level_cfg{
        quality=3,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=245760};

get({3,491520}) ->
    #spirit_level_cfg{
        quality=3,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=491520};

get({3,983040}) ->
    #spirit_level_cfg{
        quality=3,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=983040};

get({3,1966080}) ->
    #spirit_level_cfg{
        quality=3,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=1966080};

get({3,3932160}) ->
    #spirit_level_cfg{
        quality=3,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=3932160};

get({3,7864320}) ->
    #spirit_level_cfg{
        quality=3,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=7864320};

get({3,15728640}) ->
    #spirit_level_cfg{
        quality=3,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=15728640};

get({3,31457280}) ->
    #spirit_level_cfg{
        quality=3,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=31457280};

get({3,62914560}) ->
    #spirit_level_cfg{
        quality=3,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=62914560};

get({3,125829120}) ->
    #spirit_level_cfg{
        quality=3,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=125829120};

get({4,0}) ->
    #spirit_level_cfg{
        quality=4,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({4,960}) ->
    #spirit_level_cfg{
        quality=4,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=960};

get({4,1920}) ->
    #spirit_level_cfg{
        quality=4,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=1920};

get({4,3840}) ->
    #spirit_level_cfg{
        quality=4,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=3840};

get({4,7680}) ->
    #spirit_level_cfg{
        quality=4,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=7680};

get({4,15360}) ->
    #spirit_level_cfg{
        quality=4,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=15360};

get({4,30720}) ->
    #spirit_level_cfg{
        quality=4,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=30720};

get({4,61440}) ->
    #spirit_level_cfg{
        quality=4,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=61440};

get({4,122880}) ->
    #spirit_level_cfg{
        quality=4,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=122880};

get({4,245760}) ->
    #spirit_level_cfg{
        quality=4,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=245760};

get({4,491520}) ->
    #spirit_level_cfg{
        quality=4,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=491520};

get({4,983040}) ->
    #spirit_level_cfg{
        quality=4,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=983040};

get({4,1966080}) ->
    #spirit_level_cfg{
        quality=4,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=1966080};

get({4,3932160}) ->
    #spirit_level_cfg{
        quality=4,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=3932160};

get({4,7864320}) ->
    #spirit_level_cfg{
        quality=4,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=7864320};

get({4,15728640}) ->
    #spirit_level_cfg{
        quality=4,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=15728640};

get({4,31457280}) ->
    #spirit_level_cfg{
        quality=4,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=31457280};

get({4,62914560}) ->
    #spirit_level_cfg{
        quality=4,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=62914560};

get({4,125829120}) ->
    #spirit_level_cfg{
        quality=4,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=125829120};

get({4,251658240}) ->
    #spirit_level_cfg{
        quality=4,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=251658240};

get({5,0}) ->
    #spirit_level_cfg{
        quality=5,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({5,1920}) ->
    #spirit_level_cfg{
        quality=5,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=1920};

get({5,3840}) ->
    #spirit_level_cfg{
        quality=5,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=3840};

get({5,7680}) ->
    #spirit_level_cfg{
        quality=5,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=7680};

get({5,15360}) ->
    #spirit_level_cfg{
        quality=5,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=15360};

get({5,30720}) ->
    #spirit_level_cfg{
        quality=5,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=30720};

get({5,61440}) ->
    #spirit_level_cfg{
        quality=5,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=61440};

get({5,122880}) ->
    #spirit_level_cfg{
        quality=5,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=122880};

get({5,245760}) ->
    #spirit_level_cfg{
        quality=5,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=245760};

get({5,491520}) ->
    #spirit_level_cfg{
        quality=5,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=491520};

get({5,983040}) ->
    #spirit_level_cfg{
        quality=5,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=983040};

get({5,1966080}) ->
    #spirit_level_cfg{
        quality=5,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=1966080};

get({5,3932160}) ->
    #spirit_level_cfg{
        quality=5,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=3932160};

get({5,7864320}) ->
    #spirit_level_cfg{
        quality=5,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=7864320};

get({5,15728640}) ->
    #spirit_level_cfg{
        quality=5,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=15728640};

get({5,31457280}) ->
    #spirit_level_cfg{
        quality=5,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=31457280};

get({5,62914560}) ->
    #spirit_level_cfg{
        quality=5,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=62914560};

get({5,125829120}) ->
    #spirit_level_cfg{
        quality=5,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=125829120};

get({5,251658240}) ->
    #spirit_level_cfg{
        quality=5,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=251658240};

get({5,503316480}) ->
    #spirit_level_cfg{
        quality=5,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=503316480};

get({6,0}) ->
    #spirit_level_cfg{
        quality=6,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({6,7680}) ->
    #spirit_level_cfg{
        quality=6,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=7680};

get({6,15360}) ->
    #spirit_level_cfg{
        quality=6,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=15360};

get({6,30720}) ->
    #spirit_level_cfg{
        quality=6,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=30720};

get({6,61440}) ->
    #spirit_level_cfg{
        quality=6,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=61440};

get({6,122880}) ->
    #spirit_level_cfg{
        quality=6,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=122880};

get({6,245760}) ->
    #spirit_level_cfg{
        quality=6,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=245760};

get({6,491520}) ->
    #spirit_level_cfg{
        quality=6,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=491520};

get({6,983040}) ->
    #spirit_level_cfg{
        quality=6,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=983040};

get({6,1966080}) ->
    #spirit_level_cfg{
        quality=6,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=1966080};

get({6,3932160}) ->
    #spirit_level_cfg{
        quality=6,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=3932160};

get({6,7864320}) ->
    #spirit_level_cfg{
        quality=6,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=7864320};

get({6,15728640}) ->
    #spirit_level_cfg{
        quality=6,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=15728640};

get({6,31457280}) ->
    #spirit_level_cfg{
        quality=6,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=31457280};

get({6,62914560}) ->
    #spirit_level_cfg{
        quality=6,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=62914560};

get({6,125829120}) ->
    #spirit_level_cfg{
        quality=6,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=125829120};

get({6,251658240}) ->
    #spirit_level_cfg{
        quality=6,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=251658240};

get({6,503316480}) ->
    #spirit_level_cfg{
        quality=6,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=503316480};

get({6,1006632960}) ->
    #spirit_level_cfg{
        quality=6,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=1006632960};

get({6,2013265920}) ->
    #spirit_level_cfg{
        quality=6,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=2013265920};

get({7,0}) ->
    #spirit_level_cfg{
        quality=7,
        level=1,
        attr1ratio=1,
        attr1num=0,
        attr2ratio=1,
        attr2num=0,
        exp=0};

get({7,30720}) ->
    #spirit_level_cfg{
        quality=7,
        level=2,
        attr1ratio=2,
        attr1num=0,
        attr2ratio=2,
        attr2num=0,
        exp=30720};

get({7,61440}) ->
    #spirit_level_cfg{
        quality=7,
        level=3,
        attr1ratio=3,
        attr1num=0,
        attr2ratio=3,
        attr2num=0,
        exp=61440};

get({7,122880}) ->
    #spirit_level_cfg{
        quality=7,
        level=4,
        attr1ratio=4,
        attr1num=0,
        attr2ratio=4,
        attr2num=0,
        exp=122880};

get({7,245760}) ->
    #spirit_level_cfg{
        quality=7,
        level=5,
        attr1ratio=5,
        attr1num=0,
        attr2ratio=5,
        attr2num=0,
        exp=245760};

get({7,491520}) ->
    #spirit_level_cfg{
        quality=7,
        level=6,
        attr1ratio=6,
        attr1num=0,
        attr2ratio=6,
        attr2num=0,
        exp=491520};

get({7,983040}) ->
    #spirit_level_cfg{
        quality=7,
        level=7,
        attr1ratio=7,
        attr1num=0,
        attr2ratio=7,
        attr2num=0,
        exp=983040};

get({7,1966080}) ->
    #spirit_level_cfg{
        quality=7,
        level=8,
        attr1ratio=8,
        attr1num=0,
        attr2ratio=8,
        attr2num=0,
        exp=1966080};

get({7,3932160}) ->
    #spirit_level_cfg{
        quality=7,
        level=9,
        attr1ratio=9,
        attr1num=0,
        attr2ratio=9,
        attr2num=0,
        exp=3932160};

get({7,7864320}) ->
    #spirit_level_cfg{
        quality=7,
        level=10,
        attr1ratio=10,
        attr1num=0,
        attr2ratio=10,
        attr2num=0,
        exp=7864320};

get({7,15728640}) ->
    #spirit_level_cfg{
        quality=7,
        level=11,
        attr1ratio=11,
        attr1num=0,
        attr2ratio=11,
        attr2num=0,
        exp=15728640};

get({7,31457280}) ->
    #spirit_level_cfg{
        quality=7,
        level=12,
        attr1ratio=12,
        attr1num=0,
        attr2ratio=12,
        attr2num=0,
        exp=31457280};

get({7,62914560}) ->
    #spirit_level_cfg{
        quality=7,
        level=13,
        attr1ratio=13,
        attr1num=0,
        attr2ratio=13,
        attr2num=0,
        exp=62914560};

get({7,125829120}) ->
    #spirit_level_cfg{
        quality=7,
        level=14,
        attr1ratio=14,
        attr1num=0,
        attr2ratio=14,
        attr2num=0,
        exp=125829120};

get({7,251658240}) ->
    #spirit_level_cfg{
        quality=7,
        level=15,
        attr1ratio=15,
        attr1num=0,
        attr2ratio=15,
        attr2num=0,
        exp=251658240};

get({7,503316480}) ->
    #spirit_level_cfg{
        quality=7,
        level=16,
        attr1ratio=16,
        attr1num=0,
        attr2ratio=16,
        attr2num=0,
        exp=503316480};

get({7,1006632960}) ->
    #spirit_level_cfg{
        quality=7,
        level=17,
        attr1ratio=17,
        attr1num=0,
        attr2ratio=17,
        attr2num=0,
        exp=1006632960};

get({7,2013265920}) ->
    #spirit_level_cfg{
        quality=7,
        level=18,
        attr1ratio=18,
        attr1num=0,
        attr2ratio=18,
        attr2num=0,
        exp=2013265920};

get({7,4026531840}) ->
    #spirit_level_cfg{
        quality=7,
        level=19,
        attr1ratio=19,
        attr1num=0,
        attr2ratio=19,
        attr2num=0,
        exp=4026531840};

get({7,8053063680}) ->
    #spirit_level_cfg{
        quality=7,
        level=20,
        attr1ratio=20,
        attr1num=0,
        attr2ratio=20,
        attr2num=0,
        exp=8053063680};

get(_) -> false.

get_all() ->
    [{2,0},{2,240},{2,480},{2,960},{2,1920},{2,3840},{2,7680},{2,15360},{2,30720},{2,61440},{2,122880},{2,245760},{2,491520},{2,983040},{2,1966080},{2,3932160},{2,7864320},{2,15728640},{2,31457280},{2,62914560},{3,0},{3,480},{3,960},{3,1920},{3,3840},{3,7680},{3,15360},{3,30720},{3,61440},{3,122880},{3,245760},{3,491520},{3,983040},{3,1966080},{3,3932160},{3,7864320},{3,15728640},{3,31457280},{3,62914560},{3,125829120},{4,0},{4,960},{4,1920},{4,3840},{4,7680},{4,15360},{4,30720},{4,61440},{4,122880},{4,245760},{4,491520},{4,983040},{4,1966080},{4,3932160},{4,7864320},{4,15728640},{4,31457280},{4,62914560},{4,125829120},{4,251658240},{5,0},{5,1920},{5,3840},{5,7680},{5,15360},{5,30720},{5,61440},{5,122880},{5,245760},{5,491520},{5,983040},{5,1966080},{5,3932160},{5,7864320},{5,15728640},{5,31457280},{5,62914560},{5,125829120},{5,251658240},{5,503316480},{6,0},{6,7680},{6,15360},{6,30720},{6,61440},{6,122880},{6,245760},{6,491520},{6,983040},{6,1966080},{6,3932160},{6,7864320},{6,15728640},{6,31457280},{6,62914560},{6,125829120},{6,251658240},{6,503316480},{6,1006632960},{6,2013265920},{7,0},{7,30720},{7,61440},{7,122880},{7,245760},{7,491520},{7,983040},{7,1966080},{7,3932160},{7,7864320},{7,15728640},{7,31457280},{7,62914560},{7,125829120},{7,251658240},{7,503316480},{7,1006632960},{7,2013265920},{7,4026531840},{7,8053063680}].

