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

	public void EnterSceneC2S()
	{
		m__scene__enter__c2s proto = new m__scene__enter__c2s ();
		proto.scene_id = 1003;
		NetMgr.Instance.send (proto);
		SceneMgr.Instance.EnterScene("1003");
	}
}