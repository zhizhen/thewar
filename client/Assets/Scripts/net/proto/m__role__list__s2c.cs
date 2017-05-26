using System;
using Engine;
using System.Collections.Generic;
public class m__role__list__s2c : ProtoBase
{
    public List<p_role> role_list = new List<p_role> ();
    public m__role__list__s2c()
    {
        proto_id = 1101;
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
            p_role kp_role = new p_role ();
            kp_role.read(byteArray);
            role_list.Add(kp_role);
        }
    }
}
