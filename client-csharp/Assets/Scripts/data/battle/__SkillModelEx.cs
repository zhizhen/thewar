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
    }

#if UNITY_EDITOR
    public void ResetSkillInfo(SkillInfo skillInfo)
    {
        m_dicSkillInfo[skillInfo.id] = skillInfo;
    }
#endif
}