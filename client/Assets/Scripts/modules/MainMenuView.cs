using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using Engine;

namespace Engine
{
	public class MainMenuView : Singleton<MainMenuView>
	{

		private GameObject view;

		public void Init()
		{
			Debug.Log ("on enter");
			view = UIManager.Instance.GetSingleUI(UIType.MainMenu);
			GameObject rootcanvas = GameObject.Find("UIRootCanvas");
			Button btn = rootcanvas.GetComponentInChildren<Button>();
			btn.onClick.AddListener(MatchCallBack);
        }

		public void MatchCallBack()
        {
			Debug.Log("on button click");
//			EntityMainRole.Instance.RoleUseSkill(1);
        }

    }
}
