using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

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
}
