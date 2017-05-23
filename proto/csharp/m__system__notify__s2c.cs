using System;
using Engine;
using System.Collections.Generic;
public class m__system__notify__s2c : ProtoBase
{
    public Int32 code;
    public m__system__notify__s2c()
    {
        proto_id = 1001;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        code = byteArray.ReadInt32();
    }
}
