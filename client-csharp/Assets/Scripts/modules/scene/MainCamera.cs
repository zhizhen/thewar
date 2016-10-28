using System;
using System.Collections;
using UnityEngine;

public class MainCamera : MonoBehaviourExt
{
    public Color BACKGROUD_COLOR = new Color(0.0f, 0.0f, 0.0f, 1.0f);
    public Vector3 m_HeadUp = Vector3.zero;

    private EntityBase m_FollowTarget;

    public Camera camera { get; set; }
    public Transform transform { get { return camera.transform; } }
    public Vector3 position { get { return transform.position; } set { transform.position = value; } }

    public void SetCamera(Camera kCamera)
    {
        camera = kCamera;
        camera.fieldOfView = 7f;
        camera.depth = -1.0f;
    }

    public void LookAt(Vector3 vec3)
    {
        transform.LookAt(vec3);
    }
}