using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class EntityMgr : Singleton<EntityMgr>
{
    private Dictionary<CONST_ENTITY_TYPE, Func<EntityBase>> m_dicEntityCreator; //类型
    private Dictionary<CONST_ENTITY_TYPE, Dictionary<uint, EntityBase>> m_dicEntityCache; //回收
    private Dictionary<CONST_ENTITY_TYPE, Dictionary<uint, EntityBase>> m_dicEntityUpdate; //使用
    private Dictionary<Transform, EntityBase> m_dicEntityTrans; //通过GameObject找Entity

    public IEnumerable<EntityBase> EntityList { get { return m_dicEntityTrans.Values; } }

    public EntityMgr()
    {
        m_dicEntityCreator = new Dictionary<CONST_ENTITY_TYPE, Func<EntityBase>>();
        m_dicEntityCache = new Dictionary<CONST_ENTITY_TYPE, Dictionary<uint, EntityBase>>();
        m_dicEntityUpdate = new Dictionary<CONST_ENTITY_TYPE, Dictionary<uint, EntityBase>>();
        m_dicEntityTrans = new Dictionary<Transform, EntityBase>();

        Creator();

    }

    public void Creator()
    {
        m_dicEntityCreator[CONST_ENTITY_TYPE.MAIN_ROLE] = EntityMainRole.Creator;
        GlobalTimer.Instance.update += OnUpdate;
    }

    public EntityBase CreateEntity(CONST_ENTITY_TYPE etype, uint roleId = 0)
    {
        EntityBase kEntity = null;
        kEntity = m_dicEntityCache.Get(etype, roleId);

        if (kEntity == null)
        {
            Func<EntityBase> fnCreator = null;
            m_dicEntityCreator.TryGetValue(etype, out fnCreator);
            if (fnCreator == null)
            {
                Debug.Log("没有注册此类:" + etype);
                return null;
            }
            kEntity = fnCreator();
        }
        else
            m_dicEntityCache.Remove(etype, roleId);
        kEntity.roleId = roleId;
        RealAddEntity(kEntity);
        kEntity.Reset();
        return kEntity;
    }

    private void RealAddEntity(EntityBase kEnt)
    {
        CONST_ENTITY_TYPE type = kEnt.type;
        uint roleId = kEnt.roleId;
        m_dicEntityUpdate.Add(type, roleId, kEnt);
    }

    public void OnUpdate(float dt)
    {
        var enumerator = m_dicEntityUpdate.GetEnumerator();
        while (enumerator.MoveNext())
        {
            var dic = enumerator.Current.Value;
            var enu = dic.GetEnumerator();
            while (enu.MoveNext())
            {
                enu.Current.Value.OnUpdate(dt);
            }
        }
    }
}
