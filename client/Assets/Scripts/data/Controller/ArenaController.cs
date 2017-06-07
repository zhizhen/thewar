using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class ArenaController : Singleton<ArenaController>
{

	public ArenaController()
	{
		AddListener();
	}

	virtual protected void AddListener()
	{
		NetMgr.addCMD (ProtoMap.m__arena__match__s2c, ArenaMatchS2C);
	}

	public void ArenaMatch()
	{
		m__arena__match__c2s proto = new m__arena__match__c2s();
		NetMgr.Instance.send(proto);
	}

	public void ArenaMatchS2C(ProtoBase proto)
	{
		m__arena__match__s2c p = proto as m__arena__match__s2c;
		SceneController.Instance.EnterSceneC2S ();
	}
}