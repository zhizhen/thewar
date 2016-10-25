using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class URLConst
{
    public const string EXTEND_ASSETBUNDLE = ".ui";

    public static string GetUI(string name)
    {
        return name + EXTEND_ASSETBUNDLE;
    }

    public static List<string> listInitGameRes = new List<string> {
        GetUI("UIRootCanvas"),
        GetUI("UIInputAccount")
    };
}
