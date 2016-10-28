using System;
using System.Collections;
using UnityEngine;
using Engine;

public class ModelElement : GlobalBase
{
    private string m_strURL = null;

    public ModelElement(EntityBase own): base(own)
    {

    }

    public void LoadRes(Action<GameObject, object> loadCompleted = null, bool resetRes = false)
    {
        if (resetRes == false)
            own.attr.GetDefaultPrefabId();
        m_strURL = URLConst.GetModel(own.attr.prefabId.ToString());
        ModelMgr.Instance.GetModel(m_strURL, delegate (GameObject kGO, object kArg)
        {
        });
    }
}