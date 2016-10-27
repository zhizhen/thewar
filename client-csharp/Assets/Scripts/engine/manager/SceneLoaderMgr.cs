using System;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using Engine;

public class SceneLoaderMgr : Singleton<SceneLoaderMgr>, ITick
{
    private int curNum = 0, totalNum = 0;
    public static bool isLoading = false;
    private string m_sceneId;
    private bool _isLoadingComplete;

    public string sceneId { get { return m_sceneId; } set { m_sceneId = value; } }

    public void Load(string sceneId, string[] preloadAssets = null)
    {
        if (isLoading) return;
        UILoading.ShowLoading(string.Concat("正在进入", sceneId, "场景..."), "正在预加载", 0);
        this.m_sceneId = sceneId;
        isLoading = true;
        _isLoadingComplete = false;
        // Loading
        string[] sceneURLs;
        int len = 1;
        if (preloadAssets == null)
            sceneURLs = new string[len];
        else
        {
            sceneURLs = new string[len + preloadAssets.Length];
            for (int i = 0; i < preloadAssets.Length; i++)
            { sceneURLs[len + i] = preloadAssets[i]; }
        }
        sceneURLs[0] = URLConst.GetScenePrefab(sceneId);
        ResourceMgr.Instance.DownLoadBundles(
            sceneURLs, 
            DownLoadComplete,
            ResourceMgr.UI_PRIORITY,
            delegate (Resource res, int listCount, int index)
            {
                totalNum++;
            });
    }

    private void DownLoadComplete(object userData)
    {
        _isLoadingComplete = true;
        TickMgr.Instance.AddTick(this);
        SceneManager.LoadSceneAsync("scene" + sceneId);
    }

    private void DownLoadCompleteAll()
    {
        UILoading.CloseLoading();
    }

    public void OnTick(float dt)
    {
        if (_isLoadingComplete)
        {
            _isLoadingComplete = false;
            isLoading = false;
            DownLoadCompleteAll();
        }
    }
}
