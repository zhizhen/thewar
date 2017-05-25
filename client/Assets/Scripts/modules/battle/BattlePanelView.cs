using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.UI;
using Engine;

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
    }

    public void Init()
    {
        m_battleSkillUI.InitSkillJoyStick();
    }
}