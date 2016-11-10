using System.Collections.Generic;
using UnityEngine;

namespace Engine
{
    public class SkillObjCtrl<T> : Singleton<SkillObjCtrl<T>> where T : SkillObj<T>, new()
    {
        private T _RootDeactive;
        private T _RootActive;
        private List<T> _reclaimList;
        private float _lastTime;

        public SkillObjCtrl()
        {
            _reclaimList = new List<T>();
            _lastTime = Time.time;
        }

        public T GetObj()
        {
            T t = null;
            if (_RootDeactive != null)
            {
                t = _RootDeactive;
                _RootDeactive = _RootDeactive.next;
                t.next = null;
            }
            else
                t = new T();
            t.ResetId();
            if (_RootActive != null)
            {
                t.next = _RootActive;
                _RootActive.prev = t;
            }
            _RootActive = t;
            return t;
        }

        public void Reclaim(T t)
        {
            _reclaimList.Add(t);
        }

        public void ReclaimAll()
        {
            T t = _RootActive;
            while (t != null)
            {
                t.Deactive();
                t = t.next;
            }
            t = null;
        }

        public void Remove(T t)
        {
            if (_RootActive == t)
                _RootActive = t.next;
            if (t.prev != null)
                t.prev.next = t.next;
            if (t.next != null)
                t.next.prev = t.prev;
            t.next = null;
            t.prev = null;
            t.ClearId();
            t.next = _RootDeactive;
            _RootDeactive = t;
        }

        public void Update()
        {
            float time = Time.time;
            float elapsedTime = time - _lastTime;
            _lastTime = time;
            for (int i = 0; i < _reclaimList.Count; ++i)
            {
                Remove(_reclaimList[i]);
            }
            _reclaimList.Clear();
            T t = _RootActive;
            while (t != null)
            {
                t.Update(elapsedTime);
                t = t.next;
            }
            t = null;
        }
    }
}