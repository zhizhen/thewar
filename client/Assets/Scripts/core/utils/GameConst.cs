using System.Collections;
using UnityEngine;

public class GameConst
{
	
	public static AIType aiType = AIType.怪物;
	public static int mapX = 9;
	public static int mapY = 6;
	public static float cell = 0.8f;
}

public enum AIType
{
	机器人 = 1,
	怪物 =0,
}