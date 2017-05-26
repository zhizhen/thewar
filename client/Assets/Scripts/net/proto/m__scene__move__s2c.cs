using System;
using Engine;
using System.Collections.Generic;
public class m__scene__move__s2c : ProtoBase
{
    public p_pos role_summary = new p_pos ();
    public m__scene__move__s2c()
    {
        proto_id = 5003;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        role_summary.read(byteArray);
    }
}
