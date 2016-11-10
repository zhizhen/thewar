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
        view = UIManager.Instance.GetSingleUI(UIType.battle);
        GameObject rootcanvas = GameObject.Find("UIRootCanvas");
        m_battleSkillUI = new BattleSkillUI();
    }

    public void Init()
    {
        m_battleSkillUI.InitSkillJoyStick();
    }
}