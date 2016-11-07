using System;
using System.Collections;
using UnityEngine;

namespace Engine {
	public class NetMgr : Singleton<NetMgr> , ITick
	{
		private string ip_;
		private int port_;
		public NetSocket net;
		private float t = 0;
		public LockedPool<ByteArray> byteArrayPool = new LockedPool<ByteArray>(16);

		public NetMgr(){
#if UNITY_WEBGL
			net = new WebNetSocket ();
#else
            net = new NetSocket ();
#endif
        }

		public void connect(string ip, int port) {
			if (net != null) {
				ip_ = ip;
				port_ = port;
				Debug.Log ("connect server : " + ip + ", port : " + port);
				net.connect (ip, port, connected);
			}
		}

		public void connected(bool success)
		{
			if (success)
				TickMgr.Instance.AddTick (this);
		}

		public void send(ProtoBase proto) {
			net.send(proto);
		}

		public void send(ByteArray byteArray) {
			net.send(byteArray);
		}

		public void OnTick(float dt)
		{
			t += dt;
			if (t > 5) {
				t = 0;
				Debug.Log ("heart beat tick : " + dt);
			}
		}
	}
}