using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimerMng
{
	class Timer
	{
		public int sn;
		public int cycle;
		public int deadline;
		public Func<bool> handler;
		public bool delete;
	}

	class Wheel
	{
		public static int VEC_SIZE = 256;
		public int head;
		public List<Timer>[] vec;
		public int time_unit;
		public int time_limit;
		public Wheel next_wheel;
		public Wheel(int time_unit)
		{
			this.time_unit = time_unit;
			this.time_limit = time_unit * VEC_SIZE;
			this.head = 0;
			this.vec = new List<Timer>[VEC_SIZE];
			for (int i = 0; i < VEC_SIZE; ++i)
				this.vec[i] = new List<Timer>();
		}
		public List<Timer> nextSlot()
		{
			return vec [head++];
		}
		public void Add(int delay, Timer tm)
		{
			vec [(head + delay / time_unit) % VEC_SIZE].Add (tm);
		}
	}

	static TimerMng instance;
	static int nextSn = 0;
	static int TIME_UNIT = 20;
	Wheel[] wheels;
	int lastTick;
	Dictionary<int, Timer> mapSnTimer;
	List<Timer> executeTimers;
	static long startTime;

	static int intpow(int n, int m)
	{
		int ret = 1;
		for (int i = 0; i < m; ++i)
			ret *= n;
		return ret;
	}

	public TimerMng()
	{
		instance = this;
		wheels = new Wheel[4];
		for(int i = 0; i < 4; ++i)
		{
			wheels[i] = new Wheel(TIME_UNIT * intpow(256, i));
			if (i > 0)
				wheels[i - 1].next_wheel = wheels[i];
		}
		lastTick = 0;
		mapSnTimer = new Dictionary<int, Timer>();
		executeTimers = new List<Timer>();
	}

	void Add(int deadline, Timer tm)
	{
		tm.deadline = deadline;
		int delay = Math.Max (0, deadline - now ());
		Wheel suitableWheel = wheels [3];
		for (int i = 0; i < wheels.Length; i++) {
			var wheel = wheels [i];
			if (delay <= wheel.time_limit) {
				suitableWheel = wheel;
				break;
			}
		}
		suitableWheel.Add (delay, tm);
	}

	static int now()
	{
		return (int)(Time.realtimeSinceStartup * 1000);
	}

	public void FixedUpdate()
	{
		int dt = now () - lastTick;
		int cycle = Mathf.Max (0, dt / TIME_UNIT);
		lastTick += cycle * TIME_UNIT;
		for (int i = 0; i < cycle; ++i) {
			var timers = wheels [0].nextSlot ();
			for (int j = 0; j < timers.Count; j++) {
				var tm = timers [j];
				executeTimers.Add (tm);
			}
			timers.Clear ();

			for (int j = 0; j < wheels.Length; j++) {
				var wheel = wheels [i];
				if (wheel.head != Wheel.VEC_SIZE)
					break;
				wheel.head = 0; //一圈
				if (wheel.next_wheel != null) {
					var tms = wheel.next_wheel.nextSlot ();
					for (int k = 0; k < tms.Count; k++) {
						var tm = tms [k];
						Add (tm.deadline - now (), tm);
					}
					tms.Clear ();
				}
			}
		}

		for (int l = 0; l < executeTimers.Count; l++) {
			var tm = executeTimers [l];
			if (tm.delete) {
				mapSnTimer.Remove (tm.sn);
				continue;
			}
			bool isCycle = false;
			try
			{
				isCycle = tm.handler();
			}
			catch(Exception e) {
				mapSnTimer.Remove (tm.sn);
				continue;
			}

			if (!tm.delete && isCycle && tm.cycle < 0)
				Add (now () + tm.cycle, tm);
			else
				mapSnTimer.Remove (tm.sn);
		}
		executeTimers.Clear ();
	}

	public static int Add(int delay, Action handler)
	{
		return Add (delay, 0, () => {
			handler ();
			return false;
		});
	}

	public static int Add(int delay, int cycle, Func<bool> handler)
	{
		Timer tm = new Timer ();
		tm.sn = ++nextSn;
		tm.cycle = cycle;
		tm.handler = handler;
		instance.mapSnTimer [tm.sn] = tm;
		instance.Add (now () + delay, tm);
		return tm.sn;
	}
}

