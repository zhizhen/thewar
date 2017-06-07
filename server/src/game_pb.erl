-module(game_pb).
-include("game_pb.hrl").
-export([
    encode_p_poss/2,
    encode_1104/1,
    decode_p_tests/2,
    encode_p_roles/2,
    encode_p_tests/2,
    encode_5001/1,
    encode_1100/1,
    encode_1101/1,
    encode_1102/1,
    encode_1103/1,
    encode_5009/1,
    encode_1105/1,
    encode_1106/1,
    encode_1107/1,
    encode_999/1,
    encode_998/1,
    encode_p_test/1,
    encode_1001/1,
    encode_1000/1,
    encode_p_pos/1,
    decode_p_roles/2,
    encode_p_role/1,
    encode_6000/1,
    encode_6001/1,
    decode_p_poss/2
]).

-export([
    decode_6000/1,
    decode_6001/1,
    decode_5009/1,
    decode_p_pos/1,
    decode_999/1,
    decode_998/1,
    decode_5001/1,
    decode_p_role/1,
    decode_1100/1,
    decode_1101/1,
    decode_1102/1,
    decode_1103/1,
    decode_1104/1,
    decode_1105/1,
    decode_1106/1,
    decode_1107/1,
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
    {ok, Record}.
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
encode_1104(Record) when is_record(Record, m__role__login__c2s) ->
    #m__role__login__c2s{msg_id=Msg_id,id=Id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1104;
        false ->
            Msg_id
    end,
    IdFinal =
    case Id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__login__c2s, id}),
            undefined;
        false ->
            Id
    end,
    <<Msg_idFinal:32/signed,IdFinal:32/signed>>;

encode_1104(_) -> <<>>.

decode_1104(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Id:32/signed>> = Bin0,
    {m__role__login__c2s, Msg_id,Id};

decode_1104(_) ->
    undefined.

encode_998(Record) when is_record(Record, m__proto__test__c2s) ->
    #m__proto__test__c2s{msg_id=Msg_id,v1=V1,v2=V2,v3=V3,v4=V4,v5=V5,v6=V6,v7=V7,v8=V8,v9=V9,v10=V10} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            998;
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
    V9_bin = encode_int32s(V9Final, <<>>),
    SizeV9Final = erlang:length(V9Final),
    V10_bin = encode_p_tests(V10Final, <<>>),
    SizeV10Final = erlang:length(V10Final),
    <<Msg_idFinal:32/signed,V1Final:8/signed,V2Final:16/signed,V3Final:16/unsigned,V4Final:32/signed,V5Final:32/unsigned,V6Final:64/signed,V7Len:16, V72/binary,V8_bin/binary,SizeV9Final:16, V9_bin/binary,SizeV10Final:16, V10_bin/binary>>;

encode_998(_) -> <<>>.

decode_998(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
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

decode_998(_) ->
    undefined.

encode_6001(Record) when is_record(Record, m__arena__match__s2c) ->
    #m__arena__match__s2c{msg_id=Msg_id,seed=Seed} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            6001;
        false ->
            Msg_id
    end,
    SeedFinal =
    case Seed =:= undefined of
        true ->
            throw({required_field_not_assigned, m__arena__match__s2c, seed}),
            undefined;
        false ->
            Seed
    end,
    <<Msg_idFinal:32/signed,SeedFinal:32/signed>>;

encode_6001(_) -> <<>>.

decode_6001(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Seed:32/signed>> = Bin0,
    {m__arena__match__s2c, Msg_id,Seed};

decode_6001(_) ->
    undefined.

encode_999(Record) when is_record(Record, m__proto__test__s2c) ->
    #m__proto__test__s2c{msg_id=Msg_id,v1=V1,v2=V2,v3=V3,v4=V4,v5=V5,v6=V6,v7=V7,v8=V8,v9=V9,v10=V10} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            999;
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
    V9_bin = encode_int32s(V9Final, <<>>),
    SizeV9Final = erlang:length(V9Final),
    V10_bin = encode_p_tests(V10Final, <<>>),
    SizeV10Final = erlang:length(V10Final),
    <<Msg_idFinal:32/signed,V1Final:8/signed,V2Final:16/signed,V3Final:16/unsigned,V4Final:32/signed,V5Final:32/unsigned,V6Final:64/signed,V7Len:16, V72/binary,V8_bin/binary,SizeV9Final:16, V9_bin/binary,SizeV10Final:16, V10_bin/binary>>;

encode_999(_) -> <<>>.

decode_999(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
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

decode_999(_) ->
    undefined.

encode_1106(Record) when is_record(Record, m__role__info__c2s) ->
    #m__role__info__c2s{msg_id=Msg_id,id=Id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1106;
        false ->
            Msg_id
    end,
    IdFinal =
    case Id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__info__c2s, id}),
            undefined;
        false ->
            Id
    end,
    <<Msg_idFinal:32/signed,IdFinal:32/signed>>;

encode_1106(_) -> <<>>.

decode_1106(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Id:32/signed>> = Bin0,
    {m__role__info__c2s, Msg_id,Id};

decode_1106(_) ->
    undefined.

encode_6000(Record) when is_record(Record, m__arena__match__c2s) ->
    #m__arena__match__c2s{msg_id=Msg_id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            6000;
        false ->
            Msg_id
    end,
    <<Msg_idFinal:32/signed>>;

encode_6000(_) -> <<>>.

decode_6000(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed>> = Bin0,
    {m__arena__match__c2s, Msg_id};

decode_6000(_) ->
    undefined.

encode_p_role(Record) when is_record(Record, p_role) ->
    #p_role{id=Id} = Record,
    IdFinal =
    case Id =:= undefined of
        true ->
            throw({required_field_not_assigned, p_role, id}),
            undefined;
        false ->
            Id
    end,
    <<IdFinal:32/signed>>;

encode_p_role(_) -> <<>>.

decode_p_role(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Id:32/signed>> = Bin0,
    {p_role, Id};

decode_p_role(_) ->
    undefined.

encode_1107(Record) when is_record(Record, m__role__info__s2c) ->
    #m__role__info__s2c{msg_id=Msg_id,role_info=Role_info} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1107;
        false ->
            Msg_id
    end,
    Role_infoFinal =
    case Role_info =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__info__s2c, role_info}),
            undefined;
        false ->
            Role_info
    end,
    Role_info_bin = encode_p_role(Role_infoFinal),
    <<Msg_idFinal:32/signed,Role_info_bin/binary>>;

encode_1107(_) -> <<>>.

decode_1107(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,_SubBinSizerole_info:32, SubBinrole_info/binary>> = Bin0,
    Role_info = decode_p_role(SubBinrole_info),
    {m__role__info__s2c, Msg_id,Role_info};

decode_1107(_) ->
    undefined.

encode_1000(Record) when is_record(Record, m__system__heartbeat__c2s) ->
    #m__system__heartbeat__c2s{msg_id=Msg_id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1000;
        false ->
            Msg_id
    end,
    <<Msg_idFinal:32/signed>>;

encode_1000(_) -> <<>>.

decode_1000(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed>> = Bin0,
    {m__system__heartbeat__c2s, Msg_id};

decode_1000(_) ->
    undefined.

encode_1105(Record) when is_record(Record, m__role__login__s2c) ->
    #m__role__login__s2c{msg_id=Msg_id,role_info=Role_info} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1105;
        false ->
            Msg_id
    end,
    Role_infoFinal =
    case Role_info =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__login__s2c, role_info}),
            undefined;
        false ->
            Role_info
    end,
    Role_info_bin = encode_p_role(Role_infoFinal),
    <<Msg_idFinal:32/signed,Role_info_bin/binary>>;

encode_1105(_) -> <<>>.

decode_1105(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,_SubBinSizerole_info:32, SubBinrole_info/binary>> = Bin0,
    Role_info = decode_p_role(SubBinrole_info),
    {m__role__login__s2c, Msg_id,Role_info};

decode_1105(_) ->
    undefined.

encode_1100(Record) when is_record(Record, m__account__login__c2s) ->
    #m__account__login__c2s{msg_id=Msg_id,account_id=Account_id,ticket=Ticket,platform=Platform,server_id=Server_id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1100;
        false ->
            Msg_id
    end,
    Account_idFinal =
    case Account_id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__account__login__c2s, account_id}),
            undefined;
        false ->
            Account_id
    end,
    TicketFinal =
    case Ticket =:= undefined of
        true ->
            throw({required_field_not_assigned, m__account__login__c2s, ticket}),
            undefined;
        false ->
            Ticket
    end,
    PlatformFinal =
    case Platform =:= undefined of
        true ->
            throw({required_field_not_assigned, m__account__login__c2s, platform}),
            undefined;
        false ->
            Platform
    end,
    Server_idFinal =
    case Server_id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__account__login__c2s, server_id}),
            undefined;
        false ->
            Server_id
    end,
    Account_id2 = if is_bitstring(Account_idFinal) -> Account_idFinal; true -> list_to_binary(Account_idFinal) end,
    Account_idLen = erlang:byte_size(Account_id2),
    Ticket2 = if is_bitstring(TicketFinal) -> TicketFinal; true -> list_to_binary(TicketFinal) end,
    TicketLen = erlang:byte_size(Ticket2),
    <<Msg_idFinal:32/signed,Account_idLen:16, Account_id2/binary,TicketLen:16, Ticket2/binary,PlatformFinal:32/signed,Server_idFinal:32/signed>>;

encode_1100(_) -> <<>>.

decode_1100(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Account_idLen:16, Bin1/binary>> = Bin0,
    <<Account_id:Account_idLen/binary,TicketLen:16, Bin2/binary>> = Bin1,
    <<Ticket:TicketLen/binary,Platform:32/signed,Server_id:32/signed>> = Bin2,
    {m__account__login__c2s, Msg_id,Account_id,Ticket,Platform,Server_id};

decode_1100(_) ->
    undefined.

encode_1103(Record) when is_record(Record, m__role__create__s2c) ->
    #m__role__create__s2c{msg_id=Msg_id,id=Id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1103;
        false ->
            Msg_id
    end,
    IdFinal =
    case Id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__create__s2c, id}),
            undefined;
        false ->
            Id
    end,
    <<Msg_idFinal:32/signed,IdFinal:32/signed>>;

encode_1103(_) -> <<>>.

decode_1103(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Id:32/signed>> = Bin0,
    {m__role__create__s2c, Msg_id,Id};

decode_1103(_) ->
    undefined.

encode_1101(Record) when is_record(Record, m__role__list__s2c) ->
    #m__role__list__s2c{msg_id=Msg_id,role_list=Role_list} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1101;
        false ->
            Msg_id
    end,
    case Role_list =:= undefined of
        true ->
            Role_listFinal = [];
        false ->
            Role_listFinal = Role_list
    end,
    Role_list_bin = encode_p_roles(Role_listFinal, <<>>),
    SizeRole_listFinal = erlang:length(Role_listFinal),
    <<Msg_idFinal:32/signed,SizeRole_listFinal:16, Role_list_bin/binary>>;

encode_1101(_) -> <<>>.

decode_1101(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,_Sizerole_list:16, _BinLenrole_list:32, SubBinrole_list/binary>> = Bin0,
    Role_list = lists:reverse(decode_p_roles(SubBinrole_list, [])),
    {m__role__list__s2c, Msg_id,Role_list};

decode_1101(_) ->
    undefined.

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

encode_1102(Record) when is_record(Record, m__role__create__c2s) ->
    #m__role__create__c2s{msg_id=Msg_id,name=Name} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1102;
        false ->
            Msg_id
    end,
    NameFinal =
    case Name =:= undefined of
        true ->
            throw({required_field_not_assigned, m__role__create__c2s, name}),
            undefined;
        false ->
            Name
    end,
    Name2 = if is_bitstring(NameFinal) -> NameFinal; true -> list_to_binary(NameFinal) end,
    NameLen = erlang:byte_size(Name2),
    <<Msg_idFinal:32/signed,NameLen:16, Name2/binary>>;

encode_1102(_) -> <<>>.

decode_1102(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,NameLen:16, Bin1/binary>> = Bin0,
    <<Name:NameLen/binary>> = Bin1,
    {m__role__create__c2s, Msg_id,Name};

decode_1102(_) ->
    undefined.

encode_5001(Record) when is_record(Record, m__scene__neighbours__s2c) ->
    #m__scene__neighbours__s2c{msg_id=Msg_id,roles=Roles} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            5001;
        false ->
            Msg_id
    end,
    case Roles =:= undefined of
        true ->
            RolesFinal = [];
        false ->
            RolesFinal = Roles
    end,
    Roles_bin = encode_p_poss(RolesFinal, <<>>),
    SizeRolesFinal = erlang:length(RolesFinal),
    <<Msg_idFinal:32/signed,SizeRolesFinal:16, Roles_bin/binary>>;

encode_5001(_) -> <<>>.

decode_5001(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,_Sizeroles:16, _BinLenroles:32, SubBinroles/binary>> = Bin0,
    Roles = lists:reverse(decode_p_poss(SubBinroles, [])),
    {m__scene__neighbours__s2c, Msg_id,Roles};

decode_5001(_) ->
    undefined.

encode_1001(Record) when is_record(Record, m__system__notify__s2c) ->
    #m__system__notify__s2c{msg_id=Msg_id,code=Code} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            1001;
        false ->
            Msg_id
    end,
    CodeFinal =
    case Code =:= undefined of
        true ->
            throw({required_field_not_assigned, m__system__notify__s2c, code}),
            undefined;
        false ->
            Code
    end,
    <<Msg_idFinal:32/signed,CodeFinal:32/signed>>;

encode_1001(_) -> <<>>.

decode_1001(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Code:32/signed>> = Bin0,
    {m__system__notify__s2c, Msg_id,Code};

decode_1001(_) ->
    undefined.

encode_p_pos(Record) when is_record(Record, p_pos) ->
    #p_pos{role_id=Role_id,role_name=Role_name,job=Job,level=Level,pos_x=Pos_x,pos_y=Pos_y,dest_x=Dest_x,dest_y=Dest_y,weapon=Weapon,armor=Armor,wing=Wing,title_id=Title_id} = Record,
    Role_idFinal =
    case Role_id =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, role_id}),
            undefined;
        false ->
            Role_id
    end,
    Role_nameFinal =
    case Role_name =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, role_name}),
            undefined;
        false ->
            Role_name
    end,
    JobFinal =
    case Job =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, job}),
            undefined;
        false ->
            Job
    end,
    LevelFinal =
    case Level =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, level}),
            undefined;
        false ->
            Level
    end,
    Pos_xFinal =
    case Pos_x =:= undefined of
        true ->
            0;
        false ->
            Pos_x
    end,
    Pos_yFinal =
    case Pos_y =:= undefined of
        true ->
            0;
        false ->
            Pos_y
    end,
    Dest_xFinal =
    case Dest_x =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, dest_x}),
            undefined;
        false ->
            Dest_x
    end,
    Dest_yFinal =
    case Dest_y =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, dest_y}),
            undefined;
        false ->
            Dest_y
    end,
    WeaponFinal =
    case Weapon =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, weapon}),
            undefined;
        false ->
            Weapon
    end,
    ArmorFinal =
    case Armor =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, armor}),
            undefined;
        false ->
            Armor
    end,
    WingFinal =
    case Wing =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, wing}),
            undefined;
        false ->
            Wing
    end,
    Title_idFinal =
    case Title_id =:= undefined of
        true ->
            throw({required_field_not_assigned, p_pos, title_id}),
            undefined;
        false ->
            Title_id
    end,
    Role_id2 = if is_bitstring(Role_idFinal) -> Role_idFinal; true -> list_to_binary(Role_idFinal) end,
    Role_idLen = erlang:byte_size(Role_id2),
    Role_name2 = if is_bitstring(Role_nameFinal) -> Role_nameFinal; true -> list_to_binary(Role_nameFinal) end,
    Role_nameLen = erlang:byte_size(Role_name2),
    Weapon2 = if is_bitstring(WeaponFinal) -> WeaponFinal; true -> list_to_binary(WeaponFinal) end,
    WeaponLen = erlang:byte_size(Weapon2),
    Armor2 = if is_bitstring(ArmorFinal) -> ArmorFinal; true -> list_to_binary(ArmorFinal) end,
    ArmorLen = erlang:byte_size(Armor2),
    Wing2 = if is_bitstring(WingFinal) -> WingFinal; true -> list_to_binary(WingFinal) end,
    WingLen = erlang:byte_size(Wing2),
    <<Role_idLen:16, Role_id2/binary,Role_nameLen:16, Role_name2/binary,JobFinal:32/signed,LevelFinal:16/signed,Pos_xFinal:32/signed,Pos_yFinal:32/signed,Dest_xFinal:32/signed,Dest_yFinal:32/signed,WeaponLen:16, Weapon2/binary,ArmorLen:16, Armor2/binary,WingLen:16, Wing2/binary,Title_idFinal:32/signed>>;

encode_p_pos(_) -> <<>>.

decode_p_pos(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Role_idLen:16, Bin1/binary>> = Bin0,
    <<Role_id:Role_idLen/binary,Role_nameLen:16, Bin2/binary>> = Bin1,
    <<Role_name:Role_nameLen/binary,Job:32/signed,Level:16/signed,Pos_x:32/signed,Pos_y:32/signed,Dest_x:32/signed,Dest_y:32/signed,WeaponLen:16, Bin3/binary>> = Bin2,
    <<Weapon:WeaponLen/binary,ArmorLen:16, Bin4/binary>> = Bin3,
    <<Armor:ArmorLen/binary,WingLen:16, Bin5/binary>> = Bin4,
    <<Wing:WingLen/binary,Title_id:32/signed>> = Bin5,
    {p_pos, Role_id,Role_name,Job,Level,Pos_x,Pos_y,Dest_x,Dest_y,Weapon,Armor,Wing,Title_id};

decode_p_pos(_) ->
    undefined.

encode_5009(Record) when is_record(Record, m__scene__enter__c2s) ->
    #m__scene__enter__c2s{msg_id=Msg_id,scene_id=Scene_id} = Record,
    Msg_idFinal =
    case Msg_id =:= undefined of
        true ->
            5009;
        false ->
            Msg_id
    end,
    Scene_idFinal =
    case Scene_id =:= undefined of
        true ->
            throw({required_field_not_assigned, m__scene__enter__c2s, scene_id}),
            undefined;
        false ->
            Scene_id
    end,
    <<Msg_idFinal:32/signed,Scene_idFinal:32/signed>>;

encode_5009(_) -> <<>>.

decode_5009(Bin0) when erlang:is_binary(Bin0) andalso erlang:byte_size(Bin0) > 0 ->
    <<Msg_id:32/signed,Scene_id:32/signed>> = Bin0,
    {m__scene__enter__c2s, Msg_id,Scene_id};

decode_5009(_) ->
    undefined.

encode_p_roles([], Bin) ->
    Bin;
encode_p_roles([H|T], Bin) ->
    NewBin = encode_p_role(H),
    encode_p_roles(T, <<Bin/binary, NewBin/binary>>).
encode_p_poss([], Bin) ->
    Bin;
encode_p_poss([H|T], Bin) ->
    NewBin = encode_p_pos(H),
    encode_p_poss(T, <<Bin/binary, NewBin/binary>>).
encode_p_tests([], Bin) ->
    Bin;
encode_p_tests([H|T], Bin) ->
    NewBin = encode_p_test(H),
    encode_p_tests(T, <<Bin/binary, NewBin/binary>>).
decode_p_roles(<<>>, List) ->
    List;
decode_p_roles(Bin, List) ->    <<SubBinSize:32, Bin2/binary>> = Bin,
    <<SubBin:SubBinSize/binary, Bin3/binary>> = Bin2,    TmpRecord = decode_p_role(SubBin),
    decode_p_roles(Bin3, [TmpRecord|List]).
decode_p_poss(<<>>, List) ->
    List;
decode_p_poss(Bin, List) ->    <<SubBinSize:32, Bin2/binary>> = Bin,
    <<SubBin:SubBinSize/binary, Bin3/binary>> = Bin2,    TmpRecord = decode_p_pos(SubBin),
    decode_p_poss(Bin3, [TmpRecord|List]).
decode_p_tests(<<>>, List) ->
    List;
decode_p_tests(Bin, List) ->    <<SubBinSize:32, Bin2/binary>> = Bin,
    <<SubBin:SubBinSize/binary, Bin3/binary>> = Bin2,    TmpRecord = decode_p_test(SubBin),
    decode_p_tests(Bin3, [TmpRecord|List]).
