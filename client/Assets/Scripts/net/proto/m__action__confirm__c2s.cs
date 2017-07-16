using System;
using Engine;
using System.Collections.Generic;
public class m__action__confirm__c2s : ProtoBase
{
    public Int32 turn_id;
    public Int32 role_id;
    public m__action__confirm__c2s()
    {
        proto_id = 7006;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.WriteInt32(turn_id);
        byteArray.WriteInt32(role_id);
    }
}
