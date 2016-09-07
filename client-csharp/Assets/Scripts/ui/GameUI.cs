using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class GameUI {
    private static Canvas mUIRoot;
    //private static UIGameLoading mGameLoading = null;
    private static GameObject mWaitLoading = null;
    private static Text mWaitLoadingText;
    //private static UIAlert mAlert;


    public static void InitBaseUI()
    {
        if (mUIRoot == null)
        {
            mUIRoot.name = "UIRoot";
        }
    }

}
