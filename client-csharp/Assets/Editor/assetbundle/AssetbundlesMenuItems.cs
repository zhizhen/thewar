using UnityEngine;
using UnityEditor;
using System;
using System.Xml;
using System.IO;
using System.Collections.Generic;
using Engine;

public class AssetbundlesMenuItems
{
    private static XmlDocument bundleDependDoc = null; 
    private static int operateMode = 0;
    private static readonly string bundleVersionPath = Application.dataPath + "/ResourcesLibrary/Configs/bundleversion.xml";
	const string kSimulateAssetBundlesMenu = "Game Tools/资源打包/Simulate AssetBundles";
    public const string ASSET_SHADER_PATH = "Assets/Shaders";
    private static readonly string bundleExportFolder = Application.dataPath + "StreamingAssets/Android/";
    private static readonly List<string> canSingleBundle = new List<string>
    {
        ".png",
        ".jpg",
        ".bmp",
        ".tga",
        ".tif",
        ".anim",
        "Movies/",
        "Musics/",
        "/Luas",
        "/Configs",
        "/Shaders",
        ".ttf",
        ".bytes"
    };

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

    [MenuItem("Game Tools/资源打包/Build Shader")]
    public static void BuildShader()
    {
        SingleBundle(ASSET_SHADER_PATH, "Android/shaders.ui") ;
        Debug.Log("打包Shader文件夹完成!");
    }

    [MenuItem("Game Tools/资源打包/Build AssetBundles")]
    static public void BuildAssetBundles()
    {
        BuildScript.BuildAssetBundles();
    }

    private static bool SingleBundle(string assetPath, string assetBundleName)
    {
        operateMode = 1;
        if (CanSingleBundle(assetPath) == false) return false;
        AssetBundleBuild build = new AssetBundleBuild();
        build.assetBundleName = assetBundleName;
        build.assetNames = new string[] { assetPath };
        build.assetBundleVariant = "";
        AssetBundleManifest kABM = BuildPipeline.BuildAssetBundles(
            Application.streamingAssetsPath + "/", 
            new AssetBundleBuild[] { build }, 
            BuildAssetBundleOptions.DeterministicAssetBundle, 
            GetBuildTarget());
        string[] dependencies = kABM.GetAllDependencies(assetBundleName);
        dependencies = kABM.GetDirectDependencies(assetBundleName);
        List<string> list = new List<string>();
        for (int k = 0; k < dependencies.Length; k++)
        {
            list.Add(dependencies[k].Replace("assetbundles/", ""));
        }
        if (assetPath.StartsWith(ASSET_SHADER_PATH))
        {
            WriteXMLData("shaders.u");
        }
        saveXMLDoc();
        return true;
    }

    public static bool CanSingleBundle(string path)
    {
        for (int i = 0; i < canSingleBundle.Count; i++)
        {
            if (path.IndexOf(canSingleBundle[i]) > -1) return true;
        }
        return false;
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

    private static void WriteXMLData(string bundleRelativePath, IEnumerable<string> dependencies = null)
    {
        if (bundleDependDoc == null)
        {
            bundleDependDoc = new XmlDocument();
            if (File.Exists(bundleVersionPath))
                bundleDependDoc.Load(bundleVersionPath);
            if (operateMode == 0)
                bundleDependDoc.RemoveAll();
        }
        bundleRelativePath = bundleRelativePath.ToLower();
        if (bundleRelativePath.ToLower().IndexOf("font/") == -1)
        {
            var node = InitXmlNode(bundleDependDoc, bundleRelativePath);
            node.SetAttribute("path", bundleRelativePath);
            SetXmlNodeMD5(node, bundleRelativePath);
            SetXmlNodeDependencies(bundleDependDoc, node, dependencies, bundleRelativePath);
        }
    }

    private static XmlElement InitXmlNode(XmlDocument xmlDoc, string relativePath)
    {
        var root = GetXmlRoot(xmlDoc);
        var node = (root.SelectSingleNode("file[@path = '" + relativePath + "']") as XmlElement);

        if (node == null)
        {
            node = xmlDoc.CreateElement("file");
            root.AppendChild(node);
        }
        else
            node.RemoveAll();
        return node;
    }

    private static XmlNode GetXmlRoot(XmlDocument xmlDoc)
    {
        var root = xmlDoc.SelectSingleNode("root");
        if (root == null)
        {
            root = xmlDoc.CreateElement("root");
            xmlDoc.AppendChild(root);
        }
        return root;
    }

    private static void SetXmlNodeMD5(XmlElement node, string relativePath)
    {
        var exportPath = bundleExportFolder + relativePath;
        if (!File.Exists(exportPath)) return;
        string md5 = GameTools.GetFileMD5(exportPath);
        node.SetAttribute("md5", md5);
    }

    private static void SetXmlNodeDependencies(XmlDocument doc, XmlElement node, IEnumerable<string> dependencies, string parentBundleRelativePath)
    {

    }

    private static void saveXMLDoc()
    {
        if (bundleDependDoc != null)
            bundleDependDoc.Save(bundleVersionPath);
        //SaveBinaryXMLDoc();
        AssetDatabase.SaveAssets();
    }
}