-module(charm_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({1,1}) ->
    #charm_cfg{
        object=1,
        num=1,
        self_charm=1,
        charm=1,
        gold=88888,
        coin=0};

get({1,9}) ->
    #charm_cfg{
        object=1,
        num=9,
        self_charm=9,
        charm=9,
        gold=0,
        coin=66};

get({1,99}) ->
    #charm_cfg{
        object=1,
        num=99,
        self_charm=99,
        charm=99,
        gold=0,
        coin=666};

get({2,1}) ->
    #charm_cfg{
        object=2,
        num=1,
        self_charm=1,
        charm=-1,
        gold=88888,
        coin=0};

get({2,9}) ->
    #charm_cfg{
        object=2,
        num=9,
        self_charm=9,
        charm=-9,
        gold=0,
        coin=66};

get({2,99}) ->
    #charm_cfg{
        object=2,
        num=99,
        self_charm=99,
        charm=-99,
        gold=0,
        coin=666};

get(_) -> false.


