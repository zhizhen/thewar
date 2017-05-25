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
//		EntityMainRole.Instance.transform.FindChild ("skillbg").gameObject.SetActive(true);
//		EntityMainRole.Instance.transform.FindChild ("skillarray").gameObject.SetActive(true);
		Debug.Log ("On Begin Drag :" + TouchedAxis);
	}

	public void OnDrag (PointerEventData eventData)
	{
		touchedAxis = GetJoyStickAxis(eventData);
    }

	public void OnPointerUp(PointerEventData eventData)
	{
		isTouched = false;
		bg.SetActive (false);
//		EntityMainRole.Instance.transform.FindChild ("skillbg").gameObject.SetActive(false);
//		EntityMainRole.Instance.transform.FindChild ("skillarray").gameObject.SetActive(false);
		Debug.Log ("On End Drag!" + touchedAxis.normalized);
		selfTransform.anchoredPosition = originPosition;

        Vector3 joystick_dir = new Vector3(touchedAxis.normalized.x, 0, touchedAxis.normalized.y).normalized;
        Vector3 role_normal = EntityMainRole.Instance.transform.forward.normalized;
        

        float role_angle = angle_360(new Vector2(1f, 0f), new Vector2(role_normal.x, role_normal.z));
        float skill_role_angle = angle_360(new Vector2(0f, 1f), new Vector2(joystick_dir.x, joystick_dir.z));
        float world_skill_angle = (role_angle + skill_role_angle) % 360;
        Vector3 world_skill_dir = new Vector3(Mathf.Cos(world_skill_angle * Mathf.PI / 180), 0f, Mathf.Sin(world_skill_angle * Mathf.PI / 180));

        
//        EntityMainRole.Instance.RoleUseSkill(1, world_skill_dir.normalized);

        touchedAxis = Vector2.zero;
//
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

    private float angle_360(Vector2 from, Vector2 to)
    {
        Vector3 v3 = new Vector3();
        Vector3 v3_from = new Vector3(from.x, from.y, 0);
        Vector3 v3_to = new Vector3(to.x, to.y, 0);
        v3=Vector3.Cross(v3_from, v3_to);
        if(v3.z >= 0)
        {
            return Vector2.Angle(from, to); 
        }
        else
        {
            return 360 - Vector2.Angle(from, to);
        }
    }
}