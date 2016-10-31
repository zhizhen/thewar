using Engine;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class SkillEditor : BaseEditorWindow
{
    [MenuItem("Game Tools/技能编辑器")]
    static void Init()
    {
        SkillEditor window = (SkillEditor)EditorWindow.GetWindow(typeof(SkillEditor));
        window.Show();
        window._skillInfo.id = int.Parse(window.GetPlayerPrefs(KEY_SKILL_ID));
        window.LoadSkillInfo();
    }

    private Vector2 _scrollPos;
    public SkillInfo _skillInfo = new SkillInfo();

    private const string KEY_SKILL_ID = "key_skill_id";

    void OnGUI()
    {
        EditorGUILayout.BeginVertical();

        EditorGUILayout.BeginHorizontal();
        int id = _skillInfo.id;
        if (id ==0)
        {
            string value = GetPlayerPrefs(KEY_SKILL_ID);
            id = value == string.Empty ? 0 : int.Parse(value);
        }
        _skillInfo.id = EditorGUILayout.IntField("技能id:", id);
        SetPlayerPrefs(KEY_SKILL_ID, _skillInfo.id);

        if (GUILayout.Button("加载配置"))
            LoadSkillInfo();
        if (GUILayout.Button("添加事件"))
            SkillUtils.InstanceEvent(Skill_EVENT_TYPE.动作, _skillInfo, null, 0, 0);
        GUI.backgroundColor = Color.green;
        if (GUILayout.Button("保存"))
            Save();
        GUI.backgroundColor = Color.white;
        EditorGUILayout.EndHorizontal();

        _scrollPos = EditorGUILayout.BeginScrollView(_scrollPos, false, false);
        _skillInfo.DrawUI();
        EditorGUILayout.EndScrollView();

        EditorGUILayout.Separator();
        EditorGUILayout.EndVertical();
    }

    private void LoadSkillInfo()
    {
        if (_skillInfo.id == 0) return;
        int id = _skillInfo.id;
        Stream fs = File.Open("Assets/ResourceLibrary/Configs/Skill/" + _skillInfo.id + ".bytes", FileMode.Open);
        BinaryReader br = new BinaryReader(fs);
        _skillInfo = new SkillInfo();
        _skillInfo.Read(br);
        _skillInfo.id = id;
        br.Close();
        fs.Close();
    }

    string skillDir = "Assets/ResourcesLibrary/Configs/skill/";
    private void Save()
    {
        if (Application.isPlaying)
            DataMgr.SkillModelEx.ResetSkillInfo(_skillInfo);
        string path = skillDir + _skillInfo.id + ".bytes";
        SaveConfig(_skillInfo, path);
        Combine();
    }

    private void Combine()
    {
        string allPath = "Assets/ResourcesLibrary/Configs/skill/SkillConfig.bytes";
        FileStream fs = File.Open(allPath, FileMode.Create);
        CombineCfg(fs, skillDir);
        fs.Close();
    }

    private void SaveConfig(SkillInfo info, string path)
    {
        FileStream fs = File.Open(path, FileMode.Create);
        info.Write(fs);
        fs.Close();
    }

    private void CombineCfg(FileStream fs, string path)
    {
        byte[] buffer;
        string fullPath = Path.GetFullPath(path);
        string[] paths = FileTools.GetFileNames(fullPath, "*.bytes", false);
        int count = paths.Length;
        fs.WriteByte((byte)count);
        for (int i = 0; i < count; i++)
        {
            string url = paths[i];
            FileStream ufs = File.Open(url, FileMode.Open);
            long len = ufs.Length;
            buffer = new byte[len];
            int n = ufs.Read(buffer, 0, (int)len);
            fs.Write(buffer, 0, n);
            ufs.Close();
        }
        Debug.Log("技能配置合并完成!!!");
    }
}