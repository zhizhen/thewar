using System;
using UnityEngine;
using Engine;
using Engine;

public class EntityBase : IAIHost
{
    protected Transform m_Transform;
    protected Collider m_Collider;
    protected Transform m_DefaultTransform;

    protected ModelAttribute m_ModelAttribute;
    protected ModelElement m_ModelElement;

    public virtual byte realm { get; set; }
    public uint roleId { get; set; }
    public CONST_ENTITY_TYPE type { get { return attr.type; } }
    public bool IsLoaded { get; set; }
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

    public ModelAttribute attr
    {
        get
        {
            if (m_ModelAttribute == null)
                m_ModelAttribute = new ModelAttribute(this);
            return m_ModelAttribute;
        }
    }

    public ModelElement elem
    {
        get
        {
            if (m_ModelElement == null)
                m_ModelElement = new ModelElement(this);
            return m_ModelElement;
        }
    }

    public void LoadRes(Action<EntityBase, object> OnComplete = null, bool resetRes = false)
    {
        elem.LoadRes(
            (kGO, kArg) =>
            {
                LoadResCompleted(kGO, kArg);
                if (OnComplete != null)
                    OnComplete(this, kArg);
                IsLoaded = true;
            }, resetRes);
    }

    public virtual void LoadResCompleted(GameObject kGO, object kArg)
    {

    }
}