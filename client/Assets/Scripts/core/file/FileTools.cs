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

    public static string GetFileNameNOExtension(string filePath)
    {
        filePath = filePath.Replace("\\", "/");
        string[] strs = filePath.Split('/');
        filePath = strs[strs.Length - 1];
        return filePath.Split('.')[0];
    }

    public static string GetFileExtension(string filePath)
    {
        FileInfo fi = new FileInfo(filePath);
        string name = fi.Name;
        if (name.LastIndexOf('.') > -1)
        {
            name = name.Substring(name.LastIndexOf('.') + 1);
            return name.ToLower();
        }
        return string.Empty;
    }

    public static string GetFileName(string filePath)
    {
        FileInfo fi = new FileInfo(filePath);
        return fi.Name;
    }

    public static string[] GetFileNames(string directoryPath)
    {
        if (!Directory.Exists(directoryPath))
        {
            throw new FileNotFoundException();
        }
        return Directory.GetFiles(directoryPath);
    }

    public static string[] GetFileNames(string directoryPath, string searchPattern, bool isSearchChild)
    {
        List<string> mList = new List<string>();
        string[] exits = searchPattern.Split('|');
        if (!Directory.Exists(directoryPath))
            throw new FileNotFoundException();
        try
        {
            if (isSearchChild)
            {
                for (int i = 0; i < exits.Length; i++)
                {
                    mList.AddRange(Directory.GetFiles(directoryPath, exits[i], SearchOption.AllDirectories));
                }
            }
            else
            {
                for (int i = 0; i < exits.Length; i++)
                {
                    mList.AddRange(Directory.GetFiles(directoryPath, exits[i], SearchOption.TopDirectoryOnly));
                }
            }
            return mList.ToArray();
        }
        catch (IOException ex)
        {
            throw ex;
        }
    }
}