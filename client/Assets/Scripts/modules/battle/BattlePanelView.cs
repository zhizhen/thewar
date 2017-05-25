using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using Engine;
using UIExtend;

public class BattlePanelView : Singleton<BattlePanelView>
{
    private BattleSkillUI m_battleSkillUI;
	public GameObject view;

    public BattlePanelView()
    {
        GameObject UIRootCanvas = GameObject.Find("UIRootCanvas");
//        GameObject UICamera = UIRootCanvas.transform.FindChild("UICamera").gameObject;
        view = ResourceMgr.GetGameObject(URLConst.GetUI(UIType.battle.Name));
        view.transform.SetParent(UIRootCanvas.transform);
        view.transform.localPosition = new Vector3(0, 0, 0);
        view.transform.localScale = new Vector3(1, 1, 1);
        m_battleSkillUI = new BattleSkillUI();

		GameObject cardbtn = view.transform.FindChild ("Image").gameObject;
		UIEventHandlerBase.AddListener(cardbtn, UIEventType.ON_POINTER_DOWN, delegate (GameObject arg1, BaseEventData arg2){
			Debug.Log("point down!!!!!!!!");

//			SceneMgr.Instance.GetCurSceneView().addMonster(100101);
		});
		UIEventHandlerBase.AddListener(cardbtn, UIEventType.ON_POINTER_UP, delegate (GameObject arg1, BaseEventData arg2){
			Debug.Log("point Up!!!!!!!!");

			GameObject m_CurSceneGO = SceneManager.GetActiveScene().GetRootGameObjects()[0];
			Vector3 pos = m_CurSceneGO.transform.FindChild("Camera").GetComponent<Camera>().ScreenToWorldPoint(Input.mousePosition);
			SceneMgr.Instance.GetCurSceneView().addMonster(100101, new Vector3(pos.x, pos.y, 0));
		});
    }

    public void Init()
    {
        m_battleSkillUI.InitSkillJoyStick();
    }
}