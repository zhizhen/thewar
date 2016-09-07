namespace Engine
{
    using UnityEngine;
    using System;
    using System.Collections;
    using System.Collections.Generic;

    public class GameTools
    {
        public static void InitList<T>(ref List<T> list, int count)
        {
            if (list == null) { list = new List<T>(); }
            if (list.Count > count)
            {
                var delCount = list.Count - count;
                while (delCount > 0)
                {
                    list.RemoveAt(list.Count - 1);
                    delCount--;
                }
            }
            else
            {
                var addCount = count - list.Count;
                for (var i = 1; i <= addCount; i++)
                {
                    list.Add(default(T));
                }
            }
        }
    }
}