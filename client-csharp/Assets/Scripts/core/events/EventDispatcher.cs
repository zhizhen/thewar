using System;
using System.Collections.Generic;

namespace Engine
{
    public class EventDispatcher : IDisposable
    {
        private Dictionary<string, Delegate> _eventListeners;

        public void AddEventListener(string eventType, Action listener)
        {
            AddEventListener(eventType, (Delegate)listener);
        }

        public void AddEventListener<T1>(string eventType, Action<T1> listener)
        {
            AddEventListener(eventType, (Delegate)listener);
        }

        public void AddEventListener<T1, T2>(string eventType, Action<T1, T2> listener)
        {
            AddEventListener(eventType, (Delegate)listener);
        }

        public void AddEventListener<T1, T2, T3>(string eventType, Action<T1, T2, T3> listener)
        {
            AddEventListener(eventType, (Delegate)listener);
        }

        public void AddEventListener<T1, T2, T3, T4>(string eventType, Action<T1, T2, T3, T4> listener)
        {
            AddEventListener(eventType, (Delegate)listener);
        }

        public void RemoveEventListeners(string eventType = null)
        {
            if (_eventListeners == null) return;
            if (string.IsNullOrEmpty(eventType)) _eventListeners.Clear();
            else _eventListeners.Remove(eventType);
        }

        public void RemoveEventListener(string eventType, Action listener)
        {
            RemoveEventListener(eventType, (Delegate)listener);
        }

        public void RemoveEventListener<T1>(string eventType, Action<T1> listener)
        {
            RemoveEventListener(eventType, (Delegate)listener);
        }

        public void RemoveEventListener<T1, T2>(string eventType, Action<T1, T2> listener)
        {
            RemoveEventListener(eventType, (Delegate)listener);
        }

        public void RemoveEventListener<T1, T2, T3>(string eventType, Action<T1, T2, T3> listener)
        {
            RemoveEventListener(eventType, (Delegate)listener);
        }

        public void RemoveEventListener<T1, T2, T3, T4>(string eventType, Action<T1, T2, T3, T4> listener)
        {
            RemoveEventListener(eventType, (Delegate)listener);
        }

        private void RemoveEventListener(string eventType, Delegate listener)
        {
            if (string.IsNullOrEmpty(eventType)) throw new ArgumentNullException("eventType");
            if (listener == null) throw new ArgumentNullException("listener");
            if (_eventListeners == null) return;
            Delegate listeners;
            if (!_eventListeners.TryGetValue(eventType, out listeners)) return;
            if (listeners == null)
            {
                _eventListeners.Remove(eventType);
                return;
            }
            listeners = Delegate.Remove(listeners, listener);
            if (listeners != null) _eventListeners[eventType] = listeners;
            else _eventListeners.Remove(eventType);
        }

        public void Dispatch(string eventType)
        {
            if (_eventListeners == null) return;
            Delegate listener;
            if (!_eventListeners.TryGetValue(eventType, out listener)) return;
            if (listener != null) ((Action)listener)();
            else _eventListeners.Remove(eventType);
        }

        public void Dispatch<T1>(string eventType, T1 t1)
        {
            if (_eventListeners == null) return;
            Delegate listener;
            if (!_eventListeners.TryGetValue(eventType, out listener)) return;
            if (listener != null) ((Action<T1>)listener)(t1);
            else _eventListeners.Remove(eventType);
        }

        public void Dispatch<T1, T2>(string eventType, T1 t1, T2 t2)
        {
            if (_eventListeners == null) return;
            Delegate listener;
            if (!_eventListeners.TryGetValue(eventType, out listener)) return;
            if (listener != null) ((Action<T1, T2>)listener)(t1, t2);
            else _eventListeners.Remove(eventType);
        }

        public void Dispatch<T1, T2, T3>(string eventType, T1 t1, T2 t2, T3 t3)
        {
            if (_eventListeners == null) return;
            Delegate listener;
            if (!_eventListeners.TryGetValue(eventType, out listener)) return;
            if (listener != null) ((Action<T1, T2, T3>)listener)(t1, t2, t3);
            else _eventListeners.Remove(eventType);
        }

        public void Dispatch<T1, T2, T3, T4>(string eventType, T1 t1, T2 t2, T3 t3, T4 t4)
        {
            if (_eventListeners == null) return;
            Delegate listener;
            if (!_eventListeners.TryGetValue(eventType, out listener)) return;
            if (listener != null) ((Action<T1, T2, T3, T4>)listener)(t1, t2, t3, t4);
            else _eventListeners.Remove(eventType);
        }

        private void AddEventListener(string eventType, Delegate listener)
        {
            if (string.IsNullOrEmpty(eventType))
                throw new ArgumentNullException("eventType");
            if (listener == null)
                throw new ArgumentNullException("listener");
            if (_eventListeners == null)
                _eventListeners = new Dictionary<string, Delegate>();
            Delegate listeners;
            if (!_eventListeners.TryGetValue(eventType, out listeners))
            {
                _eventListeners[eventType] = listener;
                return;
            }
            if (listeners != null)
                _eventListeners[eventType] = Delegate.Combine(listeners, listener);
            else
                _eventListeners[eventType] = listener;
        }

        public void Dispose()
        {
            RemoveEventListeners();
        }
    }
}
