using UnityEngine;
using System;
using System.Reflection;

public class Clipbard
{
    private static PropertyInfo m_systemCopyBufferProperty = null;

    private static PropertyInfo GetSystemCopyBufferProperty()
    {
        if (m_systemCopyBufferProperty == null)
        {
#if UNITY_EDITOR
            Type T = typeof(GUIUtility);
            m_systemCopyBufferProperty = T.GetProperty("systemCopyBuffer", BindingFlags.Static | BindingFlags.NonPublic);
            if (m_systemCopyBufferProperty == null)
                Debug.LogError("Can't access internal member 'GUIUtility.systemCopyBuffer' it may have been removed / renamed");
#endif
        }
        return m_systemCopyBufferProperty;
    }

    public static string clipBoard
    {
        get
        {
            PropertyInfo P = GetSystemCopyBufferProperty();
            return (string)P.GetValue(null, null);
        }
        set
        {
            PropertyInfo P = GetSystemCopyBufferProperty();
            P.SetValue(null, value, null);
        }
    }
}