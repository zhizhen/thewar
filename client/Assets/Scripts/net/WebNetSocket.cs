using UnityEngine;
using System.Net;
using System.Collections;
using System.Threading;
using System;

namespace Engine
{
    public class WebNetSocket : NetSocket
    {
        private WebSocket _socket;
        private readonly byte[] _headBuffer;
        private byte[] _bodyBuffer;
		public Action<bool> callBack;

        public WebNetSocket()
        {
            _headBuffer = new byte[4];
        }

		public override void connect(string host, int port, Action<bool> connected)
        {
            close();
			this.callBack = connected;
            SimpleLoader.Instance.StartCoroutine(WebSocketConnect(host, port));
        }

        private IEnumerator WebSocketConnect(string ip, int port)
        {
            //Cecurity.PrefetchSocketPolicy("172.16.11.108", 843);
            Debug.Log("开始连接Websocket,ws://" + ip + ":" + port);
            _socket = new WebSocket(new System.Uri("ws://" + ip + ":" + port));
            yield return SimpleLoader.Instance.StartCoroutine(_socket.Connect());
#if UNITY_WEBGL && !UNITY_EDITOR
            GlobalTimer.Instance.update += OnRecvFromSocket;
#else
            Thread th = new Thread(OnRecvFromSocket);
            th.IsBackground = true;
            th.Start();
#endif
        }

        private void OnRecvFromSocket(float dt)
        {
            int length = _socket.length;
            for(int i =0; i < length; i++)
            {
                if (!connected())
                {
                    Debug.Log("断开连接！");
                    errorClose();
                    GlobalTimer.Instance.update -= OnRecvFromSocket;
                    break;
                }
                RecvFromSocket();
                if(string.IsNullOrEmpty(_socket.Error) == false)
                {
                    Debug.LogError("WebSocket 错误:" + _socket.Error);
                    break;
                    GlobalTimer.Instance.update -= OnRecvFromSocket;
                }
            }
        }

        private void OnRecvFromSocket()
        {
            Debug.Log("WebSocket 连接成功！！！");
			this.callBack (true);
            while(true)
            {
                if (!connected())
                {
                    Debug.Log("断开连接！");
                    errorClose();
                    break;
                }
                RecvFromSocket();
                if (string.IsNullOrEmpty(_socket.Error) == false)
                {
                    Debug.LogError("WebSocket 错误:" + _socket.Error);
                    break;
                    GlobalTimer.Instance.update -= OnRecvFromSocket;
                }
            }
            close();
        }

        private void RecvFromSocket()
        {
            byte[] bytes = _socket.Recv();
            if (bytes != null)
            {
                Buffer.BlockCopy(bytes, 0, _headBuffer, 0, 4);
                Int32 value = (Int32)BitConverter.ToUInt32(_headBuffer, 0);
                Int32 _msgLen = (Int32)IPAddress.NetworkToHostOrder(value) - 1;
                _bodyBuffer = new byte[_msgLen];
                Buffer.BlockCopy(bytes, 5, _bodyBuffer, 0, _msgLen);
                byte isZip = bytes[4];
                ByteArray byteArray = NetMgr.GetInstance().byteArrayPool.Pop();
                if (isZip == 1)
                {
                    byte[] unZipBuff = Ionic.Zlib.ZlibStream.UncompressBuffer(_bodyBuffer);
                    byteArray.CreateFromBuff(unZipBuff, false);
                }
                else
                {
                    byteArray.CreateFromBuff(_bodyBuffer, false);
                }
                this.recvQueue.Enqueue(byteArray);
            }
        }

        public override bool connected()
        {
            if (_socket != null && string.IsNullOrEmpty(_socket.Error))
                return true;
            else
                return false;
        }

        public override void send(byte[] data)
        {
            if (_socket != null && string.IsNullOrEmpty(_socket.Error))
            {
                _socket.Send(data);
            }
            else
            {
                Debug.Log("Websocket 错误:" + _socket.Error);
            }
        }

        public void close()
        {
            if (_socket == null) return;
            _socket.Close();
            _socket = null;
        }
    }
}
