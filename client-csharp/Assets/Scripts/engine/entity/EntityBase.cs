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
    protected bool m_isReleased;
    private bool _isDead = false;

    public virtual byte realm { get; set; }
    public uint roleId { get; set; }
    public CONST_ENTITY_TYPE type { get { return attr.type; } }
    public bool IsLoaded { get; set; }

    public SkillCtrl SkillCtrl;

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

    public EntityBase()
    {
        SkillCtrl = new SkillCtrl(this);
    }

    public static EntityBase Creator()
    {
        return new EntityBase();
    }

    public virtual void OnUpdate(float dt)
    {
        if (m_isReleased) return;
        //if (m_ModelAttribute != null) m_ModelAttribute.OnUpdate();
        if (m_ModelElement != null) m_ModelElement.OnUpdate(dt);
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
		kGO.SetActiveRecursively (true);
    }

    public void ReplaceModel(Transform trans)
    {
        if (m_Transform == null && m_DefaultTransform != null)
        {
            trans.parent = m_DefaultTransform.parent;
            trans.gameObject.ResetAll();
            trans.position = m_DefaultTransform.position;
            trans.rotation = m_DefaultTransform.rotation;
            trans.localScale = m_DefaultTransform.localScale;
            trans.name = m_DefaultTransform.name;

            GameObjectExt.Destroy(m_DefaultTransform.gameObject);
            m_Transform = trans;
            m_DefaultTransform = null;
        }
        else
            throw new ArgumentException(string.Format("m_Transform={0},m_DefaultTransform={1}", m_Transform, m_DefaultTransform));
    }

    public void SetActive(bool boo)
    {
        elem.SetActive(boo);
    }

    public void Reset()
    {
        m_isReleased = false;
        _isDead = false;
    }

    public void SetExtraInfo()
    {
        transform.name = "123456";
    }

    public virtual bool UseSkill(int id, int lv, EntityBase target, Vector3? preBeginPos, Vector3? preBeginDir, Vector3? preEndPos)
    {
        SkillCtrl.UseSkill(id, lv, target, preBeginPos, preBeginDir, preEndPos);
        return true;
    }
}