using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;

namespace Engine
{
    public class ConfigMgr : Singleton<ConfigMgr>
    {
        private Dictionary<string, object> configs;
        private List<TextAsset> delTextAsset = new List<TextAsset>();
        private Dictionary<int, string> m_MoneyDict;
        private Dictionary<int, bool> m_WindowDic;

        public ConfigMgr()
        {
            GetObject();
        }

        public void GetObject()
        {
            if (configs == null)
            {
#if _DEBUG
                configs = new Dictionary<string, object>();
                var assets = Resources.LoadAll<TextAsset>("GameAssets/Configs");
                for (int i = 0; i < assets.Length; i++)
                {
                    TextAsset kTA = assets[i] as TextAsset;
                    configs[kTA.name] = kTA;
                }
#else
                configs = new Dictionary<string, object>();
                Resource dataResource = ResourceMgr.Instance.GetResource(URLConst.CONFIG_CONFIG);
                var kEnumerator = dataResource.dicObject.GetEnumerator();
                while (kEnumerator.MoveNext())
                {
                    KeyValuePair<string, UnityEngine.Object> data = kEnumerator.Current;
                    TextAsset kTA = data.Value as TextAsset;
                    configs[data.Key] = kTA;
                }
                ResourceMgr.Instance.DestoryResource(URLConst.CONFIG_CONFIG, false, true);
                dataResource = null;
#endif
            }
        }

        public BinaryReader GetBinaryReader(string fileName, out MemoryStream ms)
        {
            byte[] bytes = GetBytes(fileName);
            ms = new MemoryStream(bytes);
            BinaryReader fReader = new BinaryReader(ms);
            return fReader;
        }

        public byte[] GetBytes(string fileName)
        {
            if (configs.ContainsKey(fileName) == true)
            {
                byte[] bytes = (configs[fileName] as TextAsset).bytes;
                delTextAsset.Add(configs[fileName] as TextAsset);
                configs.Remove(fileName);
                return bytes;
            }
            return null;
        }

        public string GetText(string fileName)
        {
            if (configs.ContainsKey(fileName) == true)
            {
                string result = (configs[fileName] as TextAsset).text;
                delTextAsset.Add(configs[fileName] as TextAsset);
                configs.Remove(fileName);
                return result;
            }
            return null;
        }

        public TextAsset GetTextAsset(string fileName)
        {
            if (configs.ContainsKey(fileName) == true)
            {
                TextAsset ta = configs[fileName] as TextAsset;
                delTextAsset.Add(configs[fileName] as TextAsset);
                configs.Remove(fileName);
                return ta;
            }
            return null;
        }

        public void ClearTextAsset()
        {
            for (int i = 0; i < delTextAsset.Count; i++)
            {
                if (delTextAsset[i] != null)
                    Resources.UnloadAsset(delTextAsset[i]);
            }
            delTextAsset.Clear();
        }
    }
}