using UnityEngine;
using Engine;
using System.Collections;
using UnityEngine.EventSystems;

public class SoundUtils
{
    private static bool hasInitSound = false;
    public static void OnInitSound()
    {
        if (hasInitSound == true) return;
        hasInitSound = true;
        GameObject kCameraObj = new GameObject("MainCamera");
        GameTools.mainCameraGO = kCameraObj;
        GameObject.DontDestroyOnLoad(kCameraObj);
        // 加入声音
//        kCameraObj.AddComponent<SoundMgr>();
        //Init();
//        SoundMgr.Instance.PlayUIBGMusic();
    }
}