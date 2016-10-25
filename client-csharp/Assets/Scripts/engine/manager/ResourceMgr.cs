using System;
using System.Collections;
using System.Collections.Generic;
#if UNITY_EDITOR	
using UnityEditor;
#endif
using UnityEngine;

namespace Engine
{
    public class ResourceMgr : MonoBehaviourExt
    {
        public static ResourceMgr Instance = null;
        public Action InitFunc;
        public const ushort DEFAULT_PRIORITY = 1;

        private Dictionary<string, Resource> resources = new Dictionary<string, Resource>();
        private Dictionary<string, ResourceMetaData> localVersions = new Dictionary<string, ResourceMetaData>();

#if UNITY_EDITOR
        static int m_SimulateAssetBundleInEditor = -1;
        const string kSimulateAssetBundles = "SimulateAssetBundles";
#endif  
        //public static string LocalCachedBundlePath;
        //public static string RemoteBundlePath;

        public static string LocalVersionPath;
        public static string LocalCacheVersionPath;
        private List<int> priorityList = new List<int>();
        private Dictionary<int, List<DownloadTask>> newDownloadTasks = new Dictionary<int, List<DownloadTask>>();

        private int threadMax = 3;
        private int threadCount = 0;
        
        void Awake()
        {
            Instance = this;
#if UNITY_EDITOR
            Debug.Log("We are " + (ResourceMgr.SimulateAssetBundleInEditor ? "in Editor simulation mode" : "in normal mode"));
#endif
            GameObject.DontDestroyOnLoad(this);
        }

        IEnumerator Start()
        {
            if (InitFunc != null) { InitFunc(); }
            yield break;
        }

        void Update()
        {
            var count = priorityList.Count;
            if (HasFreeThread() && count > 0)
            {
                List<DownloadTask> TaskList = null;
                for (int i = count - 1; i >= 0; i--)
                {
                    if (!HasFreeThread()) break;
                    if (newDownloadTasks.TryGetValue(priorityList[i], out TaskList))
                    {
                        for (int j = 0; j < TaskList.Count; j++)
                        {
                            if (TaskList[j].HasDownload() && HasFreeThread())
                                TaskList[j].DownloadNext();
                        }
                    }
                }
            }
        }

#if UNITY_EDITOR
        // Flag to indicate if we want to simulate assetBundles in Editor without building them actually.
        public static bool SimulateAssetBundleInEditor
        {
            get
            {
                if (m_SimulateAssetBundleInEditor == -1)
                    m_SimulateAssetBundleInEditor = EditorPrefs.GetBool(kSimulateAssetBundles, true) ? 1 : 0;

                return m_SimulateAssetBundleInEditor != 0;
            }
            set
            {
                int newValue = value ? 1 : 0;
                if (newValue != m_SimulateAssetBundleInEditor)
                {
                    m_SimulateAssetBundleInEditor = newValue;
                    EditorPrefs.SetBool(kSimulateAssetBundles, value);
                }
            }
        }
#endif
        // 加载ab
        public DownloadTask DownLoadBundles(
            string[] bundlePaths, 
            Action<object> downloadCall,
            ushort priority,
            Action<Resource, int, int> downPerAsset = null)
        {
            DownloadTask task = ObjectPool.GetObject<DownloadTask>();
            task.InitTask(bundlePaths, FinishDownloadTask, downloadCall, downPerAsset, null, null, null, priority);
            if (task.HasDownload())
                addDownLoadTask(task);
            return task;
        }

        // 限制同时加载资源线程最大数量
        private bool HasFreeThread()
        {
            return threadCount < threadMax;
        }

        public void LoadResource(Resource resource)
        {
            //StartCoroutine(LoadAsync(resource));
            if (resource.IsLoading || IsDone(resource.BundlePath)) return;
            resource.IsLoading = true;
            BeginDownLoad();
            StartCoroutine(LoadWWWAsync(resource));
            resource.DownLoadEnd();
        }

        private IEnumerator LoadWWWAsync(Resource resource)
        {
            var bundlePath = resource.BundlePath.ToLower();
            bool isFromRemote = false;
            string url = WrapperPath(bundlePath, out isFromRemote);
            WWW www = new WWW(url);
            resource.www = www;
            resource.DownLoadBegin();
            yield return www;

            Debug.Log("加载路径:" + www.url);
            FinishDownLoad();
            resource.IsLoading = false;
        }


        public bool IsDone(string bundlePath)
        {
            var resource = GetResource(bundlePath);
            if (resource != null)
                return resource.IsDone && string.IsNullOrEmpty(resource.error);
            return false;
        }

        public Resource GetResource(string bundlePath)
        {
            if (string.IsNullOrEmpty(bundlePath)) return null;
            Resource resource;
            resources.TryGetValue(bundlePath, out resource);
            if (resource != null) return resource;
            // 新建Resource 并加入到List
            resource = new Resource(bundlePath);
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
            Resource res;
            UnityEngine.Object original;

            res = ResourceMgr.Instance.GetResource(relativePath);
            original = res.MainAsset;
            res.Destory(false, true);
            return GameObjectExt.Instantiate(original) as GameObject;
        }


        private void BeginDownLoad()
        {
            threadCount++;
        }

        private void FinishDownLoad()
        {
            threadCount--;
        }

        private string WrapperPath(string relativePath, out bool isFromRemote)
        {
            string fullPath = URL.GetPath(relativePath, localVersions.ContainsKey(relativePath));
            isFromRemote = fullPath.StartsWith("http://");
            return fullPath;
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