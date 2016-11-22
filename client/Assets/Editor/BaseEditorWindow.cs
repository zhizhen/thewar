using UnityEngine;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class BaseEditorWindow : EditorWindow
{
    protected string GetPlayerPrefs(string key)
    {
        if (PlayerPrefs.HasKey(key))
            return PlayerPrefs.GetString(key);
        else
            return string.Empty;
    }

    protected void SetPlayerPrefs(string key, object value)
    {
        PlayerPrefs.SetString(key, value.ToString());
    }
}