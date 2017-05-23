using System;
using Engine;
using System.Collections.Generic;
public class m__scene__update_pos__c2s : ProtoBase
{
    public Int32 pos_x;
    public Int32 pos_y;
    public m__scene__update_pos__c2s()
    {
        proto_id = 5004;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.WriteInt32(pos_x);
        byteArray.WriteInt32(pos_y);
    }
}
