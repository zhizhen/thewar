using System;
using Engine;

public class RoleMgr : Singleton<RoleMgr>
{
	public RoleMgr()
	{
		AddListeners ();
	}

	public void AddListeners()
	{
		NetMgr.addCMD (ProtoMap.m__role__login__s2c, LoginS2C);
	}

	public void LoginC2S()
	{
		ProtoBase proto = new m__role__login__c2s ();
		NetMgr.Instance.send (proto);
	}

	public void LoginS2C(ProtoBase proto)
	{
		SceneMgr.Instance.Init();
	}
}