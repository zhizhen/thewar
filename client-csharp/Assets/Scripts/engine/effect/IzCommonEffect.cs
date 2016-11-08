using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class IzCommonEffect : IzCommonEffectBase
{
    public delegate void ON_LOAD_RES_FINISH(IzCommonEffect kEffect, bool bSucceed, object kArg);
    public string m_prefabId;

    public IzCommonEffect(string prefabId)
    {
        m_prefabId = prefabId;
    }

    public virtual void LoadResByType(ON_LOAD_RES_FINISH fnFinish = null, object kArg = null, bool isPay = false)
    {
        string strURL = URLConst.GetEffect(m_prefabId);
        LoadRes(strURL, fnFinish, kArg);
    }

    public virtual void LoadRes(string strURL, ON_LOAD_RES_FINISH fnFinish = null, object kArg = null)
    {
        Action<GameObject, object> fnModelLoaded =
            delegate (GameObject kGO, object kArg2)
            {

            };
        ModelMgr.Instance.GetModel(strURL, fnModelLoaded, kArg, ResourceMgr.DEFAULT_PRIORITY);
    }
}
