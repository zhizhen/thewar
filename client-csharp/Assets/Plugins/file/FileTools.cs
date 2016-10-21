using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class FileTools
{
    public static string GetExtension(string filePath)
    {
#if UNITY_WEB && !UNITY_EDITOR
        return string.Empty;
#else
        FileInfo fi = new FileInfo(filePath);
        return fi.Extension;
#endif
    }
}