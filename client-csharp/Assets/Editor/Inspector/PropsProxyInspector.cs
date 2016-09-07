using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Engine;

[CustomEditor(typeof(PropsProxy))]
public class PropsProxyInspector : UnityEditor.Editor
{
#if UNITY_EDITOR
    public override void OnInspectorGUI()
    {
        PropsProxy proxy = target as PropsProxy;
        EditorGUIUtility.labelWidth = 80f;
        EditorGUILayout.Space();

        GUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("名字高度:");
        proxy.nameHeight = EditorGUILayout.FloatField(proxy.nameHeight);
        GUILayout.EndHorizontal();

        GUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("属性数量:");
        proxy.propsCount = EditorGUILayout.IntField(proxy.propsCount);
        if (GUILayout.Button("生成代码"))
        {
            CreateCode(proxy.propNames);
        }
        GUILayout.EndHorizontal();

        GUILayout.BeginVertical();
        GameTools.InitList<string>(ref proxy.propNames, proxy.propsCount);
        GameTools.InitList<Object>(ref proxy.propValues, proxy.propsCount);
        for (var i = 0; i < proxy.propsCount; i++)
        {
            GUILayout.BeginHorizontal();
            proxy.propNames[i] = EditorGUILayout.TextField(proxy.propNames[i]);
            proxy.propValues[i] = EditorGUILayout.ObjectField(proxy.propValues[i], typeof(Object), true);
            if (string.IsNullOrEmpty(proxy.propNames[i]) && proxy.propValues[i] != null)
            {
                proxy.propNames[i] = proxy.propValues[i].name;
            }
            if (GUILayout.Button("X"))
            {
                proxy.propNames.RemoveAt(i);
                proxy.propValues.RemoveAt(i);
                i--;
                proxy.propsCount--;
            }
            GUILayout.EndHorizontal();
        }
        GUILayout.EndVertical();
    }
#endif

    private void CreateCode(List<string> list)
    {
        string str = "";
        string str2 = "";
        string strTmp = "";
        int i = 0;
        for (i = 0; i < list.Count; i++)
        {
            strTmp = list[i];
            if (strTmp.StartsWith("l_"))
            {
                str += fun1(strTmp, "UILabel", "l_");
                str2 += fun2(strTmp, "UILabel", "l_");
            }
            else if (strTmp.StartsWith("g_"))
            {
                str += fun1(strTmp, "UIGrid", "g_");
                str2 += fun2(strTmp, "UIGrid", "g_");
            }
            else if (strTmp.StartsWith("s_"))
            {
                str += fun1(strTmp, "UISprite", "s_");
                str2 += fun2(strTmp, "UISprite", "s_");
            }
            else if (strTmp.StartsWith("go_"))
            {
                str += fun1(strTmp, "GameObject", "go_");
                str2 += fun2Go(strTmp, "Go_");
            }
            else if (strTmp.StartsWith("btn_") || strTmp.StartsWith("Button_"))
            {
                str += fun1(strTmp, "MyButton", "btn_");
                str2 += fun2(strTmp, "MyButton", "btn_");
            }
            else if (strTmp.StartsWith("pbar_"))
            {
                str += fun1(strTmp, "UIProgressBar", "pbar_");
                str2 += fun2(strTmp, "UIProgressBar", "pbar_");
            }
            else if (strTmp.StartsWith("mc_"))
            {
                str += fun1(strTmp, "MovieClip", "mc_");
                str2 += fun2(strTmp, "MovieClip", "mc_");
            }
            else
            {
                str += fun1(strTmp, "GameObject", "go_");
                str2 += fun2Go(strTmp, "go_");
            }
        }
    }

    private string fun1(string str, string type, string head)
    {
        return "private " + type + " " + str + " ; \n";
    }

    private string fun2(string str, string type, string head)
    {
        return str + " = proxy.Get<" + type + ">(\"" + str + "\") ; \n";
    }

    private string fun2Go(string str, string head)
    {
        return str + " = Proxy.GetNameObject(\"" + str + "\") ; \n";
    }
}