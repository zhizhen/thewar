using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace Engine
{
	public class UIManager : Singleton<UIManager>
	{
		public Dictionary<UIType, GameObject> _UIDict = new Dictionary<UIType,GameObject>();

		private Transform _canvas;

		public UIManager()
		{
			//_canvas = GameObject.Find("UIRootCanvas").transform;
			//foreach (Transform item in _canvas)
			//{
			//	GameObject.Destroy(item.gameObject);
			//}
		}

		public GameObject GetSingleUI(UIType uiType)
		{
			if (_UIDict.ContainsKey(uiType) == false || _UIDict[uiType] == null)
			{
				GameObject UIRootCanvas = GameObject.Find("UIRootCanvas");
				GameObject UICanvas = UIRootCanvas.transform.FindChild("UICanvas").gameObject;
				GameObject UICamera = UIRootCanvas.transform.FindChild("UICamera").gameObject;

				//GameObject go = ResourceMgr.Instance.GetGameObject(uiType.Path, uiType.Name);
                GameObject go = ResourceMgr.GetGameObject(URLConst.GetUI(uiType.Name));
                go.transform.SetParent (UICanvas.transform);
				go.transform.localPosition = new Vector3 (0, 0, 0);
				go.transform.localScale = new Vector3 (1, 1, 1);
				Canvas canvas = go.GetComponent<Canvas>();
				Camera camera = UICamera.GetComponent<Camera>();
				canvas.renderMode = RenderMode.ScreenSpaceCamera;
				canvas.worldCamera = camera;

				//GameObject go = GameObject.Instantiate(Resources.Load<GameObject>(uiType.Path)) as GameObject;
				//go.transform.SetParent(_canvas, false);
				//go.name = uiType.Name;
				_UIDict.AddOrReplace(uiType, go);
				return go;
			}
			return _UIDict[uiType];
		}

		public void DestroySingleUI(UIType uiType)
		{
			if (!_UIDict.ContainsKey(uiType))
			{
				return;
			}

			if (_UIDict[uiType] == null)
			{
				_UIDict.Remove(uiType);
				return;
			}

			GameObject.Destroy(_UIDict[uiType]);
			_UIDict.Remove(uiType);
		}
	}
}
