using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using System;

public class SimpleLoader : SingletonMonoBehaviour<SimpleLoader>
{
    [HideInInspector]
    public bool isLoading = false;
    private List<string> _paths;
    private Action<WWW> _loadComplete;
    private Action<WWW> _loadError;
    private Action<WWW> _perAssetComplete;
    private Action<float> completeProgress;
    private WWW currentWWW;


    public void Load(string path, Action<WWW> complateCall, Action<WWW> errorCall = null, Action<float> completeProgress = null)
    {
        var paths = new List<string>();
        paths.Add(path);
        this.completeProgress = completeProgress;
        Load(paths, complateCall, null, errorCall);
    }

    public void Load(List<string> paths, Action<WWW> complateCall, Action<WWW> perAssetComplete = null, Action<WWW> errorCall = null)
    {
        this._paths = paths;
        this._loadComplete = complateCall;
        this._loadError = errorCall;
        this._perAssetComplete = perAssetComplete;
    }

    private void Update()
    {
        if (isLoading == false)
        {
            if (_paths != null && _paths.Count > 0)
            {
                var path = _paths[0];
                _paths.RemoveAt(0);
                StartCoroutine(LoadWWWAsync(path));
            }
        }
        else
        {
            if (completeProgress != null)
            {
                completeProgress(process);
            }
        }
    }

    private IEnumerator LoadWWWAsync(string path)
    {
        currentWWW = new WWW(path);
        isLoading = true;
        yield return currentWWW;
        isLoading = false;
        if (currentWWW.error == null)
        {
            if (_perAssetComplete != null) { _perAssetComplete(currentWWW); }
        }
        else
        {
            // 错误重试
            _paths.Add(path);
            if (_loadError != null) { _loadError(currentWWW); }
            Debug.Log(currentWWW.url + "加载失败!");
        }
        if (_paths.Count == 0)
        {
            if (_loadComplete != null) { _loadComplete(currentWWW); }
            currentWWW = null;
        }
    }

    public float process
    {
        get
        {
            if (currentWWW != null) { return currentWWW.progress; }
            return 0;
        }
    }
}