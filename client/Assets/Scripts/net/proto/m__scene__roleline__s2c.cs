using System;
using Engine;
using System.Collections.Generic;
public class m__scene__roleline__s2c : ProtoBase
{
    public Int32 line;
    public List<Int32> openlines = new List<Int32> ();
    public m__scene__roleline__s2c()
    {
        proto_id = 5011;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        line = byteArray.ReadInt32();
        short sLen = 0;
        int i = 0;

        sLen = byteArray.Readshort();
        for (i = 0; i < sLen; i++) {
            openlines.Add(byteArray.ReadInt32());
        }
    }
}
