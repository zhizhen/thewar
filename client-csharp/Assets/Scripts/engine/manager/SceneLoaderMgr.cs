using System;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using Engine;

public class SceneLoaderMgr : Singleton<SceneLoaderMgr>, ITick
{
    public static bool isLoading = false;
    private bool _isLoadingComplete;

    public void Load(string sceneId)
    {
        if (isLoading) return;
        UILoading.ShowLoading(string.Concat("正在进入", sceneId, "场景..."), "正在预加载", 0);
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
