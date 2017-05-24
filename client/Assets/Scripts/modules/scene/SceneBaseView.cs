using Engine;
using System;
using System.Collections.Generic;
using UnityEngine;

public class SceneBaseView
{
    //protected SceneController controller;
    protected SceneMgr mgr;
    protected MainCamera mainCamera = null;
    protected GameObject gameObject;
    protected Transform transform;
    protected PropsProxy propsProxy;
    protected Transform monsterTrans;
    protected Transform playerTrans;
    protected Transform npcTrans;
    protected Transform bornTrans;

    public SceneBaseView()
    {
        mgr = SceneMgr.Instance;
    }

    virtual public void Init()
    {
        gameObject = SceneMgr.Instance.curSceneGO;
        transform = gameObject.transform;
        propsProxy = transform.GetComponent<PropsProxy>();
        playerTrans = GetTransform("player");
        bornTrans = GetTransform("born");

		if (SceneMgr.Instance.SceneVo.id != 1001) {
			// 显示战斗界面
			BattlePanelView.Instance.Init ();

			// 播放背景音效

			//摄像机调整
			InitCamera (bornTrans);

			//加载玩家
//			OnRoleInfo ();
		}
    }

    virtual public void InitCamera(Transform bornTrans)
    {
        //var bornPos = Vector3.zero;
        //SceneMgr.Instance.mainCamera.DetachFromParent(bornPos);
        //SceneMgr.Instance.mainCamera.LookAt(bornPos);
    }

    public void OnChangeScene()
    {

    }

//    private void OnRoleInfo()
//    {
//        EntityBase mainRole;
//        mainRole = EntityMgr.Instance.CreateEntity(CONST_ENTITY_TYPE.MAIN_ROLE, 123456);
//        mainRole.transform.parent = bornTrans;
//        mainRole.SetExtraInfo();
//        mainRole.LoadRes(
//            (mainEnt, kArg) =>
//            {
//                Debug.Log("角色初始成功!");
//                //ModelLoaded += 1;
//                //PlayerLoaded = true;
//                //SceneMgr.Instance.mainCamera.SetFollowTarget(mainEnt, true);
//                SetInteractive(true);
//            }
//            );
//    }

	public void addMonster(int MonId)
	{
		EntityBase monster;
		monster = EntityMgr.Instance.CreateEntity(CONST_ENTITY_TYPE.MAIN_ROLE, 123456);
		monster.transform.parent = bornTrans;
//		mainRole.SetExtraInfo();
		monster.LoadRes(MonId,
			(mainEnt, kArg) =>
			{
				Debug.Log("角色初始成功!");
				//ModelLoaded += 1;
				//PlayerLoaded = true;
				//SceneMgr.Instance.mainCamera.SetFollowTarget(mainEnt, true);
				SetInteractive(true);
			}
		);
	}

    protected Transform GetTransform(string name)
    {
        Transform trans = transform.Find(name);
        if (trans == null)
        {
            trans = new GameObject(name).transform;
            trans.parent = transform;
        }
        return trans;
    }

    private static void SetInteractive(bool value)
    {
        TouchMgr.Instance.SetActiveEx(value);
        //KeyManager.Instance.SetActiveEx(value);
        //ModelMoveController.Instance.SetActiveEx(value);
        CharaController.Instance.Init();
    }
}