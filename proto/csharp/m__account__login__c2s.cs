using System;
using Engine;
using System.Collections.Generic;
public class m__account__login__c2s : ProtoBase
{
    public string account_id;
    public string ticket;
    public Int32 platform;
    public Int32 server_id;
    public m__account__login__c2s()
    {
        proto_id = 1100;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.Writestring(account_id);
        byteArray.Writestring(ticket);
        byteArray.WriteInt32(platform);
        byteArray.WriteInt32(server_id);
    }
}
