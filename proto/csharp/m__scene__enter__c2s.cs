using System;
using Engine;
using System.Collections.Generic;
public class m__scene__enter__c2s : ProtoBase
{
    public Int32 scene_id;
    public m__scene__enter__c2s()
    {
        proto_id = 5009;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.WriteInt32(scene_id);
    }
}
