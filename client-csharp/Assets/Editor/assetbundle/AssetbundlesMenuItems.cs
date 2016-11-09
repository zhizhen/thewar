using UnityEngine;
using UnityEditor;
using System;
using System.Xml;
using System.IO;
using System.Collections.Generic;
using Engine;

public class AssetbundlesMenuItems
{
	const string kSimulateAssetBundlesMenu = "Game Tools/资源打包/模拟加载";

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

    [MenuItem("Game Tools/资源打包/打包所有资源")]
    static public void BuildAssetBundles()
    {
        BuildScript.BuildAssetBundles();
    }

    public static BuildTarget GetBuildTarget()
    {
#if UNITY_IOS || UNITY_IPHONE
        return BuildTarget.iOS;
#elif UNITY_ANDROID
        return BuildTarget.Android;
#elif UNITY_WEBPLAYER
        return BuildTarget.WebPlayer;
#elif UNITY_WEBGL
        return BuildTarget.WebGL;
#else
        return BuildTarget.StandaloneWindows;
#endif
    }
}