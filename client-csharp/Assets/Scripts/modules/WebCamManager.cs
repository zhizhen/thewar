using System;
using System.Collections;
using UnityEngine;

namespace Engine
{
	public class WebCamManager : MonoBehaviour
	{
		public WebCamTexture cameraTexture;  
		public string cameraName = "";  
		private bool isPlay = false;  

		void Start()
		{
			StartCoroutine (Test ());
		}

		IEnumerator Test()  
		{  
			yield return Application.RequestUserAuthorization(UserAuthorization.WebCam);
			if (Application.HasUserAuthorization (UserAuthorization.WebCam)) {
				// 取后置摄像头
				for (int i = 0; i < WebCamTexture.devices.Length; i++) {
					cameraName = WebCamTexture.devices [i].name;
					break;
				}
				cameraTexture = new WebCamTexture(cameraName, 960, 1920, 15);  
				cameraTexture.Play();  
				isPlay = true; 
			}
		}

		void OnGUI()  
		{  
			if (isPlay)  
			{  
				GUI.DrawTexture(new Rect(0, 0, 960, 1920), cameraTexture, ScaleMode.ScaleToFit);  
			}  
		}  
	}
}

