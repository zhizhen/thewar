using System;
using Engine;
using System.Collections.Generic;
public class p_role : ProtoBase
{
    public Int32 id;
    public p_role()
    {

    }
    public override void read(ByteArray byteArray)
    {
        id = byteArray.ReadInt32();
    }
    public override void write(ByteArray byteArray)
    {
        byteArray.WriteInt32(id);
    }
}
