using System;
using Engine;
using System.Collections.Generic;
public class m__arena__match__s2c : ProtoBase
{
    public Int32 seed;
    public m__arena__match__s2c()
    {
        proto_id = 6001;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        seed = byteArray.ReadInt32();
    }
}
