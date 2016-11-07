-module(netsake).
-include("gate.hrl").

-compile(export_all).

net_packet_init() ->
    #netcache{need_len = 0, bin = <<>>}.

net_packet(CurNetBin, NetCache) ->
    #netcache{need_len = NeedLen, bin = Bin} = NetCache,
    NetBin = 
    case CurNetBin of
        [] -> Bin;
        _ -> l2b([Bin|CurNetBin])
    end,

    BinSize = bsz(NetBin),

    case NeedLen of
        0 when BinSize >= 2 ->
            <<NeedLen1:16, Rest/binary>> = NetBin,
            case bsz(Rest) >= NeedLen1 of
                true ->
                    <<NeedBin:NeedLen1/binary, Rest1/binary>> = Rest,
                    {NetCache#netcache{need_len = 0, bin = Rest1}, NeedBin};
                false ->
                    {NetCache#netcache{need_len = NeedLen1, bin = Rest}, false}
            end;
        0 ->
            {NetCache#netcache{need_len = 0, bin = NetBin}, false};
        NeedLen when BinSize >= NeedLen ->
            <<NeedBin:NeedLen/binary, Rest/binary>> = NetBin,
            {NetCache#netcache{need_len = 0, bin = Rest}, NeedBin};
        _ ->
            {NetCache#netcache{need_len = NeedLen, bin = NetBin}, false}
    end.

l2b(L) -> erlang:list_to_binary(L).
bsz(B) -> erlang:byte_size(B).
    
