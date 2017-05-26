using System;
using Engine;
using System.Collections.Generic;
public class m__role__create__s2c : ProtoBase
{
    public Int32 id;
    public m__role__create__s2c()
    {
        proto_id = 1103;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        id = byteArray.ReadInt32();
    }
}
