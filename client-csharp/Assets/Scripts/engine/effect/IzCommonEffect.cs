using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class IzCommonEffect : IzCommonEffectBase
{
    public delegate void ON_LOAD_RES_FINISH(IzCommonEffect kEffect, bool bSucceed, object kArg);
    public string m_prefabId;
    public GameObject m_kGO;
    public Transform m_kTRS;

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
                if (kGO == null)
                {
                    Debug.LogError("特效果加载为空：" + strURL);
                    return;
                }
                m_kGO = kGO;
                if (kGO != null)
                {
                    m_kGO.SetParentExt(SceneMgr.Instance.curSceneGO.transform);
                    OnEffectLoadFinish();
                    if (fnFinish != null) fnFinish(this, true, kArg);
                }
                else
                {
                    OnEffectLoadFinish();
                    if (fnFinish != null) fnFinish(this, false, kArg);
                }
            };
        ModelMgr.Instance.GetModel(strURL, fnModelLoaded, kArg, ResourceMgr.DEFAULT_PRIORITY);
    }

    protected virtual void OnEffectLoadFinish()
    {
        m_kTRS = m_kGO.GetComponent<Transform>();
    }
}
