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
}