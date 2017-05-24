using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ModelAction : GlobalBase {

	private Animator _animator;
	private int _curEventId;
	//动画速度改变恢复时间
	private float m_aniSpeedRecoverTime = 0f;
	private Dictionary<int, AnimationClip> m_dicAnimationClip;

	// Use this for initialization
	public ModelAction(EntityBase own) : base(own)
	{
		m_dicAnimationClip = new Dictionary<int, AnimationClip> ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
