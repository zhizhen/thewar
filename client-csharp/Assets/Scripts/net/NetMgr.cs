using System;
using UnityEngine;
using System.Collections;

namespace Engine {
	public class NetMgr {
		private string ip_;
		private int port_;
		public NetSocket net;

		public LockedPool<ByteArray> byteArrayPool = new LockedPool<ByteArray>(16);

		private NetMgr(){
#if UNITY_WEBGL
			net = new WebNetSocket ();
#else
            net = new NetSocket ();
#endif
        }

		private static NetMgr _instance;
		public static NetMgr Instance {
			get {
				if (_instance == null) {
					_instance = new NetMgr ();
				}
				return _instance;
			}
		}
		public static NetMgr GetInstance() {
			return Instance;
		}

		public void connect(string ip, int port) {
			if (net != null) {
				ip_ = ip;
				port_ = port;
				Debug.Log ("connect server : " + ip + ", port : " + port);
				net.connect (ip, port);
			}
		}

		public void send(ProtoBase proto) {
			net.send(proto);
		}

		public void send(ByteArray byteArray) {
			net.send(byteArray);
		}
	}
}