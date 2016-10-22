using System;
using System.Collections.Generic;
using UnityEngine;

namespace Engine
{
    public class DownloadTask
    {
        private Action<Resource> beginCallBack;
        private Action<string, string> failCallBack;
        private Action<Resource, int, int> downLoadCallBackPerAsset;
        private Action<object> downloadCallBack;
        private Action<DownloadTask> finishTaskCallBack;
        private object userData;
        private int finishCount = 0;
        private Resource[] resList;
        private List<Resource> downloads = new List<Resource>();

        public ushort priority = ResourceMgr.DEFAULT_PRIORITY;

        public void InitTask(string[] bundlePaths, Action<DownloadTask> finishTaskCall, 
            Action<object> downloadCall, Action<Resource, int, int> downloadPerCall, 
            object data, Action<Resource> beginCall, Action<string, string> failCall, ushort priority)
        {
            this.finishTaskCallBack = finishTaskCall;
            this.downloadCallBack = downloadCall;
            this.failCallBack = failCall;
            this.downLoadCallBackPerAsset = downloadPerCall;
            this.beginCallBack = beginCall;
            this.userData = data;
            this.finishCount = 0;
            this.priority = priority;
            int i;
            /*
#if _DEBUG
            for(i = 0; i < bundlePaths.Length; i++)
            {
                var bundlePath = bundlePaths[i];
                Resource resource = ResourceMgr.Instance.GetResource(bundlePath);
                if (beginCallBack != null)
                    beginCallBack(resource);
                try
                {
                    string strExtend = FileTools.GetExtension(bundlePath);
                    string strAssetBundlePath = "Resources/GameAssets/Assetbundles/" + bundlePath.Replace(strExtend, "");
                    Debug.Log("正在加载：" + strAssetBundlePath);
                    resource.MainAsset = Resources.Load("GameAssets/Assetbundles/" + bundlePath.Replace(strExtend, ""));
                    if (resource.MainAsset == null && !URLConst.listInitGameRes.Contains(bundlePath))
                    {
                        Debug.LogError(strAssetBundlePath + "不存在！");
                    }
                    if (downLoadCallBackPerAsset != null)
                        downLoadCallBackPerAsset(resource, bundlePaths.Length, finishCount);
                }
                catch(Exception ex)
                {
                    if (failCallBack != null)
                        failCallBack(resource.BundlePath, "加载错误:" + ex.Message);
                }
                finishCount++;
            }
            if (downloadCallBack != null)
                downloadCallBack(userData);
            if (finishTaskCallBack != null)
                finishTaskCallBack(this);
#else
*/
            bool hasIsDone = false;
            List<Resource> loadQueue = new List<Resource>();
            for(i = 0; i < bundlePaths.Length; i++)
            {
                var bundlePath = bundlePaths[i];
                var resource = ResourceMgr.Instance.GetResource(bundlePath);
                if (ResourceMgr.Instance.IsDone(resource.BundlePath))
                {
                    resource.Reference(); // 已加载的，根节点增加计数
                    hasIsDone = true;
                    continue;
                }
                loadQueue.Clear();
                FlattenResource(resource, loadQueue);
                loadQueue.Reverse();
                for (int j = 0; j < loadQueue.Count; j++)
                {
                    var res = loadQueue[j];
                    if (!downloads.Contains(res))
                    {
                        res.Reference();
                        downloads.Add(res);
                    }
                }
            }
            resList = downloads.ToArray();
            if (hasIsDone)
            {
                for(int j = 0; j < bundlePaths.Length; j++)
                {
                    var bundlePath = bundlePaths[j];
                    var resource = ResourceMgr.Instance.GetResource(bundlePath);
                    if (ResourceMgr.Instance.IsDone(resource.BundlePath))
                    {
                        OnDownloadBegin(resource);
                        OnDownloadEnd(resource);
                        continue;
                    }
                }
                if (HasDownload() == false && resList.Length == 0)
                {
                    if (downloadCallBack != null) downloadCallBack(userData);
                    if (finishTaskCallBack != null) finishTaskCallBack(this);
                }
            }
//#endif
        }

        public bool HasDownload()
        {
            return downloads.Count != 0;
        }

        public void DownloadNext()
        {
            var resource = downloads[0];
            if (resource.IsLoading) return;
            if (ResourceMgr.Instance.IsDone(resource.BundlePath))
            {
                OnDownloadEnd(resource);
                return;
            }
            ResourceMgr.Instance.LoadResource(resource);
        }

        public void Dispose()
        {
            for (int i = 0; i < downloads.Count; i++)
            {
                var resource = downloads[i];
                //RemoveResourceListeners(resource);
            }
            beginCallBack = null;
            failCallBack = null;
            downloadCallBack = null;
            downLoadCallBackPerAsset = null;
            downloads.Clear();
            finishCount = 0;
            userData = null;
            resList = null;
            ObjectPool.ReclaimObject(this);
        }

        protected void RemoveResourceListeners(Resource resource)
        {
            if (resource != null)
            {
                resource.RemoveEventListener<Resource>(Resource.DOWNLOAD_BEGIN, OnDownloadBegin);
            }
        }

        protected void FlattenResource(Resource mainResource, List<Resource> queue)
        {
            queue.Add(mainResource);
            mainResource.AddEventListener<Resource>(Resource.DOWNLOAD_BEGIN, OnDownloadBegin);
            mainResource.AddEventListener<Resource>(Resource.DOWNLOAD_END, OnDownloadEnd);
            mainResource.AddEventListener<Resource>(Resource.DOWNLOAD_ERROR, OnDownloadError);
        }

        private void OnDownloadBegin(Resource resource)
        {
            if (beginCallBack != null) beginCallBack(resource);
        }

        private void OnDownloadEnd(Resource resource)
        {
            //ResourceMgr.Instance.RemoveFreeTimeLoad(resource.BundlePath);
            if (downloads.Contains(resource))
            {
                finishCount++;
                RemoveResourceListeners(resource);
                downloads.Remove(resource);
            }
            if (downLoadCallBackPerAsset != null) downLoadCallBackPerAsset(resource, downloads.Count, finishCount);
            if (downloads.Count == 0 && resList.Length > 0)
            {
                if (downloadCallBack != null) downloadCallBack(userData);
                if (finishTaskCallBack != null) finishTaskCallBack(this);
            }
        }

        private void OnDownloadError(Resource resource)
        {
            Debug.Log("下载错误：" + resource.error);
            if (downloads.Contains(resource))
            {
                finishCount++;
                RemoveResourceListeners(resource);
                downloads.Remove(resource);
            }
            if (failCallBack != null) failCallBack(resource.BundlePath, resource.error);
            if (downloads.Count == 0)
            {
                if (downloadCallBack != null) downloadCallBack(userData);
                if (finishTaskCallBack != null) finishTaskCallBack(this);
            }
        }
    }
}