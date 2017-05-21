using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEditor;
using UnityEngine;

public class EditorTreeNode {

	const float gapX = 40f;
	const float gapY = 15f;

	static int nextSn = 0;
	public int sn;
	public List<EditorTreeNode> childs;
	public Dictionary<int, EditorTreeNode> mapSnChilds;
	public EditorTreeNode parent;
	public Rect rect;
	public int index; //在兄弟中排第几
	int _deep;

	public int deep
	{
		set 
		{
			_deep = value;
			foreach (var child in childs) {
				child.deep = value + 1;
			}
		}
		get { return _deep;}
	}

	public Vector2 pos
	{
		get{ return rect.center;}
		set{ rect.center = value;}
	}

	public EditorTreeNode()
	{
		this.sn = ++nextSn;
		this.rect = new Rect (0f, 0f, 20f, 20f);
		this.childs = new List<EditorTreeNode> ();
		this.mapSnChilds = new Dictionary<int, EditorTreeNode> ();
		this.deep = 0;
		this.index = 0;
	}

	public virtual EditorTreeNode add(int index, EditorTreeNode node)
	{
		this.childs.Insert (index, node);
		this.mapSnChilds.Add (node.sn, node);
		node.deep = this.deep + 1;
		node.parent = this;
		node.index = index;
		//如果是插入操作，更新后面兄弟节点的索引
		for (int i = index + 1; i < this.childs.Count; ++i) {
			this.childs [i].index = i;
		}
		return node;
	}

	public virtual EditorTreeNode add(EditorTreeNode node)
	{
		int index = childs.Count;
		return add (index, node);
	}

	public virtual void remove(int sn)
	{
		var node = this.mapSnChilds [sn];
		this.childs.Remove (node);
		this.mapSnChilds.Remove (sn);
		for (int i = node.index; i < this.childs.Count; ++i) {
			this.childs [i].index = i;
		}
	}

	public virtual void calcSize()
	{
		rect.width = 30f;
		rect.height = 30f;
	}

	public virtual void refreshChild()
	{
	}

	//单个节点的绘制
	public virtual void draw()
	{
		GUI.Box (this.rect, this.sn.ToString());
	}

	//节点与节点之间连线
	public void drawLineToParent(bool isInDragingBranch, bool isDragingSelf, float dragOffsetX, float offsetX)
	{
		if (parent == null)
			return;
		Handles.BeginGUI ();
		Vector3 startPosition = new Vector3 (this.parent.rect.xMax, this.parent.pos.y, 0f);
		Vector3 endPosition = new Vector3 (this.rect.x, this.pos.y, 0f);
		Vector3 startTangent = new Vector3 (offsetX - gapX * 0.5f, this.parent.pos.y, 0f);//设置连线开始的位置
//		if (isInDragingBranch)
//			startTangent += dragOffsetX;
		Vector3 endTangent = new Vector3 (this.rect.x - gapX * 0.5f, this.pos.y, 0f);
		Color lineColor = GetLineColor (isDragingSelf);
		Handles.DrawBezier (startPosition, endPosition, startTangent, endTangent, lineColor, null, 2f);
		Handles.EndGUI ();
	}

	protected virtual Color GetLineColor(bool isDragingSelf)
	{
		Color lineColor = Color.white;
		if (isDragingSelf) {
			lineColor = Color.red;
			lineColor.a = 0.5f;
		}
		return lineColor;
	}

	public virtual void onClick()
	{
		
	}

	public virtual void onDoubleClick()
	{
		
	}

	public virtual bool canAttach(EditorTreeNode node)
	{
		return true;
	}

	public virtual void onBeginHighlight()
	{}

	public virtual void OnEndHighlight()
	{
	}

	public virtual void reset()
	{
	}
		
}

public class EditorTreeCtrl<NodeT> where NodeT:EditorTreeNode
{
	const float gapX = 40f;
	const float gapY = 15f;

	enum PopupMenuOptions
	{
		AddCdn, //条件节点
		AddAct, //行为节点
		Up,
		Down,
		Del,
		Rep,
		AddSel,
		AddSeq,
	}

	public NodeT rootNode;
	public Rect bound;
	NodeT selectNode;
	NodeT dragingNode;
	NodeT highlightNode;

	public EditorTreeCtrl()
	{
		this.bound = new Rect (0f, 0f, 0f, 0f);
	}

	public void reset()
	{
		rootNode.reset ();
	}

	bool isInDragingBranch(NodeT node)
	{
		if (dragingNode == null)
			return false;

		var iterNode = node;
		while (iterNode != null) {
			if (iterNode == dragingNode)
				return true;
			iterNode = (NodeT)iterNode.parent;
		}
		return false;
	}

	//鼠标事件
	private bool onMouseMessage(NodeT node, bool isSelfDraging)
	{
		if (node.rect.Contains (Event.current.mousePosition) == false)
			return false;
		if (dragingNode != null) //正在拖动
		{
			if (isSelfDraging)
				return false;
			if (node.canAttach (dragingNode)) {
				GUI.color = Color.red;
				if (Event.current.type == EventType.MouseUp && Event.current.button == 0)
					cut (dragingNode, node);
			}
			return true;
		}

		if (Event.current.type == EventType.MouseDown) {
			if (Event.current.button == 1) {
				selectNode = node;
				popupMenu ();
			} else if (Event.current.button == 0) {
				selectNode = node;
				if (Event.current.clickCount == 2)
					node.onDoubleClick ();
			}
		} else if (Event.current.type == EventType.MouseDrag
		           && Event.current.button == 0
		           && selectNode == node
		           && node.parent != null) {
			dragingNode = node;
			selectNode = null;
		} else if (Event.current.type == EventType.MouseUp
		           && Event.current.button == 0) {
			node.onClick ();
		} else {
			if (highlightNode != node) {
				if (highlightNode != null)
					highlightNode.OnEndHighlight ();
				highlightNode = node;
				node.onBeginHighlight ();
			}
		}
		return false;
	}

	//获取子节点数量
	int getMaxChildCount(NodeT root)
	{
		Queue<NodeT> queue = new Queue<NodeT> ();
		queue.Enqueue (root);
		NodeT curNode;
		Dictionary<int, int> deepCount = new Dictionary<int, int> ();
		while (queue.Count > 0) {
			curNode = queue.Dequeue ();
			if (deepCount.ContainsKey (curNode.deep))
				deepCount [curNode.deep]++;
			else
				deepCount [curNode.deep] = 1;

			foreach (var child in curNode.childs)
				queue.Enqueue ((NodeT)child);
		}

		int count = 0;
		foreach (var val in deepCount)
			count = Mathf.Max (val.Value, count);
		return count;
	}

	//绘制整个树形结构
	public void paint()
	{
		if (rootNode == null)
			return;

		Queue<NodeT> queue = new Queue<NodeT> ();
		queue.Enqueue (rootNode);
		NodeT curNode;
		Dictionary<int, float> mapDeepXMax = new Dictionary<int, float> ();
		Dictionary<int, float> mapDeepOffsetY = new Dictionary<int, float> ();
		Dictionary<int, float> mapDeepChildCount = new Dictionary<int, float> ();
		float dragOffsetX = 0f;
		float dragOffsetY = 0f;
		bool needCheckBetweenBrothers = true;
		while (queue.Count > 0) {
			curNode = queue.Dequeue ();
			Color oldColor = GUI.color;
			float offsetX = bound.x;
			float offsetY = bound.y;
			if (mapDeepXMax.ContainsKey (curNode.deep - 1))
				offsetX = mapDeepXMax [curNode.deep - 1] + gapX;
			if (mapDeepOffsetY.ContainsKey (curNode.deep)) {
				offsetY = mapDeepOffsetY [curNode.deep] + gapY;
				offsetY = (curNode.rect.height + gapY) * mapDeepChildCount [curNode.deep];
			}
			curNode.calcSize ();
			Vector2 OrgNodeCenterPos = new Vector2 ();
			OrgNodeCenterPos.x = offsetX + curNode.rect.width * 0.5f;
			OrgNodeCenterPos.y = offsetY + curNode.rect.height * 0.5f;

			bool isInDragingBra = isInDragingBranch (curNode);
			bool isSelfDraging = curNode == dragingNode;
			if (isSelfDraging) {
				curNode.pos = Event.current.mousePosition;
				dragOffsetX = curNode.pos.x - OrgNodeCenterPos.x;
				dragOffsetY = curNode.pos.y - OrgNodeCenterPos.y;
			} else if (isInDragingBra) {
				curNode.pos = new Vector2 (OrgNodeCenterPos.x + dragOffsetX, OrgNodeCenterPos.y + dragOffsetY);
			} else {
				curNode.pos = new Vector2 (OrgNodeCenterPos.x, OrgNodeCenterPos.y);
				this.bound.xMax = Mathf.Max (this.bound.xMax, curNode.rect.xMax);
				this.bound.yMax = Mathf.Max (this.bound.yMax, curNode.rect.yMax);

				if (dragingNode != null && curNode.canAttach (dragingNode))
					GUI.color = Color.green;
			}
			bool isDragOverOn = onMouseMessage (curNode, isSelfDraging);
			if (isDragOverOn && dragingNode != null)
				needCheckBetweenBrothers = false;

			curNode.draw ();
			curNode.drawLineToParent (isInDragingBra, isSelfDraging, dragOffsetX, offsetX);

			offsetX = offsetX + curNode.rect.width;
			offsetY = offsetY + curNode.rect.height;

			float oldOffsetX = bound.x;
			mapDeepXMax.TryGetValue (curNode.deep, out oldOffsetX);
			mapDeepXMax [curNode.deep] = Mathf.Max (oldOffsetX, offsetX);
			mapDeepOffsetY [curNode.deep] = offsetY;
			if (!mapDeepChildCount.ContainsKey (curNode.deep))
				mapDeepChildCount [curNode.deep] = 0;
			mapDeepChildCount [curNode.deep] += getMaxChildCount (curNode);
			curNode.refreshChild ();
			foreach (var child in curNode.childs)
				queue.Enqueue ((NodeT)child);
			GUI.color = oldColor;
		}

		if (dragingNode != null) {
			if (needCheckBetweenBrothers) {
				Rect bound = new Rect (float.MaxValue, float.MaxValue, float.MinValue, float.MinValue);
				int insertIndex = 0;

				foreach (var brother in dragingNode.parent.childs) {
					if (brother == dragingNode)
						continue;
					bound.x = Mathf.Min (bound.x, brother.rect.x);
					bound.y = Mathf.Min (bound.y, brother.rect.y);
					bound.xMax = Mathf.Max (bound.xMax, brother.rect.xMax);
					bound.yMax = Mathf.Max (bound.yMax, brother.rect.yMax);

					if (dragingNode.pos.y > brother.pos.y)
						insertIndex = brother.index + 1;
				}
				if (bound.Contains (dragingNode.pos)) {
					Handles.BeginGUI ();
					const float center = 10f;
					const float offset = 40f;
					Handles.DrawLine (new Vector3 (dragingNode.pos.x - center, dragingNode.pos.y, 0f), new Vector3 (dragingNode.pos.x - center - offset, dragingNode.pos.y - offset, 0f));
					Handles.DrawLine (new Vector3 (dragingNode.pos.x - center, dragingNode.pos.y, 0f), new Vector3 (dragingNode.pos.x - center - offset, dragingNode.pos.y + offset, 0f));
					Handles.DrawLine (new Vector3 (dragingNode.pos.x + center, dragingNode.pos.y, 0f), new Vector3 (dragingNode.pos.x + center + offset, dragingNode.pos.y - offset, 0f));
					Handles.DrawLine (new Vector3 (dragingNode.pos.x + center, dragingNode.pos.y, 0f), new Vector3 (dragingNode.pos.x + center + offset, dragingNode.pos.y + offset, 0f));
					Handles.EndGUI ();

					if (Event.current.type == EventType.MouseUp) {
						dragingNode.parent.remove (dragingNode.sn);
						if (dragingNode.index < insertIndex)
							insertIndex = insertIndex - 1;
						dragingNode.parent.add (insertIndex, dragingNode);
					}
				}
			}
			if (Event.current.type == EventType.MouseUp) {
				dragingNode = null;
			}
		} else {
			if (needCheckBetweenBrothers && highlightNode != null) {
				highlightNode.OnEndHighlight ();
				highlightNode = null;
			}
		}
	}

	// 右击鼠标事件
	protected virtual void popupMenu()
	{
		var menu = new GenericMenu ();
		bool canAdd = isCanAddChild (selectNode);
		if (canAdd) {
			menu.AddItem (new GUIContent ("添加行为子节点"), false, PopupMenuSelect, PopupMenuOptions.AddAct);
			menu.AddItem (new GUIContent ("添加条件子节点"), false, PopupMenuSelect, PopupMenuOptions.AddCdn);
			menu.AddItem (new GUIContent ("添加顺序节点"), false, PopupMenuSelect, PopupMenuOptions.AddSeq);
			menu.AddItem (new GUIContent ("添加选择节点"), false, PopupMenuSelect, PopupMenuOptions.AddSel);
			menu.AddItem (new GUIContent ("替换"), false, PopupMenuSelect, PopupMenuOptions.Rep);
		}

		if (selectNode.parent != null) {
			menu.AddItem (new GUIContent ("上移"), false, PopupMenuSelect, PopupMenuOptions.Up);
			menu.AddItem (new GUIContent ("下移"), false, PopupMenuSelect, PopupMenuOptions.Down);
			menu.AddItem (new GUIContent ("删除"), false, PopupMenuSelect, PopupMenuOptions.Del);
		}
		menu.ShowAsContext ();
	}

	protected virtual bool isCanAddChild(NodeT node)
	{
		return true;
	}

	protected virtual void onAddNode(NodeT parentNode)
	{
	}

	protected virtual void onAddNodeByType(NodeT parentNode, Type typeName)
	{}

	protected virtual void onDelNode(NodeT delNode)
	{
		if (delNode.parent != null)
			delNode.parent.remove (delNode.sn);
	}

	void PopupMenuSelect(object objProperty)
	{
		if (objProperty.GetType () != typeof(PopupMenuOptions))
			return;
		var option = (PopupMenuOptions)objProperty;
		switch (option) {
		case PopupMenuOptions.AddAct:
			onAddNodeByType (selectNode, typeof(BT.ActionNode));
			break;
		case PopupMenuOptions.AddCdn:
			onAddNodeByType (selectNode, typeof(BT.ConditionNode));
			break;
		case PopupMenuOptions.Up:
			{
				int index = selectNode.parent.childs.IndexOf (selectNode);
				if (index > 0) {
					selectNode.parent.remove (selectNode.sn);
					selectNode.parent.add (index - 1, selectNode);
				}
			}
			break;
		case PopupMenuOptions.Down:
			{
				int index = selectNode.parent.childs.IndexOf (selectNode);
				if (index < selectNode.parent.childs.Count - 1) {
					selectNode.parent.remove (selectNode.sn);
					selectNode.parent.add (index + 1, selectNode);
				}
			}
			break;
		case PopupMenuOptions.Rep:
			{
				Type selectType = null;
				BTViewNode node = selectNode as BTViewNode;
				if (node.proxy is BT.SelectorNode)
					selectType = typeof(BT.SequenceNode);
				else if (node.proxy is BT.SequenceNode)
					selectType = typeof(BT.SelectorNode);
				BT.BTNode childDataNode = Activator.CreateInstance (selectType) as BT.BTNode;
				var childViewNode = new BTViewNode ();
				childViewNode.formatByDataNode (childDataNode);

				var parentDataNode = (selectNode.parent as BTViewNode).proxy as BT.ComponentNode;
				parentDataNode.addChild (childDataNode);
				selectNode.parent.add (childViewNode);

				for (int i = 0; i < selectNode.childs.Count; i++) {
					if (selectNode.childs [i].parent == selectNode)
						childViewNode.add (selectNode.childs [i]);
				}
				onDelNode (selectNode);
			}
			break;
		case PopupMenuOptions.AddSel:
			{
				Type selectType = null;
				BTViewNode node = selectNode as BTViewNode;
				selectType = typeof(BT.SelectorNode);

				BT.BTNode childDataNode = Activator.CreateInstance (selectType) as BT.BTNode;
				var childViewNode = new BTViewNode ();
				childViewNode.formatByDataNode (childDataNode);

				var parentDataNode = (selectNode as BTViewNode).proxy as BT.ComponentNode;
				parentDataNode.addChild (childDataNode);
				selectNode.parent.add (childViewNode);
			}
			break;
		case PopupMenuOptions.AddSeq:
			{
				Type selectType = null;
				BTViewNode node = selectNode as BTViewNode;
				selectType = typeof(BT.SequenceNode);

				BT.BTNode childDataNode = Activator.CreateInstance (selectType) as BT.BTNode;
				var childViewNode = new BTViewNode ();
				childViewNode.formatByDataNode (childDataNode);
				var parentDataNode = (selectNode as BTViewNode).proxy as BT.ComponentNode;
				parentDataNode.addChild (childDataNode);
				selectNode.parent.add (childViewNode);
			}
			break;
		case PopupMenuOptions.Del:
			onDelNode (selectNode);
			break;
		}
	}

	void cut(NodeT child, NodeT parent)
	{
		child.parent.remove (child.sn);
		parent.add (child);
	}
}