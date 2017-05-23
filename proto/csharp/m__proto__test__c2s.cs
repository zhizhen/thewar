using System;
using Engine;
using System.Collections.Generic;
public class m__proto__test__c2s : ProtoBase
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
    public m__proto__test__c2s()
    {
        proto_id = 998;
    }
    public override void write(ByteArray byteArray)
    {
        base.write(byteArray);
        byteArray.WriteInt32(proto_id);
        byteArray.Writebyte(v1);
        byteArray.Writeshort(v2);
        byteArray.Writeushort(v3);
        byteArray.WriteInt32(v4);
        byteArray.WriteUInt32(v5);
        byteArray.WriteInt64(v6);
        byteArray.Writestring(v7);

        v8.write(byteArray);
        short sLen = 0;
        int i = 0;

        sLen = (short)v9.Count;
        byteArray.Writeshort(sLen);
        for (i = 0; i < sLen; i++) {
            byteArray.WriteInt32(v9[i]);
        }
        sLen = (short)v10.Count;
        byteArray.Writeshort(sLen);
        for (i = 0; i < sLen; i++) {
            v10[i].write(byteArray);
        }    }
}
