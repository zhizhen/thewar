public class EntityPlayer : EntityBase
{
    public override byte realm
    {
        get
        {
            return 0;
        }
    }

    public new static EntityBase Creator()
    {
        return new EntityPlayer();
    }
}