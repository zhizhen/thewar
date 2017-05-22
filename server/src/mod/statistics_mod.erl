%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2013-8-5 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(statistics_mod).

% -include("statistics.hrl").
% -include("logger.hrl").

% -export([build_log/2, build_create_sql/1]).

% %%%===================================================================
% %%% API functions
% %%%===================================================================
% build_log({Table, Type, ServerId, Format, Parms}, Cache) ->
%     #statistics_cache{pool = Pool} = Cache,
%     {{Y,M,D},{H,Mi,S}} = erlang:localtime(),

%     NoteTime = lists:concat([Y,"-",M,"-",D," ",H,":",Mi,":",S]),
%     Values = "(" ++ string:join([mysql:encode(X)||X <- [ServerId, util:unixtime(), NoteTime]++Parms], ",") ++ ")",

%     Tag = list_to_atom(Table),
%     case lists:keyfind(Tag, 1, Pool) of
%         {Tag, Insert} -> 
%             NewInsert = lists:concat([Insert, ",", Values]),
%             NewCache = lists:keyreplace(Tag, 1, Pool, {Tag, NewInsert}),
%             Cache#statistics_cache{pool = NewCache};
%         false ->
%             TableName = case Type of
%                 week -> 
%                     {Year, Week} = calendar:iso_week_number({Y,M,D}),
%                     lists:concat([Table, "_", Year, "_", Week]);
%                 month -> lists:concat([Table, "_", Y, "_", M]);
%                 one -> Table
%             end,

%             Fields = build_fields(Format),
%             InsertSql = lists:concat(["insert into ", TableName, Fields, " values ", Values]),

%             NewCache = Pool ++ [{Tag, InsertSql}],
%             Cache#statistics_cache{pool = NewCache}
%     end;

% build_log(_, Cache) ->
%     Cache.

% build_create_sql({TableName, Fields}) ->
%     Sql = lists:concat(["CREATE TABLE IF NOT EXISTS ", TableName, "(id bigint(32) NOT NULL AUTO_INCREMENT, "]),
%     build_create_sql(["server_id","timestamp","time"]++Fields, Sql).

% %%======================================
% %% internal functions
% %%======================================
% build_fields(Format) ->
%     build_data(Format, " (server_id,timestamp,time").

% build_data([], Result) ->
%     Result ++ ")";
% build_data([Data|Datas], Result) ->
%     build_data(Datas, lists:concat([Result, ",", Data])).

% build_create_sql([], Sql) ->
%     Sql ++ " PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
% build_create_sql([Field|Fields], Sql) ->
%     build_create_sql(Fields, lists:concat([Sql, Field, " varchar(64) NOT NULL,"])).