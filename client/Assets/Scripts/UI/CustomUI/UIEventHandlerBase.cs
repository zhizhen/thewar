using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UIExtend;

public class UIEventHandlerBase : MonoBehaviour,
	IPointerEnterHandler,
	IPointerExitHandler,
	IPointerDownHandler,
	IPointerUpHandler,
	IPointerClickHandler,
	IBeginDragHandler,
	IDragHandler,
	IEndDragHandler,
	IDropHandler,
	IScrollHandler,
	IUpdateSelectedHandler,
	IDeselectHandler,
	IMoveHandler,
	ISubmitHandler,
	ICancelHandler
{
	public Action<GameObject, PointerEventData> onPointerEnter;
	public Action<GameObject, PointerEventData> onPointerExit;
	public Action<GameObject, PointerEventData> onPointerDown;
	public Action<GameObject, PointerEventData> onPointerUp;
	public Action<GameObject, PointerEventData> onPointerClick;
	public Action<GameObject> onPointerPressClick;  //长按事件
	public Action<GameObject, PointerEventData> onBeginDrag;
	public Action<GameObject, PointerEventData> onDrag;
	public Action<GameObject, PointerEventData> onEndDrag;
	public Action<GameObject, PointerEventData> onDrop;
	public Action<GameObject, PointerEventData> onScroll;
	public Action<GameObject, BaseEventData> onUpdateSelected;
	public Action<GameObject, BaseEventData> onDeselect;
	public Action<GameObject, AxisEventData> onMove;
	public Action<GameObject, BaseEventData> onSubmit;
	public Action<GameObject, BaseEventData> onCancel;

	public static Action<GameObject, string> onClickSound;
	public static Action<GameObject> onClickNewbie;
	public string soundId;
	private float m_interval = 0.1f;
	private bool m_isPress = false;
	private float m_lastInvokeTime = 0.0f;
	private GameObject m_currentBePressButton;

	
	// Update is called once per frame
	void Update () {
		if (m_isPress) {
			if (Time.time - m_lastInvokeTime >= m_interval) {
				if (onPointerPressClick != null) {
					onPointerPressClick (m_currentBePressButton);
				}
				m_lastInvokeTime = Time.time;
			}
		}
	}

	public void OnPointerEnter(PointerEventData eventData)
	{
		if (onPointerEnter != null)
			onPointerEnter.Invoke (gameObject, eventData);
	}

	public void OnPointerExit(PointerEventData eventData)
	{
		m_isPress = false;
		m_currentBePressButton = null;
		if (onPointerExit != null)
			onPointerExit (gameObject, eventData);
	}

	public void OnPointerDown(PointerEventData eventData)
	{
		m_currentBePressButton = gameObject;
		m_isPress = true;
		if (onPointerDown != null)
			onPointerDown.Invoke (gameObject, eventData);
	}

	public void OnPointerUp(PointerEventData eventData)
	{
		m_isPress = false;
		m_currentBePressButton = null;
		if (onPointerUp != null)
			onPointerUp.Invoke (gameObject, eventData);
	}

	public virtual void OnPointerClick(PointerEventData eventData)
	{
		PlaySound (gameObject, soundId);
		CloseNewbie (gameObject);
		if (onPointerClick != null)
			onPointerClick.Invoke (gameObject, eventData);
	}

	public void OnBeginDrag(PointerEventData eventData)
	{
		if (onBeginDrag != null)
			onBeginDrag.Invoke (gameObject, eventData);
	}

	public void OnDrag(PointerEventData eventData)
	{
		if (onDrag != null)
			onDrag.Invoke (gameObject, eventData);
	}

	public void OnEndDrag(PointerEventData eventData)
	{
		if (onEndDrag != null)
			onEndDrag.Invoke (gameObject, eventData);
	}

	public void OnDrop(PointerEventData eventData)
	{
		if (onDrop != null)
			onDrop.Invoke (gameObject, eventData);
	}

	public void OnScroll(PointerEventData eventData)
	{
		if (onScroll != null)
			onScroll.Invoke (gameObject, eventData);
	}

	public void OnUpdateSelected(BaseEventData eventData)
	{
		if (onUpdateSelected != null)
			onUpdateSelected.Invoke (gameObject, eventData);
	}

	public void OnDeselect(BaseEventData eventData)
	{
		if (onDeselect != null)
			onDeselect.Invoke (gameObject, eventData);
	}

	public void OnMove(AxisEventData eventData)
	{
		if (onMove != null)
			onMove.Invoke (gameObject, eventData);
	}

	public void OnSubmit(BaseEventData eventData)
	{
		if (onSubmit != null)
			onSubmit.Invoke (gameObject, eventData);
	}

	public void OnCancel(BaseEventData eventData)
	{
		if (onCancel != null)
			onCancel.Invoke (gameObject, eventData);
	}

	protected static void PlaySound(GameObject gameObject, string soundId)
	{
		if (onClickSound != null)
			onClickSound.Invoke (gameObject, soundId);
	}

	protected static void CloseNewbie(GameObject gameObject)
	{
		if (onClickNewbie != null)
			onClickNewbie.Invoke (gameObject);
	}


	public static void AddListener(GameObject target, UIEventType type, Action<GameObject, BaseEventData> func, string soundId = null)
	{
		UIEventHandlerBase handler = target.GetComponent<UIEventHandlerBase> ();
		if (handler == null)
			handler = target.AddComponent<UIEventHandlerBase> ();
		if (!string.IsNullOrEmpty (soundId))
			handler.soundId = soundId;
		switch (type) {
		case UIEventType.ON_POINTER_ENTER:
			handler.onPointerEnter += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_POINTER_EXIT:
			handler.onPointerExit += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_POINTER_DOWN:
			handler.onPointerDown += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_POINTER_UP:
			handler.onPointerUp += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_POINTER_CLICK:
			handler.onPointerClick += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_BEGIN_DRAG:
			handler.onBeginDrag += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_END_DRAG:
			handler.onEndDrag += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		
		case UIEventType.ON_SCROLL:
			handler.onScroll += delegate(GameObject o, PointerEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_UPDATE_SELECTED:
			handler.onUpdateSelected += delegate(GameObject o, BaseEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_DESELECT:
			handler.onDeselect += delegate(GameObject o, BaseEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_MOVE:
			handler.onMove += delegate(GameObject o, AxisEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_SUBMIT:
			handler.onSubmit += delegate(GameObject o, BaseEventData evtData) {
				func (o, evtData);
			};
			break;
		case UIEventType.ON_CANCEL:
			handler.onCancel += delegate(GameObject o, BaseEventData evtData) {
				func (o, evtData);
			};
			break;
		default:
			break;
		}
	}
}
