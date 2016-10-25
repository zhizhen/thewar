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

    public static string localResPath
    {
        get
        {
            if (Application.platform == RuntimePlatform.WindowsEditor ||
                Application.platform == RuntimePlatform.WindowsPlayer ||
                Application.platform == RuntimePlatform.OSXEditor)
                return string.Format("{0}/StreamingAsset/", Application.dataPath);
            else if (Application.platform == RuntimePlatform.Android)
                return string.Format("{0}!/asset/", Application.dataPath);
            else if (Application.platform == RuntimePlatform.IPhonePlayer)
                return string.Format("{0}/Raw/", Application.dataPath);
            return "";
        }
    }

    public static string localBundlePath { get { return string.Format("{0}", localResPath); } }

    public static string localCachePath
    {
        get { return string.Format("{0}/{1}/", Application.streamingAssetsPath,  "Android"); }
    }

    //public static string localBundleCachePath { get { return string.Format("{0}Assetbundles/", localCachePath); } }
    public static string localBundleCachePath { get { return string.Format("{0}", localCachePath); } }

    public static string GetPath(string relativePath, bool existsLocalRes = true)
    {
        relativePath = relativePath.ToLower();
#if UNITY_EIDTOR
        return string.Format("{0}{1}{2}", GetFileSymbol(), URL.localBundlePath, relativePath);
#elif UNITY_WEB || UNITY_WEBPLAYER
        return string.Format("{0}{1}", GetFileSymbol(), URL.localBundlePath, relativePath);
#endif
        //if (FileTools.IsExistFile(localBundleCachePath + relativePath))
            return string.Format("file://{0}{1}", localBundleCachePath, relativePath);
        //else
            //return string.Format("{0}{1}{2}", GetFileSymbol(), URL.localBundlePath, relativePath);
    }

    public string GetRelativePath()
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
}
