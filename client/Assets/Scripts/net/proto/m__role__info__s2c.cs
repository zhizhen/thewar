using System;
using Engine;
using System.Collections.Generic;
public class m__role__info__s2c : ProtoBase
{
    public p_role role_info = new p_role ();
    public m__role__info__s2c()
    {
        proto_id = 1107;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        role_info.read(byteArray);
    }
}
