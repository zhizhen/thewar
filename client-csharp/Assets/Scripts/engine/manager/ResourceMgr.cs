using UnityEngine;
using System.Collections;

public class ResourceMgr : MonoBehaviour {
    public static ResourceMgr Instance = null;


    //不同平台下StreamingAssets的路径是不同的，这里需要注意一下。
    public static readonly string PathURL =
#if UNITY_ANDROID
		"jar:file://" + Application.dataPath + "!/assets/";
#elif UNITY_IPHONE
		Application.dataPath + "/Raw/";
#elif UNITY_STANDALONE_WIN || UNITY_EDITOR
    "file://" + Application.dataPath + "/StreamingAssets/";
#else
        string.Empty;
#endif

    // Use this for initialization
    void Awake () {
        Instance = this;
        GameObject.DontDestroyOnLoad(this);
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    //读取一个资源

    public IEnumerator LoadMainGameObject(string path)
    {
        WWW bundle = new WWW(path);

        yield return bundle;

        //加载到游戏中
        GameObject go = Instantiate(bundle.assetBundle.mainAsset) as GameObject;
        go.transform.parent = GameObject.Find("UIRoot").transform;
        yield return go;

        bundle.assetBundle.Unload(false);
    }

    //读取全部资源

    public IEnumerator LoadALLGameObject(string path)
    {
        WWW bundle = new WWW(path);
        yield return bundle;

        //通过Prefab的名称把他们都读取出来
        Object obj0 = bundle.assetBundle.LoadAsset("Prefab0");
        Object obj1 = bundle.assetBundle.LoadAsset("Prefab1");

        //加载到游戏中	
        yield return Instantiate(obj0);
        yield return Instantiate(obj1);
        bundle.assetBundle.Unload(false);
    }
}
