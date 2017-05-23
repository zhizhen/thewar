using System.Collections;
using System.Collections.Generic;
using UnityEngine;

static public class StringUtils
{

	static public string Join(this string[] list, string sep){
		return string.Join (sep, list);
	}
}
