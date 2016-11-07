using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainCamera : MonoBehaviourExt
{
    private EntityBase m_FollowTarget;

    static List<Transform> mTargets = new List<Transform>();
    static MainCamera mInstance = null;
    static public Vector3 direction = Vector3.forward;
    static public Vector3 flatDirection = Vector3.forward;

    public float interpolationTime = 0.25f;

    Transform mTrans;
    Vector3 mPos;
    Quaternion mRot;
    public Camera camera { get; set; }
    public Vector3 position { get { return transform.position; } set { transform.position = value; } }

    /// <summary>
    /// Target the camera is following.
    /// </summary>

    public Transform target
    {
        get
        {
            return (mTargets.Count == 0) ? null : mTargets[mTargets.Count - 1];
        }
        set
        {
            mTargets.Clear();
            if (value != null) mTargets.Add(value);
        }
    }

    /// <summary>
    /// Add a new target to the top of the list.
    /// </summary>

    public static void AddTarget(Transform t)
    {
        if (t != null)
        {
            mTargets.Remove(t);
            mTargets.Add(t);
        }
    }

    /// <summary>
    /// Remove the specified target from the list.
    /// </summary>

    public static void RemoveTarget(Transform t)
    {
        if (t != null)
        {
            mTargets.Remove(t);
        }
    }

    /// <summary>
    /// Detach the camera from the current parent.
    /// </summary>

    public void DetachFromParent()
    {
        if (mInstance != null && mInstance.mTrans.parent != null)
        {
            mInstance.mTrans.parent = null;
        }
    }

    /// <summary>
    /// Detach the camera from the specified parent.
    /// </summary>

    public bool DetachFromParent(Transform t)
    {
        if (mInstance != null && Tools.IsChild(t, mInstance.mTrans))
        {
            mInstance.mTrans.parent = null;
            return true;
        }
        return false;
    }

    /// <summary>
    /// Keep a singleton reference.
    /// </summary>

    void Awake() { mInstance = this; }
    void OnDestroy() { mInstance = null; }

    /// <summary>
    /// Cache the transform.
    /// </summary>

    void Start() { mTrans = transform; }

    /// <summary>
    /// Interpolate the position.
    /// </summary>

    void LateUpdate()
    {
        Transform t = target;

        if (t == null)
        {
            mTrans.parent = null;
        }
        else
        {
            // Interpolation finished -- parent the camera to the target and assume its orientation
            mTrans.parent = t;
            mTrans.position = t.position;
            mTrans.rotation = t.rotation;

        }

        // Update the directional and flat directional vectors
        direction = mTrans.rotation * Vector3.forward;
        flatDirection = direction;
        flatDirection.y = 0f;
        flatDirection.Normalize();
    }

    public void SetCamera(Camera kCamera)
    {
        camera = kCamera;
    }
}