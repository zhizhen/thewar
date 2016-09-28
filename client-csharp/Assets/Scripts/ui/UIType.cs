using UnityEngine;
using System.Collections;
using System.Collections.Generic;

/*
 *	
 *  Define View's Path And Name
 *
 *	by Xuanyi
 *
 */

namespace Engine
{
	public class UIType {

		public string Path { get; private set; }

		public string Name { get; private set; }

		public UIType(string path, string name)
		{
			Path = path;
			Name = name;
		}

		public override string ToString()
		{
			return string.Format("path : {0} name : {1}", Path, Name);
		}

		public static readonly UIType Login = new UIType("uiinputaccount.ui", "UIInputAccount");
		public static readonly UIType MainMenu = new UIType("View/MainMenuView", "Main");
//		public static readonly UIType OptionMenu = new UIType("View/OptionMenuView");
//		public static readonly UIType NextMenu = new UIType("View/NextMenuView");
//		public static readonly UIType HighScore = new UIType("View/HighScoreView");
	}
}
