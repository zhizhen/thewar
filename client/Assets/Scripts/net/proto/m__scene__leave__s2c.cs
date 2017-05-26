using System;
using Engine;
using System.Collections.Generic;
public class m__scene__leave__s2c : ProtoBase
{
    public string role_id;
    public m__scene__leave__s2c()
    {
        proto_id = 5006;
    }
    public override void read(ByteArray byteArray)
    {
        base.read(byteArray);
        role_id = byteArray.Readstring();
    }
}
