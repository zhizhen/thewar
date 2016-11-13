using System;
using System.Collections.Generic;
using UnityEngine;

namespace Engine {
	public class NetMgr : Singleton<NetMgr> , ITick
	{
        //心跳间隔
        private const double HEART_BEAT_INTEVAL = 1;
        //每帧处理协议数
        private const int frameCMDNum = 30;
        //立即处理
        private static readonly Dictionary<int, Action<ProtoBase>> imm_handleList = new Dictionary<int, Action<ProtoBase>>();
        //分帧处理
        private static readonly Dictionary<int, Action<ProtoBase>> frame_handleList = new Dictionary<int, Action<ProtoBase>>();
        private readonly IList<ProtoBase> cacheCMDList;
        private string ip_;
		private int port_;
		public NetSocket net;
		private float t = 0;
		public LockedPool<ByteArray> byteArrayPool = new LockedPool<ByteArray>(16);
        private m__system__heartbeat__c2s heartbeat_proto;


        public NetMgr(){
            cacheCMDList = new List<ProtoBase>();
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

        public void sendHeartbeat()
        {
            if (heartbeat_proto == null)
                heartbeat_proto = new m__system__heartbeat__c2s();
            send(heartbeat_proto);
        }

        public static void addImmCMD(int cmd, Action<ProtoBase> callback)
        {
            if (callback == null) return;
            if (imm_handleList.ContainsKey(cmd)) Debug.LogError("重复监听:" + cmd);
            imm_handleList[cmd] = callback;
        }
        public static void removeImmCMD(int cmd)
        {
            imm_handleList.Remove(cmd);
        }

        public static void addCMD(int cmd, Action<ProtoBase> callback)
        {
            if (callback == null) return;
            if (frame_handleList.ContainsKey(cmd)) Debug.LogError("重复监听:" + cmd);
            frame_handleList[cmd] = callback;
        }
        public static void removeCMD(int cmd)
        {
            frame_handleList.Remove(cmd);
        }

        private void cacheCMD()
        {
            var ProtoCount = net.ProtoCount;
            if (ProtoCount < 1) return;
            while (true)
            {
                var byteArray = net.ReadFromQueue();
                if (byteArray == null) break;
                //协议号
                var protoId = byteArray.ReadInt32();
                var protocolData = ProtoMap.Instance.GetProto(protoId);
                if (protocolData != null)
                {
                    protocolData.read(byteArray);
                    if (imm_handleList.ContainsKey(protoId)) imm_handleList[protoId](protocolData);
                    else cacheCMDList.Add(protocolData);
                    byteArrayPool.Push(byteArray);
                }
                else
                    Debug.LogError("没有这个协议:" + protoId);
            }
        }

        private void handleCMD()
        {
            if (cacheCMDList.Count < 1) return;
            for (int i = frameCMDNum; i > 0; i--)
            {
                if (cacheCMDList.Count < 1) break;
                var proto = cacheCMDList[0];
                cacheCMDList.Remove(proto);
                var protoId = proto.proto_id;
                if (frame_handleList.ContainsKey(protoId))
                {
                    frame_handleList[protoId](proto);
                }
            }
        }

        public void OnTick(float dt)
		{
			t += dt;
			if (t > HEART_BEAT_INTEVAL) {
				t = 0;
				Debug.Log ("heart beat tick : " + dt);
                sendHeartbeat();
			}
            cacheCMD();
            handleCMD();
		}
	}
}