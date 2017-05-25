using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DrawCell : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		for (int i = 0; i <= GameConst.mapX; i++)
			Debug.DrawLine (new Vector3(i * GameConst.cell, 0, 0), new Vector3(i * GameConst.cell, GameConst.cell * GameConst.mapY, 0), Color.red);
		for (int i = 0; i <= GameConst.mapY; i++)
			Debug.DrawLine (new Vector3(0, i * GameConst.cell, 0), new Vector3(GameConst.cell * GameConst.mapX, i * GameConst.cell, 0), Color.green);
	}
}
