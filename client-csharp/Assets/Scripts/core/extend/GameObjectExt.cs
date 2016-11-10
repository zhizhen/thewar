using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

public class GameObjectExt
{
    private static List<GameObject> listGameObjects = new List<GameObject>();

    public static Object Instantiate(Object original, bool record = false)
    {
        if (original == null) return null;
        Debug.Log("创建Instantiate对象: " + original);
        Object copyObject = GameObject.Instantiate(original);
        copyObject.name = copyObject.name.Replace("(Clone)", "");
        if (copyObject.name.StartsWith("UI"))
        {
            Text[] texts = (copyObject as GameObject).GetComponentsInChildren<Text>(true);
            for (int i = 0; i < texts.Length; i++)
            {
                Text text = texts[i];
                //text.font = Fonts.font_FZY4JW;
            }
        }
        else if (record)
        {
            listGameObjects.Add(copyObject as GameObject);
        }
        else
        {
            Debug.Log("未加入--------------------: " + copyObject.name);
        }
        return copyObject;
    }

    public static void Destroy(Object original)
    {
        if (original == null) return;
        Debug.Log("删除Instantiate对象:" + original);
        GameObject.Destroy(original);
    }
}