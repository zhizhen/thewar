using System;
using Engine;
using System.Collections.Generic;
public class m__arena__match__c2s : ProtoBase
{
    public m__arena__match__c2s()
    {
        proto_id = 6000;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
    }
}
