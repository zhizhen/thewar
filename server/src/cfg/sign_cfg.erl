-module(sign_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #sign_cfg{
        day=1,
        general_awards=["4-50000"],
        vip_awards=["4-100000"],
        request_charge=10};

get(2) ->
    #sign_cfg{
        day=2,
        general_awards=["9-2000"],
        vip_awards=["6-20"],
        request_charge=10};

get(3) ->
    #sign_cfg{
        day=3,
        general_awards=["77115-1"],
        vip_awards=["77115-1"],
        request_charge=10};

get(4) ->
    #sign_cfg{
        day=4,
        general_awards=["5-20"],
        vip_awards=["77069-1"],
        request_charge=10};

get(5) ->
    #sign_cfg{
        day=5,
        general_awards=["4-100000"],
        vip_awards=["4-150000"],
        request_charge=10};

get(6) ->
    #sign_cfg{
        day=6,
        general_awards=["77065-1"],
        vip_awards=["6-30"],
        request_charge=10};

get(7) ->
    #sign_cfg{
        day=7,
        general_awards=["77115-1"],
        vip_awards=["77115-1"],
        request_charge=10};

get(8) ->
    #sign_cfg{
        day=8,
        general_awards=["5-20"],
        vip_awards=["77069-1"],
        request_charge=10};

get(9) ->
    #sign_cfg{
        day=9,
        general_awards=["4-150000"],
        vip_awards=["4-200000"],
        request_charge=10};

get(10) ->
    #sign_cfg{
        day=10,
        general_awards=["9-3000"],
        vip_awards=["6-40"],
        request_charge=10};

get(11) ->
    #sign_cfg{
        day=11,
        general_awards=["77115-1"],
        vip_awards=["77115-1"],
        request_charge=10};

get(12) ->
    #sign_cfg{
        day=12,
        general_awards=["5-30"],
        vip_awards=["77070-1"],
        request_charge=10};

get(13) ->
    #sign_cfg{
        day=13,
        general_awards=["4-200000"],
        vip_awards=["4-300000"],
        request_charge=10};

get(14) ->
    #sign_cfg{
        day=14,
        general_awards=["77065-2"],
        vip_awards=["6-50"],
        request_charge=10};

get(15) ->
    #sign_cfg{
        day=15,
        general_awards=["77115-1"],
        vip_awards=["77115-1"],
        request_charge=10};

get(16) ->
    #sign_cfg{
        day=16,
        general_awards=["5-30"],
        vip_awards=["77070-1"],
        request_charge=10};

get(17) ->
    #sign_cfg{
        day=17,
        general_awards=["4-300000"],
        vip_awards=["4-500000"],
        request_charge=10};

get(18) ->
    #sign_cfg{
        day=18,
        general_awards=["77065-3"],
        vip_awards=["6-100"],
        request_charge=10};

get(19) ->
    #sign_cfg{
        day=19,
        general_awards=["77115-1"],
        vip_awards=["77115-1"],
        request_charge=10};

get(20) ->
    #sign_cfg{
        day=20,
        general_awards=["9-5000"],
        vip_awards=["77070-2"],
        request_charge=10};

get(_) -> false.


