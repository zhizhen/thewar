using UnityEngine;
using System.Collections;

public class GlobalBase
{
    protected EntityBase own;

    public GlobalBase(EntityBase own)
    {
        this.own = own;
    }

    public virtual void OnUpdate(float dt)
    {

    }

    public virtual void Reset()
    {

    }

    public virtual void Release(bool cache = true)
    {

    }

    public virtual void Destroy()
    {

    }

    public virtual void SetActive(bool boo)
    {

    }
}