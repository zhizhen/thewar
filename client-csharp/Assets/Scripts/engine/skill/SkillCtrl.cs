using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Engine;

public class SkillCtrl : GlobalBase
{
    private Skill _executeSkill;
    private List<Skill> _skillList;
    private Dictionary<int, int> _skillDic;
    private float _lastTime;

    public SkillCtrl(EntityBase own)
        : base(own)
    {
        _skillList = new List<Skill>();
        _skillDic = new Dictionary<int, int>();
        _lastTime = Time.time;
    }

    public void UseSkill(int id, int lv, EntityBase target, Vector3? preBeginPos, Vector3? preBeginDir, Vector3? preEndPos)
    {
        Skill skill = CreateSkill(id);
        if (skill != null)
        {
            _executeSkill = skill;
            _executeSkill.Begin(preBeginPos, preBeginDir, preEndPos, false, target);
        }
    }

    private Skill CreateSkill(int id)
    {
        SkillInfo info = DataMgr.SkillModelEx.GetSkillInfo(id);
        Skill skill = GetSkill(id);
        if (skill == null)
        {
            skill = new Skill();
            skill.Init(id, info, own);
            _skillList.Add(skill);
            _skillDic.Add(id, _skillList.Count - 1);
        }
#if UNITY_EDITOR
        else
        {
            skill.Init(id, info, own);
        }
#endif
        return skill;
    }

    public Skill GetSkill(int id)
    {
        if (_skillDic.ContainsKey(id))
        {
            int index = _skillDic.GetValue(id);
            if (index >= 0 && index < _skillList.Count)
                return _skillList[index];
        }
        return null;
    }
}
