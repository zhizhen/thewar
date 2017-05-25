using System.Collections;
using UnityEngine;

public class GameConst
{
	
	public static AIType aiType = AIType.怪物;
	public static int mapX = 35;
	public static int mapY = 15;
	public static float cell = 0.4f;
}

public enum AIType
{
	机器人 = 1,
	怪物 =0,
}