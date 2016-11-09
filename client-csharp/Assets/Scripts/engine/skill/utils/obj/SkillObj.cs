using UnityEngine;

namespace Engine
{
    public class SkillObj<T> where T : SkillObj<T>, new()
    {
        protected enum SKILL_OBJ_STATE
        {
            ACTIVE = 1,
            DEACTIVE = 2
        }

        protected SKILL_OBJ_STATE _state = SKILL_OBJ_STATE.DEACTIVE;
        private static int _gid = 0;
        private int _id;
        public T prev;
        public T next;

        public SkillObj()
        {
            Debug.Log("new skill obj");
        }
        public int id { get { return _id; } }
        public void ResetId()
        {
            if (_id <= 0)
                _id = ++_gid;
        }
        public void ClearId()
        {
            if (_id > 0)
                _id = 0;
        }
        public virtual void Update(float elapseTime)
        {

        }
        public virtual void Deactive()
        {

        }
    }
}