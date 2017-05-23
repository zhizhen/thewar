using System;
using System.IO;
using System.Reflection;
using System.Linq.Expressions;
//using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Engine{
	public class ConfigTool : Singleton<ConfigTool> {

		private MemoryStream _fs;
		private BinaryReader _br;

		private event Func<int> _rInt;
		private event Func<int, string> _rStr;
		private event Func<float> _rSingle;
		private event Func<int, List<int>> _rIntList;
		private event Func<int, List<string>> _rStrList;

//		## 二进制数据打包格式
//		##[字段个数][字段类型+字段名长度+字段名]...[键值长度+键值+配置数据]...
//		##配置数据 = [数据类型 + 数据信息]
//		#		  = array	=> 维度+数据类型+数据
//		#		  				数据类型 = string, 	数据 = 数据个数+[数据长度+数据]
//		#						数据类型 = int,		数据 = 数据个数+[数据]
//		#						数据类型 = float,		数据 = 数据个数+[数据]
//		#			string 	=> [数据长度+数据]
//		#			int		=> [数据]
//		#			float	=> [数据]

		public Dictionary<string, object> AnalyseBinaryConfig<T>() where T : new()
		{
			string voName = typeof(T).Name;
			var keyValueDic = new Dictionary<string, object> ();
			_br = ConfigMgr.Instance.GetBinaryReader (voName, out _fs);

			if (_rInt == null)
				_rInt = () => _br.ReadInt32 ();

			if (_rStr == null) {
				_rStr = (int byteNum) => {
					byte[] buffer = _br.ReadBytes (byteNum);
					string str = System.Text.Encoding.UTF8.GetString(buffer);
					return str;
				};
			}

			if (_rSingle == null)
				_rSingle = () => _br.ReadSingle ();

			if (_rIntList == null) {
				_rIntList = (int dNum) => {
					var list = new List<int>();
					for(int k = 0; k < dNum; k++)
					{
						int intValue = _rInt();
						list.Add(intValue);
					}
					return list;
				};
			}

			if (_rStrList == null) {
				_rStrList = (int dNum) => {
					var list = new List<string>();
					for(int k = 0; k < dNum; k++)
					{
						int byteLen = _rInt();
						string strValue = _rStr(byteLen);
						list.Add(strValue);
					}
					return list;
				};
			}

			//字段数量
			int num = _rInt();
			string[] fieldsName = new string[num];
			int[] fieldsType = new int[num];
			//读取表头
			for (int i = 0; i < num; i++) {
				int type = _rInt ();
				int keyLen = _rInt ();
				string keyValue = _rStr (keyLen);
				fieldsName [i] = keyValue;
				fieldsType [i] = type;
			}
			//读取表数据
			while (_br.BaseStream.Position < _br.BaseStream.Length - 1) {
				
				Type type = Type.GetType (voName);
				if (type == null) {
					_fs.Close ();
					_br.Close ();
					Debug.LogError (voName + "不存在！");
					return keyValueDic;
				}
				object obj = Activator.CreateInstance (type);
				FieldInfo[] infos = obj.GetType ().GetFields ();

				//读取组合key
				int keyLen = _rInt ();
				string key = _rStr (keyLen);
				SetValue (infos, "key", ref obj, ref key);
				for (int i = 0; i < fieldsName.Length; i++) {
					switch (fieldsType [i]) {
					case 1:
						{
							int intValue = _rInt ();
							SetValue (infos, fieldsName [i], ref obj, ref intValue);
							break;
						}
					case 2:
						{
							int byteLen = _rInt ();
							string strValue = _rStr (byteLen);
							SetValue (infos, fieldsName [i], ref obj, ref strValue);
							break;
						}
					case 3:
						{
							int listLv = _rInt ();
							int listType = _rInt ();
							if (listLv == 1) //一维数组
							{
								int dataNum = _rInt ();
								if (listType == 1) //整型数组
								{
									var list = _rIntList (dataNum);
									SetValue (infos, fieldsName[i], ref obj, ref list);
								}
								else //字符串数组
								{
									var list = _rStrList (dataNum);
									SetValue (infos, fieldsName[i], ref obj, ref list);
								}
							}
							else if (listLv == 2) // 二维数组
							{
								if (listType == 1) //整型数组
								{
									var keyList = new List<List<int>> ();
									var listNum = _rInt ();
									for (int j = 0; j < listNum; j++) {
										int dataNum = _rInt ();
										var list = _rIntList (dataNum);
										keyList.Add (list);
									}
									SetValue (infos, fieldsName[i], ref obj, ref keyList);
								}
								else //字符串数组
								{
									var keyList = new List<List<string>> ();
									var listNum = _rInt ();
									for (int j = 0; j < listNum; j++) {
										int dataNum = _rInt ();
										var list = _rStrList (dataNum);
										keyList.Add (list);
									}
									SetValue (infos, fieldsName[i], ref obj, ref keyList);
								}
							}
							break;
						}
					case 4: //单精度浮点型
						{
							float floatValue = _rSingle ();
							SetValue (infos, fieldsName [i], ref obj, ref floatValue);
							break;
						}
					default:
						_fs.Close ();
						_br.Close ();
						Debug.LogError ("配置表类型有误");
						return keyValueDic;
					}
				}
				keyValueDic.Add (key, obj);
			}

			_fs.Close ();
			_br.Close ();
			return keyValueDic;
		}

		private void SetValue<T>(IEnumerable<FieldInfo> infos, string fieldName, ref object obj, ref T value)
		{
			var iter = infos.GetEnumerator ();
			while (iter.MoveNext ()) {
				var info = iter.Current;
				if (info != null && info.Name.Equals (fieldName)) {
					if (info.FieldType == typeof(T))
						info.SetValue (obj, value);
					else
						throw new Exception (string.Format("Type of fieldName {0} is not {1}", fieldName, typeof(T)));
					break;
				}
			}
		}
	}
}