using System;
using Engine;
using System.Collections.Generic;
public class m__scene__switch_line__c2s : ProtoBase
{
    public Int32 line_id;
    public m__scene__switch_line__c2s()
    {
        proto_id = 5010;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.WriteInt32(line_id);
    }
}
