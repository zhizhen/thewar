-module(chat_template_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(1) ->
    #chat_template_cfg{
        id=1,
        keys=[2, 1, 10]};

get(2) ->
    #chat_template_cfg{
        id=2,
        keys=[4]};

get(3) ->
    #chat_template_cfg{
        id=3,
        keys=[2, 1]};

get(4) ->
    #chat_template_cfg{
        id=4,
        keys=[2, 3, 7, 4]};

get(5) ->
    #chat_template_cfg{
        id=5,
        keys=[2, 1]};

get(6) ->
    #chat_template_cfg{
        id=6,
        keys=[2, 16]};

get(7) ->
    #chat_template_cfg{
        id=7,
        keys=[1]};

get(8) ->
    #chat_template_cfg{
        id=8,
        keys=[2, 5]};

get(9) ->
    #chat_template_cfg{
        id=9,
        keys=[2, 9]};

get(10) ->
    #chat_template_cfg{
        id=10,
        keys=[2, 4]};

get(11) ->
    #chat_template_cfg{
        id=11,
        keys=[2, 13, 11]};

get(12) ->
    #chat_template_cfg{
        id=12,
        keys=[2, 13, 17]};

get(13) ->
    #chat_template_cfg{
        id=13,
        keys=[2, 4, 11]};

get(14) ->
    #chat_template_cfg{
        id=14,
        keys=[1]};

get(15) ->
    #chat_template_cfg{
        id=15,
        keys=[2, 4, 11]};

get(16) ->
    #chat_template_cfg{
        id=16,
        keys=[2, 4]};

get(17) ->
    #chat_template_cfg{
        id=17,
        keys=[2, 4]};

get(18) ->
    #chat_template_cfg{
        id=18,
        keys=[2, 13]};

get(19) ->
    #chat_template_cfg{
        id=19,
        keys=[2, 6]};

get(20) ->
    #chat_template_cfg{
        id=20,
        keys=[2, 1]};

get(21) ->
    #chat_template_cfg{
        id=21,
        keys=[2, 1]};

get(22) ->
    #chat_template_cfg{
        id=22,
        keys=[2, 1]};

get(23) ->
    #chat_template_cfg{
        id=23,
        keys=[2, 14]};

get(25) ->
    #chat_template_cfg{
        id=25,
        keys=[2]};

get(26) ->
    #chat_template_cfg{
        id=26,
        keys=[2, 15]};

get(27) ->
    #chat_template_cfg{
        id=27,
        keys=[2]};

get(28) ->
    #chat_template_cfg{
        id=28,
        keys=[2]};

get(29) ->
    #chat_template_cfg{
        id=29,
        keys=[2, 13]};

get(_) -> false.


