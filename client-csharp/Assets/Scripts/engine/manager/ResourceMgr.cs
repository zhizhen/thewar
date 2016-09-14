using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Security;
using UnityEngine;

namespace Engine
{
    public class ResourceMgr : BaseLoader
    {
        public static ResourceMgr Instance = null;
        public const ushort DEFAULT_PRIORITY = 1;

        public Action bundleVersionLoaded;

        void Awake()
        {
            Instance = this;

            GameObject.DontDestroyOnLoad(this);
            //StartCoroutine(Initialize());
        }

        IEnumerator Start()
        {
#if _DEBUG
            if(bundleVersionLoaded != null) { bundleVersionLoaded(); }
            yield break;
#else

#endif
        }

        public GameObject GetGameObject(string AssetBundleName, string bundleName)
        {
            GameObject go = Load(AssetBundleName, bundleName);
            return go;
        }
        
    }
}