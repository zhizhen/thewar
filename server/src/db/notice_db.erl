%% Copyright
-module(notice_db).

-include("table_record.hrl").
-include("table_etc.hrl").
-include("common.hrl").

%% API
-export([get/0, get_max_notice_id/0, save/1]).


get() ->
    Now = ?NOW,
    Template = <<"select * from notice where created_at <= ~p and expired_at > ~p">>,
    Params = [Now, Now],
    Query = ?FILTER_SQL(Template, Params),
    Rows = mysql_db:select(Query),
    build_notice_data(Rows).

get_max_notice_id() ->
    Sql = <<"SELECT MAX(CAST(id AS SIGNED)) FROM notice">>,
    [Id] = mysql_db:get(Sql),
    Id.

save(#notice{}=Notice) ->
    Query = ?FILTER_SQL(?update_notice_sql, ?TAIL(Notice)),
    mysql_db:update(Query).

build_notice_data(null) -> [];
build_notice_data(Row) ->
    [list_to_tuple([notice|X]) || X<- Row].
