using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
#if UNITY_EDITOR	
using UnityEditor;
#endif

public class URL
{
	const string kAssetBundlesPath = "Assets/StreamingAssets";

    public static string GetPath(string assetbundle, bool existsLocalRes = true)
    {
        assetbundle = assetbundle.ToLower();
        // Set base downloading url.
        string relativePath = GetRelativePath();
        string platformFolderForAssetBundles =
#if UNITY_EDITOR
                GetPlatformFolderForAssetBundles(EditorUserBuildSettings.activeBuildTarget);
#else
    		GetPlatformFolderForAssetBundles(Application.platform);
#endif
        //Debug.Log("streaming asset path: " + Application.streamingAssetsPath);
        // "jar:file://" + Application.dataPath + "!/assets/test.txt";
        return string.Format("{0}/{1}/{2}", relativePath, platformFolderForAssetBundles, assetbundle);
        //return GetFileSymbol() + Application.dataPath + "!/assets/Android/" + assetbundle;

    }
//    public static string GetPath(string relativePath, bool existsLocalRes = true)
//    {
//        relativePath = relativePath.ToLower();
//#if UNITY_EIDTOR
//        return string.Format("{0}{1}{2}", GetFileSymbol(), URL.localBundlePath, relativePath);
//#elif UNITY_WEB || UNITY_WEBPLAYER
//        return string.Format("{0}{1}", GetFileSymbol(), URL.localBundlePath, relativePath);
//#endif
//        if (FileTools.IsExistFile(localBundleCachePath + relativePath))
//        return string.Format("file://{0}{1}", localBundleCachePath, relativePath);
//        else
//        return string.Format("{0}{1}{2}", GetFileSymbol(), URL.localBundlePath, relativePath);
//    }
//    public static string localCachePath
//    {
//        get { return string.Format("{0}/{1}/", Application.streamingAssetsPath, "Android"); }
//    }

//    public static string localBundleCachePath { get { return string.Format("{0}Assetbundles/", localCachePath); } }
//    public static string localBundleCachePath { get { return string.Format("{0}", localCachePath); } }

    public static string GetFileSymbol()
    {
#if UNITY_EDITOR
        return @"file://";
#elif UNITY_ANDROID
        return "jar:file://";
#elif UNITY_IPHONE
        return "file://";
#elif UNITY_STANDALONE_WIN
        return "file:///";
#else
        return "";
#endif
    }

    public static string GetRelativePath()
    {
        if (Application.isEditor)
            return GetFileSymbol() + System.Environment.CurrentDirectory.Replace("\\", "/") + "/" + kAssetBundlesPath; // Use the build output folder directly.
        else if (Application.isWebPlayer)
            return System.IO.Path.GetDirectoryName(Application.absoluteURL).Replace("\\", "/") + "/StreamingAssets";
        else if (Application.isMobilePlatform || Application.isConsolePlatform)
            return Application.streamingAssetsPath;
        else // For standalone player.
            return Application.streamingAssetsPath;
    }

#if UNITY_EDITOR
    public static string GetPlatformFolderForAssetBundles(BuildTarget target)
    {
        switch (target)
        {
            case BuildTarget.Android:
                return "Android";
            case BuildTarget.iOS:
                return "iOS";
            case BuildTarget.WebPlayer:
                return "WebPlayer";
            case BuildTarget.StandaloneWindows:
            case BuildTarget.StandaloneWindows64:
                return "Windows";
            case BuildTarget.StandaloneOSXIntel:
            case BuildTarget.StandaloneOSXIntel64:
            case BuildTarget.StandaloneOSXUniversal:
                return "OSX";
            // Add more build targets for your own.
            // If you add more targets, don't forget to add the same platforms to GetPlatformFolderForAssetBundles(RuntimePlatform) function.
            default:
                return null;
        }
    }
#endif

	static string GetPlatformFolderForAssetBundles(RuntimePlatform platform)
	{
		switch (platform)
		{
		case RuntimePlatform.Android:
			return "Android";
		case RuntimePlatform.IPhonePlayer:
			return "iOS";
		case RuntimePlatform.WindowsWebPlayer:
		case RuntimePlatform.OSXWebPlayer:
			return "WebPlayer";
		case RuntimePlatform.WindowsPlayer:
			return "Windows";
		case RuntimePlatform.OSXPlayer:
			return "OSX";
			// Add more build platform for your own.
			// If you add more platforms, don't forget to add the same targets to GetPlatformFolderForAssetBundles(BuildTarget) function.
		default:
			return null;
		}
	}
}
