using System;
using Engine;
using System.Collections.Generic;
public class m__action__confirm__s2c : ProtoBase
{
    public Int32 turn_id;
    public Int32 role_id;
    public m__action__confirm__s2c()
    {
        proto_id = 7007;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        turn_id = byteArray.ReadInt32();
        role_id = byteArray.ReadInt32();
    }
}
