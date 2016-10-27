using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class SceneMgr : Singleton<SceneMgr>
{
    private Dictionary<int, SceneBaseView> m_Scenes;
    private SceneBaseView _baseView;
    private GameObject m_CurSceneGO;
    private MainCamera m_mainCamera;


    public void Init()
    {
        m_Scenes = new Dictionary<int, SceneBaseView>();
        OnSceneReadyToChange("1003");
    }

    private void OnSceneReadyToChange(string sceneId)
    {
        SceneLoaderMgr.Instance.Load(sceneId);
    }

}