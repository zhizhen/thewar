using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Engine;

public class Skill
{
    private int _id;
    private int _lv;
    private int _order;
    private SkillInfo _info;

    private int _action;
    private bool _executed;
    private float _timer;
    private bool _CDing;
    private float _CDTick;
    private float _CDTotal;
    private EntityBase _caster;
    private SKILL_STATE_TYPE _currentStateType = SKILL_STATE_TYPE.无;
    private List<SkillProgress> _spList;
    private Dictionary<SKILL_STATE_TYPE, SkillStateData> _stateDict;

    public Skill()
    {
        _spList = new List<SkillProgress>();
        _stateDict = new Dictionary<SKILL_STATE_TYPE, SkillStateData>();
    }

    public void Init(int id, SkillInfo info, EntityBase caster)
    {
        Dispose();
        _caster = caster;
        _info = info;
        _id = id;
        InitState();
        InitProgress();
    }

    public void Dispose()
    {
        for (int i = 0; i < _spList.Count; ++i)
        {
            _spList[i].Dispose();
        }
        _spList.Clear();
        _stateDict.Clear();
        _info = null;
        _caster = null;
        _currentStateType = SKILL_STATE_TYPE.无;
        _executed = false;
        _timer = 0;
        _CDing = false;
        _CDTick = 0;
        _CDTotal = 0;
        _id = 0;
        _lv = 0;
        _order = 0;
        _action = 0;
    }

    private void InitState()
    {
        for (int i = 0; i <= 4; ++i)
        {
            SKILL_STATE_TYPE stateType = (SKILL_STATE_TYPE)i;
            SkillStateData stateData;
            stateData.stateType = stateType;
        }
    }

    private void InitProgress()
    {
        int num = 1;
        int group = 1;
        for (int i = 0; i < _info.eventList.Count; ++i)
        {
            BaseSkillEvent bse = _info.eventList[i];
            if (SKILL_EVENT_TYPE.子弹 == bse.eventType || SKILL_EVENT_TYPE.动作 == bse.eventType)
            {
                for (int j = 0; j < bse.times; ++j)
                {
                    SkillProgress sp = SkillProgressCtrl.Instance.GetSkillProgress(false);
                    _spList.Add(sp);
                    sp.InitEvt(bse, _id, bse.time + bse.interval * j, num, group);
                    ++num;
                }
            }
            else
            {
                SkillProgress sp = SkillProgressCtrl.Instance.GetSkillProgress(false);
                _spList.Add(sp);
                sp.InitEvt(bse, _id, bse.time, num, group);
                ++num;
            }
        }
    }

    public void Begin(Vector3? preBeginPos, Vector3? preBeginDir, Vector3? preEndPos, bool isSync, EntityBase target)
    {
        if (_executed == true) return;
        _executed = true;
        _timer = 0;

        SkillPreData preData = new SkillPreData();
        preData.preBeginPos = preBeginPos;
        preData.preBeginDir = preBeginDir;
        preData.preEndPos = preEndPos;
        SkillCasterData casterData = new SkillCasterData();
        casterData.roleId = _caster.roleId;
        casterData.roleType = CONST_ENTITY_TYPE.MAIN_ROLE;
        casterData.oriPos = _caster.position;
        casterData.oriDir = _caster.forward;
        casterData.oriCenter = _caster.centerPos;
        SkillTargetData targetData = new SkillTargetData();
        if (target != null)
        {
            targetData.roleId = target.roleId;
            targetData.oriPos = target.position;
            targetData.oriCenter = target.centerPos;
        }
        for (int i = 0; i < _spList.Count; ++i)
        {
            SkillProgress sp = _spList[i];
            sp.SetSkillProgressData(_lv, casterData, preData, targetData, isSync);
        }
        Update(0f);
    }

    public void Update(float elapsedTime)
    {
        if (_executed == false) return;
        _timer += elapsedTime;
        for (int i = 0; i < _spList.Count; ++i)
        {
            _spList[i].Update(elapsedTime);
        }
        if (_executed && SKILL_STATE_TYPE.结束 == _currentStateType)
        {
            _executed = false;
            _timer = 0;
        }
    }
}