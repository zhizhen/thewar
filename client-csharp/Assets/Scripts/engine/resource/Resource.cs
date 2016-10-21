using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using System.Collections;

namespace Engine
{
    public class Resource
    {
        public List<Resource> dependencies;
        public int tryCount = 0;
        private WWW _www;
        private UnityEngine.Object mainAsset;
        private AudioClip audioClip;
        private bool isLoading = false;
        private string bundlePath = string.Empty;
        private int m_referenceCount = 0;
        private Dictionary<string, UnityEngine.Object> m_kDicObject;
        private Sprite _mainSprite;

        public string BundlePath
        {
            get { return bundlePath; }
            set { bundlePath = value; }
        }

        public UnityEngine.Object MainAsset
        {
#if _DEBUG
            set{ mainAsset = value; }
            get{ return mainAsset; }
#else
            get
            {
                string name = FileTools.GetFileNameNOExtension(bundlePath);
                if(IsDone)
                {
                    if(mainAsset == null && _www != null && _www.assetBundle != null)
                    {
                        try
                        {
                            mainAsset = _www.assetBundle.LoadAsset(name);
                        }
                        catch(Exception ex)
                        {
                            Debug.LogError(bundlePath + "获取MainAsset错误:" + ex.Message);
                        }
                    }
                    return mainAsset;
                }
                else if(_www != null && _www.assetBundle != null)
                {
                    return _www.assetBundle.LoadAsset(name);
                }
                return null;
            }
#endif
        }

        public void Reference()
        {
            m_referenceCount++;
            if(dependencies != null && dependencies.Count > 0)
            {
                for (int i = 0; i < dependencies.Count; i++)
                {
                    var child = dependencies[i];
                }
            }
        }

        public void UnReference()
        {
            if (m_referenceCount > 0)
                m_referenceCount--;
            if(dependencies != null && dependencies.Count > 0)
            {
                for(int i = 0; i < dependencies.Count; i++)
                {
                    var child = dependencies[i];
                }
            }
        }

        private void UnloadAllLoadedAssets()
        {
            m_referenceCount = 0;
            if (_www != null && _www.assetBundle != null)
                _www.assetBundle.Unload(true);
            m_kDicObject.Clear();
            _mainSprite = null;
        }

        public void Destory(bool unloadAllLoadedAssets = true, bool destoryDepends = false)
        {
            tryCount = 0;
            UnReference();
            //if (unloadAllLoadedAssets)
            //    UnloadAllLoadedAssets();
            //else
            //    UnloadAssetBundle();

            //DestoryDepends(unloadAllLoadedAssets, destoryDepends);

            //if (dependencies != null)
            //    dependencies.Clear();
        }
    }
}