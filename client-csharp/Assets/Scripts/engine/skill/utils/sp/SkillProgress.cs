using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

namespace Engine
{
    public class SkillProgress
    {
        private static int _gid = 0;
        private int _id;
        public int spid;
        public bool isSync;
        public bool executed;
        public bool finished;
        public float timer;
        public float delay;
        public int skillId;
        public BaseSkillEvent skillEvt;
        public List<SkillProgress> spList = new List<SkillProgress>();
        public SkillPreData preData;
        public SkillCasterData casterData;
        public SkillTargetData targetData;
        public SkillHitEndData hitEndData;
        public List<SkillHitData> hitList = new List<SkillHitData>();

        public void Dispose()
        {

        }

        public void ResetID()
        {
            if (_id <= 0)
                _id = ++_gid;
        }

        public void InitEvt(BaseSkillEvent evt, int skillId, float delay, int spid, int group)
        {
            this.spid = spid;
            this.skillEvt = evt;
            this.delay = delay;
            this.skillId = skillId;
            int num = 1;
            group *= 100;
            for (int i = 0; i < evt.childrenEvents.Count; ++i)
            {
                BaseSkillEvent bse = evt.childrenEvents[i];
                if (SKILL_EVENT_TYPE.子弹 == bse.eventType)
                {
                    for (int j = 0; j < bse.times; ++j)
                    {
                        SkillProgress sp = SkillProgressCtrl.Instance.GetSkillProgress(false);
                        spList.Add(sp);
                        sp.InitEvt(bse, skillId, bse.time + bse.interval * j, group * num + spid, group);
                        ++num;
                    }
                }
                else
                {
                    SkillProgress sp = SkillProgressCtrl.Instance.GetSkillProgress(false);
                    sp.InitEvt(bse, skillId, bse.time, group * num + spid, group);
                    ++num;
                    spList.Add(sp);
                }
            }
        }

        public void SetSkillProgressData(int lv, SkillCasterData casterData, SkillPreData preData, SkillTargetData targetData, bool isSync)
        {
            this.isSync = isSync;
            this.casterData = casterData;
            this.preData = preData;
            this.targetData = targetData;
            if (skillEvt.eventType == SKILL_EVENT_TYPE.伤害)
            {
                EntityBase caster = EntityMgr.Instance.GetEntity(this.casterData.roleType, (uint)this.casterData.roleId);
            }
            for (int i = 0; i < spList.Count; ++i)
            {
                SkillProgress sp = spList[i];
                sp.SetSkillProgressData(lv, casterData, preData, targetData, isSync);
            }
        }

        public bool Update(float elapseTime)
        {
            if (finished) return true;
            timer += elapseTime;
            if (!executed && timer >= delay)
            {
                executed = true;
                if (skillEvt.times <= 0)
                {
                    finished = true;
                    return true;
                }
                Execute();
            }
            if (executed)
            {
                if (SKILL_EVENT_TYPE.子弹 == skillEvt.eventType ||
                    SKILL_EVENT_TYPE.AOE == skillEvt.eventType ||
                    SKILL_EVENT_TYPE.位移 == skillEvt.eventType) return true;
                bool finish = true;
                for (int i = 0;i < spList.Count; ++i)
                {
                    SkillProgress sp = spList[i];
                    finish = sp.Update(elapseTime) && finish;
                }
                return finish;
            }
            return false;
        }

        public void Execute()
        {
            EntityBase caster = EntityMgr.Instance.GetEntity(casterData.roleType, casterData.roleId);
            if (caster != null)
            {
                switch (skillEvt.eventType)
                {
                    case SKILL_EVENT_TYPE.动作:
                        //DoAction();
                        break;
                    case SKILL_EVENT_TYPE.子弹:
                        DoBullet();
                        break;
                }
            }
        }

        private void DoBullet()
        {
            SkillEventBullet skillEvtBullet = skillEvt as SkillEventBullet;
            EntityBase caster = EntityMgr.Instance.GetEntity(casterData.roleType, casterData.roleId);
            EntityBase target = null;
            Vector3 beginPos = new Vector3();
            Vector3 beginDir = new Vector3();
            Transform firePoint = null;
            //this.FindBulletBeginPos(caster, ref beginPos, ref beginDir, ref firePoint);
            //this.FindBulletBeginPos(caster, firePoint, ref beginPos, ref beginDir, ref target);
            //float range = SkillEventBullet.range;
            //this.FindBulletRange(caster, beginPos, ref range, ref target);
            //CreateBullets(beginPos, beginDir, range, target);
        }
    }
}