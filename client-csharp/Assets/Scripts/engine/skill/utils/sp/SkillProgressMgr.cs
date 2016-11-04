using System.Collections.Generic;
using UnityEngine;

namespace Engine
{
    public class SkillProgressMgr : Singleton<SkillProgressMgr>
    {
        private List<SkillProgress> _cacheList;
        private SkillProgress _RootActive;
        private List<SkillProgress> _reclaimList;
        private List<SkillProgress> _waitList;
        private const int DEFAULT_CAPACITY = 500;
        private float _lastTime;

        public SkillProgressMgr()
        {
            _cacheList = new List<SkillProgress>();
            _reclaimList = new List<SkillProgress>();
            _waitList = new List<SkillProgress>();
            for (int i = 0; i < DEFAULT_CAPACITY; ++i)
            {
                SkillProgress sp = new SkillProgress();
                sp.ResetID();
                _cacheList.Add(sp);
            }
            _lastTime = Time.time;
        }
    }
}