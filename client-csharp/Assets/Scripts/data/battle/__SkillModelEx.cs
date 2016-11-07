using UnityEngine;
using System.Collections;
using Engine;
using System.Collections.Generic;
using System.IO;

public class __SkillModelEx : BaseModel
{
    private Dictionary<int, SkillInfo> m_dicSkillInfo;

    public __SkillModelEx()
    {
        m_dicSkillInfo = new Dictionary<int, SkillInfo>();
        byte[] bytes = ConfigMgr.Instance.GetBytes("SkillConfig");
        MemoryStream stream = new MemoryStream(bytes);
        BinaryReader br = new BinaryReader(stream);
        int num = br.ReadByte();
        for (int i = 0; i < num; i++)
        {
            InitSkillConfig(br);
        }
    }

#if UNITY_EDITOR
    public void ResetSkillInfo(SkillInfo skillInfo)
    {
        m_dicSkillInfo[skillInfo.id] = skillInfo;
    }
#endif

    private void InitSkillConfig(BinaryReader br)
    {
        SkillInfo info = new SkillInfo();
        info.Read(br);
        m_dicSkillInfo[info.id] = info;
    }

    public SkillInfo GetSkillInfo(int id)
    {
        return m_dicSkillInfo.GetValue(id);
    }
}