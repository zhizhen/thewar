using System;
using UnityEngine;
using Engine;

public class TouchMgr : Singleton<TouchMgr>
{
    private EntityBase m_owner;
    private EntityBase m_currentSelectEntity = null;
    
    public TouchMgr()
    {
        m_owner = EntityMainRole.Instance;
    }

    public void SetActiveEx(bool active)
    {
        if (active)
            GlobalTimer.Instance.update += OnGUI;
        else
            GlobalTimer.Instance.update -= OnGUI;
    }

    public void Run(bool bRun = true)
    {

    }

    private void OnGUI(float dt)
    {

    }
}