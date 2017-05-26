using System;
using Engine;
using System.Collections.Generic;
public class m__scene__move__c2s : ProtoBase
{
    public Int32 dest_x;
    public Int32 dest_y;
    public m__scene__move__c2s()
    {
        proto_id = 5002;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.WriteInt32(dest_x);
        byteArray.WriteInt32(dest_y);
    }
}
