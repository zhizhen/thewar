using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

namespace Engine
{
	public class LoginContext : BaseContext
	{
		public LoginContext() : base(UIType.Login)
		{

		}
	}

	public class LoginView : AnimateView
	{

		[SerializeField]
		private Button _buttonOption;

		public override void OnEnter(BaseContext context)
		{
			Debug.Log ("on enter");
            Button btn = _buttonOption.GetComponent<Button>();
            btn.onClick.AddListener(LoginCallBack);
            //base.OnEnter(context);
        }

		public override void OnExit(BaseContext context)
		{
			Debug.Log ("on enter");
			base.OnExit(context);
		}

		public override void OnPause(BaseContext context)
		{
			Debug.Log ("on enter");
			//_animator.SetTrigger("OnExit");
		}

		public override void OnResume(BaseContext context)
		{
			Debug.Log ("on enter");
			//_animator.SetTrigger("OnEnter");
		}


        public void LoginCallBack()
        {
            Debug.Log("on button click");
            ContextManager.Instance.Push(new MainMenuContext());
        }
	}
}
