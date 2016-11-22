using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using Engine;

namespace Engine
{
    public class TickMgr : Singleton<TickMgr>
    {
        private List<ITick> _activeTicks;
        private List<ITick> _needDeleteTicks;
        private List<ITick> _needActiveTicks;
        private ITick tickItem;

        public TickMgr()
        {
            _activeTicks = new List<ITick>();
            _needDeleteTicks = new List<ITick>();
            _needActiveTicks = new List<ITick>();
        }

        public void OnUpdate(float dt)
        {
            while (_needDeleteTicks.Count > 0)
            {
                tickItem = _needDeleteTicks[0];
                _needDeleteTicks.RemoveAt(0);
                _activeTicks.Remove(tickItem);
            }
            while (_needActiveTicks.Count > 0)
            {
                tickItem = _needActiveTicks[0];
                _needActiveTicks.RemoveAt(0);
                _activeTicks.Add(tickItem);
            }
            int Count = _activeTicks.Count;
            for (int i = 0; i < Count; i++)
            {
                _activeTicks[i].OnTick(dt);
            }
        }

        public void AddTick(ITick tick)
        {
            if (_needDeleteTicks.Contains(tick)) { _needDeleteTicks.Remove(tick); }
            if (!IsActive(tick))
            {
                if (!_needActiveTicks.Contains(tick)) { _needActiveTicks.Add(tick); }
            }
        }

        public void RemoveTick(ITick tick)
        {
            if (IsActive(tick)) { _needDeleteTicks.Add(tick); }
            else if (_needActiveTicks.Contains(tick)) { _needActiveTicks.Remove(tick); }
        }

        public bool IsActive(ITick tick)
        {
            return _activeTicks.Contains(tick);
        }

        public List<ITick> Ticks
        {
            get { return _activeTicks; }
        }
    }

}
