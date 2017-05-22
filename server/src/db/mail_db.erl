%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mail_db).

-include("common.hrl").
-include("table_record.hrl").
-include("table_etc.hrl").
-include("logger.hrl").

%% API
-export([
    get/1,
    get_by_id/1,
    update/1,
    save/1,
    get_max_mail_id/0,
    delete/0
]).

%%%===================================================================
%%% API
%%%===================================================================

get(RoleId) ->
    Template = <<"SELECT * FROM mails WHERE role_id = ~p AND state <> ~p AND create_time > ~p">>,
    Params = [RoleId, ?MAILING_DELETE, util:unixtime() - ?MAIL_READ_TIME_LINE],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:select(Query),
    build_all_mailing_data(Row).

get_max_mail_id() ->
    Query = <<"SELECT MAX(CAST(id AS SIGNED)) FROM mails">>,
    [MaxMailId] = mysql_db:get(Query),
    MaxMailId.

get_by_id(Id) ->
    Template = <<"SELECT * FROM mails WHERE id = ~p">>,
    Params = [Id],
    Query = ?FILTER_SQL(Template, Params),
    Row = mysql_db:get(Query),
    build_mailing_data(Row).

update(Mail) ->
    Query = ?FILTER_SQL(?update_mail_sql, ?TAIL(Mail)),
    try
        mysql_db:update(Query)
    catch
        throw:Reason ->
            ?ERROR_MSG("save group boss error:~n~p~n", [Reason])
    end.

save(#mails{all=Mails}) ->
    [update(Mail) || Mail <- Mails].

delete() ->
    Template = <<"DELETE * FROM mails WHERE create_time < ~p">>,
    Params = [util:unixtime() - ?MAIL_DELETE_TIME_LINE],
    Query = ?FILTER_SQL(Template, Params),
    mysql_db:delete(Query).

%%%===================================================================
%%% Internal functions
%%%===================================================================
build_mailing_data(Row) ->
    Mailing = list_to_tuple([mail|Row]),
    Mailing.

build_all_mailing_data(Row) ->
    MailList = [build_mailing_data(X) || X<- Row],
    #mails{all=MailList}.
