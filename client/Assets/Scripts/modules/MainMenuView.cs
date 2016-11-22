using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using Engine;

namespace Engine
{
	public class MainMenuView : Singleton<MainMenuView>
	{
		[SerializeField]
		private Button _buttonOption;

		public void Init()
		{
			Debug.Log ("on enter");
        }

        public void FireCallBack()
        {
			Debug.Log("on button click");
//			EntityMainRole.Instance.RoleUseSkill(1);
        }

    }
}
