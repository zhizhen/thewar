using System;
using Engine;
using UnityEngine;

public class RoleController : Singleton<RoleController>
{
	public RoleController()
	{
		AddListeners ();
	}

	public void AddListeners()
	{
		NetMgr.addCMD (ProtoMap.m__role__login__s2c, LoginS2C);
	}

	public void CreateRoleC2S(string name)
	{
		m__role__create__c2s create_c2s = new m__role__create__c2s ();
		create_c2s.name = name;
		NetMgr.Instance.send (create_c2s);
	}

	public void LoginC2S(int id)
	{
		m__role__login__c2s login_c2s = new m__role__login__c2s();
		login_c2s.id = id;
		NetMgr.Instance.send (login_c2s);
	}

	public void LoginS2C(ProtoBase proto)
	{
		Debug.Log ("角色登陆返回");
		m__role__login__s2c p = proto as m__role__login__s2c;
		RoleMgr.Instance.RoleId = p.role_info.id;
		SceneMgr.Instance.Init();
		MainMenuView.Instance.Init ();
	}
}