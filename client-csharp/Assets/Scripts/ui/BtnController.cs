using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class BtnControl : MonoBehaviour {
	 
	     // Use this for initialization
	     void Start ()
	     {
		         var button = transform.gameObject.GetComponent<Button>();
		         if (button != null)
			         {
			             button.onClick.RemoveAllListeners();
			             button.onClick.AddListener(TestClick);
			         }
		     }
	 
	     public void TestClick()
	     {
		         Debug.Log("Test Click. This is Type 4");
		     }
	     
	     // Update is called once per frame
	     void Update () {
		         
		     }
	 }