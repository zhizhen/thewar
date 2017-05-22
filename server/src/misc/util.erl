%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc MYSQL util
%%%
%%% @end
%%% Created : 17 Feb 2013 by goddess <goddess@rekoo.com>
%%% == Modified Log==
%%%
%%%-------------------------------------------------------------------
-module(util).

-compile(export_all).

-include("common.hrl").
-include("cfg_record.hrl").

-export([
    ip/1,
    sort/1,
    for/3,
    f2s/1,
    get_type/2,
    ceil/1,
    floor/1,
    sleep/1,
    subatom/2,
    to_integer/1,
    to_binary/1,
    to_tuple/1,
    to_float/1,
    to_list/1,
    to_atom/1,
    md5/1,
    list_to_atom2/1,
    combine_lists/2,
    get_msg_queue/0,
    get_memory/0,
    get_memory/1,
    get_heap/0,
    get_heap/1,
    md5_to_hex/1,
    unixtime/0,
    longunixtime/0,
    datetime_to_timestamp/1,
    timestamp_to_datetime/1,
    delete_list/2,
    add_list/2,
    index_of/2,
    index_of/3,
    get_state_by_binary/3,
    split/2,
    split2/2,
    splitn/3,
    trans_http_parms/1,
    get_field/2,
    get_field/3,
    is_expired/1
]).

%% @doc get IP address string from Socket
ip(Socket) ->
    {ok, {IP, _Port}} = inet:peername(Socket),
    {Ip0,Ip1,Ip2,Ip3} = IP,
    list_to_binary(integer_to_list(Ip0)++"."++integer_to_list(Ip1)++"."++integer_to_list(Ip2)++"."++integer_to_list(Ip3)).


%% @doc quick sort
sort([]) ->
    [];
sort([H|T]) -> 
    sort([X||X<-T,X<H]) ++ [H] ++ sort([X||X<-T,X>=H]).

%% for
for(Max,Max,F)->[F(Max)];
for(I,Max,F)->[F(I)|for(I+1,Max,F)].


%% @doc convert float to string,  f2s(1.5678) -> 1.57
f2s(N) when is_integer(N) ->
    integer_to_list(N) ++ ".00";
f2s(F) when is_float(F) ->
    [A] = io_lib:format("~.2f", [F]),
    A.


%% @doc convert other type to atom
to_atom(Msg) when is_atom(Msg) -> 
    Msg;
to_atom(Msg) when is_binary(Msg) -> 
    list_to_atom(binary_to_list(Msg));
to_atom(Msg) when is_list(Msg) -> 
    list_to_atom(Msg);
to_atom(_) -> 
    throw(other_value).  %%list_to_atom("").

%% @doc convert other type to list
to_list(Msg) when is_list(Msg) -> 
    Msg;
to_list(Msg) when is_atom(Msg) -> 
    atom_to_list(Msg);
to_list(Msg) when is_binary(Msg) -> 
    binary_to_list(Msg);
to_list(Msg) when is_integer(Msg) -> 
    integer_to_list(Msg);
to_list(Msg) when is_float(Msg) -> 
    f2s(Msg);
to_list(_) ->
    throw(other_value).

%% @doc convert other type to binary
to_binary(Msg) when is_binary(Msg) -> 
    Msg;
to_binary(Msg) when is_atom(Msg) ->
    list_to_binary(atom_to_list(Msg));
    %%atom_to_binary(Msg, utf8);
to_binary(Msg) when is_list(Msg) -> 
    list_to_binary(Msg);
to_binary(Msg) when is_integer(Msg) -> 
    list_to_binary(integer_to_list(Msg));
to_binary(Msg) when is_float(Msg) -> 
    list_to_binary(f2s(Msg));
to_binary(_Msg) ->
    throw(other_value).

%% @doc convert other type to float
to_float(Msg)->
    Msg2 = to_list(Msg),
    list_to_float(Msg2).

%% @doc convert other type to integer
-spec to_integer(Msg :: any()) -> integer().
to_integer(Msg) when is_integer(Msg) -> 
    Msg;
to_integer(Msg) when is_binary(Msg) ->
    Msg2 = binary_to_list(Msg),
    list_to_integer(Msg2);
to_integer(Msg) when is_list(Msg) -> 
    list_to_integer(Msg);
to_integer(Msg) when is_float(Msg) ->
    trunc(Msg);
to_integer(_Msg) ->
    throw(other_value).

%% @doc convert other type to tuple
to_tuple(T) when is_tuple(T) -> T;
to_tuple(T) -> {T}.

%% @doc get data type {0=integer,1=list,2=atom,3=binary}
get_type(DataValue,DataType)->
    case DataType of
        0 ->
            DataValue2 = binary_to_list(DataValue),
            list_to_integer(DataValue2);
        1 ->
            binary_to_list(DataValue);
        2 ->
            DataValue2 = binary_to_list(DataValue),
            list_to_atom(DataValue2);
        3 -> 
            DataValue
    end.


%% @doc 取整 大于X的最小整数
ceil(X) ->
    T = trunc(X),
    if 
        X - T == 0 ->
            T;
        true ->
            if
                X > 0 ->
                    T + 1;
                true ->
                    T
            end            
    end.


%% @doc 取整 小于X的最大整数
floor(X) ->
    T = trunc(X),
    if 
        X - T == 0 ->
            T;
        true ->
            if
                X > 0 ->
                    T;
                true ->
                    T-1
            end
    end.
%% 4舍5入
%% round(X)

%% subatom
subatom(Atom,Len)->    
    list_to_atom(lists:sublist(atom_to_list(Atom),Len)).

%% @doc 暂停多少毫秒
sleep(Msec) ->
    receive
        after Msec ->
            true
    end.

md5(S) ->        
    Md5_bin =  erlang:md5(S), 
    Md5_list = binary_to_list(Md5_bin), 
    lists:flatten(list_to_hex(Md5_list)). 
 
list_to_hex(L) -> 
    lists:map(fun(X) -> int_to_hex(X) end, L). 
 
int_to_hex(N) when N < 256 -> 
    [hex(N div 16), hex(N rem 16)]. 
hex(N) when N < 10 -> 
       $0+N; 
hex(N) when N >= 10, N < 16 ->      
    $a + (N-10).

list_to_atom2(List) when is_list(List) ->
    case catch(list_to_existing_atom(List)) of
        {'EXIT', _} -> erlang:list_to_atom(List);
        Atom when is_atom(Atom) -> Atom
    end.
    
combine_lists(L1, L2) ->
    Rtn = 
    lists:foldl(
        fun(T, Acc) ->
            case lists:member(T, Acc) of
                true ->
                    Acc;
                false ->
                    [T|Acc]
            end
        end, lists:reverse(L1), L2),
    lists:reverse(Rtn).


get_process_info_and_zero_value(InfoName) ->
    PList = erlang:processes(),
    ZList = lists:filter( 
        fun(T) -> 
            case erlang:process_info(T, InfoName) of 
                {InfoName, 0} -> false; 
                _ -> true     
            end
        end, PList ),
    ZZList = lists:map( 
        fun(T) -> {T, erlang:process_info(T, InfoName), erlang:process_info(T, registered_name)} 
        end, ZList ),
    [ length(PList), InfoName, length(ZZList), ZZList ].

get_process_info_and_large_than_value(InfoName, Value) ->
    PList = erlang:processes(),
    ZList = lists:filter( 
        fun(T) -> 
            case erlang:process_info(T, InfoName) of 
                {InfoName, VV} -> 
                    if VV >  Value -> true;
                        true -> false
                    end;
                _ -> true     
            end
        end, PList ),
    ZZList = lists:map( 
        fun(T) -> {T, erlang:process_info(T, InfoName), erlang:process_info(T, registered_name)} 
        end, ZList ),
    [ length(PList), InfoName, Value, length(ZZList), ZZList ].

get_msg_queue() ->
    io:fwrite("process count:~p~n~p value is not 0 count:~p~nLists:~p~n", 
                get_process_info_and_zero_value(message_queue_len) ).

get_memory() ->
    io:fwrite("process count:~p~n~p value is large than ~p count:~p~nLists:~p~n", 
                get_process_info_and_large_than_value(memory, 1048576) ).

get_memory(Value) ->
    io:fwrite("process count:~p~n~p value is large than ~p count:~p~nLists:~p~n", 
                get_process_info_and_large_than_value(memory, Value) ).

get_heap() ->
    io:fwrite("process count:~p~n~p value is large than ~p count:~p~nLists:~p~n", 
                get_process_info_and_large_than_value(heap_size, 1048576) ).

get_heap(Value) ->
    io:fwrite("process count:~p~n~p value is large than ~p count:~p~nLists:~p~n", 
                get_process_info_and_large_than_value(heap_size, Value) ).

get_processes() ->
    io:fwrite("process count:~p~n~p value is large than ~p count:~p~nLists:~p~n",
    get_process_info_and_large_than_value(memory, 0) ).

build_hash_str(Code) when erlang:length(Code) < 32 ->
    Tmp = lists:concat(["0", Code]),
    build_hash_str(Tmp);

build_hash_str(Code) when erlang:length(Code) >= 32 ->
    Code.

md5_to_hex(Str) ->
    <<HashStr:128>> = erlang:md5(Str),
    Code = erlang:integer_to_list(HashStr, 16),
    build_hash_str(Code).

%% 取得当前的unix时间戳
%% 单位：秒
unixtime() ->
    {M, S, _} = os:timestamp(),
    M * 1000000 + S.

%% 单位：毫秒
longunixtime() ->
    {M, S, Ms} = os:timestamp(),
    M * 1000000000 + S*1000 + Ms div 1000.

datetime_to_timestamp({Date, Time}) ->
    Seconds1 = calendar:datetime_to_gregorian_seconds({Date, Time}),
    Seconds2 = calendar:datetime_to_gregorian_seconds({{1970,1,1}, ?TIME_ZONE}),
    Seconds1 - Seconds2.

timestamp_to_datetime(Timestamp) ->
    Seconds1 = calendar:datetime_to_gregorian_seconds({{1970,1,1}, ?TIME_ZONE}),
    Seconds2 = Timestamp + Seconds1,
    calendar:gregorian_seconds_to_datetime(Seconds2).

delete_list(All, []) ->
    All;
delete_list(All, [R|Remove]) ->
    NewAll = lists:delete(R, All),
    case lists:member(R, NewAll) of
        true ->
            delete_list(NewAll, [R|Remove]);
        false ->
            delete_list(NewAll, Remove)
    end.

add_list(Targ, []) ->
    Targ;
add_list(Targ, [F|From]) ->
    case lists:member(F, Targ) of
        true ->
            add_list(Targ, From);
        false ->
            add_list(Targ ++ [F], From)
    end.

index_of(Item, List) -> index_of(Item, List, 1).

index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).

%% 通过int值查询状态，如Int->25,Id->2, Num % 完全字符串的长度
%% List -> "10101",Com -> "010101", get_state_by_binary(Int, Id, Num) -> 1.
get_state_by_binary(Int, Id, Num) -> 
    List = erlang:integer_to_list(Int, 2),
    Com = build_complete_str(List, Num),
    lists:nth(Id, lists:reverse(Com)) - 48.

build_complete_str(Code, Num) when erlang:length(Code) < Num ->
    Tmp = lists:concat(["0", Code]),
    build_complete_str(Tmp, Num);
build_complete_str(Code, Num) when erlang:length(Code) >= Num ->
    Code.

%% pos 从1开始
bit_test(Int, Pos) -> (Int bsr (Pos-1)) band 1.

bit_set(Int, Pos) -> Int bor (1 bsl (Pos-1)).


% T :: unixtime()
is_today(T) ->
    {{A, B, C}, _} = util:timestamp_to_datetime(T),
    {{A1, B1, C1}, _} = erlang:localtime(),
    A == A1 andalso B == B1 andalso C == C1.


% string split
% usage: 
%   1.split(List, ";"),  
%   2.split2(List, ";:"),  
%   3.splitn(List, ";", 2),  
%   4.splitn(List, ";:", 2)
split(L, Splitters) ->  
    string:tokens(L, Splitters).  
  
split2(L, Splitters)  ->  
    case lists:any(fun(A) -> string:str(L,[A]) > 0 end, Splitters) of   
        true ->  
            [H|_] = split(L, Splitters),  
            T = string:substr(L,string:len(H)+2),  
            case length(T) of  
                0 -> [H];  
                 _ -> [H,T]  
            end;  
        _ ->  
            [L]  
    end.  
  
splitn(L, Splitters, N) ->  
    splitn(L, Splitters, N, []).  

splitn([], _, _, NL) ->   
    NNL = lists:concat([[],NL]),  
    lists:reverse(NNL);  

splitn(L, Splitters, 1, NL) ->   
    [H|T] = split2(L, Splitters),  
    NNL = lists:reverse(NL),  
    case length(T) of  
        0 -> lists:concat([NNL, [H]]);  
        _ -> 
            NT = lists:concat([T]),  
            lists:concat([NNL, [H], NT])
    end;  

splitn(L, Splitters, N, NL) ->  
    [H|[T]] = split2(L, Splitters),  
    splitn(T, Splitters, N-1, [H|NL]).


trans_http_parms(Parms) ->
    List = string:tokens(Parms, "&"),
    Fun = fun(Elem, AccIn) ->
        [Key, Value] = util:splitn(Elem, "=", 1),
        [{Key, Value}|AccIn]
    end,
    lists:foldl(Fun, [], List).


get_field(Props, Key) ->
    case lists:keysearch(Key, 1, Props) of
        {value, {_K, Val}} ->
            Val;
        false ->
            throw("NOT_MATCH")
    end.

get_field(Props, Key, Default) ->
    case lists:keysearch(Key, 1, Props) of
        {value, {_K, Val}} ->
            Val;
        false ->
            Default
    end.

is_expired([Begin, End]) ->
    Now = erlang:localtime(),
    less(cfg2time(Begin), Now) andalso less(Now, cfg2time(End)).

less(Time, Now) ->
    {D1, {H1, Mi1, S1}} = calendar:time_difference(Time, Now),
    lists:all(fun(X) -> X >= 0 end, [D1, H1, Mi1, S1]).

cfg2time(#date_cfg{year=Y, month=M, day=D, hour=H, minute=Mi, second=S}) ->
    {{Y, M, D}, {H, Mi, S}}.
