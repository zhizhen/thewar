using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class LanguageSetting
{
    public const string CN = "cn";

    public static string[] languages = new string[] { CN};

    public static string GetLanguage(int index)
    {
        return languages[index];
    }

    public static int GetLanguageIndex(string language)
    {
        return Array.IndexOf<string>(languages, language);
    }
}