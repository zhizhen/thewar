using UnityEngine;
using System;

/**
 * 该单例需要绑定某个对象，不确定该脚本是否存在的情况下，可用Exists判断
 */

public class SingletonMonoBehaviour<T> : MonoBehaviourExt where T : SingletonMonoBehaviour<T>
{
    private static T uniqueInstance;

    public static T Instance
    {
        get { return uniqueInstance; }
    }

    public static T GetInstance()
    {
        return Instance;
    }

    protected virtual void Awake()
    {
        if (uniqueInstance == null)
        {
            uniqueInstance = (T)this;
            Exists = true;
        }
        else if (uniqueInstance != this)
        {
            throw new InvalidOperationException("Cannot have two instances of a SingletonMonoBehaviour :" + typeof(T).ToString() + ".");
        }
    }

    protected virtual void OnDestroy()
    {
        if (uniqueInstance == this)
        {
            Exists = false;
            uniqueInstance = null;
        }
    }

    protected S AddComponent<S>() where S : Component
    {
        S component = GetComponent<S>();
        if (component == null)
            component = gameObject.AddComponent<S>();
        return component;
    }

    public static bool Exists
    { get; private set; }
}
