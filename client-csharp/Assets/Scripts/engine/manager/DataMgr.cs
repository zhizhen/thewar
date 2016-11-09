public class DataMgr
{
    private static __SkillModelEx _skillModelEx;
    private static SceneModel _SceneModel;

    public static __SkillModelEx SkillModelEx
    {
        get { return _skillModelEx ?? (_skillModelEx = new __SkillModelEx()); }
    }

    public static SceneModel sceneModel
    {
        get { return _SceneModel ?? (_SceneModel = new SceneModel()); }
    }
}