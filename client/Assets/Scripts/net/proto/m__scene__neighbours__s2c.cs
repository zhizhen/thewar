using System;
using Engine;
using System.Collections.Generic;
public class m__scene__neighbours__s2c : ProtoBase
{
    public List<p_pos> roles = new List<p_pos> ();
    public m__scene__neighbours__s2c()
    {
        proto_id = 5001;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        short sLen = 0;
        int i = 0;
        byteArray.ReadInt32 ();//erlang decode

        sLen = byteArray.Readshort();
        for (i = 0; i < sLen; i++) {
            byteArray.ReadInt32 ();//erlang decode
            p_pos kp_pos = new p_pos ();
            kp_pos.read(byteArray);
            roles.Add(kp_pos);
        }
    }
}
