using System;
using System.Collections.Generic;
using Engine;
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

}
