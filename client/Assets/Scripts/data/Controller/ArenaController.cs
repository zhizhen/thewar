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

	}

	public void ArenaMatch()
	{
		m__arena__match__c2s proto = new m__arena__match__c2s();
		NetMgr.Instance.send(proto);
	}
}