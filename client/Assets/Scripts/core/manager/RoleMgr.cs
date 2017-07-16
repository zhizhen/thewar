using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoleMgr : Singleton<RoleMgr>
{
	public int role_id;
	public int RoleId
	{
		get { return role_id; }
		set { role_id = value; }
	}
	public RoleMgr()
	{
		
	}
}
