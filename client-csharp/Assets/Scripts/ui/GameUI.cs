using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class GameUI {
    private static GameObject mUIRoot;
    //private static UIGameLoading mGameLoading = null;
    private static GameObject mWaitLoading = null;
    private static Text mWaitLoadingText;
    //private static UIAlert mAlert;

    public static void InitBaseUI()
    {
        if (mUIRoot == null)
        {
            mUIRoot = GameObject.Instantiate(Resources.Load("UIRoot")) as GameObject;
            mUIRoot.name = "UIRoot";
            GameObject.DontDestroyOnLoad(mUIRoot);
        }
    }
}
