-module(warrior_rand_cfg).
-include("cfg_record.hrl").
-export([get/1]).
-export([get_all/0]).

get({130001,100}) ->
    #warrior_rand_cfg{
        id=130001,
        chance=100};

get({130007,100}) ->
    #warrior_rand_cfg{
        id=130007,
        chance=100};

get({130013,100}) ->
    #warrior_rand_cfg{
        id=130013,
        chance=100};

get({130019,100}) ->
    #warrior_rand_cfg{
        id=130019,
        chance=100};

get({130025,100}) ->
    #warrior_rand_cfg{
        id=130025,
        chance=100};

get({130031,100}) ->
    #warrior_rand_cfg{
        id=130031,
        chance=100};

get({130037,100}) ->
    #warrior_rand_cfg{
        id=130037,
        chance=100};

get({130043,100}) ->
    #warrior_rand_cfg{
        id=130043,
        chance=100};

get({130049,100}) ->
    #warrior_rand_cfg{
        id=130049,
        chance=100};

get({130055,100}) ->
    #warrior_rand_cfg{
        id=130055,
        chance=100};

get({130061,100}) ->
    #warrior_rand_cfg{
        id=130061,
        chance=100};

get({130067,100}) ->
    #warrior_rand_cfg{
        id=130067,
        chance=100};

get({130073,100}) ->
    #warrior_rand_cfg{
        id=130073,
        chance=100};

get({130079,100}) ->
    #warrior_rand_cfg{
        id=130079,
        chance=100};

get({130085,100}) ->
    #warrior_rand_cfg{
        id=130085,
        chance=100};

get({130091,100}) ->
    #warrior_rand_cfg{
        id=130091,
        chance=100};

get({130097,100}) ->
    #warrior_rand_cfg{
        id=130097,
        chance=100};

get({130103,100}) ->
    #warrior_rand_cfg{
        id=130103,
        chance=100};

get({130002,50}) ->
    #warrior_rand_cfg{
        id=130002,
        chance=50};

get({130008,50}) ->
    #warrior_rand_cfg{
        id=130008,
        chance=50};

get({130014,50}) ->
    #warrior_rand_cfg{
        id=130014,
        chance=50};

get({130020,50}) ->
    #warrior_rand_cfg{
        id=130020,
        chance=50};

get({130026,50}) ->
    #warrior_rand_cfg{
        id=130026,
        chance=50};

get({130032,50}) ->
    #warrior_rand_cfg{
        id=130032,
        chance=50};

get({130038,50}) ->
    #warrior_rand_cfg{
        id=130038,
        chance=50};

get({130044,50}) ->
    #warrior_rand_cfg{
        id=130044,
        chance=50};

get({130003,30}) ->
    #warrior_rand_cfg{
        id=130003,
        chance=30};

get({130009,30}) ->
    #warrior_rand_cfg{
        id=130009,
        chance=30};

get({130015,30}) ->
    #warrior_rand_cfg{
        id=130015,
        chance=30};

get({130021,30}) ->
    #warrior_rand_cfg{
        id=130021,
        chance=30};

get({130027,30}) ->
    #warrior_rand_cfg{
        id=130027,
        chance=30};

get({130004,10}) ->
    #warrior_rand_cfg{
        id=130004,
        chance=10};

get({130010,10}) ->
    #warrior_rand_cfg{
        id=130010,
        chance=10};

get({130016,10}) ->
    #warrior_rand_cfg{
        id=130016,
        chance=10};

get({130022,10}) ->
    #warrior_rand_cfg{
        id=130022,
        chance=10};

get({130028,10}) ->
    #warrior_rand_cfg{
        id=130028,
        chance=10};

get(_) -> false.

get_all() ->
    [{130001,100},{130007,100},{130013,100},{130019,100},{130025,100},{130031,100},{130037,100},{130043,100},{130049,100},{130055,100},{130061,100},{130067,100},{130073,100},{130079,100},{130085,100},{130091,100},{130097,100},{130103,100},{130002,50},{130008,50},{130014,50},{130020,50},{130026,50},{130032,50},{130038,50},{130044,50},{130003,30},{130009,30},{130015,30},{130021,30},{130027,30},{130004,10},{130010,10},{130016,10},{130022,10},{130028,10}].

