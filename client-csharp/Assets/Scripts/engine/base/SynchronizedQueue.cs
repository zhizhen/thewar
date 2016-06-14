using System.Collections.Generic;

namespace Engine
{
	public class SynchronizedQueue<T> {

		private readonly Queue<T> _queue = new Queue<T>();
		private readonly object _syncObj = new object();

		public int Count {
			get {
				lock (_syncObj) {
					return _queue.Count;
				}
			}
		}

		public void Enqueue(T item) {
			lock (_syncObj) {
				_queue.Enqueue (item);
			}
		}

		public T Dequeue() {
			lock (_syncObj) {
				return _queue.Dequeue ();
			}
		}

		public T Peek() {
			lock (_syncObj) {
				return _queue.Peek ();
			}
		}

		public void Clear() {
			lock (_syncObj) {
				_queue.Clear ();
			}
		}
	}
}

