using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using Engine;

public interface ILockedPoolElement {

	void Reset ();
}

public sealed class LockedPool<T> where T : ILockedPoolElement, new() {
	private Stack<T> m_Pools;
	private int m_PoolSize;

	public LockedPool(int poolSize){
		m_Pools = new Stack<T> (poolSize);
		m_PoolSize = poolSize;
		for (int i = 0; i < poolSize; ++i) {
			T t = new T ();
			t.Reset ();
			m_Pools.Push (t);
		}
	}

	public T Pop(){
		T t;
		lock (this) {
			if (m_Pools.Count <= 0)
				Resize ();
			t = m_Pools.Pop ();
		}
		return t;
	}

	public void Push(T t){
		if (t != null) {
			t.Reset ();
			lock (this) {
				m_Pools.Push (t);
			}
		}
	}

	private void Resize() {
		int addCount = m_PoolSize / 2;
		if (addCount <= 0)
			addCount = 1;
		for (int i = 0; i < addCount; ++i) {
			T t = new T ();
			t.Reset ();
			m_Pools.Push (t);
		}
		m_PoolSize += addCount;
	}
}
