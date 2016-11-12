using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Engine;

public class URLConst
{
    public const string EXTEND_ASSETBUNDLE = ".u";

    public static readonly string UI_PATH = "UI/";
    public static readonly string SCENE_PATH = "Scenes/";
    public static readonly string MODEL_PATH = "Models/";
    public static readonly string SHADER_CONFIG = "shaders" + EXTEND_ASSETBUNDLE;
    public static readonly string CONFIG_CONFIG = "configs" + EXTEND_ASSETBUNDLE;

    public static string GetUI(string name)
    {
        return UI_PATH + name + EXTEND_ASSETBUNDLE;
    }

    public static string GetModel(string name)
    {
        return MODEL_PATH + name + EXTEND_ASSETBUNDLE;
    }

    public static List<string> listInitGameRes = new List<string> {
        SHADER_CONFIG,
        GetUI("UIRootCanvas"),
        GetUI("UIInputAccount"),
        GetUI("UIMainView"),
        GetUI("UIBattlePanel")
    };

    public static string GetScenePrefab(string sceneId)
    {
        return SCENE_PATH + "ScenePrefab" + sceneId + EXTEND_ASSETBUNDLE;
    }

    public static string GetEffect(string name)
    {
        return "Effects/" + name + EXTEND_ASSETBUNDLE;
    }
}
