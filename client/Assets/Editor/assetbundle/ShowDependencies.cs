using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEditor;
using UnityEngine;

public class ShowDependencies : EditorWindow
{
    private Vector2 scrollPos;

    [MenuItem("Game Tools/查看依赖信息")]
    public static void Init()
    {
        GetWindow<ShowDependencies>();
    }

    [MenuItem("Game Tools/显示层级路径")]
    public static void ShowNodePath()
    {
        var selected = Selection.activeObject as GameObject;
        Debug.Log(selected + "===" + Selection.activeObject);
        if (selected != null)
        {
            var path = selected.name;
            var parent = selected.transform.parent;
            while (parent != null)
            {
                path = parent.name + "/" + path;
                parent = parent.parent;
            }
            Debug.Log(path);
        }
    }

    private void OnGUI()
    {
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos);
        EditorGUILayout.BeginVertical();
        DrawDependencies();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndScrollView();
    }

    private void DrawDeepHierarchy()
    {
        GUILayout.Label("DeepHierarchy");
        var dependencies = EditorUtility.CollectDeepHierarchy(new[] { Selection.activeObject });
        foreach (var obj in dependencies)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label(AssetDatabase.GetAssetPath(obj) + " : " + obj);
            if (GUILayout.Button("选择", GUILayout.Width(100)))
                Selection.activeObject = obj;
            EditorGUILayout.EndHorizontal();
        }
    }
    string content = string.Empty;

    private void DrawDependencies()
    {
        GUILayout.Label("Dependencies:");
        var dependencies = EditorUtility.CollectDependencies(new[] { Selection.activeObject });
        List<string> paths = new List<string>();
        foreach (var obj in dependencies)
        {
            var path = AssetDatabase.GetAssetPath(obj);
            if (path == null || path.Equals(string.Empty))
                paths.Add(obj.ToString());
            else
                paths.Add(path);
        }
        var filters = paths.Distinct();
        List<string> listFileName = new List<string>();
        foreach (var obj in filters)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label(obj);
            if (FileTools.GetFileExtension(obj) == "mat" && !listFileName.Contains(FileTools.GetFileNameNOExtension(obj)))
            {
                listFileName.Add(FileTools.GetFileName(obj));
                content += FileTools.GetFileName(obj) + "\n";
            }
            if (GUILayout.Button("选择", GUILayout.Width(100)))
            {
                var go = AssetDatabase.LoadMainAssetAtPath(obj);
                Clipbard.clipBoard = content;
            }
            EditorGUILayout.EndHorizontal();
        }
    }
}