using System;
using Engine;
using System.Collections.Generic;
public class m__proto__test__s2c : ProtoBase
{
    public byte v1;
    public short v2;
    public ushort v3;
    public Int32 v4;
    public UInt32 v5;
    public Int64 v6;
    public string v7;
    public p_test v8 = new p_test ();
    public List<Int32> v9 = new List<Int32> ();
    public List<p_test> v10 = new List<p_test> ();
    public m__proto__test__s2c()
    {
        proto_id = 1001;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        v1 = byteArray.Readbyte();
        v2 = byteArray.Readshort();
        v3 = byteArray.Readushort();
        v4 = byteArray.ReadInt32();
        v5 = byteArray.ReadUInt32();
        v6 = byteArray.ReadInt64();
        v7 = byteArray.Readstring();
        v8.read(byteArray);
        short sLen = 0;
        int i = 0;

        sLen = byteArray.Readshort();
        for (i = 0; i < sLen; i++) {
            v9.Add(byteArray.ReadInt32());
        }

        sLen = byteArray.Readshort();
        for (i = 0; i < sLen; i++) {
            p_test kp_test = new p_test ();
            kp_test.read(byteArray);
            v10.Add(kp_test);
        }
    }
}
