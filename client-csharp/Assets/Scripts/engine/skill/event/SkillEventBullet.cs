using System.Collections.Generic;
using System.IO;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Engine
{
    public class SkillEventBullet : BaseSkillEvent
    {
        public SKILL_BULLET_TYPE bulletType = SKILL_BULLET_TYPE.普通;
    }
}