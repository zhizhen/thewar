%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------

-define(OVERLEAP_BUFF_ID, 1).

-define(OVERLEAP_TIME(VIP, MISSION_TYPE),
    case MISSION_TYPE of
        1 ->
            if
                VIP < 1 -> 30;
                VIP >= 1 -> 0;
                true -> 600
            end;
        2 ->
            if
                VIP =< 4 -> 180;
                VIP > 4 -> 0;
                true -> 600
            end;
        3 ->
            if
                VIP =< 6 -> 300;
                VIP > 6 -> 0;
                true -> 600
            end
    end
).