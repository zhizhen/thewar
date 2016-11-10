using System;
using System.Collections.Generic;
using UnityEngine;

public class DefaultModelPools
{
    private static Queue<GameObject> m_kQueue = new Queue<GameObject>();

    public static GameObject GetGameObject(string name = "")
    {
        GameObject kGO;
        if (m_kQueue.Count > 0)
        {
            kGO = m_kQueue.Dequeue();
            if (!string.IsNullOrEmpty(name)) kGO.name = name;
        }
        else
            kGO = string.IsNullOrEmpty(name) ? new GameObject() : new GameObject(name);
        GameObject.DontDestroyOnLoad(kGO);
        return kGO;
    }

    public static void RecycleGameObject(GameObject kGO)
    {
        if (kGO != null)
        {
            kGO.transform.localScale = Vector3.one;
            m_kQueue.Enqueue(kGO);
        }
    }

    public static void ReleaseAll()
    {
        while (m_kQueue.Count > 0)
            GameObject.Destroy(m_kQueue.Dequeue());
        m_kQueue.Clear();
    }
}
