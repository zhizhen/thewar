using UnityEngine;
using System.Collections;
using Engine;

public class GameApp : MonoBehaviour {
    private float otherStep;
    private int step, resStep, resTotal = 4;

    // Use this for initialization
    void Start () {
        //NetMgr.GetInstance ().connect ("113.105.250.96", 12000);
        Driver.InitApp(gameObject);
        OnLoadUILoading();
        EnterGame();
    }

    private void OnLoadUILoading()
    {
        UILoading.subTitle = "正在加载中，请耐心等待，<color=yellow>（此加载不消耗流量）</color>";
        UILoading.ShowLoading();

        LoadNeedRes();
    }
	
	// Update is called once per frame
	void Update () {
	
	}

    private void LoadNeedRes()
    {
        gameObject.AddComponent<ResourceMgr>();
        ResourceMgr.Instance.bundleVersionLoaded = () =>
        {
            otherStep++;
            /*
            ResourceMgr.Instance.DownLoadBundles(URLConst.listInitGameRes.ToArray(), OnNeedResLoaded,
                ResourceMgr.DEFAULT_PRIORITY, OnDownLoadCallBack);
                */
        };
    }

    private void OnNeedResLoaded(object userdata)
    {
        otherStep++;
        EnterGame();
    }

    private void OnDownLoadCallBack(Resources res, int listCount, int index)
    {
#if _DEBUG
        resTotal = listCount - 1;
#else
        resTotal = listCount + index;
#endif
        resStep = index;
    }

    private void EnterGame()
    {
        InitUGUIMain();
    }

    static private void InitUGUIMain()
    {
        //GameObject rootCanvas = ResourceMgr.GetGameObject(URLConst.GetUI("UIRootCanvas"));
    }

}
