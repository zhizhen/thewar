%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-4-17 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(package_tests).
-include_lib("eunit/include/eunit.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("game_pb.hrl").
-include("msg_code.hrl").

-export([test_package/0]).

test_package() ->
    % -------------------------------------------------------------------------
    %  data struct
    %  ------------------------------------------------------------------------
    RoleId = "unit_test", 
    Item1 = #item{
        id = 1, 
        role_id = RoleId,
        item_id = 72000,                              %% 物品模板id
        level = 0,                                %% 强化等级
        num = 0,                                  %% 数量
        slot = 2,                                 %% 位置
        created_at = 0,                           %% 出现时间
        state = 1,                                %% 物品状态已使用,未使用,
        quality = 1,                              %% 品质
        slots = [1, 0, 0],                                %% 第一个孔 1代表已打孔 宝石id
        rune = 0
    },
    Item2 = #item{
        id = 2, 
        role_id = RoleId,
        item_id = 70000,                              %% 物品模板id
        level = 0,                                %% 强化等级
        num = 0,                                  %% 数量
        slot = 3,                                 %% 位置
        created_at = 0,                           %% 出现时间
        state = 1,                                %% 物品状态已使用,未使用,
        quality = 1,                              %% 品质
        slots = [1, 0, 0],                                %% 第一个孔 1代表已打孔 宝石id
        rune = 0
    },
    Items = [Item1, Item2],
    NullSlots = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    Item = #items{all=Items},
    Package = #package{
        role_id = RoleId,
        slots = NullSlots
    },
    GameInfo = #game_info{package = Package, item = Item},
    % -------------------------------------------------------------------------
    %  package_mod:sort_package
    %  ------------------------------------------------------------------------
    
    S_R = package_mod:sort_package(Package, Item),
    S_I1 = Item1#item{slot = 2},
    S_I2 = Item2#item{slot = 1},
    S_Is = [S_I1, S_I2],
    S_E = #items{all = S_Is},

    %?DEBUG_MSG("S_E:~p~n", [S_E]),
    %?DEBUG_MSG("S_R:~p~n", [S_R]),
    ?assertEqual(S_E, S_R),


    ok.

