using UnityEngine;
using System.Collections;
using Engine;

public class GameApp : MonoBehaviour {


    // Use this for initialization
    void Start () {
        //NetMgr.GetInstance ().connect ("113.105.250.96", 12000);
        //InitSceneCamera();
        //GameUI.InitBaseUI();
        //GameObject.DontDestroyOnLoad(gameObject);
        //LoadAssetBundleFile();
        Driver.InitApp(gameObject);
        OnLoadUILoading();
        //EnterGame();
    }

    private void OnLoadUILoading()
    {
        UILoading.subTitle = "正在加载中，请耐心等待，<color=yellow>（此加载不消耗流量）</color>";
        UILoading.ShowLoading();
    }
	
	// Update is called once per frame
	void Update () {
	
	}

    private void InitSceneCamera()
    {
        GameObject mainCameraGo = GameObject.FindWithTag("MainCamera");
        Camera mainCamera;
        if (mainCameraGo == null)
        {
            mainCameraGo = new GameObject("SceneCamera");
            GameObject.DontDestroyOnLoad(mainCameraGo);
            mainCamera = mainCameraGo.AddComponent<Camera>();
            mainCamera.clearFlags = CameraClearFlags.SolidColor;
            mainCamera.backgroundColor = Color.black;
            mainCamera.cullingMask = 0;
        }
        else
        {
            mainCamera = mainCameraGo.GetComponent<Camera>();
        }

    }

    private void LoadAssetBundleFile()
    {
        gameObject.AddComponent<ResourceMgr>();
        StartCoroutine(ResourceMgr.Instance.LoadMainGameObject(ResourceMgr.PathURL + "UIMain.assetbundle"));
    }

    private void EnterGame()
    {

    }

}
