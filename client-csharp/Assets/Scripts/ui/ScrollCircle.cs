using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using Engine;

public class ScrollCircle : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IDragHandler
{
	public float JoyStickRadius=50f;
	public float JoyStickResetSpeed = 5.0f;
	private RectTransform selfTransform;
	private bool isTouched = false;
	private Vector2 originPosition;
	private Vector2 touchedAxis;
	public GameObject bg;
	public Vector2 TouchedAxis
	{
		get
		{
			if (touchedAxis.magnitude < JoyStickRadius)
				return touchedAxis.normalized / JoyStickRadius;
			return touchedAxis.normalized;
		}
	}

	void Start ()
	{
		//初始化虚拟摇杆的默认方向
		selfTransform = this.GetComponent<RectTransform>();
		originPosition = selfTransform.anchoredPosition;
		bg = BattlePanelView.Instance.view.transform.FindChild ("bg").gameObject;
		Debug.Log ("originposition :" + originPosition);
	}

	public void OnPointerDown(PointerEventData eventData)
	{
		isTouched = true;
		bg.SetActive (true);
		EntityMainRole.Instance.transform.FindChild ("skillbg").gameObject.SetActive(true);
		EntityMainRole.Instance.transform.FindChild ("skillarray").gameObject.SetActive(true);
		Debug.Log ("On Begin Drag :" + TouchedAxis);
	}

	public void OnDrag (PointerEventData eventData)
	{
		touchedAxis = GetJoyStickAxis(eventData);
		Vector3 s = new Vector3 (90f, touchedAxis.y, touchedAxis.x);
		EntityMainRole.Instance.transform.FindChild ("skillarray").gameObject.transform.localRotation = Quaternion.Euler(s);
    }

	public void OnPointerUp(PointerEventData eventData)
	{
		isTouched = false;
		bg.SetActive (false);
		EntityMainRole.Instance.transform.FindChild ("skillbg").gameObject.SetActive(false);
		EntityMainRole.Instance.transform.FindChild ("skillarray").gameObject.SetActive(false);
		Debug.Log ("On End Drag!" + touchedAxis.normalized);
		selfTransform.anchoredPosition = originPosition;
		EntityMainRole.Instance.RoleUseSkill(1, new Vector3(touchedAxis.normalized.x, 0, touchedAxis.normalized.y));
		touchedAxis = Vector2.zero;
	}

	void Update()
	{
		//松开虚拟摇杆后让虚拟摇杆回到默认位置
		if(selfTransform.anchoredPosition.magnitude > originPosition.magnitude)
			selfTransform.anchoredPosition -= TouchedAxis * Time.deltaTime * JoyStickResetSpeed;
	}

	private Vector2 GetJoyStickAxis(PointerEventData eventData)
	{
		Vector3 worldPosition;
		if (RectTransformUtility.ScreenPointToWorldPointInRectangle (selfTransform, eventData.position, eventData.pressEventCamera, out worldPosition))
			selfTransform.position = worldPosition;

		Vector2 touchAxis = selfTransform.anchoredPosition - originPosition;

		if (touchAxis.magnitude >= JoyStickRadius) 
		{
			touchAxis = touchAxis.normalized * JoyStickRadius;
			selfTransform.anchoredPosition = originPosition + touchAxis;
		}
		return touchAxis;
	}
}