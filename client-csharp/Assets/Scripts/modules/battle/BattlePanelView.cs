using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class BattlePanelView : Singleton<BattlePanelView>
{
    private BattleSkillUI m_battleSkillUI;

    public BattlePanelView()
    {
        m_battleSkillUI = new BattleSkillUI();
    }

    public void Init()
    {
        m_battleSkillUI.InitSkillJoyStick();
    }
}