using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class Test : MonoBehaviour {

	private Rect rect;
	CanvasScaler canvaScaler;

	// Use this for initialization
	void Start () {
		canvaScaler = GetComponent<CanvasScaler> ();
		rect = new Rect(0, 0, Screen.width , Screen.height);
		float scale = canvaScaler.matchWidthOrHeight == 1 ? canvaScaler.referenceResolution.y / (float)Screen.height : canvaScaler.referenceResolution.x / (float)Screen.width;
		rect = new Rect(rect.x * scale, rect.y * scale, rect.width * scale, rect.height * scale);
		Debug.Log ("rect:" + rect);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnGUI()
	{

//		GUI.Box(rect, "hello");
	}
}
