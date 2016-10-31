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
    }
}