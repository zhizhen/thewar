using System;
using Engine;
using System.Collections.Generic;
public class m__role__login__c2s : ProtoBase
{
    public m__role__login__c2s()
    {
        proto_id = 1001;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
    }
}
