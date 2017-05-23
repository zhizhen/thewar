using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Engine;

public class SceneModel : BaseModel
{
	public SceneModel()
	{
		InitData<SceneVo> ();
	}

	public SceneVo GetVo(string key)
	{
		return __GetVo<SceneVo> (key);
	}
}