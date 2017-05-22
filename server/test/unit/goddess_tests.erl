%%%-------------------------------------------------------------------
%%% @author godness <godness@rekoo.com>
%%% @copyright (C) 2013, godness.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by godness <godness@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_tests).
-include_lib("eunit/include/eunit.hrl").

main_test() ->
    goddess_app:start(),
    package_tests:test_package(),
    shop_tests:test_shop(),
    ok.
