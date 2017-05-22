%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2015, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2015-02-09 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(title_db).

-include("common.hrl").
-include("logger.hrl").
-include("table_record.hrl").
-include("cfg_record.hrl").
-include("table_etc.hrl").

%% API
-export([get/1, get_by_id/2, add/1, update/1, save/1]).

get(RoleId) ->
    Template = <<"select * from titles where role_id=~p">>,
    Params = [RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_titles_data(Rows).

get_by_id(TitleId, RoleId) ->
    Template = <<"SELECT * FROM titles WHERE title_id=~p and role_id = ~p">>,
    Params = [TitleId, RoleId],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_title_data(Row).

add(Title) ->
    Query = ?FILTER_SQL(?update_title_sql, ?TAIL(Title)),
    mysql_db:update(Query).

update(#title{} = Title) ->
    Query = ?FILTER_SQL(?update_title_sql, ?TAIL(Title)),
    mysql_db:update(Query).

save(#titles{all=All}) ->
    lists:foreach(fun(Title) -> update(Title) end, All).


%% internal
build_titles_data(null) -> #titles{all=[]};
build_titles_data(Rows) ->
    All = [build_title_data(Row) || Row <- Rows],
    #titles{all=All}.

build_title_data(null) -> false;
build_title_data([RoleId, TitleId, HoldTime, Status]) ->
    #title{
        role_id = RoleId, 
        title_id = TitleId, 
        hold_time = HoldTime, 
        status = Status
    }.
