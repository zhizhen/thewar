using System;
using Engine;
using System.Collections.Generic;
public class m__action__ready_to_start__s2c : ProtoBase
{
    public Int32 role_id;
    public m__action__ready_to_start__s2c()
    {
        proto_id = 7001;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        role_id = byteArray.ReadInt32();
    }
}
