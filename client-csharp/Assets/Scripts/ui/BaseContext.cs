using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace Engine
{
	public class BaseContext 
	{

		public UIType ViewType { get; private set; }

		public BaseContext(UIType viewType)
		{
			ViewType = viewType;
		}
	}
}
