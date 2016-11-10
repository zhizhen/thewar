using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Engine;

public class BattleSkillUI : BattleBaseUI
{
    private GameObject m_joystick;
    private RectTransform m_joystickTransform;
    public Vector2 skill1Position = new Vector2(-160, 130f);

    public void InitSkillJoyStick()
    {
        string uiPath = URLConst.GetUI("UIJoyStick");
        ResourceMgr.Instance.DownLoadBundle(uiPath, downLoadJoyStickComplete, ResourceMgr.UI_PRIORITY);
    }

    private void downLoadJoyStickComplete(object userData)
    {
        m_joystick = ResourceMgr.GetGameObject(URLConst.GetUI("UIJoyStick"));
        m_joystickTransform = m_joystick.GetComponent<RectTransform>();
        GameObject uiCanvas = GameObject.Find("UIRootCanvas");
        UtilsExtends.SetParentExt(m_joystick, uiCanvas.transform);
        m_joystickTransform.anchoredPosition = skill1Position;
    }
}
