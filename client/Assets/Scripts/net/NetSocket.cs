using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using UnityEngine;

namespace Engine
{
	public class NetSocket
	{
		private const int DEFAULT_CONNECT_RETRYNUM = 5;
		private const int CONNECT_TIMEOUT = 10 * 1000;
		public const int MAX_RECEIVE_SIZE = 65535;

		private readonly byte[] _headBuffer;
		private byte[] _bodyBuffer;
		private int _msgLen;
		private ByteArray _sendBuffer = new ByteArray();
		protected readonly SynchronizedQueue<ByteArray> recvQueue = new SynchronizedQueue<ByteArray>();

		public int port { get; set; }
		public string ip { get; set; }
		private Socket _socket;
		private Thread th;
		public Action<bool> callBack;
        public int ProtoCount { get { return recvQueue.Count; } }


        public NetSocket ()
		{
			_headBuffer = new byte[4];
		}

		public virtual bool connected() {
			return _socket != null && _socket.Connected;
		}

		public virtual void connect(string ip, int port, Action<bool> connected) {
			CloseAndClear ();
			this.ip = ip;
			this.port = port;
			this.callBack = connected;
			_socket = new Socket (AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
			IAsyncResult result = _socket.BeginConnect (ip, port, connectedCallback, null);
		}

		public void close() {
			stopRecv ();
			if (_socket != null) {
				_socket.Close ();
				_socket = null;
			}
		}

		protected void errorClose() {
			close ();
			Debug.LogError ("error close socket!");
		}

		public void send(ProtoBase proto) {
			string protoName = proto.GetType ().Name;
//			Debug.Log ("send proto :" + protoName);
			send (Encode (proto));
		}

		public void send(ByteArray byteArray) {
			//proto length
			short BigLen = IPAddress.HostToNetworkOrder ((short)byteArray.Length);
			byte[] lenBytes = BitConverter.GetBytes(BigLen);
			byte[] sendBytes = new byte[byteArray.Length + 2];
			Array.Copy (lenBytes, sendBytes, lenBytes.Length);
			Array.Copy (byteArray.Buff, 0, sendBytes, 2, byteArray.Length);
			send (sendBytes);
		}

		public virtual void send(byte[] data) {
			if (data != null) {
				if (connected () && _socket.Poll (1, SelectMode.SelectWrite)) {
					try {
						_socket.Send(data);
//						Debug.Log("send size : " + sendSize);
					} catch (SocketException ex) {
						Debug.LogError ("send data error :" + ex.Message + ";error code: " + ex.ErrorCode);
						errorClose ();
					}
				} else {
					Debug.LogError ("not connected, do not send!");
				}
			}
		}

        public ByteArray ReadFromQueue()
        {
            if (recvQueue.Count == 0) return null;
            var byteArray = recvQueue.Dequeue();
            return byteArray;
        }

		private void connectedCallback(IAsyncResult ar) {
			if (connected ()) {
				_socket.EndConnect (ar);
				Debug.LogError ("connect success!");
				if (this.callBack != null)
					this.callBack (true);
				startRecv ();
			} 
			else 
			{
				Debug.LogError ("connect failed!");
				if (this.callBack != null)
					this.callBack (false);
			}
		}

		private void startRecv() {
			if (th == null) {
				th = new Thread (RecvFromSocket);
				th.IsBackground = true;
				th.Start ();
			}
		}

		private void stopRecv() {
			try {
				if ( th != null) {
					th.Abort();
				}
			} catch (Exception ex) {
				Debug.LogError ("stopRecv() failed! :" + ex.StackTrace);
			} finally {
				th = null;
			}
		}

		private void RecvFromSocket() {
			while (true) {
				if (!connected ()) {
					Debug.LogError ("not connected!");
					break;
				}
				if (_msgLen == 0) {
					//header
					if (_socket.Available < 2)
						continue;
					_socket.Receive (_headBuffer);
					Int32 value = (Int32)BitConverter.ToUInt32 (_headBuffer, 0);
					_msgLen = (Int32)IPAddress.NetworkToHostOrder (value);
					if (_msgLen > MAX_RECEIVE_SIZE) {
						Debug.LogError ("package length exception :" + _msgLen);
						return;
					}
					_bodyBuffer = new byte[_msgLen];
				} else {
					//body
					if (_socket.Available < _msgLen) continue;
					_socket.Receive (_bodyBuffer);
					ByteArray byteArray = NetMgr.GetInstance ().byteArrayPool.Pop ();
					//is Zip
					byte isZip = _bodyBuffer[0];
					if (isZip == 1) {
						int zipBuffSize = _bodyBuffer.Length - 1;
						byte[] zipBuff = new byte[zipBuffSize];
						Array.Copy (_headBuffer, 1, zipBuff, 0, zipBuff.Length);

						byte[] unZipBuff = Ionic.Zlib.ZlibStream.UncompressBuffer (zipBuff);
						byteArray.CreateFromBuff (unZipBuff, false);
					} else {
						byteArray.CreateFromBuff (_bodyBuffer, true);
					}
					_bodyBuffer = null;
					_msgLen = 0;
					//recv success
					recvQueue.Enqueue (byteArray);
				}
			}
		}

		private byte[] Encode(ProtoBase proto) {
			_sendBuffer.Reset ();
			proto.write (_sendBuffer);

			short BigLen = IPAddress.HostToNetworkOrder ((short)_sendBuffer.Length);
			byte[] lenBytes = BitConverter.GetBytes (BigLen);

			byte[] sendBytes = new byte[_sendBuffer.Length + 2];
			Array.Copy (lenBytes, sendBytes, lenBytes.Length);

			Array.Copy (_sendBuffer.Buff, 0, sendBytes, 2, _sendBuffer.Length);
			return sendBytes;
		}

		private void CloseAndClear() {
			close ();
			_bodyBuffer = null;
		}
	}
}

