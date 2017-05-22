%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 29 Jan 2013 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(goddess_net).

-include("logger.hrl").
-include("game_pb.hrl").
-include("goddess.hrl").

%% API
-export([
        recv/2,
        recv/3,
        send/2,
        send_list/2,
        broadcast/2,
        pack/1,
        unpack/2,
        decode/1,
        encode/1
        ]).

-define(RECV_MAX_LEN, 1024).        % 接收的最大包长
-define(RECV_TIMEOUT, 60 * 1000).  % 接收数据包超时时间
-define(PACKET_HEADER_LENGTH, 4). % 数据包头字节数，数据包头二进制位数为：?PACKET_HEADER_LENGTH * 8
-define(PACKAGE_ZIP_LINE,   300000).
%%%===================================================================
%%% API
%%%===================================================================

%% @doc 接收socket数据包并将其解包
recv(Sock, Step) ->
    %% 接收数据包头
    case recv(Sock, ?PACKET_HEADER_LENGTH, ?RECV_TIMEOUT) of
        %% 处理HTTP GET请求
        {ok, <<"GET ">>} ->
            case recv(Sock, 0, ?RECV_TIMEOUT) of
                {ok, DataBin} ->
                    {ok, http_get, DataBin};
                {error, _}=Error ->
                    Error;
                {'EXIT', _, _}=Exit ->
                    Exit
            end;
        %% 处理HTTP POST请求
        {ok, <<"POST">>} ->
            case recv(Sock, 0, ?RECV_TIMEOUT) of
                {ok, DataBin} ->
                    {ok, http_post, DataBin};
                {error, _}=Error ->
                    Error;
                {'EXIT', _, _}=Exit ->
                    Exit
            end;
        {ok, <<PacketLen:32>>} ->
            case PacketLen >= ?RECV_MAX_LEN of
                false ->
                    %% 接收数据包体
                    case recv(Sock, PacketLen, ?RECV_TIMEOUT) of
                        {ok, DataBin} ->
                            {Mod, Fun, DataRecord} = unpack(DataBin, Step),
                            {ok, {Mod, Fun, DataRecord}};
                        {error, _}=Error ->
                            Error;
                        {'EXIT', _, _}=Exit ->
                            Exit
                    end;
                true ->
                    {error, PacketLen}
            end;
        {error, _}=Error ->
            Error;
        {'EXIT', _, _}=Exit ->
            Exit
    end.

%% @doc 接收socket数据及进程消息
recv(Sock, Length, Timeout) when is_port(Sock), is_integer(Length), Length >= 0 ->
    case prim_inet:async_recv(Sock, Length, Timeout) of
        {ok, _Ref} ->
            receive
                {inet_async, Sock, _Ref, Status} ->
                    Status;
                {'EXIT', Sock, _Reason} ->
                    {error, closed};
                {'EXIT', From, Reason} when is_pid(From) ->
                    {'EXIT', From, Reason}
            end;
        {error, _}=Error ->
            ?DEBUG_MSG("async error socket:~p~n", [{Sock, inet:peername(Sock)}]),
            Error
    end.

%% @doc 发送封包后的socket数据包
send(Sock, Data) ->
%%     ?DEBUG_MSG("SEND DATA: ~p~n", [Data]),
    DataBin = pack(Data),
    gen_tcp:send(Sock, DataBin).

send_list(Sock, Data) when is_list(Data) ->
    DataBin = erlang:list_to_binary([ pack(D) || D <- Data]),
    gen_tcp:send(Sock, DataBin).

%% @doc 广播封包后的socket数据包
broadcast(SockList, Data) ->
    DataBin = pack(Data),
    [gen_tcp:send(Sock, DataBin) || Sock <- SockList].

%% @doc 对需要发送的数据进行封包，erlang record类型数据需要编码处理
pack(Data) when is_binary(Data) ->
    pack0(Data);
pack(Data) ->
    pack0(encode(Data)).

%% @doc 对需要发送的数据进行封包
pack0(Data) ->
    DataBin = case erlang:byte_size(Data) >= ?PACKAGE_ZIP_LINE of
        true ->
            DataCompress = zlib:compress(Data),
            <<1:8, DataCompress/binary>>;
        false ->
            <<0:8, Data/binary>>
    end,

    PacketLen = erlang:byte_size(DataBin),
    <<PacketLen:32, DataBin/binary>>.

%% @doc 对接收的数据进行解包
unpack(Bin, no_xxtea) ->
    try
        <<Compress:8, DataBin/binary>> = Bin,
        case Compress of
            0 -> decode(DataBin);
            1 -> decode(zlib:uncompress(DataBin))
        end
    catch
        _Class:Reason ->
            {error, Reason}
    end;

unpack(Bin, Step) ->
    try
        HashKey = util:to_list(?PROTOCOL_KEY) ++ util:to_list(Step),
        DecryptoBin = xxtea:decrypt(Bin, HashKey),
        unpack(DecryptoBin, no_xxtea)
    catch
        _Class:Reason ->
            {error, Reason}
    end.


%% @doc 解码二进制数据为erlang record类型数据
decode(DataBin) ->
    case game_pb:decode(DataBin) of
        {ok, Data} ->
%%             catch ?DEBUG_MSG("RECV DATA: ~p~n", [Data]),
            Data;
        {error, Reason} ->
            throw({game_pb_cannot_decode, {Reason, DataBin}})
    end.

%% @doc 编码erlang record类型数据为二进制数据
encode(DataRecord) ->
    case game_pb:encode(DataRecord) of
        {ok, DataBin} ->
            DataBin;
        {error, Reason} ->
            throw({game_pb_cannot_encode, {Reason, DataRecord}})
    end.
