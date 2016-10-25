using UnityEngine;
using UnityEditor;
using System.Collections;
using Engine;

public class AssetbundlesMenuItems
{
    const string kSimulateAssetBundlesMenu = "AssetBundles/Simulate AssetBundles";

    [MenuItem(kSimulateAssetBundlesMenu)]
    public static void ToggleSimulateAssetBundle()
    {
		ResourceMgr.SimulateAssetBundleInEditor = !ResourceMgr.SimulateAssetBundleInEditor;
    }

    [MenuItem(kSimulateAssetBundlesMenu, true)]
    public static bool ToggleSimulateAssetBundleValidate()
    {
		Menu.SetChecked(kSimulateAssetBundlesMenu, ResourceMgr.SimulateAssetBundleInEditor);
        return true;
    }

    [MenuItem("AssetBundles/Build AssetBundles")]
    static public void BuildAssetBundles()
    {
        BuildScript.BuildAssetBundles();
    }

    [MenuItem("AssetBundles/Build Player")]
    static void BuildPlayer()
    {
        BuildScript.BuildPlayer();
    }
}