using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BT
{
	[HideInInspector]
	public class BTNode
	{
		public enum State {INIT, PENDING, FINISH, FAIL};
		private State _state = State.INIT;
		public ComponentNode parent;
		public bool _isRunTimeNode = false;

		public State state 
		{
			get { return _state;}
			set
			{
				if (_state == value)
					return;
				_state = value;
			}
		}

		public virtual string GetNodeName()
		{
			return this.GetType ().Name;
		}

		public virtual void reset()
		{
			state = State.INIT;
		}

		public virtual void execute(AICtrl agent)
		{}

		#if UNITY_EDITOR
		const int Delay = 200;
		protected void delayFinish(AICtrl agent, State stat)
		{
			Action a = () =>
			{
				this.state = stat;
				Action b = () =>
				{
					if (this.parent != null)
						this.parent.tryMoveNext(agent, stat);
				};
				TimerMng.Add(Delay, b);
			};
			TimerMng.Add (Delay, a);
		}
		#endif

		protected void finish(AICtrl agent, State stat)
		{
			this.state = stat;
			if (this.parent != null)
				this.parent.tryMoveNext (agent, stat);
		}

		public static Type getReflectType(string clsName)
		{
			return Type.GetType (clsName);
		}

		public virtual void PendingCheck(AICtrl agent)
		{
			
		}
	}

	//组合节点的基类，表示拥有子节点
	[HideInInspector]
	public class ComponentNode : BTNode
	{
		public List<BTNode> childs;
		protected List<BTNode>.Enumerator iterChild;

		public bool _isFirstExe = true;
		#if UNITY_EDITOR
		public bool _needRrawChilds = false;
		#endif
		public ComponentNode() :base()
		{
			childs = new List<BTNode> ();
		}

		public override void reset()
		{
			_isFirstExe = true;
			base.reset ();
			int count = childs.Count;
			for (int i = count - 1; i > 0; i--) {
				BTNode child = childs [i];
				if (child._isRunTimeNode)
					removeChild (child);
				else
					child.reset ();
			}
		}

		public void addChild(BTNode node)
		{
			addChild (childs.Count, node);
		}

		public void addChild(int index, BTNode node)
		{
			if (childs.Contains (node))
				return;
			if (node.parent != null)
				node.parent.removeChild (node);
			childs.Insert (index, node);
			node.parent = this;
			iterChild = childs.GetEnumerator ();
		}

		public void removeChild(BTNode node)
		{
			childs.Remove (node);
			node.parent = null;
			iterChild = childs.GetEnumerator ();
		}

		protected void moveNext(AICtrl agent)
		{
			if (iterChild.MoveNext ()) {
				var currentChild = iterChild.Current;
				currentChild.state = BTNode.State.PENDING;
				checkPendingSole (currentChild);
				currentChild.execute (agent);
			} else {
				moveEnd (agent);
			}
		}

		[System.Diagnostics.Conditional("UNITY_EDITOR")]
		protected void checkPendingSole(BTNode curChild)
		{
			for (int i = 0; i < childs.Count; i++) {
				if (childs [i].Equals (curChild))
					continue;
				if (childs [i].state == BTNode.State.PENDING)
					Debug.LogError ("childs[i].state == BTNode.State.Pending");
			}
		}

		public override void PendingCheck(AICtrl agent)
		{
			for (int i = 0; i < childs.Count; i++) {
				BTNode child = childs [i];
				if (child.state == BTNode.State.PENDING) {
					child.PendingCheck (agent);
					break;
				}
			}
		}

		public void tryMoveNext(AICtrl agent, State stat)
		{
			bool pass = checkState (agent, stat);
			if (pass) {
				if (agent.enabled)
					moveNext (agent);
				else
					this.finish (agent, State.FAIL);
			}
		}

		public sealed override void execute(AICtrl agent)
		{
			if (_isFirstExe) {
				_isFirstExe = false;
				beforFirstExecute (agent);
			}
			iterChild = childs.GetEnumerator ();
			moveNext (agent);
		}

		protected virtual void beforFirstExecute(AICtrl agent)
		{}

		protected virtual bool checkState(AICtrl agent, State stat)
		{
			return false;
		}

		protected virtual void moveEnd(AICtrl agent)
		{
			
		}

		public static ComponentNode operator + (ComponentNode lhs, BTNode rhs)
		{
			lhs.addChild (rhs);
			return lhs;
		}
	}

	//序列节点，有一个子节点返回false时返回false，否则返回true
	public class SequenceNode : ComponentNode
	{
		public string tips = "顺序节点";
		public bool isTrue = false;
		public string param = "[]";
		public new void SequenceNodeInit(bool isTrue, string param)
		{
			this.isTrue = isTrue;
			this.param = param;
		}

		protected override bool checkState(AICtrl agent, State stat)
		{
			if (stat == BTNode.State.FAIL) {
				finish (agent, State.FAIL);
				return false;
			}
			return true;
		}

		public override string GetNodeName()
		{
			Type type = this.GetType ();
			if (type == typeof(BT.SequenceNode))
				return "顺  序";
			return base.GetNodeName ();
		}

		protected override void moveEnd(AICtrl agent)
		{
			finish (agent, State.FINISH);
		}
	}

	// 选择节点，当有子节点返回true时就返回true，否则返回false
	public class SelectorNode : ComponentNode
	{
		public string tips = "选择节点";
		protected override bool checkState(AICtrl agent, State stat)
		{
			if (stat == BTNode.State.FINISH) {
				finish (agent, State.FINISH);
				return false;
			}
			return true;
		}

		public override string GetNodeName()
		{
			Type type = this.GetType ();
			if (type == typeof(BT.SelectorNode))
				return "选  择";
			return base.GetNodeName ();
		}

		protected override void moveEnd(AICtrl agent)
		{
			finish (agent, State.FAIL);
		}

		public static SelectorNode operator + (SelectorNode lhs, BTNode rhs)
		{
			lhs.addChild (rhs);
			return lhs;
		}
	}

	// 行为节点基类
	public class BehaviorNode : BTNode
	{
		
	}

	// 条件节点，根据判断条件返回
	public class ConditionNode : BehaviorNode
	{
		public bool isTrue = true;
		public ConditionNode()
		{
		}

		public override void PendingCheck(AICtrl agent)
		{}

		public sealed override void execute(AICtrl agent)
		{
			bool conditionPass = condition (agent);
			if (conditionPass == isTrue)
				finish (agent, State.FINISH);
			else
				finish (agent, State.FAIL);
		}

		public virtual bool condition(AICtrl agent)
		{
			return false;
		}
	}

	//执行节点，执行完毕返回结果
	public class ActionNode : BehaviorNode
	{
		public override void execute(AICtrl agent)
		{
			finish (agent, State.PENDING);
		}
	}
}

