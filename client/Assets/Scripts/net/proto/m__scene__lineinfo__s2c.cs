using System;
using Engine;
using System.Collections.Generic;
public class m__scene__lineinfo__s2c : ProtoBase
{
    public List<Int32> openlines = new List<Int32> ();
    public m__scene__lineinfo__s2c()
    {
        proto_id = 5012;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        short sLen = 0;
        int i = 0;
        byteArray.ReadInt32 ();//erlang decode

        sLen = byteArray.Readshort();
        for (i = 0; i < sLen; i++) {
            openlines.Add(byteArray.ReadInt32());
        }
    }
}
