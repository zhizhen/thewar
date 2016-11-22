using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Engine
{
    public class SkillInfo
    {
        public int id;
        public List<BaseSkillEvent> eventList;

        public SkillInfo()
        {
            eventList = new List<BaseSkillEvent>();
        }

        public void Read(BinaryReader br)
        {
            id = br.ReadInt32();
            int count = br.ReadInt32();
            for (int i = 0; i < count; ++i)
            {
                BaseSkillEvent bse = SkillUtils.InstSkillEvent(br, this, null, 0, i);
                bse.Deserialize(br);
            }
        }

        public void Write(FileStream stream)
        {
            BinaryWriter bw = new BinaryWriter(stream);
            bw.Write(id);
            bw.Write(eventList.Count);
            for (int i = 0; i < eventList.Count; ++i)
            {
                eventList[i].Serialize(bw);
            }
            bw.Close();
        }

#if UNITY_EDITOR
        public void DrawUI()
        {
            if (eventList != null)
            {
                EditorGUILayout.BeginHorizontal();
                for (int i = 0; i < eventList.Count; ++i)
                {
                    eventList[i].DrawUI();
                }
                EditorGUILayout.EndHorizontal();
            }
        }
#endif
    }
}