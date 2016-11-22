using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class SceneController : Singleton<SceneController>
{
    private SceneModel sceneModel;

    public SceneController()
    {
        sceneModel = DataMgr.sceneModel;
        AddListener();
    }

    virtual protected void AddListener()
    {

    }
}