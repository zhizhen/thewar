using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Security;
using UnityEngine;

namespace Engine
{
    public class ResourceMgr : BaseLoader
    {
        public static ResourceMgr Instance = null;

        public Action bundleVersionLoaded;

        void Awake()
        {
            Instance = this;

            GameObject.DontDestroyOnLoad(this);
        }

        IEnumerator Start()
        {
            yield return StartCoroutine(Initialize());
            yield return StartCoroutine(Load("uirootcanvas.ui", "UIRootCanvas"));
            /*
#if _DEBUG
            if(bundleVersionLoaded != null)
            {
                bundleVersionLoaded();
            }
            yield break;
#else
            yield return StartCoroutine(AnalyzeBundleDepends(URL.GetPath("BundleVersion" + URLConst.EXTEND_ASSETBUNDLE), localVersions));
            if (bundleVersionLoaded != null)
            {
                bundleVersionLoaded();
            }
#endif
*/
        }
        /*

        public DownloadTask DownLoadBundles(string[] bundlePaths, Action<object> downloadCall, ushort priority, Action<Resource, int, int> downPerAsset = null)
        {
            DownloadTask task = ObjectPool.GetObject<DownloadTask>();
            task.InitTask(bundlePaths, FinishDownloadTask, downloadCall, downPerAsset, null, null, null, priority);
            if (task.HasDownload())
            {
                addDownLoadTask(task);
            }
            return task;
        }
        */
    }
}