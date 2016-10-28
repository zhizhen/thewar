using UnityEngine;

public class EntityMainRole : EntityPlayer
{
    private static EntityMainRole _ins;

    public static EntityMainRole Instance { get { return _ins ?? (_ins = new EntityMainRole()); } }

    public new static EntityBase Creator()
    {
        Instance.Reset();
        return Instance;
    }

    public void Reset() { }

    private EntityMainRole()
    {
        attr.type = CONST_ENTITY_TYPE.MAIN_ROLE;
    }
}