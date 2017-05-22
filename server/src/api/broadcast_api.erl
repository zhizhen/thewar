%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-10-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(broadcast_api).

-include_lib("stdlib/include/ms_transform.hrl").

-include("table_record.hrl").
-include("table_etc.hrl").
-include("logger.hrl").
-include("common.hrl").
-include("cfg_record.hrl").

%% API
-export([scene/2, server/1, server/2, group/2, give_sender/2]).

-export([get_item/1, get_exp/1, get_gold/1]).

%%%===================================================================
%%% API
%%%===================================================================
scene(SceneId, Msg) ->
    RoleIds = ets:select(?ETS_ONLINE_PLAYER,
        ets:fun2ms(fun(#online{role=#role{role_id=URoleId, scene_id=USceneId}}) when USceneId == SceneId ->
                    URoleId
                   end)),
    [give_sender(RoleId, Msg)  || RoleId <- RoleIds].

server(Msg, Exclude) ->
    ets:foldl(
        fun(#role_conn{sender=Sender}, _) ->
            if Sender == Exclude -> ok; true -> Sender ! {send, Msg} end
        end, 0, role_conn).

server(Msg) ->
    ets:foldl(
        fun(#role_conn{sender=Sender}, _) ->
            Sender ! {send, Msg}
        end, 0, role_conn).

group(G, Msg) ->
    [give_sender(RoleId, Msg) || #group_state{role_id=RoleId, state=?G_NORMAL} <- G].

%% give_sender(Msg, Sender) ->
%%     Sender ! {send, Msg}.

give_sender(RoleId, M) ->
    case goddess_misc:get_role_pid(RoleId) of
        false -> false;
        Pid -> Pid ! {send, M}
    end.

%%%===================================================================
%%%  functions
%%%===================================================================
show(Where, Msg) ->
    case Where of
        1 ->
            server(Msg);
        2 ->
            #game_info{role=Role} = role_api:get_user_data(),
            scene(Role#role.scene_id, Msg)
    end.

%% @doc e.g 获得金币
get_gold(Num) ->
    CfgId = 1,
    Cfg = broadcast_cfg:get(CfgId),
    TmpId = Cfg#broadcast_cfg.tmpid,
    case Num >= Cfg#broadcast_cfg.con1 of
        false -> ok;
        true ->
            Default = chat_api:chat_content_template(),
            Content = Default#chat_content{
                gold = Num
            },
            M = chat_mod:make_show_msg(TmpId, Content),
            show(Cfg#broadcast_cfg.channel, M)
    end.

get_exp(Num) ->
    CfgId = 2,
    Cfg = broadcast_cfg:get(CfgId),
    TmpId = Cfg#broadcast_cfg.tmpid,
    case Num >= Cfg#broadcast_cfg.con1 of
        false -> ok;
        true ->
            Default = chat_api:chat_content_template(),
            Content = Default#chat_content{
                exp = Num
            },
            M = chat_mod:make_show_msg(TmpId, Content),
            show(Cfg#broadcast_cfg.channel, M)
    end.

get_item(#item{id=Id, item_id=ItemId}) ->
    CfgId = 3,
    Cfg = broadcast_cfg:get(CfgId),
    TmpId = Cfg#broadcast_cfg.tmpid,
    case lists:member(ItemId, Cfg#broadcast_cfg.con2) of
        false -> ok;
        true ->
            Default = chat_api:chat_content_template(),
            Content = Default#chat_content{
                    item = #chat_item{item_id=ItemId, id=Id}
            },
            M = chat_mod:make_show_msg(TmpId, Content),
            show(Cfg#broadcast_cfg.channel, M)
    end.

