using System;
using Engine;
using System.Collections.Generic;
public class m__system__heartbeat__c2s : ProtoBase
{
    public m__system__heartbeat__c2s()
    {
        proto_id = 1000;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
    }
}
