using UnityEngine;
using System.Collections;
using System.Collections.Generic;

[ExecuteInEditMode]
public class PropsProxy : MonoBehaviour
{
    public int propsCount;
    public List<string> propNames;
    public List<Object> propValues;
    public float nameHeight = 1.8f;

    private List<string> m_lstComponentKey;
    private List<Component> m_lstComponentValue;

    public PropsProxy()
    {
        propNames = new List<string>();
        propValues = new List<Object>();
        m_lstComponentKey = new List<string>();
        m_lstComponentValue = new List<Component>();
    }

    public Component GetUIComponent(System.Type type, string propName)
    {
        string strKey = propName + "_" + type.Name;
        if (!m_lstComponentKey.Contains(strKey))
        {
            GameObject go = GetObject(propName) as GameObject;
            if (go != null)
            {
                m_lstComponentKey.Add(strKey);
                m_lstComponentValue.Add(go.GetComponent(type));
            }
        }
        int index = m_lstComponentKey.IndexOf(strKey);
        return m_lstComponentKey.IndexOf(strKey) > -1 ? m_lstComponentValue[index] : null;
    }

    public T Get<T>(string propName) where T : Component
    {
        string strKey = propName + "_" + typeof(T).Name;
        if (!m_lstComponentKey.Contains(strKey))
        {
            GameObject go = GetObject(propName) as GameObject;
            if (go != null)
            {
                m_lstComponentValue.Add(go.GetComponent<T>());
                m_lstComponentKey.Add(strKey);
            }
        }
        int index = m_lstComponentKey.IndexOf(strKey);
        return index > -1 ? m_lstComponentValue[index] as T : null;
    }

    public GameObject[] GetGameObjects(params string[] propNames)
    {
        GameObject[] gos = new GameObject[propNames.Length];
        for (var i = 0; i < propNames.Length; i++)
        {
            gos[i] = GetGameObject(propNames[i]);
        }
        return gos;
    }

    public T[] GetAll<T>(params string[] propNames) where T : Component
    {
        T[] results = new T[propNames.Length];
        for (var i = 0; i < propNames.Length; i++)
        {
            results[i] = Get<T>(propNames[i]);
        }
        return results;
    }

    public Object GetObject(string propName)
    {
        if (propNames != null && propNames.Contains(propName))
        {
            var index = propNames.IndexOf(propName);
            return propValues[index];
        }
        Debug.Log("找不到属性:" + propName);
        return null;
    }

    public GameObject GetGameObject(string propName)
    {
        GameObject go = GetObject(propName) as GameObject;
        return go;
    }
}
