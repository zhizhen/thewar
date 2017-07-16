using System;
using System.Collections.Generic;
using Engine;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.Serialization;
using System.Xml.Serialization;
using UnityEngine;

public static class UtilsExtends
{
    public static void Add<T1, T2>(this Dictionary<T1, List<T2>> dic, T1 t1, T2 t2)
    {
        if (!dic.ContainsKey(t1))
            dic[t1] = new List<T2>();
        dic[t1].Add(t2);
    }

    public static void Remove<T1, T2>(this Dictionary<T1, List<T2>> dic, T1 t1, T2 t2)
    {
        if (!dic.ContainsKey(t1)) return;
        if (dic[t1].Contains(t2)) dic[t1].Remove(t2);
    }

    public static T3 Get<T1, T2, T3>(this Dictionary<T1, Dictionary<T2, T3>> dic, T1 t1, T2 t2)
    {
        if (dic.ContainsKey(t1) && dic[t1].ContainsKey(t2))
            return dic[t1][t2];
        return default(T3);
    }

    public static void Add<T1, T2, T3>(this Dictionary<T1, Dictionary<T2, T3>> dic, T1 t1, T2 t2, T3 t3)
    {
        if (!dic.ContainsKey(t1))
            dic[t1] = new Dictionary<T2, T3>();
        dic[t1].Add(t2, t3);
    }

    public static void Remove<T1, T2, T3>(this Dictionary<T1, Dictionary<T2, T3>> dic, T1 t1, T2 t2)
    {
        if (!dic.ContainsKey(t1)) return;
        if (dic[t1].ContainsKey(t2))
            dic[t1].Remove(t2);
    }

    public static void ResetAll(this GameObject kGO)
    {
        kGO.ResetLocalPosition();
        kGO.ResetLocalRotation();
        kGO.ResetLocalScale();
    }

    public static void ResetLocalPosition(this GameObject kGO)
    {
        kGO.transform.localPosition = Vector3.zero;
    }

    public static void ResetLocalRotation(this GameObject kGO)
    {
        kGO.transform.localRotation = Quaternion.identity;
    }

    public static void ResetLocalScale(this GameObject kGO)
    {
        kGO.transform.localScale = Vector3.one;
    }

    public static T GetValue<K, T>(this Dictionary<K, T> dic, K k)

    {
        T t;
        dic.TryGetValue(k, out t);
        return t;
    }

    public static void SetParentExt(this GameObject kGO, Transform parent, bool worldPositionStays = false)
    {
        kGO.transform.SetParentExt(parent, worldPositionStays);
    }

    public static void SetParentExt(this Transform trans, Transform parent, bool worldPositionStays = false)
    {
        if (trans != null && trans.parent != parent)
            trans.SetParent(parent, worldPositionStays);
    }

}
