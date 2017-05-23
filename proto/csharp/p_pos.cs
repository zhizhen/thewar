using System;
using Engine;
using System.Collections.Generic;
public class p_pos : ProtoBase
{
    public string role_id;
    public string role_name;
    public Int32 job;
    public short level;
    public Int32 pos_x;
    public Int32 pos_y;
    public Int32 dest_x;
    public Int32 dest_y;
    public string weapon;
    public string armor;
    public string wing;
    public Int32 title_id;
    public p_pos()
    {

    }
    public override void read(ByteArray byteArray)
    {
        role_id = byteArray.Readstring();
        role_name = byteArray.Readstring();
        job = byteArray.ReadInt32();
        level = byteArray.Readshort();
        pos_x = byteArray.ReadInt32();
        pos_y = byteArray.ReadInt32();
        dest_x = byteArray.ReadInt32();
        dest_y = byteArray.ReadInt32();
        weapon = byteArray.Readstring();
        armor = byteArray.Readstring();
        wing = byteArray.Readstring();
        title_id = byteArray.ReadInt32();
    }
    public override void write(ByteArray byteArray)
    {
        byteArray.Writestring(role_id);
        byteArray.Writestring(role_name);
        byteArray.WriteInt32(job);
        byteArray.Writeshort(level);
        byteArray.WriteInt32(pos_x);
        byteArray.WriteInt32(pos_y);
        byteArray.WriteInt32(dest_x);
        byteArray.WriteInt32(dest_y);
        byteArray.Writestring(weapon);
        byteArray.Writestring(armor);
        byteArray.Writestring(wing);
        byteArray.WriteInt32(title_id);
    }
}
