using System;
using Engine;
using System.Collections.Generic;
public class m__scene__stop__c2s : ProtoBase
{
    public m__scene__stop__c2s()
    {
        proto_id = 5007;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
    }
}
