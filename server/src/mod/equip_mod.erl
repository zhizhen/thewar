%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(equip_mod).
-include("table_etc.hrl").
-include("table_record.hrl").

%% API
-export([build_p_equip/1]).

%%%===================================================================
%%% API
%%%===================================================================


build_p_equip(Equip) ->
    erlang:setelement(1, Equip, p_equip).


%%%===================================================================
%%% Internal functions
%%%===================================================================
