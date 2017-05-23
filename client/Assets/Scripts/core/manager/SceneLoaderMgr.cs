using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Engine;

public class SceneLoaderMgr : Singleton<SceneLoaderMgr>, ITick
{
    private int curNum = 0, totalNum = 0;
    public static bool isLoading = false;
    private int m_sceneId;
    private bool _isLoadingComplete;
    private GameObject m_kScenePrefab;
    private Action<GameObject> callBack;

	public int sceneId { get { return m_sceneId; } set { m_sceneId = value; } }

	public void Load(SceneVo Vo, Action<GameObject> callBack = null, string[] preloadAssets = null)
    {
        if (isLoading) return;
		UILoading.ShowLoading(string.Concat("正在进入", Vo.id, "场景..."), "正在预加载", 0);
        this.callBack = callBack;
		this.m_sceneId = Vo.id;
		SceneMgr.Instance.SceneVo = Vo;
        isLoading = true;
        _isLoadingComplete = false;
        GameObjectExt.Destroy(m_kScenePrefab);
        // Loadinge
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
		sceneURLs[0] = URLConst.GetScenePrefab(Vo.id);
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
        SceneManager.LoadSceneAsync("scene" + sceneId);
		TickMgr.Instance.AddTick(this);
    }

    private void DownLoadCompleteAll()
    {
        UILoading.CloseLoading();
        if (callBack != null)
            callBack(m_kScenePrefab);
    }

    public void OnTick(float dt)
    {
        if (_isLoadingComplete)
        {
            _isLoadingComplete = false;
            isLoading = false;
            TickMgr.Instance.RemoveTick(this);

			Resource resPrefab = ResourceMgr.Instance.GetResource(URLConst.GetScenePrefab(m_sceneId));
            m_kScenePrefab = GameObjectExt.Instantiate(resPrefab.MainAsset, true) as GameObject;
            GameObject.DontDestroyOnLoad(m_kScenePrefab);
            resPrefab.Destory(false, true);
            DownLoadCompleteAll();
        }
    }
}
