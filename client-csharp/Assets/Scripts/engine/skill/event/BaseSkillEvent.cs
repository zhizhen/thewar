using UnityEngine;
using System.Collections.Generic;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Engine
{
    public class BaseSkillEvent
    {
        public SkillInfo skillInfo;
        public BaseSkillEvent parent;
        public int layer = 0;
        public string key = "";
        public SKILL_EVENT_TYPE eventType = SKILL_EVENT_TYPE.动作;
        public float time = 0f;
        public int times = 1;
        public float interval = 0f;
        public float actionTime = 0f;
        public List<BaseSkillEvent> childrenEvents = new List<BaseSkillEvent>();

#if UNITY_EDITOR
        public static readonly int MAX_LAYER = 4;
        public static readonly float WIDTH = 300;
        public static readonly float WIDTH_LEVEL = 20;
        public static readonly float WIDTH_GROW = 17;
        public static object editorItemData;
        public static bool isEditorItem;
        public SKILL_EVENT_TYPE lastType = 0;

        public void DrawUI()
        {

        }
#endif

        public string GetKey()
        {
            string key = string.Empty;
            int index = 0;
            if (parent != null)
            {
                index = parent.childrenEvents.IndexOf(this);
                key = string.Concat(parent.GetKey(), ",", index);
            }
            else
            {
                index = skillInfo.eventList.IndexOf(this);
                key = string.Concat(index);
            }
            return key;
        }

        public List<BaseSkillEvent> GetParentChildrenEventList()
        {
            if (parent != null)
                return parent.childrenEvents;
            return skillInfo.eventList;
        }

        public void Serialize(BinaryWriter bw)
        {
            bw.Write((int)eventType);
            bw.Write(time);
            bw.Write(times);
            bw.Write(interval);
            bw.Write(actionTime);
            SerializeType(bw);

            int count = childrenEvents.Count;
            bw.Write(count);
            for (int i = 0; i < count; ++i)
            {
                childrenEvents[i].Serialize(bw);
            }
        }

        protected virtual void SerializeType(BinaryWriter bw)
        {

        }

        public void Deserialize(BinaryReader br)
        {
            DeserializeTYpe(br);
            int count = br.ReadInt32();
            childrenEvents.Clear();
            for (int i = 0; i < count; ++i)
            {
                BaseSkillEvent bse = SkillUtils.InstSkillEvent(br, skillInfo, this, layer + 1, i);
                bse.Deserialize(br);
            }
        }

        protected virtual void DeserializeTYpe(BinaryReader br)
        {

        }
    }
}