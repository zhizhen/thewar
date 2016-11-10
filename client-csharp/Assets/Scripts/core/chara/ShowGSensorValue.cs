using UnityEngine;
using System.Collections;

public class ShowGSensorValue : MonoBehaviour {

    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnGUI()
    {
#if UNITY_EDITOR
        GUI.Box(new Rect(5, 5, 100, 20), string.Format("{0:0.000}", Input.GetAxis("Horizontal")));
        GUI.Box(new Rect(5, 30, 100, 20), string.Format("{0:0.000}", Mathf.Clamp01(Input.GetAxis("Vertical"))));
#else
        GUI.Box(new Rect(5, 5, 100, 20), string.Format("{0:0.000}", Input.acceleration.x));
        GUI.Box(new Rect(5, 30, 100, 20), string.Format("{0:0.000}", Input.acceleration.y));
        GUI.Box(new Rect(5, 55, 100, 20), string.Format("{0:0.000}", Input.acceleration.z));
#endif
    }
}
