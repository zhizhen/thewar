namespace Engine
{
    using UnityEngine;
    using System;
    using System.IO;
    using System.Collections;
    using System.Collections.Generic;

    public class GameTools
    {
        public static Camera mainCamera;
        public static GameObject mainCameraGO;
        public static Camera CanvasCamera;

        public static GameObject UICanvas;
        public static GameObject UICanvasCamera;

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

        public static string GetFileMD5(string path)
        {
            FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read);
            var md5 = MD5Hash.Get(stream);
            stream.Close();
            return md5;
        }
    }
}