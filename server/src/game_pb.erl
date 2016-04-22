-module(game_pb).
-include("game_pb.hrl").
-export([
    encode_1001/1,
    encode_1000/1,
    decode_p_tests/2,
    encode_p_tests/2,
    encode_p_test/1
]).

-export([
    decode_1001/1,
    decode_1000/1,
    decode_p_test/1
]).


-export([
    encode/1,
    decode/1
]).

-export([
    encode_bytes/2,
    encode_ubytes/2,
    encode_shorts/2,
    encode_ushorts/2,
    encode_int32s/2,
    encode_uint32s/2,
    encode_int64s/2, 
    encode_doubles/2,
    encode_bools/2,
    encode_strings/2
]).

-export([
    decode_bytes/2,
    decode_ubytes/2,
    decode_shorts/2,
    decode_ushorts/2,
    decode_int32s/2,
    decode_uint32s/2,
    decode_int64s/2, 
    decode_doubles/2,
    decode_bools/2,
    decode_strings/2
]).

encode(RecordData) ->
    MsgId = element(2, RecordData),
    FuncName = string:concat("encode_", integer_to_list(MsgId)),
    Bin = apply('game_pb', list_to_atom(FuncName), [RecordData]),
    {ok, Bin}.

decode(BinData) ->
    <<MsgId:32, _/binary>> = BinData,
    FuncName = string:concat("decode_", integer_to_list(MsgId)),
    Record = apply('game_pb', list_to_atom(FuncName), [BinData]),
    RecordName = element(1, Record),
    [_, M, F, _] = re:split(atom_to_list(RecordName), "__", [{return, list}]),
    {ok, {list_to_atom(M ++ "_api"), list_to_atom(F), Record}}.
encode_bytes([], Bin) ->
    Bin;
encode_bytes([H|T], Bin) ->
    encode_bytes(T, <<Bin/binary, H:8/signed>>).
encode_ubytes([], Bin) ->
    Bin;
encode_ubytes([H|T], Bin) ->
    encode_bytes(T, <<Bin/binary, H:8/unsigned>>).
encode_shorts([], Bin) ->
    Bin;
encode_shorts([H|T], Bin) ->
    encode_shorts(T, <<Bin/binary, H:16/signed>>).
encode_ushorts([], Bin) ->
    Bin;
encode_ushorts([H|T], Bin) ->
    encode_ushorts(T, <<Bin/binary, H:16/unsigned>>).
encode_int32s([], Bin) ->
    Bin;
encode_int32s([H|T], Bin) ->
    encode_int32s(T, <<Bin/binary, H:32/signed>>).
encode_uint32s([], Bin) ->
    Bin;
encode_uint32s([H|T], Bin) ->
    encode_uint32s(T, <<Bin/binary, H:32/unsigned>>).
encode_int64s([], Bin) ->
    Bin;
encode_int64s([H|T], Bin) ->
    encode_int64s(T, <<Bin/binary, H:64/signed>>).
encode_doubles([], Bin) ->
    Bin;
encode_doubles([H|T], Bin) ->
    encode_doubles(T, <<Bin/binary, H/float>>).
encode_strings([], Bin) ->
    Bin;
encode_strings([H|T], Bin) ->
    Str = if is_bitstring(H) -> H; true -> list_to_binary(H) end,
    StrLen = erlang:byte_size(Str),
    encode_strings(T, <<Bin/binary, StrLen:16/unsigned, Str/binary>>).
encode_bools([], Bin) ->
    Bin;
encode_bools([H|T], Bin) ->
    case H  of
       true ->
           B = 1;
       false ->
           B = 0
    end,
    encode_bools(T, <<Bin/binary, B:8>>).
decode_bytes(<<>>, List) ->
    List;
decode_bytes(Bin, List) ->
    <<Int:8/signed, Bin2/binary>> = Bin,
    decode_bytes(Bin2, [Int|List]).

decode_ubytes(<<>>, List) ->
    List;
decode_ubytes(Bin, List) ->
    <<Int:8/unsigned, Bin2/binary>> = Bin,
    decode_ubytes(Bin2, [Int|List]).

decode_shorts(<<>>, List) ->
    List;
decode_shorts(Bin, List) ->
    <<Int:16/signed, Bin2/binary>> = Bin,
    decode_shorts(Bin2, [Int|List]).

decode_ushorts(<<>>, List) ->
    List;
decode_ushorts(Bin, List) ->
    <<Int:16/unsigned, Bin2/binary>> = Bin,
    decode_ushorts(Bin2, [Int|List]).

decode_int32s(<<>>, List) ->
    List;
decode_int32s(Bin, List) ->
    <<Int:32/signed, Bin2/binary>> = Bin,
    decode_int32s(Bin2, [Int|List]).

decode_uint32s(<<>>, List) ->
    List;
decode_uint32s(Bin, List) ->
    <<Int:32/unsigned, Bin2/binary>> = Bin,
    decode_uint32s(Bin2, [Int|List]).

decode_int64s(<<>>, List) ->
    List;
decode_int64s(Bin, List) ->
    <<Int:64/signed, Bin2/binary>> = Bin,
    decode_int64s(Bin2, [Int|List]).

decode_doubles(<<>>, List) ->
    List;
decode_doubles(Bin, List) ->
    <<Double/float, Bin2/binary>> = Bin,
    decode_doubles(Bin2, [Double|List]).
decode_strings(<<>>, List) ->
    List;
decode_strings(Bin, List) ->
    <<Len:16, Bin2/binary>> = Bin,
    <<Str:Len/binary, Bin3/binary>> = Bin2,
    decode_strings(Bin3, [binary_to_list(Str)|List]).
decode_bools(<<>>, List) ->
    List;
decode_bools(Bin, List) ->
    <<Int:8, Bin2/binary>> = Bin,
    case Int of 
        1 ->
            Bool = true;
        _ ->
            Bool = false
    end,
    decode_bools(Bin2, [Bool|List]).
encode_p_test(Record) when is_record(Record, p_test) ->
    #p_test{v1=V1,v2=V2} = Record,
    V1Final =
    case V1 =:= undefined of
        true ->
            throw({required_field_not_assigned, p_test, v1}),
            undefined;
        false ->
            V1
    end,
    V2Final =
    case V2 =:= undefined of
        true ->
            throw({required_field_not_assigned, p_test, v2}),
            undefined;
        false ->
            V2
    end,
    <<V1Final:32/signed,V2Final:32/signed>>;

encode_p_test(_) -> <<>>.

decode_p_test(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<V1:32/signed,V2:32/signed>> = Bin0,
    {p_test, V1,V2};

decode_p_test(_) ->
    undefined.

encode_1000(Record) when is_record(Record, m__proto__test__c2s) ->
    #m__proto__test__c2s{msg_id=Msg_id,v1=V1,v2=V2,v3=V3,v4=V4,v5=V5,v6=V6,v7=V7,v8=V8,v9=V9,v10=V10} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1000;
        false ->
            Msg_id
    end,
    V1Final =
    case V1 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v1}),
            undefined;
        false ->
            V1
    end,
    V2Final =
    case V2 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v2}),
            undefined;
        false ->
            V2
    end,
    V3Final =
    case V3 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v3}),
            undefined;
        false ->
            V3
    end,
    V4Final =
    case V4 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v4}),
            undefined;
        false ->
            V4
    end,
    V5Final =
    case V5 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v5}),
            undefined;
        false ->
            V5
    end,
    V6Final =
    case V6 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v6}),
            undefined;
        false ->
            V6
    end,
    V7Final =
    case V7 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v7}),
            undefined;
        false ->
            V7
    end,
    V8Final =
    case V8 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__c2s, v8}),
            undefined;
        false ->
            V8
    end,
    case V9 =:= undefined of
        true ->
            V9Final = [];
        false ->
            V9Final = V9
    end,
    case V10 =:= undefined of
        true ->
            V10Final = [];
        false ->
            V10Final = V10
    end,
    V72 = if is_bitstring(V7Final) -> V7Final; true -> list_to_binary(V7Final) end,
    V7Len = erlang:byte_size(V72),
    V8_bin = encode_p_test(V8Final),
    BinLen_v8 = erlang:byte_size(V8_bin),
    V9_bin = encode_int32s(V9Final, <<>>),
    SizeV9Final = erlang:length(V9Final),
    BinLen_v9 = erlang:byte_size(V9_bin),
    V10_bin = encode_p_tests(V10Final, <<>>),
    SizeV10Final = erlang:length(V10Final),
    BinLen_v10 = erlang:byte_size(V10_bin),
    <<Msg_idFinal:32/signed,V1Final:8/signed,V2Final:16/signed,V3Final:16/unsigned,V4Final:32/signed,V5Final:32/unsigned,V6Final:64/signed,V7Len:16, V72/binary,BinLen_v8:32, V8_bin/binary,SizeV9Final:16, BinLen_v9:32, V9_bin/binary,SizeV10Final:16, BinLen_v10:32, V10_bin/binary>>;

encode_1000(_) -> <<>>.

decode_1000(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,V1:8/signed,V2:16/signed,V3:16/unsigned,V4:32/signed,V5:32/unsigned,V6:64/signed,V7Len:16, Bin1/binary>> = Bin0,
    <<V7:V7Len/binary,SubBinSizev8:32, Bin2/binary>> = Bin1,
    <<SubBinv8:SubBinSizev8/binary, Bin3/binary>> = Bin2,
    V8 = decode_p_test(SubBinv8),
    <<_Sizev9:16, BinLenv9:32, Bin4/binary>> = Bin3,
    <<SubBinv9:BinLenv9/binary, Bin5/binary>> = Bin4, 
    V9 = lists:reverse(decode_int32s(SubBinv9, [])),
    <<_Sizev10:16, _BinLenv10:32, SubBinv10/binary>> = Bin5,
    V10 = lists:reverse(decode_p_tests(SubBinv10, [])),
    {m__proto__test__c2s, Msg_id,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10};

decode_1000(_) ->
    undefined.

encode_1001(Record) when is_record(Record, m__proto__test__s2c) ->
    #m__proto__test__s2c{msg_id=Msg_id,v1=V1,v2=V2,v3=V3,v4=V4,v5=V5,v6=V6,v7=V7,v8=V8,v9=V9,v10=V10} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1001;
        false ->
            Msg_id
    end,
    V1Final =
    case V1 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v1}),
            undefined;
        false ->
            V1
    end,
    V2Final =
    case V2 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v2}),
            undefined;
        false ->
            V2
    end,
    V3Final =
    case V3 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v3}),
            undefined;
        false ->
            V3
    end,
    V4Final =
    case V4 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v4}),
            undefined;
        false ->
            V4
    end,
    V5Final =
    case V5 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v5}),
            undefined;
        false ->
            V5
    end,
    V6Final =
    case V6 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v6}),
            undefined;
        false ->
            V6
    end,
    V7Final =
    case V7 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v7}),
            undefined;
        false ->
            V7
    end,
    V8Final =
    case V8 =:= undefined of
        true ->
            throw({required_field_not_assigned, m__proto__test__s2c, v8}),
            undefined;
        false ->
            V8
    end,
    case V9 =:= undefined of
        true ->
            V9Final = [];
        false ->
            V9Final = V9
    end,
    case V10 =:= undefined of
        true ->
            V10Final = [];
        false ->
            V10Final = V10
    end,
    V72 = if is_bitstring(V7Final) -> V7Final; true -> list_to_binary(V7Final) end,
    V7Len = erlang:byte_size(V72),
    V8_bin = encode_p_test(V8Final),
    BinLen_v8 = erlang:byte_size(V8_bin),
    V9_bin = encode_int32s(V9Final, <<>>),
    SizeV9Final = erlang:length(V9Final),
    BinLen_v9 = erlang:byte_size(V9_bin),
    V10_bin = encode_p_tests(V10Final, <<>>),
    SizeV10Final = erlang:length(V10Final),
    BinLen_v10 = erlang:byte_size(V10_bin),
    <<Msg_idFinal:32/signed,V1Final:8/signed,V2Final:16/signed,V3Final:16/unsigned,V4Final:32/signed,V5Final:32/unsigned,V6Final:64/signed,V7Len:16, V72/binary,BinLen_v8:32, V8_bin/binary,SizeV9Final:16, BinLen_v9:32, V9_bin/binary,SizeV10Final:16, BinLen_v10:32, V10_bin/binary>>;

encode_1001(_) -> <<>>.

decode_1001(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,V1:8/signed,V2:16/signed,V3:16/unsigned,V4:32/signed,V5:32/unsigned,V6:64/signed,V7Len:16, Bin1/binary>> = Bin0,
    <<V7:V7Len/binary,SubBinSizev8:32, Bin2/binary>> = Bin1,
    <<SubBinv8:SubBinSizev8/binary, Bin3/binary>> = Bin2,
    V8 = decode_p_test(SubBinv8),
    <<_Sizev9:16, BinLenv9:32, Bin4/binary>> = Bin3,
    <<SubBinv9:BinLenv9/binary, Bin5/binary>> = Bin4, 
    V9 = lists:reverse(decode_int32s(SubBinv9, [])),
    <<_Sizev10:16, _BinLenv10:32, SubBinv10/binary>> = Bin5,
    V10 = lists:reverse(decode_p_tests(SubBinv10, [])),
    {m__proto__test__s2c, Msg_id,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10};

decode_1001(_) ->
    undefined.

encode_p_tests([], Bin) ->
    Bin;
encode_p_tests([H|T], Bin) ->
    NewBin = encode_p_test(H),
     NewBinSize = erlang:byte_size(NewBin),
    encode_p_tests(T, <<Bin/binary, NewBinSize:32, NewBin/binary>>).
decode_p_tests(<<>>, List) ->
    List;
decode_p_tests(Bin, List) ->    <<SubBinSize:32, Bin2/binary>> = Bin,
    <<SubBin:SubBinSize/binary, Bin3/binary>> = Bin2,    TmpRecord = decode_p_test(SubBin),
    decode_p_tests(Bin3, [TmpRecord|List]).
