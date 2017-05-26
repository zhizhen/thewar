using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class AccountController : Singleton<AccountController>
{

	public AccountController()
	{
		AddListener();
	}

	virtual protected void AddListener()
	{
		NetMgr.addCMD (ProtoMap.m__role__list__s2c, AccountLoginS2C);
	}

	public void AccountLogin()
	{
		m__account__login__c2s proto = new m__account__login__c2s();
		proto.account_id = "abc";
		proto.ticket = "123";
		proto.platform = 0;
		proto.server_id = 1000;
		NetMgr.Instance.send(proto);
	}

	public void AccountLoginS2C(ProtoBase proto)
	{
		Debug.Log ("role list");
		m__role__list__s2c p = proto as m__role__list__s2c;
		if (p.role_list.Count == 0) {
			m__role__create__c2s create_c2s = new m__role__create__c2s ();
			create_c2s.name = "我叫金三胖";
			NetMgr.Instance.send (create_c2s);
		} else {
			m__role__login__c2s login_c2s = new m__role__login__c2s();
			login_c2s.id = p.role_list [0].id;
			NetMgr.Instance.send (login_c2s);
		}
	}
}
