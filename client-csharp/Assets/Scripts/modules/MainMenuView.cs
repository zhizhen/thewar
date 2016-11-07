using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

namespace Engine
{
	public class MainMenuContext : BaseContext
	{
		public MainMenuContext() : base(UIType.MainMenu)
		{

		}
	}

	public class MainMenuView : BaseView
	{
		[SerializeField]
		private Button _buttonOption;

		public override void OnEnter(BaseContext context)
		{
			Debug.Log ("on enter");
            Button btn = _buttonOption.GetComponent<Button>();
            btn.onClick.AddListener(FireCallBack);
        }

		public void OnExit(BaseContext context)
		{
			Debug.Log ("on enter");
		}

		public override void OnPause(BaseContext context)
		{
			Debug.Log ("on enter");
		}

		public override void OnResume(BaseContext context)
		{
			Debug.Log ("on enter");
		}

        public void FireCallBack()
        {
            Debug.Log("on button click");
            EntityMainRole.Instance.RoleUseSkill(1);
        }
    }
}
