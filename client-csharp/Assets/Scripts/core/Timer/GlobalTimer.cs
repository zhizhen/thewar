using System;
using System.Collections.Generic;
using Engine;
using UnityEngine;

public class GlobalTimer : SingletonMonoBehaviour<GlobalTimer>
{
    public static float fixedTimeStep = 0.02f;
    public Action<float> fixedUpdate;
    public Action<float> lateUpdate;
    private long m_milliSecond;
    public Action<float> onGUI;
    private int timerCount;
    public Action<float> update;
    private readonly Dictionary<Action<int>, bool> m_kFrameCallFlag = new Dictionary<Action<int>, bool>();
    private readonly Dictionary<Action<int>, int> m_kFrameCountCallback = new Dictionary<Action<int>, int>();
    private readonly List<Action> m_kTimerCallBacks = new List<Action>(); // 定时器回调函数列表
    private readonly List<int> m_kTimerIDs = new List<int>(); // 定时器ID列表
    private readonly List<uint> m_kTimerIntervals = new List<uint>(); // 定时器间隔列表
    private readonly List<float> m_kTimerRecords = new List<float>(); // 定时器当前积累记录
    private readonly List<uint> m_kTimerTickCounts = new List<uint>(); // 定时器tick次数

    public float timeScale
    {
        get { return Time.timeScale; }
        set { Time.timeScale = value; }
    }

    protected override void Awake()
    {
        base.Awake();
        DontDestroyOnLoad(this);
    }

    private void Update()
    {
        TickMgr.Instance.OnUpdate(Time.deltaTime);
        if (update != null)
        {
            update(Time.deltaTime);
        }
        for (var i = 0; i < m_kTimerRecords.Count; i++)
        {
            if (m_kTimerRecords[i] >= m_kTimerIntervals[i])
            {
                m_kTimerCallBacks[i].Invoke();
                if (m_kTimerRecords.Count > i)
                {
                    m_kTimerRecords[i] = 0;
                }
                if (m_kTimerTickCounts.Count > i)
                {
                    m_kTimerTickCounts[i] -= 1;
                    if (m_kTimerTickCounts[i] <= 0)
                    {
                        ClearTimer(m_kTimerIDs[i]);
                    }
                }
            }
            else
            {
                m_kTimerRecords[i] += Time.deltaTime * 1000;
            }
        }
        if (m_kFrameCountCallback.Count > 0)
        {
            var dirtyAction = new List<Action<int>>();
            var deleteAction = new List<Action<int>>();
            var keys = m_kFrameCountCallback.Keys;
            var kEume = keys.GetEnumerator();
            while (kEume.MoveNext())
            {
                if (kEume.Current == null) { continue; }
                var value = m_kFrameCountCallback[kEume.Current];
                if (value > 0)
                {
                    if (m_kFrameCallFlag[kEume.Current]) { kEume.Current(value); }
                    dirtyAction.Add(kEume.Current);
                }
                else
                {
                    kEume.Current(value);
                    deleteAction.Add(kEume.Current);
                }
            }
            for (var i = 0; i < dirtyAction.Count; i++) { m_kFrameCountCallback[dirtyAction[i]] -= 1; }
            for (var i = 0; i < deleteAction.Count; i++)
            {
                m_kFrameCountCallback.Remove(deleteAction[i]);
                m_kFrameCallFlag.Remove(deleteAction[i]);
            }
        }
    }

    public void ClearTimer(int item)
    {
        if (m_kTimerIDs.Contains(item))
        {
            var index = m_kTimerIDs.IndexOf(item);
            m_kTimerIDs.RemoveAt(index);
            m_kTimerCallBacks.RemoveAt(index);
            m_kTimerIntervals.RemoveAt(index);
            m_kTimerTickCounts.RemoveAt(index);
            m_kTimerRecords.RemoveAt(index);
        }
    }

    public int SetTimer(uint interval, uint Count, Action callback)
    {
        m_kTimerIDs.Add(timerCount);
        m_kTimerCallBacks.Add(callback);
        m_kTimerIntervals.Add(interval);
        if (Count != 0) { m_kTimerTickCounts.Add(Count); }
        else { m_kTimerTickCounts.Add(uint.MaxValue); }
        m_kTimerRecords.Add(0);
        return timerCount++;
    }

    public int SetInterval(uint interval, Action callback)
    {
        m_kTimerIDs.Add(timerCount);
        m_kTimerCallBacks.Add(callback);
        m_kTimerIntervals.Add(interval);
        m_kTimerTickCounts.Add(uint.MaxValue);
        m_kTimerRecords.Add(0);
        return timerCount++;
    }

    public int SetTimeout(uint interval, Action callback)
    {
        m_kTimerIDs.Add(timerCount);
        m_kTimerCallBacks.Add(callback);
        m_kTimerIntervals.Add(interval);
        m_kTimerTickCounts.Add(1);
        m_kTimerRecords.Add(0);
        return timerCount++;
    }

    public void SetFrameCall(Action<int> callback, int frameCount = 1, bool isCallEveryFrame = false)
    {
        if (callback != null)
        {
            m_kFrameCountCallback.Add(callback, frameCount);
            m_kFrameCallFlag.Add(callback, isCallEveryFrame);
        }
    }
}
