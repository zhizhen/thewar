using System;
using System.Collections;
using UnityEngine;
using Engine;

public class ModelElement : GlobalBase
{
    private GameObject m_kGO = null;
    private string m_strURL = null;

    private Renderer[] renderers;

    public ModelElement(EntityBase own): base(own)
    {

    }

    public void LoadRes(int MonId, Action<GameObject, object> loadCompleted = null, bool resetRes = false)
    {
        if (resetRes == false)
            own.attr.GetDefaultPrefabId();
		m_strURL = URLConst.GetModel(MonId.ToString());
        ModelMgr.Instance.GetModel(m_strURL, delegate (GameObject kGO, object kArg)
        {
            m_kGO = kGO;
            renderers = m_kGO.GetComponentsInChildren<Renderer>();

            var transform = m_kGO.transform;
            own.ReplaceModel(transform);
            own.SetActive(true);

			loadCompleted(kGO, kArg);
        });
    }
}