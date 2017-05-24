using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;

namespace Engine
{
	public class LoginView : Singleton<LoginView>
	{
        private GameObject view;

		public void Init()
		{
			Debug.Log ("on enter");
            view = UIManager.Instance.GetSingleUI(UIType.Login);
            GameObject rootcanvas = GameObject.Find("UIRootCanvas");
            Button btn = rootcanvas.GetComponentInChildren<Button>();
            btn.onClick.AddListener(LoginCallBack);
        }

        public void LoginCallBack()
        {
            Debug.Log("on button click");
//			RoleMgr.Instance.LoginC2S ();
			SceneMgr.Instance.Init();
            view.SetActive(false);
			MainMenuView.Instance.Init ();
        }
	}
}
