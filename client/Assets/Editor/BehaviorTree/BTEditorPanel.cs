using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using Engine;

public class BTEditorPanel : BaseEditorWindow {
	BTViewCtrl tree;
	Vector2 scrollTree;
	bool editMode;
	public int id;
	private const string KEY_AI_ID = "key_ai_id";
	const int ButtonAreaWidth = 100;
	const int ButtonAreaHeight = 80;
	const int XGap = 10;
	const int yGap = 25;

	const int AlertWindowWidth = 100;
	const int AlertWindowHeight = 80;

	private GameObject _currentTestingRole = null;
	private string rootPath = "Assets/Resources/GameAssets/Configs/AItree/";

	BTEditorPanel():base()
	{
		scrollTree = Vector2.zero;
		Init ();
	}

	private void Init()
	{
		tree = new BTViewCtrl ();
		editMode = true;
		var dataRoot = new BT.SelectorNode ();
		var branch1 = new BT.SequenceNode ();
		dataRoot.addChild (branch1);
		tree.rootNode.formatByDataNode (dataRoot);
	}

	[MenuItem("Game Tools/行为树AI")]
	public static void openPanel()
	{
		BTEditorPanel panel = EditorWindow.GetWindow<BTEditorPanel> (false, "BTEditorPanel", false);
		panel.id = int.Parse(panel.GetPlayerPrefs(KEY_AI_ID));
		panel.Load ();
	}

	void applyToGameObject()
	{
		editMode = false;
		Debug.Log ("TODO,选中GameObject之后，不用导出Json，能实时调用AI，需要实现此功能");
		if (Selection.activeGameObject = null) {
			Debug.LogError ("请选中一个需要绑定的角色");
			return;
		}
	}

	void exitToEditMode()
	{
		tree.reset ();
		editMode = true;
		Debug.Log ("TODO,选中GameObject之后，不用导出Json，能实时调用AI，需要实现此功能");
	}

	void OnGUI()
	{
		EditorGUILayout.BeginVertical ();
		EditorGUILayout.BeginHorizontal ();
		if (id == 0) {
			string value = GetPlayerPrefs (KEY_AI_ID);
			id = value == string.Empty ? 0 : int.Parse (value);
		}
		id = EditorGUILayout.IntField ("行为id", id);
		SetPlayerPrefs (KEY_AI_ID, id);
		GameConst.aiType = (AIType)EditorGUILayout.EnumPopup ("AI类型", GameConst.aiType);
		if (GUILayout.Button ("加载配置")) {
			Load ();
		}
		if (GUILayout.Button ("增加AI")) {
			AddAI ();
		}
		GUI.backgroundColor = Color.green;
		if (GUILayout.Button ("保存")) {
			Save ();
		}
		GUI.backgroundColor = Color.white;
		EditorGUILayout.EndHorizontal ();

		EditorGUILayout.Separator ();

		//树控件区域
		if (tree == null) return;
		var leftRect = new Rect (0, 0, Screen.width, Screen.height);
		var treeRect = new Rect (leftRect);
		treeRect.center += new Vector2 (XGap, yGap);
		treeRect.width -= XGap * 2;
		treeRect.height -= yGap * 2;
		GUILayout.BeginArea (leftRect);
		Rect view = tree.bound;
		scrollTree = GUI.BeginScrollView (treeRect, scrollTree, view);
		{
			tree.paint ();
		}
		GUI.EndScrollView ();
		GUILayout.EndArea ();

		//按钮功能区

		EditorGUILayout.EndVertical ();
		Repaint ();
	}

	private void traceNode(BT.BTNode node, string pre)
	{
		Debug.Log (pre + " " + node.GetType());
		pre += "  -  ";
		if (node is BT.ComponentNode) {
			var compNode = node as BT.ComponentNode;
			foreach (var child in compNode.childs) {
				traceNode (child, pre);
			}
		}
	}

	private void Load()
	{
		if (id == 0)
			return;
		string openFile = Application.dataPath + "/AssetsLibrary/Configs/AItree/" + id + ".json";
		if (File.Exists (openFile) == false) {
			if (tree != null) {
				Init ();
			}
			return;
		}
		var sr = File.OpenText (openFile);
		var content = sr.ReadToEnd ();
		sr.Close ();
//		var rawJson = MiniJON.Json.Deserialize (content);
//		JsonNode json = new JsonNode (rawJson);
//		var rootDataNode = BTNodeBuilder.buildByJson (json);
//		rootViewNode.formatByDataNode (rootDataNode);
//		tree.rootNode = rootViewNode;
	}

	private void Save()
	{
//		string saveStr = MiniJSON.Json.SerializePretty (tree.rootNode.save ());
//		string filePath = rootPath + "AI" + id + ".bytes";
//		FileStream fs = File.Open (filePath, FileMode.Create);
//		BinaryWriter bw = new BinaryWriter (fs);
//		AIInfo aiInfo = new AIInfo ();
//		aiInfo.ReadJson (saveStr);
//		aiInfo.Write (bw);
//		bw.Close ();
//		bw = null;
//		fs.Close ();
//		fs = null;
//		if (Application.isPlaying) {
//			byte[] bytes = FileTools.FileToBytes (filePath);
//			//DataMgr.aiMode.UpdateAiInfoBytes(id, bytes);
//			//GameDispatcher.Dispatch<int>(GameEvent.EDITOR_UPDATE_AI_DATA, id);
//		}
//		SaveJson ();
	}

	private void SaveJson()
	{
//		string saveFile = Application.dataPath + "/AssetsLibrary/Configs/AItree/" + id + ".json";
//		string saveStr = MiniJSON.Json.SerializePretty (tree.rootNode.save ());
//		FileStream fs = File.Open (saveFile, FileMode.Create);
//		byte[] data = new UTF8Encoding ().GetBytes (saveStr);
//		fs.Write (data, 0, data.Length);
//		fs.Close ();
//		Debug.Log ("AI"+ id + "行为保存完成！");
	}

	private void AddAI()
	{
//		EntityBase ent = TouchMgr.Instance.currentSelectEntity;
//		if (ent != null && id > 0) {
			//ent.ai.Execute(id);
//		}
	}
}
