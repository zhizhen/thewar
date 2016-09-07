using UnityEngine;
using System.Collections;
using Game.UI;
using UnityEngine.UI;

public class UILoading :SingletonMonoBehaviour<UILoading>
{
    private static Text percentText;
    private static Text subTitleText;
    private static SliderWrapper sliderWrapper;

    private static GameObject _gameObject;

    public static Sprite spriteBg;

    void Awake()
    {
        _gameObject = gameObject;
        PropsProxy propsProxy = _gameObject.GetComponent<PropsProxy>();
        percentText = propsProxy.Get<TextWrapper>("percentText");
        subTitleText = propsProxy.Get<TextWrapper>("subTitleText");
        spriteBg = propsProxy.Get<Image>("sceneCity").sprite;
        GameObject kSliderGo = propsProxy.GetGameObject("LoadingBar");
        //sliderWrapper = kSliderGo.GetComponent<SliderWrapper>();
        //sliderWrapper.maxLength = 680f;

        GameObject.DontDestroyOnLoad(this);
    }

    public static string mainTitle
    {
        set { }
    }

    public static string subTitle
    {
        set { subTitleText.text = value; }
    }

    public static void SetSubTitle(string title, float kPercent)
    {
        subTitle = title;
        percent = kPercent;
    }

    public static float percent
    {
        set
        {
            var p = Mathf.Clamp(value, 0f, 1f);
            sliderWrapper.percent = p;
            percentText.text = (p * 100).ToString("0.00") + "%";
        }
    }

    public static void ShowLoading(string kMainTitle = "", string kSubTitle = "", float kPercent = 0)
    {
        if (!string.IsNullOrEmpty(kMainTitle)) { mainTitle = kMainTitle; }
        if (!string.IsNullOrEmpty(kSubTitle)) { subTitle = kSubTitle; }
        percent = kPercent;
        SetActive(true);
    }

    public static void CloseLoading()
    {
        SetActive(false);
    }

    private static void SetActive(bool boo)
    {
        if (_gameObject != null) { _gameObject.SetActive(boo); }
    }
}
