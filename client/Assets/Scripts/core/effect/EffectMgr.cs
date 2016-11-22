using System;
using System.Collections.Generic;
using UnityEngine;

public class EffectMgr : Singleton<EffectMgr>
{
    public IzCommonEffect CreateEffect(string uiType)
    {
        IzCommonEffect kCE;
        kCE = new IzCommonEffect(uiType);
        return kCE;
    }
}
