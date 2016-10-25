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
	const string kAssetBundlesPath = "/Assets/StreamingAssets/";

    public static string GetPath(string assetbundle, bool existsLocalRes = true)
	{
		assetbundle = assetbundle.ToLower ();
		// Set base downloading url.
		string relativePath = GetRelativePath ();
		string platformFolderForAssetBundles =
#if UNITY_EDITOR
			GetPlatformFolderForAssetBundles (EditorUserBuildSettings.activeBuildTarget);
#else
		GetPlatformFolderForAssetBundles(Application.platform);
#endif
		return relativePath + kAssetBundlesPath + platformFolderForAssetBundles + "/" + assetbundle;
	}

    public static string GetRelativePath()
    {
        if (Application.isEditor)
            return "file://" + System.Environment.CurrentDirectory.Replace("\\", "/"); // Use the build output folder directly.
        else if (Application.isWebPlayer)
            return System.IO.Path.GetDirectoryName(Application.absoluteURL).Replace("\\", "/") + "/StreamingAssets";
        else if (Application.isMobilePlatform || Application.isConsolePlatform)
            return Application.streamingAssetsPath;
        else // For standalone player.
            return "file://" + Application.streamingAssetsPath;
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
