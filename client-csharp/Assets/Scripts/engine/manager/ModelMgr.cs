using System;
using System.Collections.Generic;
using UnityEngine;
using Engine;

public class ModelMgr : Singleton<ModelMgr>
{
    protected struct MODEL_LOAD_INFO
    {
        public Action<GameObject, object> fnLoaded;
        public object kArg;
        public bool isPreload;
    }

    protected Dictionary<string, GameObject> m_mapRawModel;
    protected Dictionary<string, List<GameObject>> m_mapModel;
    protected Dictionary<string, List<GameObject>> m_mapModelUsing;

    protected Dictionary<string, List<MODEL_LOAD_INFO>> m_mapRawModelLoading;
    protected List<string> m_stopLoading;

    public ModelMgr()
    {
        m_mapRawModel = new Dictionary<string, GameObject>();
        m_mapModel = new Dictionary<string, List<GameObject>>();
        m_mapModelUsing = new Dictionary<string, List<GameObject>>();
        m_mapRawModelLoading = new Dictionary<string, List<MODEL_LOAD_INFO>>();

        m_stopLoading = new List<string>();
    }

    public void GetModels(string[] strURLs, Action<GameObject, object> fnLoaded, object kArg, ushort priority, bool isPreload = false)
    {
        for (int i = 0; i <= strURLs.Length - 1; i++)
        {
            GetModel(strURLs[i], fnLoaded, strURLs[i], priority, isPreload);
        }
    }

    public void GetModel(string strURL, Action<GameObject, object> fnLoaded, object kArg = null, ushort priority = 100, bool isPreload = false)
    {
        GameObject kNewGO = null;
        GameObject kRawGO;
        List<GameObject> listGO;
        List<MODEL_LOAD_INFO> listMR;

        Action<string, GameObject, Action<GameObject, object>, object> callBack =
            (string strUrl, GameObject kgo, Action<GameObject, object> loadCall, object arg) =>
            {
                if (kgo != null)
                {
                    //kgo.ResetLocalPosition();
                    m_mapModelUsing.Add<string, GameObject>(strUrl, kgo);
                    GameObject.DontDestroyOnLoad(kgo);
					loadCall(kgo, arg);
                }
            };
        //从缓存池中取
        if (isPreload == false)
        {
            if (m_mapModel.ContainsKey(strURL))
            {
                listGO = m_mapModel[strURL];
                if (listGO.Count > 0)
                {
                    callBack(strURL, listGO[0], fnLoaded, kArg);
                    listGO.RemoveAt(0);
                    return;
                }
            }
        }
        //从内存中创建新的一个
        if (m_mapRawModel.ContainsKey(strURL))
        {
            kRawGO = m_mapRawModel[strURL];
            if (isPreload == false)
                kNewGO = GameObjectExt.Instantiate(kRawGO, true) as GameObject;
            callBack(strURL, kNewGO, fnLoaded, kArg);
            return;
        }

        //如果当前资源正在加载，返回
        MODEL_LOAD_INFO kMLI;
        if (m_mapRawModelLoading.ContainsKey(strURL))
        {
            listMR = m_mapRawModelLoading[strURL];
            kMLI.fnLoaded = fnLoaded;
            kMLI.kArg = kArg;
            kMLI.isPreload = isPreload;
            listMR.Add(kMLI);
            return;
        }

        //从文件中加载对象
        Action<object> fnLoadFinish = delegate (object kData)
        {
            listMR = m_mapRawModelLoading[strURL];
            m_mapRawModelLoading.Remove(strURL);
            if (m_stopLoading.Contains(strURL))
            {
                m_stopLoading.Remove(strURL);
                listMR.Clear();
                listMR = null;
                return;
            }
            Resource kRes = ResourceMgr.Instance.GetResource(strURL);
            kRawGO = kRes.MainAsset as GameObject;
            if (kRawGO == null)
            {
                Debug.LogError("AssetBundle' mainAsset is null, url: " + strURL);
                return;
            }
            m_mapRawModel[strURL] = kRawGO;
            for (int i = 0; i < listMR.Count; i++)
            {
                if (listMR[i].fnLoaded != null)
                {
                    if (listMR[i].isPreload == false)
                        kNewGO = GameObjectExt.Instantiate(kRawGO, true) as GameObject;
                    callBack(strURL, kNewGO, listMR[i].fnLoaded, listMR[i].kArg);
                }
            }
            kRes.Destory(false, true);
            kRes = null;
            listMR.Clear();
            listMR = null;
        };
        if (!m_mapRawModelLoading.ContainsKey(strURL))
        {
            listMR = new List<MODEL_LOAD_INFO>();
            m_mapRawModelLoading[strURL] = listMR;
        }
        else
            listMR = m_mapRawModelLoading[strURL];
        kMLI.fnLoaded = fnLoaded;
        kMLI.kArg = kArg;
        kMLI.isPreload = isPreload;
        listMR.Add(kMLI);
        ResourceMgr.Instance.DownLoadBundle(strURL, fnLoadFinish, priority);
    }
}
