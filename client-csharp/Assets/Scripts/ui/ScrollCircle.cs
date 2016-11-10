using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using Engine;

public class ScrollCircle :ScrollRect, IBeginDragHandler, IEndDragHandler
{
	protected float mRadius=0f;

	protected override void Start()
	{
		base.Start();
		//计算摇杆块的半径
		mRadius = (transform as RectTransform).sizeDelta.x * 0.5f;
	}

	public void OnBeginDrag(PointerEventData eventData){

		Debug.Log ("On Begin Drag!");
	}

	public override void OnDrag (UnityEngine.EventSystems.PointerEventData eventData)
	{
		Debug.Log ("On Drag!");
		base.OnDrag (eventData);
		var contentPostion = this.content.anchoredPosition;
		if (contentPostion.magnitude > mRadius){
			contentPostion = contentPostion.normalized * mRadius ;
			SetContentAnchoredPosition(contentPostion);
		}
	}

	public void OnEndDrag(PointerEventData eventData){

		Debug.Log ("On End Drag!");
	}
}