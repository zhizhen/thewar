using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class AccountController : Singleton<AccountController>
{
	public string acc;

	public AccountController()
	{
		AddListener();
	}

	virtual protected void AddListener()
	{
		NetMgr.addCMD (ProtoMap.m__role__list__s2c, AccountLoginS2C);
	}

	public void AccountLogin(string account)
	{
		acc = account;
		m__account__login__c2s proto = new m__account__login__c2s();
		proto.account_id = account;
		proto.ticket = "123";
		proto.platform = 0;
		proto.server_id = 1000;
		NetMgr.Instance.send(proto);
	}

	public void AccountLoginS2C(ProtoBase proto)
	{
		Debug.Log ("角色列表返回");
		m__role__list__s2c p = proto as m__role__list__s2c;
		if (p.role_list.Count == 0) {
			// 创建角色
			RoleController.Instance.CreateRoleC2S (acc);
		} else {
			// 登陆角色
			RoleController.Instance.LoginC2S (p.role_list [0].id);
		}
	}
}
