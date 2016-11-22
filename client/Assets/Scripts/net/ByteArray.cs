using System;
using System.Text;
using System.Net;
using UnityEngine;

namespace Engine
{
	public class ByteArray : ILockedPoolElement
	{
		private const int MAX_BUFF_SIZE = 65535;
		protected byte[] dataBuff;
		protected int length = 0;
		protected int position = 0;

		public byte[] Buff
		{
			get{ return dataBuff; }
		}

		public int Length
		{
			get { return length; }
		}

		public int Position
		{
			get { return position; }
		}

		public ByteArray ()
		{
			dataBuff = new byte[4096];
		}

		public void Reset(){
			length = 0;
			position = 0;
			Array.Clear (dataBuff, 0, dataBuff.Length);
		}

		public bool CreateFromBuff(byte[] buff, bool IsZip){
			if (buff == null) {
				return false;
			}
			if (buff.Length > MAX_BUFF_SIZE) {
				return false;
			}
			if (IsZip)
				Array.Copy (buff, 1, dataBuff, 0, buff.Length - 1);
			else
				Array.Copy (buff, 0, dataBuff, 0, dataBuff.Length);
			position = 0;
			return true;
		}

		public byte Readbyte(){
			if (position + 1 > dataBuff.Length) {
				Debug.LogError ("Readbyte read out of limit: " + dataBuff.Length);
			}
			byte value = dataBuff [position];
			position++;
			return value;
		}

		public short Readshort() {
			if (position + 2 > dataBuff.Length) {
				Debug.LogError ("Readshort read out of limit: " + dataBuff.Length);
			}
			short value = BitConverter.ToInt16 (dataBuff, position);
			short bigValue = (short)IPAddress.NetworkToHostOrder (value);
			position += 2;
			return bigValue;
		}

		public ushort Readushort() {
			if (position + 2 > dataBuff.Length) {
				Debug.LogError ("Readushort read out of limit: " + dataBuff.Length);
			}
			short value = (short)BitConverter.ToInt16 (dataBuff, position);
			ushort bigValue = (ushort)IPAddress.NetworkToHostOrder (value);
			position += 2;
			return bigValue;
		}

		public Int32 ReadInt32() {
			if (position + 4 > dataBuff.Length) {
				Debug.LogError ("ReadInt32 read out of limit: " + dataBuff.Length);
			}
			Int32 value = BitConverter.ToInt32 (dataBuff, position);
			Int32 bigValue = (Int32)IPAddress.NetworkToHostOrder (value);
			position += 4;
			return bigValue;
		}

		public UInt32 ReadUInt32() {
			if (position + 4 > dataBuff.Length) {
				Debug.LogError ("ReadUInt32 read out of limit: " + dataBuff.Length);
			}
			Int32 value = (Int32)BitConverter.ToInt32 (dataBuff, position);
			UInt32 bigValue = (UInt32)IPAddress.NetworkToHostOrder (value);
			position += 4;
			return bigValue;
		}

		public Int64 ReadInt64() {
			if (position + 8 > dataBuff.Length) {
				Debug.LogError ("ReadInt64 read out of limit: " + dataBuff.Length);
			}
			Int64 value = BitConverter.ToInt64 (dataBuff, (Int32)position);
			Int64 bigValue = (Int64)IPAddress.NetworkToHostOrder (value);
			position += 8;
			return bigValue;
		}

		public string Readstring() {
			if (position + 2 > dataBuff.Length) {
				Debug.LogError ("Readstring read out of limit: " + dataBuff.Length);
			}
			ushort bigValue = Readushort ();
			string value = Encoding.UTF8.GetString (dataBuff, position, (Int32)bigValue);
			position += bigValue;
			return value;
		}

		public void Writebyte(byte value) {
			CheckBuffSize (position + 1);
			dataBuff [position] = value;
			position++;
			length = position;
		}

		public void Writeshort(short value) {
			CheckBuffSize (position + 2);
			short bigValue = (short)IPAddress.HostToNetworkOrder (value);
			Array.Copy (BitConverter.GetBytes(bigValue), 0, dataBuff, position, 2);
			position += 2;
			length = position;
		}

		public void Writeushort(ushort value) {
			CheckBuffSize (position + 2);
			dataBuff [position] = (byte)(value >> 8);
			dataBuff [position + 1] = (byte)value;
			position += 2;
			length = position;
		}

		public void WriteInt32(Int32 value) {
			CheckBuffSize (position + 4);
			Int32 bigValue = (Int32)IPAddress.HostToNetworkOrder (value);
			Array.Copy (BitConverter.GetBytes(bigValue), 0, dataBuff, position, 4);
			position += 4;
			length = position;
		}

		public void WriteUInt32(UInt32 value) {
			CheckBuffSize (position += 4);
			UInt32 bigValue = (UInt32)IPAddress.HostToNetworkOrder ((Int32)value);
			Array.Copy (BitConverter.GetBytes (bigValue), 0, dataBuff, position, 4);
			position += 4;
			length = position;
		}

		public void WriteInt64(Int64 value) {
			CheckBuffSize (position + 8);
			Int64 bigValue = (Int64)IPAddress.HostToNetworkOrder (value);
			Array.Copy (BitConverter.GetBytes (bigValue), 0, dataBuff, position, 8);
			position += 8;
			length = position;
		}

		public void Writestring(string value) {
			byte[] bytes = Encoding.UTF8.GetBytes (value);
			ushort strLen = (ushort)bytes.Length;
			CheckBuffSize (position + 2 + strLen);
			Writeushort (strLen);
			Array.Copy (bytes, 0, dataBuff, position, strLen);
			position += strLen;
			length = position;
		}

		public void CheckBuffSize(int nextSize) {
			if (nextSize > dataBuff.Length) {
				if (nextSize > 32767) {
					Debug.LogError ("init byte array failed, larger than max socket stream limit!");
					throw new Exception ("ByteArray out of limit size!");
				}
				int newSize = dataBuff.Length + dataBuff.Length / 2;
				if (newSize < nextSize)
					newSize = nextSize;
				byte[] newBuff = new byte[newSize];
				Array.Copy (dataBuff, newBuff, position);
				dataBuff = newBuff;
			}
		}
	}
}

