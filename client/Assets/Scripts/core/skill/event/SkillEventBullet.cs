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
        public SKILL_HIT_TYPE hitType = SKILL_HIT_TYPE.敌方;
        public SKILL_BULLET_POS_TYPE posType = SKILL_BULLET_POS_TYPE.FirePoint;
        public SKILL_BULLET_TARGET_TYPE targetType = SKILL_BULLET_TARGET_TYPE.目标;
        public SKILL_BULLET_PATH_TYPE pathType = SKILL_BULLET_PATH_TYPE.直线;

        //基本属性
        public int bulletId = 0;
        public int bulletNum = 1;
        public float range = 5.0f;
        public float speed = 5f;

        public int effectEnd = 0;
        //子弹类型
        public Vector3 size = new Vector3(0.1f, 0.1f, 0.1f);
        public bool ignoreCollision = false;

        //弹道
        public float trackAdd = 0;
        public float pHeight = 0;
        public List<BulletAccelPathData> listAccel = new List<BulletAccelPathData>();

#if UNITY_EDITOR
        protected override void DrawTypeUI()
        {
            DrawPathTypeUI();
        }

        private void DrawPathTypeUI()
        {
            pathType = (SKILL_BULLET_PATH_TYPE)EditorGUILayout.EnumPopup("子弹弹道", pathType);
            bulletNum = EditorGUILayout.IntField("子弹数量", bulletNum);
            if (SKILL_BULLET_PATH_TYPE.直接命中 != pathType)
            {
                bulletId = EditorGUILayout.IntField("子弹Id", bulletId);
                speed = EditorGUILayout.FloatField("射速", speed);
            }
            else
                bulletId = 0;
            range = EditorGUILayout.FloatField("射程", range);
            if (SKILL_BULLET_PATH_TYPE.跟踪 == pathType)
                trackAdd = EditorGUILayout.FloatField("附加射程", trackAdd);
            else if (SKILL_BULLET_PATH_TYPE.抛物线 == pathType ||
                SKILL_BULLET_PATH_TYPE.弹球 == pathType ||
                SKILL_BULLET_PATH_TYPE.轰炸 == pathType)
                pHeight = EditorGUILayout.FloatField("垂直高度", pHeight);
        }
#endif

        protected override void SerializeType(BinaryWriter bw)
        {
            bw.Write((int)bulletType);
            bw.Write((int)hitType);
            bw.Write((int)posType);
            bw.Write((int)targetType);
            bw.Write((int)pathType);

            bw.Write(bulletId);
            bw.Write(bulletNum);
            bw.Write(range);
            bw.Write(speed);
        }

        protected override void DeserializeTYpe(BinaryReader br)
        {
            bulletType = (SKILL_BULLET_TYPE)br.ReadInt32();
            hitType = (SKILL_HIT_TYPE)br.ReadInt32();
            posType = (SKILL_BULLET_POS_TYPE)br.ReadInt32();
            targetType = (SKILL_BULLET_TARGET_TYPE)br.ReadInt32();
            pathType = (SKILL_BULLET_PATH_TYPE)br.ReadInt32();

            bulletId = br.ReadInt32();
            bulletNum = br.ReadInt32();
            range = br.ReadSingle();
            speed = br.ReadSingle();
        }
    }
}