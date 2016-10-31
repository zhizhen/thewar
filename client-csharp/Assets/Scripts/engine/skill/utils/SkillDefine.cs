using UnityEngine;

namespace Engine
{
    class SkillDefine
    {

    }

    public enum SKILL_STATE_TYPE
    {
        无 = 0,
        前摇 = 1,
        释放 = 2,
        后摇 = 3,
        结束 = 4,
    }

    public enum SKILL_EVENT_TYPE
    {
        动作 = 0,
        子弹 = 1,
        AOE = 2,
        伤害 = 3,
        Buff = 4,
        召唤 = 5,
        特效 = 6,
        音效 = 7,
        位移 = 8,
        警示 = 9,
        摄像机 = 10,
        角色效果 = 11,
        全局效果 = 12,
        模型转向 = 13,
    }

    public enum SKILL_ACTION_DIR_TYPE
    {
        默认 = 1,
        朝向目标 = 2,
    }

    public enum SKILL_BULLET_TYPE
    {
        普通 = 1,
        AOE = 2,
    }

    public enum SKILL_BULLET_PATH_TYPE
    {
        直接命中 = 1,
        直线 = 2,
        射线 = 3,
        跟踪 = 4,
        抛物线 = 5,
        回旋 = 6,
        弹球 = 7,
        轰炸 = 8,
    }

    public enum SKILL_BULLET_TARGET_TYPE
    {
        目标 = 1,
        目标位置 = 2,
        射程位置 = 3,
        自定义终点 = 4,
        自己 = 5,
    }

    public enum SKILL_BULLET_POS_TYPE
    {
        自己中心 = 1,
        FirePoint = 2,
        自定义起点 = 3,
        终点位置 = 4,
    }

    public enum SKILL_HIT_TYPE
    {
        全部 = 1,
        友方 = 2,
        敌方 = 3,
    }

    public enum SKILL_AOE_TYPE
    {
        圆形 = 1,
        扇形 = 2,
        矩形 = 3,
        射线 = 4,
    }
}