using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class ActionController : Singleton<ActionController>
{

	public ActionController()
	{
		AddListener();
	}

	virtual protected void AddListener()
	{
		NetMgr.addCMD (ProtoMap.m__action__sync__s2c, SyncActionS2C);
		NetMgr.addCMD (ProtoMap.m__action__confirm__s2c, ConfirmActionS2C);

	}

	public void SyncAction(int turnid, int roleid, byte[] action){
		m__action__sync__c2s proto = new m__action__sync__c2s ();
		proto.turn_id = turnid;
		proto.role_id = roleid;
		proto.action = action;
		NetMgr.Instance.send (proto);
	}

	public void SyncActionS2C(ProtoBase proto) {
		Debug.Log ("sync s2c!");
		m__action__sync__s2c p = proto as m__action__sync__s2c;
		IAction a = BinarySerialization.DeserializeObject<IAction> (p.action);
		LockStepMgr.Instance.SyncAction (p.turn_id, p.role_id, a);
		m__action__confirm__c2s p1 = new m__action__confirm__c2s ();
		p1.role_id = RoleMgr.Instance.RoleId;
		p1.turn_id = p.turn_id;
		NetMgr.Instance.send (p1);
	}

	public void ConfirmActionS2C(ProtoBase proto)
	{
		Debug.Log ("confirm action s2c!");
	}
}



  