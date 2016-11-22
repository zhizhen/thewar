using System;
using Engine;
using System.Collections.Generic;
public class p_test : ProtoBase
{
    public Int32 v1;
    public Int32 v2;
    public p_test()
    {

    }
    public override void read(ByteArray byteArray)
    {
        v1 = byteArray.ReadInt32();
        v2 = byteArray.ReadInt32();
    }
    public override void write(ByteArray byteArray)
    {
        byteArray.WriteInt32(v1);
        byteArray.WriteInt32(v2);
    }
}
