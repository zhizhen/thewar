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

    public void Run(bool bRun = true)
    {

    }
}