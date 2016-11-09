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
		NetMgr.Instance.connect ("127.0.0.1", 8000);
        gameObject.AddComponent<GlobalTimer>();
        GameObjectExt.Instantiate(Resources.Load<UnityEngine.Object>("UILoading"));
        ShowLoadingBar();
    }
	
	// Update is called once per frame
	void Update () {
        if (!showProgress) return;
        OnProgress();
        if (isCompletedLoad)
        {
            OnCompleteLoaded();
            return;
        }
        if (step < frameActions.Length)
        {
            frameActions[step]();
            step++;
        }
    }
    
    //void OnGUI()
    //{

    //    GUI.Box(new Rect(5, 80, 100, 20), string.Format("{0:0.000}", Input.GetAxis("Horizontal")));
    //    GUI.Box(new Rect(5, 105, 100, 20), string.Format("{0:0.000}", Mathf.Clamp01(Input.GetAxis("Vertical"))));
    //}

    private void ShowLoadingBar()
    {
        UILoading.subTitle = "正在加载中，请耐心等待，<color=yellow>（此加载不消耗流量）</color>";
        UILoading.ShowLoading();

        gameObject.AddComponent<ResourceMgr>();
        ResourceMgr.Instance.InitFunc = () =>
        {
            otherStep++;
            OnNeedResLoaded(new object());
            ResourceMgr.Instance.DownLoadBundles(URLConst.listInitGameRes.ToArray(), OnNeedResLoaded,
                ResourceMgr.DEFAULT_PRIORITY, OnDownLoadCallBack);
        };
    }

    private void OnCompleteLoaded()
    {
        showProgress = false;
        UILoading.CloseLoading();
        EnterGame();
    }

    private void OnProgress()
    {
        var curStep = step + resStep + otherStep;
        var totalStep = resTotal + frameActions.Length + otherTotal; //4 + 4 + 2
        UILoading.percent = curStep * 1.0f / totalStep;
        if (curStep >= totalStep)
            isCompletedLoad = true;
    }

    private void OnNeedResLoaded(object userdata)
    {
        otherStep++;
    }

    private void OnDownLoadCallBack(Resource res, int listCount, int index)
    {
        if (ResourceMgr.SimulateAssetBundleInEditor)
            resTotal = listCount;
        else
            resTotal = listCount + index;
        resStep = index;
    }

    private void EnterGame()
    {
        InitUGUIMain();
        ContextManager.GetInstance();
    }

    private void InitUGUIMain()
    {
        //GameObject UIRootCanvas = ResourceMgr.Instance.GetGameObject("uirootcanvas.ui", "UIRootCanvas");
        GameObject UIRootCanvas = ResourceMgr.GetGameObject(URLConst.GetUI("UIRootCanvas"));
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
