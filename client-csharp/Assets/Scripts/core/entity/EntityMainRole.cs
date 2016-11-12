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

	public void RoleUseSkill(int skillPos, Vector3 dir)
    {
        int id = 123;
        int lv = 1;
        Vector3 preBeginPos = Instance.transform.position;
		UseSkill(id, lv, null, preBeginPos, dir, null);
    }

    public override bool UseSkill(int id, int lv, EntityBase target, Vector3? preBeginPos, Vector3? preBeginDir, Vector3? preEndPos)
    {
        bool result = false;
        result = base.UseSkill(id, lv, target, preBeginPos, preBeginDir, preEndPos);
        return result;
    }
}