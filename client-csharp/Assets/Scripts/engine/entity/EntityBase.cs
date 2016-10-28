using System;
using UnityEngine;
using Engine;
using Engine;

public class EntityBase : IAIHost
{
    protected Transform m_Transform;
    protected Collider m_Collider;
    protected Transform m_DefaultTransform;

    public Transform transform
    {
        get
        {
            if (m_Transform == null)
            {
                if (m_DefaultTransform == null)
                    m_DefaultTransform = DefaultModelPools.GetGameObject().transform;
                return m_DefaultTransform;
            }
            return m_Transform;
        }
        set
        {
            m_Transform = null;
            m_DefaultTransform = null;
        }
    }
    public Vector3 position { get { return transform.position; } set { transform.position = value; } }
}