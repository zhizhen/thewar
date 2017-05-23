using System;
using Engine;
using System.Collections.Generic;
public class m__role__create__c2s : ProtoBase
{
    public string name;
    public Int32 job;
    public m__role__create__c2s()
    {
        proto_id = 1102;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.Writestring(name);
        byteArray.WriteInt32(job);
    }
}
