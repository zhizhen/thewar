using System;
using UnityEngine;

public class MonoBehaviourExt : MonoBehaviour
{
    protected GameObject FindChild(string path)
    {
        var target = transform.Find(path);
        if (target == null)
        {
            throw new Exception(string.Format("can not find child {0}.", path));
        }
        else
        {
            return target.gameObject;
        }
    }

    void OnBecameInvisible()
    {
        enabled = false;
    }

    void OnBecameVisible()
    {
        enabled = true;
    }
}
