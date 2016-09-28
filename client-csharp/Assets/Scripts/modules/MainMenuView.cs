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

	public class MainMenuView : AnimateView
	{

		[SerializeField]
		private Button _buttonHighScore;
		[SerializeField]
		private Button _buttonOption;

		public override void OnEnter(BaseContext context)
		{
			Debug.Log ("on enter");
			base.OnEnter(context);
		}

		public override void OnExit(BaseContext context)
		{
			Debug.Log ("on enter");
			base.OnExit(context);
		}

		public override void OnPause(BaseContext context)
		{
			Debug.Log ("on enter");
			_animator.SetTrigger("OnExit");
		}

		public override void OnResume(BaseContext context)
		{
			Debug.Log ("on enter");
			_animator.SetTrigger("OnEnter");
		}

		public void OptionCallBack()
		{
			Debug.Log ("callllllllllllllll");
			//ContextManager.Instance.Push(new OptionMenuContext());
		}

		public void HighScoreCallBack()
		{
			Debug.Log ("on enter");
			//ContextManager.Instance.Push(new HighScoreContext());
		}
	}
}
