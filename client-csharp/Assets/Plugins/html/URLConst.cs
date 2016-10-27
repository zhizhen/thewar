using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class URLConst
{
    public const string EXTEND_ASSETBUNDLE = ".ui";

    public static readonly string SCENE_PATH = "Scenes/";

    public static string GetUI(string name)
    {
        return name + EXTEND_ASSETBUNDLE;
    }

    public static List<string> listInitGameRes = new List<string> {
        GetUI("UIRootCanvas"),
        GetUI("UIInputAccount"),
        GetUI("UIMainView")
    };

    public static string GetScenePrefab(string sceneId)
    {
        return SCENE_PATH + "ScenePrefab" + sceneId + EXTEND_ASSETBUNDLE;
    }
}
