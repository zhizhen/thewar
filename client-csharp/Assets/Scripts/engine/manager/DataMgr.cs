public class DataMgr
{
    private static __SkillModelEx _skillModelEx;

    public static __SkillModelEx SkillModelEx
    {
        get { return _skillModelEx ?? (_skillModelEx = new __SkillModelEx()); }
    }
}