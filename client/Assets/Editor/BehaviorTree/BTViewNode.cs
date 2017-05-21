using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BTViewNode : EditorTreeNode {

	public enum NodeStatus {NORMAL, ROOT, EDITING};
	public NodeStatus nodeStatus = NodeStatus.NORMAL;

	public BT.BTNode proxy;
	bool hightlisht = false;
	public BTNodeBuilder buildInfo;

	public BTViewNode()
	{
		this.buildInfo = new BTNodeBuilder ();
		hightlisht = false;
		nodeStatus = NodeStatus.NORMAL;
	}

	public BTViewNode(params object[] lstArg)
	{
		this.buildInfo = new BTNodeBuilder ();
//		this.buildInfo.setArgs (lstArg);
//		this.proxy = (BT.BTNode)buildInfo.build ();
	}

	//计算每个节点大小
	public override void calcSize()
	{
		float textLength = ToString ().Length * 7.2f;
		if (textLength > 250)
			textLength = 250;
		this.rect.width = Mathf.Max (100, textLength);
		this.rect.height = 22f;
	}

	//更新节点
	public override void refreshChild()
	{
		if (this.proxy is BT.ComponentNode) {
			var compNode = this.proxy as BT.ComponentNode;
			if (compNode._needRrawChilds)
				this.formatByDataNode (this.proxy);
		}
	}

	//画每个节点的内部结构，3个矩形，设置节点颜色
	public override void draw()
	{
		Rect rect = this.rect;
		if (this.proxy is BT.ComponentNode || this.proxy is BT.SelectorNode || this.proxy is BT.SequenceNode)
			GUI.color = new Color (0, 73, 133);
		else if (this.proxy is BT.ActionNode)
			GUI.color = ColorUtil.HexToColor (0xFF0B0BFF);
		else if (this.proxy is BT.ConditionNode)
			GUI.color = new Color (255, 121, 0);

		var infoRect = new Rect (rect);
		infoRect.y = rect.y;
		infoRect.height = 22f;
		GUI.Box (infoRect, GetIntroduce());
	}

	string GetIntroduce()
	{
		if (this.proxy != null) {
			Type type = this.proxy.GetType ();
			string typeName = type.Name;
			string info = type.GetField ("tips").GetValue (Activator.CreateInstance (type)).ToString () + typeName;
			return info;
		}
		return null;
	}

	public void formatByDataNode(BT.BTNode dataNode)
	{
		
	}
}

public class BTViewCtrl : EditorTreeCtrl<BTViewNode>
{

}
