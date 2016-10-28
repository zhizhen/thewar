using UnityEngine;

public class EntityMainRole : EntityPlayer
{
    private static EntityMainRole _ins;

    public static EntityMainRole Instance { get { return _ins ?? (_ins = new EntityMainRole()); } }
}