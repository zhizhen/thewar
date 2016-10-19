using UnityEngine;
using Engine;
using System.Reflection;
using System.IO;
using System.Collections.Generic;
using System;
using System.Runtime.Serialization.Formatters.Binary;

public class Driver : MonoBehaviour
{
    public static void InitApp(GameObject gameObject)
    {
        if (gameObject.GetComponent<SimpleLoader>() == null)
        {
            //Application.logMessageReceivedThreaded += OnLogCallBack;
            gameObject.AddComponent<SimpleLoader>();
            GameObjectExt.Instantiate(Resources.Load<UnityEngine.Object>("UILoading"));
            gameObject.AddComponent<GlobalTimer>();
        }
    }

}