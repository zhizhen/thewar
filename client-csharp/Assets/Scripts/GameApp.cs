using UnityEngine;
using System.Collections;
using System;
using Engine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class GameApp : MonoBehaviour
{
    private bool isCompletedLoad = false;
    private bool showProgress = true;
    private float otherStep;
    private int step, resStep, resTotal = 4;
    private const int aspet = 0;
    private readonly int otherTotal = 2 + aspet;
    private readonly Action[] frameActions = {SoundUtils.OnInitSound};

    // Use this for initialization
    void Start () {
        //NetMgr.GetInstance ().connect ("113.105.250.96", 12000);
        Driver.InitApp(gameObject);
        OnLoadUILoading();
        //EnterGame();
    }

    private void OnLoadUILoading()
    {
        UILoading.subTitle = "正在加载中，请耐心等待，<color=yellow>（此加载不消耗流量）</color>";
        UILoading.ShowLoading();

        LoadNeedRes();
    }
	
	// Update is called once per frame
	void Update () {
	    if(showProgress)
        {
            OnProgress();
            if (resStep >= resTotal)
            {
                if (isCompletedLoad)
                {
                    OnCompleteLoaded();
                    return;
                }
                if(step < frameActions.Length)
                {
                    frameActions[step]();
                    step++;
                }
            }
        }
	}

    private void OnCompleteLoaded()
    {
        showProgress = false;
        UILoading.CloseLoading();
        GameObject UIRootCanvas = GameObject.Find("UIRootCanvas");
        GameObject UICanvas = UIRootCanvas.transform.FindChild("UICanvas").gameObject;
        GameObject UICamera = UIRootCanvas.transform.FindChild("UICamera").gameObject;
        GameObject panel = ResourceMgr.Instance.GetGameObject("uiinputaccount.ui", "UIInputAccount");
        panel.transform.parent = UICanvas.transform;
        Canvas canvas = panel.GetComponent<Canvas>();
        Camera camera = UICamera.GetComponent<Camera>();
        canvas.renderMode = RenderMode.ScreenSpaceCamera;
        canvas.worldCamera = camera;
    }

    private void OnProgress()
    {
        resStep++;
        var curStep = step + resStep + otherStep;
        var totalStep = resTotal + frameActions.Length + otherTotal; //4 + 4 + 2
        UILoading.percent = curStep * 1.0f / totalStep;
        if (curStep >= totalStep) isCompletedLoad = true;
    }

    private void LoadNeedRes()
    {
        gameObject.AddComponent<ResourceMgr>();
       ResourceMgr.Instance.bundleVersionLoaded = () =>
       {
            otherStep++;
            OnNeedResLoaded(new object());
            //ResourceMgr.Instance.DownLoadBundles(URLConst.listInitGameRes.ToArray(), OnNeedResLoaded,
            //    ResourceMgr.DEFAULT_PRIORITY, OnDownLoadCallBack);
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

    private void InitUGUIMain()
    {
        GameObject UIRootCanvas = ResourceMgr.Instance.GetGameObject("uirootcanvas.ui", "UIRootCanvas");
        GameObject UICanvas = UIRootCanvas.transform.FindChild("UICanvas").gameObject;
        GameObject UICamera = UIRootCanvas.transform.FindChild("UICamera").gameObject;
        GameTools.CanvasCamera = UICamera.GetComponent<Camera>();
        GameTools.UICanvasCamera = UICanvas;

        UIRootCanvas.SetActive(true);
        GameObject.DontDestroyOnLoad(UIRootCanvas);

        GameObject eventSystem = GameObject.Find("EventSystem");
        if (eventSystem == null)
        {
            eventSystem = new GameObject("EventSystem");
            eventSystem.AddComponent<EventSystem>();
            eventSystem.AddComponent<StandaloneInputModule>();
            GameObject.DontDestroyOnLoad(eventSystem);
        }
    }

}
