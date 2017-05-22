-module(group_mall_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({1,72002}) ->
    #group_mall_cfg{
        guildlevel=1,
        itemid=72002,
        value=1800,
        count=3};

get({1,72012}) ->
    #group_mall_cfg{
        guildlevel=1,
        itemid=72012,
        value=1800,
        count=3};

get({2,72002}) ->
    #group_mall_cfg{
        guildlevel=2,
        itemid=72002,
        value=1800,
        count=6};

get({2,72012}) ->
    #group_mall_cfg{
        guildlevel=2,
        itemid=72012,
        value=1800,
        count=6};

get({2,72022}) ->
    #group_mall_cfg{
        guildlevel=2,
        itemid=72022,
        value=1800,
        count=6};

get({2,72032}) ->
    #group_mall_cfg{
        guildlevel=2,
        itemid=72032,
        value=1800,
        count=6};

get({3,72002}) ->
    #group_mall_cfg{
        guildlevel=3,
        itemid=72002,
        value=1800,
        count=10};

get({3,72012}) ->
    #group_mall_cfg{
        guildlevel=3,
        itemid=72012,
        value=1800,
        count=10};

get({3,72022}) ->
    #group_mall_cfg{
        guildlevel=3,
        itemid=72022,
        value=1800,
        count=10};

get({3,72032}) ->
    #group_mall_cfg{
        guildlevel=3,
        itemid=72032,
        value=1800,
        count=10};

get({3,72042}) ->
    #group_mall_cfg{
        guildlevel=3,
        itemid=72042,
        value=1800,
        count=10};

get({4,72002}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72002,
        value=1800,
        count=15};

get({4,72012}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72012,
        value=1800,
        count=15};

get({4,72022}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72022,
        value=1800,
        count=15};

get({4,72032}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72032,
        value=1800,
        count=15};

get({4,72042}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72042,
        value=1800,
        count=15};

get({4,72052}) ->
    #group_mall_cfg{
        guildlevel=4,
        itemid=72052,
        value=1800,
        count=15};

get({5,72002}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72002,
        value=1800,
        count=20};

get({5,72012}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72012,
        value=1800,
        count=20};

get({5,72022}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72022,
        value=1800,
        count=20};

get({5,72032}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72032,
        value=1800,
        count=20};

get({5,72042}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72042,
        value=1800,
        count=20};

get({5,72052}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72052,
        value=1800,
        count=20};

get({5,72062}) ->
    #group_mall_cfg{
        guildlevel=5,
        itemid=72062,
        value=1800,
        count=20};

get(_) -> false.


