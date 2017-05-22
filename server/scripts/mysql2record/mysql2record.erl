%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(mysql2record).

-include("conf_table.hrl").

-export([start/0]).

start() ->
    [Host, Port, User, Password, Database, Encoding] = ?DATABASE_CONFIG, 
    start_erlydb(Host, Port, User, Password, Database, Encoding),
    mysql2record(?MYSQL_TABLES, ?RECORD_FILENAME, ?TMP_TABLE_PATH).

%% @doc 将配置中的数据库表转换为record
mysql2record(MysqlTables, TargetFile, TmpPath) ->
    %% 重新生成之前，先给备份原来的 .hrl 文件
    %%Bakfile = re:replace(
    %%    lists:flatten(lists:concat([TargetFile , "_", time_format(now())])),
    %%    "[ :]","_",[global,{return,list}]),
    %%file:rename(TargetFile, Bakfile),
    {ok, WriteIo} = file:open(TargetFile, [write]),
    Header = module_head("从数据库生成，勿手动修改，手动改此文件者木有小JJ !!!!"),
    io:format(WriteIo, "~s", [Header]),

    [ table2record(Table, TmpPath, RecordName, Describe, WriteIo) || 
        {Table, RecordName, Describe} <- MysqlTables].

table2record(Table, TmpPath, RecordName, Describe, WriteIo) ->
    Sql = lists:concat(["show create table ", Table]),
%    case  db_mysqlutil:get_row(Sql) of
    case mysql:fetch(?POOL_ID, Sql) of
        {data, {_, _, [], _, _, _, _, _}} -> [];
        {data, {_, _, [[_, A | _]], _, _, _, _, _}} -> 
            CreateTableList = re:split(A,"[\n]",[{return, binary}]),
            Desc = case Describe of
                "" -> get_table_describe(CreateTableList, Table);
                _  -> Describe
            end,
            TableDesc = table_describe(Desc, Table),
%%             io:format(WriteIo, "~s", [TableDesc]),
            code_gen([Table], TmpPath),
            TableFields = erlang:apply(Table, db_fields, []),
            RecordDef = record_define(RecordName, CreateTableList, TableFields),
            {SelectSql, UpdateSql} = make_sql(Table, RecordName, TableFields),


            io:format(WriteIo, "~s", [RecordDef]),
            io:format(WriteIo, "~s", [SelectSql]),
            io:format(WriteIo, "~s", [UpdateSql]),


%            io:format("A = ~s~n~n~n",[A]),
%            io:format("Create Table List:~s~n",[Create_table_list]),
            CreateTableList;
        R -> R
    end.

%% @doc 生成模块的头部声明
module_head(Descript) ->
    io_lib:format(
    "%%%-------------------------------------------------------------------\n"
    "%%% @author goddess <goddess@rekoo.com>\n"
    "%%% @copyright (C) 2013, goddess.rekoo.com\n"
    "%%% @doc ~s\n"
    "%%% @date ~s\n"
    "%%% \n"
    "%%% @end\n"
    "%%%-------------------------------------------------------------------\n"
    "%%\n"
    "\n",
    [Descript, datetime_to_str(erlang:localtime())]).

%% @doc 生成表的描述
table_describe(Describe, Table) ->
    io_lib:format(
        "%% @doc \n"
        "%% ~s\n"
        "%% 从数据库 ~s 表生成，勿手动修改\n"
        "%% @end\n",
        [Describe, Table]).

%% @doc 生成record定义
record_define(RecordName, CreateTableList, TableFields) ->
    Fields = fields_define(TableFields, CreateTableList, 1, []),
    error_logger:info_msg("~p ~n", [Fields]),
    io_lib:format("-record(~s, {\n    ~s\n}).\n\n",[RecordName, Fields]).

fields_define([], _CreateTableList, _Num, FieldValueDescribes) -> 
    FormatString = lists:concat([string:join(["~s" || _ <- lists:seq(1, length(FieldValueDescribes) div 3)], ", ~s%% ~s~n    "), " ~s %% ~s"]),
    io_lib:format(FormatString, FieldValueDescribes);
fields_define([#erlydb_field{name = Name} = Field|Rest], CreateTableList, Num, Acc0) ->
    DefaultValue = get_default_value(Field),
    FieldDesc = get_field_describe(CreateTableList, Num),
    FieldValue = io_lib:format("~s~s", [Name, DefaultValue]),
    Blank = lists:duplicate(40-length(lists:flatten(FieldValue)), " "),
    fields_define(Rest, CreateTableList, Num + 1, Acc0 ++ [FieldValue, Blank, FieldDesc]).


make_sql(TableName, RecordName, TableFields) ->
    % 因为写着方便,就不考虑性能问题,反正是工具
    % insert into dbnames(field1, field2) values(?,?) on duplicate update field1=values(field1);
    AllField = [ I#erlydb_field.name_str || I <- TableFields],
    TypeF = fun(varchar) -> "'~ts'";
        (blob) -> "'~ts'";
        (_) -> "~p"
    end,
    Keys = [ I || I <- TableFields, I#erlydb_field.key == primary ],
    SelectKeys = string:join([ io_lib:format("~s=~s", [K#erlydb_field.name_str, TypeF(K#erlydb_field.type)]) || K <- Keys], " and "),
    Holder = string:join([TypeF(I#erlydb_field.type) || I <- TableFields], ","),
    Insert = string:join(AllField, ","),
    Update = string:join([ io_lib:format("~s=values(~s)", [I, I]) || I <- AllField], ","),
    {
        io_lib:format("-define(select_~s_sql, <<\"select * from ~s where ~s\">>).~n", [RecordName, TableName, SelectKeys]),
        io_lib:format("-define(update_~s_sql, <<\"insert into ~s(~s) values(~s) on duplicate key update ~s\">>).~n~n", [RecordName, TableName, Insert, Holder, Update])
    }.


%%% Local functions
%% @doc 时间转换成字符串
datetime_to_str({{Year, Month, Day}, {Hour, Minute, Second}}) ->
    lists:flatten(
        io_lib:format("~4..0B-~2..0B-~2..0B ~2..0B:~2..0B:~2..0B",
                    [Year, Month, Day, Hour, Minute, Second])).

start_erlydb(IP, Port, User, Password, Database, Encoding) ->
    erlydb:start(mysql, [{pool_id, ?POOL_ID},
                        {hostname, IP},
                         {port, Port},
                         {username, User},
                         {password, Password},
                         {database, Database},
                         {encoding, Encoding},
                         {pool_size, 10}]).

%% time format
one_to_two(One) -> io_lib:format("~2..0B", [One]).

time_format(Now) -> 
    {{Y,M,D},{H,MM,S}} = calendar:now_to_local_time(Now),
    lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ",
                        one_to_two(H) , ":", one_to_two(MM), ":", one_to_two(S)]).

get_table_describe(CreateTableList, Table) ->
    Len  = length(CreateTableList),
    L1 = binary_to_list(lists:nth(Len, CreateTableList)),
%%  io:format("L1 = ~p ~n", [L1]),
    Loc1 = string:rstr(L1, "COMMENT="),
%%  io:format("Loc = ~p ~n", [Loc1]),
    case Loc1 > 0 of
        true ->
            L2 = string:substr(L1, Loc1 + 8),
            L3 = lists:subtract(L2, [39,44]),
            lists:subtract(L3, [39]);
        _ -> Table
    end.

get_field_describe(Create_table_list, Loc) ->
%%     L1 = re:split(lists:nth(Loc+1, Create_table_list),"[ ]",[{return, list}]),
    L1 = binary_to_list(lists:nth(Loc+1, Create_table_list)),
%%  io:format("L1 = ~p ~n", [L1]),
    Loc1 = string:rstr(L1, "COMMENT "),
%%  io:format("Loc = ~p ~n", [Loc1]),
    case Loc1 > 0 of
        true ->
            L2 = string:substr(L1, Loc1 + 8),
            L3 = lists:subtract(L2, [39,44]),
            lists:subtract(L3, [39]);
        _ -> ""
    end.

get_default_value(#erlydb_field{default = undefined}) -> ' ';
get_default_value(#erlydb_field{default = <<>>, type = Type}) -> 
    case erlydb_field:get_erl_type(Type) of
        binary ->
            lists:concat([" = \"\""]);
        integer ->
            lists:concat([" = 0"]);
        _ -> ''
    end;
get_default_value(#erlydb_field{default = <<"[]">>}=Field) -> 
    lists:concat([" = ", binary_to_list(Field#erlydb_field.default)]);
get_default_value(#erlydb_field{default = Value, type = Type}) -> 
    case erlydb_field:get_erl_type(Type) of
        binary ->
            lists:concat([" = <<\"", binary_to_list(Value) ,"\">>"]);
%%         integer ->
%%             lists:concat([" = 0"]);
        _ ->
            lists:concat([" = ", binary_to_list(Value)])
    end.

code_gen(TableList, TmpPath) ->
    Tables = writeTempFile(TableList, TmpPath),
%% io:format("TableList=~p~n~n",[TableList]),
    erlydb:code_gen(Tables,{mysql,
                               [{allow_unsafe_statements, true},
                                {skip_fk_checks, true}],[{?POOL_ID, default}]},
                                [debug_info,{skip_fk_checks, true},
                                 {outdir,"../../ebin/"}]),
    clearTempFile(TmpPath),
    ok.

%% @doc 为指定的表名生成module文件，给code_gen/0 使用
%% @spec writeTempFile/0 ->[TableFilePath]
%%    eg: TableFilePath -> "./tmptable/tuser_friend_log.erl"
writeTempFile(TableList, TmpPath)->
    clearTempFile(TmpPath),
    ok = file:make_dir(TmpPath),
    lists:map(fun(F)->
                      Filename =
                          TmpPath ++ atom_to_list(F) ++ ".erl",
                      Bytes = list_to_binary( io_lib:format("-module(~w).", [F]) ),
                      file:write_file(Filename, Bytes),
                      Filename
              end, TableList).

clearTempFile(TmpPath)->
    case file:list_dir(TmpPath) of
        {ok, Filenames} ->
            lists:foreach(fun(F)->
                                  file:delete(TmpPath ++ F) end , Filenames);
        {error, _} -> ignore
    end,
    file:del_dir(TmpPath).


