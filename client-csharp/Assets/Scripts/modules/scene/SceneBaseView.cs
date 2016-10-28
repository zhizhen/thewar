using Engine;
using System;
using System.Collections.Generic;
using UnityEngine;

public class SceneBaseView
{
    //protected SceneController controller;
    protected SceneMgr mgr;
    protected MainCamera mainCamera = null;
    protected GameObject gameObject;
    protected Transform transform;
    protected PropsProxy propsProxy;
    protected Transform monsterTrans;
    protected Transform playerTrans;
    protected Transform npcTrans;
    protected Transform bornTrans;

    public SceneBaseView()
    {
        mgr = SceneMgr.Instance;
    }

    virtual public void Init()
    {
        gameObject = SceneMgr.Instance.curSceneGO;
        transform = gameObject.transform;
        propsProxy = transform.GetComponent<PropsProxy>();

        // 显示主界面

        ContextManager.Instance.Push(new MainMenuContext());
    }

    public void OnChangeScene()
    {

    }
}