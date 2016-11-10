using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ModelAttribute : GlobalBase
{
    public ModelAttribute(EntityBase own):base(own)
    {

    }

    public override void Release(bool cache = true)
    {

    }

    public string name { get; set; }
    public int prefabId { get; set; }
    public CONST_ENTITY_TYPE type { get; set; }
    public byte realm { get; set; }

    public int GetDefaultPrefabId()
    {
        int ret = 11101;
        if (type == CONST_ENTITY_TYPE.MAIN_ROLE || type == CONST_ENTITY_TYPE.PLAYER)
        {
            prefabId = 11001;
            ret = 11001;
        }
        return ret;
    }
}