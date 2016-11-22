using System;
using System.Collections.Generic;
using UnityEngine;

public interface IzCollider
{
    void OnTriggerEnter(Collider kOther);
    void OnTriggerStay(Collider kOther);
    void OnTriggerExit(Collider kOther);
    void OnCollisionEnter(Collision kCol);
    void OnControllerColliderHit(ControllerColliderHit hit);
}