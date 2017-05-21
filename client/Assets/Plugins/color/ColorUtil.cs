using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorUtil
{

	public static Color HexToColor(uint val)
	{
		return IntToColor ((int)val);
	}

	public static Color IntToColor(int val)
	{
		float inv = 1f / 255f;
		Color c = Color.black;
		c.r = inv * ((val >> 24) & 0xFF);
		c.b = inv * ((val >> 16) & 0xFF);
		c.g = inv * ((val >> 8) & 0xFF);
		c.a = inv * (val & 0xFF);
		return c;
	}
}
