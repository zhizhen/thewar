using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
[System.Serializable]
public class SkillVo : IConfig<string>
{
    public string key;
    public int id;
    public string name;
    public string GetKey()
    {
        return key;
    }
}
