using UnityEngine;

[AddComponentMenu("Game/Camera Target")]
public class GameCameraTarget : MonoBehaviour
{
	public void Activate (bool val)
	{
		if (val)
            SceneMgr.Instance.mainCamera.target = transform;
        //MainCamera.AddTarget(transform);
        else MainCamera.RemoveTarget(transform);
	}

	void OnEnable  () { Activate(true);  }
	void OnDisable () { Activate(false); }
}