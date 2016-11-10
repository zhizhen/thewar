using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace Engine
{
    public static class SkillUtils
    {
        public static BaseSkillEvent InstSkillEvent(BinaryReader br, SkillInfo info, BaseSkillEvent parent, int layer, int index)
        {
            SKILL_EVENT_TYPE eventType = (SKILL_EVENT_TYPE)br.ReadInt32();
            BaseSkillEvent bse = SkillUtils.InstanceEvent(eventType, info, parent, layer, index);
            bse.time = br.ReadSingle();
            bse.times = br.ReadInt32();
            bse.interval = br.ReadSingle();
            bse.actionTime = br.ReadSingle();
            bse.key = bse.GetKey();
#if UNITY_EDITOR
            bse.lastType = eventType;
#endif
            return bse;
        }

        public static BaseSkillEvent InstanceEvent(SKILL_EVENT_TYPE eventType, SkillInfo info, BaseSkillEvent parent, int layer, int index)
        {
            BaseSkillEvent bse = null;
            switch (eventType)
            {
                case SKILL_EVENT_TYPE.动作:
                    bse = new SkillEventAction();
                    break;
                case SKILL_EVENT_TYPE.子弹:
                    bse = new SkillEventBullet();
                    break;
            }
            bse.skillInfo = info;
            bse.parent = parent;
            bse.eventType = eventType;
            bse.layer = layer;
            bse.GetParentChildrenEventList().Insert(index, bse);
#if UNITY_EDITOR
            bse.lastType = eventType;
#endif
            return bse;
        }

        public static SkillProgress CopySkillProgress(SkillProgress from, bool executed, bool finished, bool AddToUpdateList)
        {
            SkillProgress copy = SkillProgressCtrl.Instance.GetSkillProgress(AddToUpdateList);
            copy.executed = executed;
            copy.finished = finished;
            copy.timer = from.timer;
            copy.delay = from.delay;
            copy.spid = from.spid;
            copy.isSync = from.isSync;
            copy.skillId = from.skillId;
            copy.skillEvt = from.skillEvt;
            copy.casterData = from.casterData;
            copy.targetData = from.targetData;
            if (SKILL_EVENT_TYPE.伤害 == from.skillEvt.eventType)
                Array.Copy(from.casterAttrs, copy.casterAttrs, from.casterAttrs.Length);
            for (int i = 0; i < from.spList.Count; ++i)
            {
                SkillProgress childSp = from.spList[i];
                if (from.skillEvt is SkillEventBullet && childSp.skillEvt is SkillEventWarn)
                    continue;
                copy.spList.Add(SkillUtils.CopySkillProgress(childSp, false, false, false));
            }
            return copy;
        }
    }
}