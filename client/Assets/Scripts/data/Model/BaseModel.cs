using System;
using System.Collections.Generic;
using Engine;

public class BaseModel
{
	private readonly Dictionary<string, Dictionary<string, object>> _dicVo = new Dictionary<string, Dictionary<string, object>>();

	protected void InitData<T>() where T : new()
	{
		_dicVo [typeof(T).Name] = GetConfigVoDic<T> ();
	}

	private static Dictionary<string, object> GetConfigVoDic<T>() where T : new() 
	{
		var data = ConfigTool.GetInstance ().AnalyseBinaryConfig<T> ();
		if (data == null) {
			throw new InvalidOperationException (string.Format ("{0} not exist", typeof(T).Name));
		} else {
			return data;
		}
	}

	protected T __GetVo<T>(string key) where T : new(){
		return GetValue<T> (typeof(T).Name, key);
	}

	protected T __GetVo<T>(params string[] keys) where T : new(){
		return GetValue<T> (typeof(T).Name, keys.Join ("-"));
	}

	private T GetValue<T>(string type, string key){
		object data;
		if (_dicVo [type].TryGetValue (key, out data))
			return (T)data;
		else
			throw new ArgumentException (string.Format("Config not found type={0}, key={1}", type, key));
	}

	public Dictionary<string, object> GetVOs<T>(){
		return _dicVo [typeof(T).Name];
	}
}