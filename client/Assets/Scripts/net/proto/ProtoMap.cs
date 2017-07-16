using System;
using Engine;
using System.Collections.Generic;
namespace Engine 
{
    public class ProtoMap : Singleton<ProtoMap>
    {
        private Dictionary<int, Type> m_DicProtoType;
        public ProtoBase GetProto(int uiProtoID)
        {
            Type kProtoType;
            m_DicProtoType.TryGetValue(uiProtoID, out kProtoType);
            if (kProtoType != null)
            {
                ProtoBase kProto = null;
                kProto = Activator.CreateInstance(kProtoType) as ProtoBase;
                return kProto;
            }
            else
            {
                return null;
            }
        }
        public static readonly int m__proto__test__c2s = 998;
        public static readonly int m__action__ready_to_start__s2c = 7001;
        public static readonly int m__role__info__s2c = 1107;
        public static readonly int m__system__heartbeat__c2s = 1000;
        public static readonly int m__action__confirm__s2c = 7007;
        public static readonly int m__arena__match__c2s = 6000;
        public static readonly int m__proto__test__s2c = 999;
        public static readonly int m__role__create__c2s = 1102;
        public static readonly int m__action__confirm__c2s = 7006;
        public static readonly int m__account__login__c2s = 1100;
        public static readonly int m__role__info__c2s = 1106;
        public static readonly int m__role__login__s2c = 1105;
        public static readonly int m__role__list__s2c = 1101;
        public static readonly int m__role__create__s2c = 1103;
        public static readonly int m__scene__neighbours__s2c = 5001;
        public static readonly int m__action__sync__c2s = 7004;
        public static readonly int m__role__login__c2s = 1104;
        public static readonly int m__action__ready_to_start__c2s = 7000;
        public static readonly int m__scene__enter__c2s = 5009;
        public static readonly int m__arena__match__s2c = 6001;
        public static readonly int m__action__sync__s2c = 7005;
        public static readonly int m__system__notify__s2c = 1001;
        public ProtoMap()
        {
            m_DicProtoType = new Dictionary<int, Type>();
            m_DicProtoType[m__proto__test__c2s] = typeof(m__proto__test__c2s);
            m_DicProtoType[m__action__ready_to_start__s2c] = typeof(m__action__ready_to_start__s2c);
            m_DicProtoType[m__role__info__s2c] = typeof(m__role__info__s2c);
            m_DicProtoType[m__system__heartbeat__c2s] = typeof(m__system__heartbeat__c2s);
            m_DicProtoType[m__action__confirm__s2c] = typeof(m__action__confirm__s2c);
            m_DicProtoType[m__arena__match__c2s] = typeof(m__arena__match__c2s);
            m_DicProtoType[m__proto__test__s2c] = typeof(m__proto__test__s2c);
            m_DicProtoType[m__role__create__c2s] = typeof(m__role__create__c2s);
            m_DicProtoType[m__action__confirm__c2s] = typeof(m__action__confirm__c2s);
            m_DicProtoType[m__account__login__c2s] = typeof(m__account__login__c2s);
            m_DicProtoType[m__role__info__c2s] = typeof(m__role__info__c2s);
            m_DicProtoType[m__role__login__s2c] = typeof(m__role__login__s2c);
            m_DicProtoType[m__role__list__s2c] = typeof(m__role__list__s2c);
            m_DicProtoType[m__role__create__s2c] = typeof(m__role__create__s2c);
            m_DicProtoType[m__scene__neighbours__s2c] = typeof(m__scene__neighbours__s2c);
            m_DicProtoType[m__action__sync__c2s] = typeof(m__action__sync__c2s);
            m_DicProtoType[m__role__login__c2s] = typeof(m__role__login__c2s);
            m_DicProtoType[m__action__ready_to_start__c2s] = typeof(m__action__ready_to_start__c2s);
            m_DicProtoType[m__scene__enter__c2s] = typeof(m__scene__enter__c2s);
            m_DicProtoType[m__arena__match__s2c] = typeof(m__arena__match__s2c);
            m_DicProtoType[m__action__sync__s2c] = typeof(m__action__sync__s2c);
            m_DicProtoType[m__system__notify__s2c] = typeof(m__system__notify__s2c);
        }
    }
}
