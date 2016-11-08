using UnityEngine;
using System.Collections;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Engine
{
    public class SkillEventAction : BaseSkillEvent
    {
        public int action = 0;

#if UNITY_EDITOR
        protected override void DrawTypeUI()
        {
            action = EditorGUILayout.IntField("动作id", action);
        }
#endif
    }
}