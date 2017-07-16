using System;
using UnityEngine;

[Serializable]
public class CreateAction : IAction
{
	public Vector3 pos;

	public CreateAction(Vector3 pos)
	{
		pos = pos;
	}

	public Vector3 Pos
	{
		get { return pos; }
		set { pos = value; }
	}

	public void ProcessAction() {
		SceneMgr.Instance.GetCurSceneView().addMonster(100101, new Vector3(pos.x, pos.y, 0));
	}

	public void SyncAction(){
//		ActionController.Instance.
	}
}