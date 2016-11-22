using System;
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

    public MainCamera mainCamera
    {
        get
        {
            if (m_mainCamera == null)
            {
                Camera camera = GameTools.mainCameraGO.AddComponent<Camera>();
                m_mainCamera = GameTools.mainCameraGO.AddComponent<MainCamera>();
                m_mainCamera.SetCamera(camera);
            }
            return m_mainCamera;
        }
    }

    public void Init()
    {
        m_Scenes = new Dictionary<int, SceneBaseView>();
        EnterScene("1004");
    }

    private void EnterScene(string sceneId)
    {
        Action<GameObject> fnLoadFinish = delegate (GameObject kSceneGO)
        {
            m_CurSceneGO = kSceneGO;
            if (_baseView == null)
            {
                _baseView = new SceneBaseView();
                _baseView.Init();
            }
            else
            {
                _baseView.Init();
            }
            if (_baseView != null)
                _baseView.OnChangeScene();
#if UNITY_EDITOR
            //MouseMgr.Instance.Run();
#endif
        };
        SceneLoaderMgr.Instance.Load(sceneId, fnLoadFinish);
    }

    public GameObject curSceneGO
    {
        get { return m_CurSceneGO; }
        set { m_CurSceneGO = value; }
    }
}