using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Security;
using UnityEngine;

namespace Engine
{
    public class ResourceMgr : MonoBehaviourExt
    {
        public static ResourceMgr Instance = null;
        public const ushort DEFAULT_PRIORITY = 1;

        private Dictionary<string, Resource> resources = new Dictionary<string, Resource>();
        private Dictionary<string, ResourceMetaData> localVersions = new Dictionary<string, ResourceMetaData>();

        //public static string LocalBundlePath;
        // 本地资源路径，在程序安装目录中
        
        #if (UNITY_STANDALONE_WIN || UINTY_EDITOR)
            public static string LocalBundlePath = Application.dataPath + "/StreamingAssets/Assetbundles/";
        #elif UNITY_IPHONE
            public static string LocalBundlePath = Application.dataPath + "/Raw/Assetbundles/";
        #elif UNITY_STANDALONE_OSX
            public static string LocalBundlePath = Application.dataPath + "/Data/StreamingAssets/Assetbundles/";
        #elif UNITY_ANDROID
            public static string LocalBundlePath = "jar:file://" + Application.dataPath + "!/assets/Android";
        #endif
        
        public static string LocalCachedBundlePath;
        public static string RemoteBundlePath;

        public static string LocalVersionPath;
        public static string LocalCacheVersionPath;
        private List<int> priorityList = new List<int>();
        private Dictionary<int, List<DownloadTask>> newDownloadTasks = new Dictionary<int, List<DownloadTask>>();

        private int threadMax = 3;
        private int threadCount = 0;

        public Action bundleVersionLoaded;

        void Awake()
        {
            Instance = this;

            GameObject.DontDestroyOnLoad(this);
            //StartCoroutine(Initialize());
        }

        IEnumerator Start()
        {
//#if _DEBUG
            if (bundleVersionLoaded != null) { bundleVersionLoaded(); }
            yield break;
//#else
//            yield break;
//#endif
        }

        void Update()
        {
            if (HasFreeThread() && priorityList.Count > 0)
            {
                var count = priorityList.Count;
                List<DownloadTask> downloadTaskList = null;
                for (int i = count - 1; i >= 0; i--)
                {
                    if (newDownloadTasks.TryGetValue(priorityList[i], out downloadTaskList))
                    {
                        for (int j = 0; j < downloadTaskList.Count; j++)
                        {
                            if (downloadTaskList[j].HasDownload())
                            {
                                StartDownLoadTask(downloadTaskList[j]);
                                if (!HasFreeThread()) break;
                            }
                        }
                    }
                    if (!HasFreeThread()) break;
                }
            }
            else
            {

            }
        }

        private bool HasFreeThread()
        {
            return threadCount < threadMax;
        }

        public void LoadResource(Resouce resource)
        {
            StartCoroutine(LoadAsync(resource));
        }

        private IEnumerator LoadAsync(Resource resource)
        {
            if (resource.IsLoading || IsDone(resource.BundlePath)) yield break;
            resource.IsLoading = true;
            BeginDownLoad();
            yield return StartCoroutine(LoadWWWAsync(resource));
        }

        public bool IsDone(string bundlePath)
        {
            var resource = GetResource(bundlePath);
            if (resource != null)
                return resource.IsDone && string.IsNullOrEmpty(resource.error);
            return false;
        }

        private void StartDownLoadTask(DownloadTask task)
        {
            if (HasFreeThread()) task.DownloadNext();
        }

        public Resource GetResource(string bundlePath)
        {
            if (string.IsNullOrEmpty(bundlePath))
            {
                return null;
            }
            Resource resource;
            resources.TryGetValue(bundlePath, out resource);
            if (resource != null)
                return resource;
            resource = new Resource();
            resource.BundlePath = bundlePath;
            resources[bundlePath] = resource;
            resource.dependencies = GetDependencies(bundlePath);
            return resource;

        }

        public List<Resource> GetDependencies(string bundlePath)
        {
            bundlePath = bundlePath.ToLower();
            if (localVersions.ContainsKey(bundlePath))
            {
                var dependencies = localVersions[bundlePath].Dependencies;
                if(dependencies != null && dependencies.Count > 0)
                {
                    var list = new List<Resource>();
                    for(int i = 0; i < dependencies.Count; i++)
                    {
                        var path = dependencies[i];
                        list.Add(GetResource(path));
                    }
                    return list;
                }
            }
            else
            {
                Debug.Log("找不到" + bundlePath + "相关信息!");
            }
            return null;
        }

        public static GameObject GetGameObject(string relativePath, bool depends = false)
        {
            Material kMaterial = null;
            Resource res;
            UnityEngine.Object original;

            res = ResourceMgr.Instance.GetResource(relativePath);
            original = res.MainAsset;
            res.Destory(false, true);

            return GameObjectExt.Instantiate(original) as GameObject;
        }

        public DownloadTask DownLoadBundles(string[] bundlePaths, Action<object> downloadCall, 
            ushort priority, Action<Resource, int, int> downPerAsset = null)
        {
            DownloadTask task = ObjectPool.GetObject<DownloadTask>();
            task.InitTask(bundlePaths, FinishDownloadTask, downloadCall, downPerAsset, null, null, null, priority);
            if (task.HasDownload())
                addDownLoadTask(task);
            return task;
        }


        private void addDownLoadTask(DownloadTask task)
        {
            List<DownloadTask> downLoadList = null;
            if (newDownloadTasks.TryGetValue(task.priority, out downLoadList))
                downLoadList.Add(task);
            else
            {
                newDownloadTasks[task.priority] = new List<DownloadTask>();
                downLoadList = newDownloadTasks[task.priority];
                downLoadList.Add(task);
            }
            if (!priorityList.Contains(task.priority))
            {
                priorityList.Add(task.priority);
                priorityList.Sort();
            }
        }

        private void FinishDownloadTask(DownloadTask task)
        {
            List<DownloadTask> downLoadList = null;
            if (newDownloadTasks.TryGetValue(task.priority, out downLoadList))
            {
                if (downLoadList.Contains(task))
                    downLoadList.Remove(task);
                if (downLoadList.Count <= 0)
                {
                    if (priorityList.Contains(task.priority))
                        priorityList.Remove(task.priority);
                    if (newDownloadTasks.ContainsKey(task.priority))
                        newDownloadTasks.Remove(task.priority);
                }
            }
            if (task != null) task.Dispose();
        }
        
    }
}