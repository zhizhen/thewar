using System;
using UnityEngine;
using System.Collections;

public class SliderWrapper : MonoBehaviourExt
{
    public RectTransform transBg;
    public RectTransform transFill;
    public RectTransform transFollow;
    private float tmpPercent = 0;
    private int actionId = 0;

    void Awake()
    {
        if (transBg != null && Math.Abs(maxLength - 0) <= 0.0001f)
            maxLength = transBg.sizeDelta.x;
    }

    public void Init()
    {
        tmpPercent = 0;
        actionId = 0;
        tmpPercent = 1;
    }

    public float percent
    {
        set
        {
            tmpPercent = value;
            if (value <= 0) tmpPercent = 0;
            if (value >= 1) tmpPercent = 1;
            if (transFill != null)
                transFill.sizeDelta = new Vector2(maxLength * tmpPercent, transFill.sizeDelta.y);
            if (transFollow != null)
                transFollow.anchoredPosition = new Vector2(transFill.sizeDelta.x, transFollow.anchoredPosition.y);
        }
    }

    public float maxLength { get; set; }

    public void SetActionPercent(float endPercent, float speed = 0.01f)
    {
        if (actionId != 0)
        {
            GlobalTimer.GetInstance().ClearTimer(actionId);
            actionId = 0;
        }

        float beginPercent = tmpPercent;
        float detailPercent = tmpPercent - endPercent;
        if (tmpPercent - endPercent > 0)
        {
            actionId = GlobalTimer.GetInstance().SetInterval(30, () =>
            {
                percent = tmpPercent - speed;
                if (tmpPercent <= endPercent)
                {
                    percent = endPercent;
                    GlobalTimer.GetInstance().ClearTimer(actionId);
                    actionId = 0;
                }
            });
        }
        else
        {
            percent = endPercent;
        }
    }
}
