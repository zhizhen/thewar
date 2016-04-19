using UnityEngine;
using System.Collections;
using Engine;

public class GameApp : MonoBehaviour {

	// Use this for initialization
	void Start () {
		NetMgr.GetInstance ().connect ("113.105.250.96", 12000);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
