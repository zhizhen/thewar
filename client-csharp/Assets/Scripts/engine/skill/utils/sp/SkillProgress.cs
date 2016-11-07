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

        }
    }
}