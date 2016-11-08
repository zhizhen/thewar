using System;
using System.Collections.Generic;
using UnityEngine;

namespace Engine
{
    public class Bullet : SkillObj<Bullet>, IzCollider
    {
        private GameObject _gameObject;
        private Transform _transform;
        private BoxCollider _collider;

        private bool _isSync;
        private int _skillId;
        private float _range;
        private float _speed;
        private float _time;
        private float _aoeTick;
        private Vector3 _beginPos;
        private Vector3 _beginDir;
        private Vector3 _endPos;
        private Vector3 _pos;
        private Vector3 _dir;
        private float _disMoved;
        private float _disTotal;
        private SkillEventBullet _bulletEvt;

        public void Active(SkillEventBullet evt, float deltaTime = 0)
        {
            Debug.Log("bullet active");
            _bulletEvt = evt;
            ActivePath(deltaTime);
        }

        public void ActivePath(float deltaTime)
        {
            switch (_bulletEvt.pathType)
            {
                case SKILL_BULLET_PATH_TYPE.直线:
                    ActivePath_Line(deltaTime);
                    break;
            }
        }

        private void ActivePath_Line(float deltaTime)
        {
            _disMoved = 0f;
            _disTotal = _range;
            _time = deltaTime;
            LoadBullet(_bulletEvt.bulletId.ToString());
            //UpdatePath_Line(deltaTime);
        }

        private void DefaultBullet()
        {
            if (_gameObject != null) return;
            _gameObject = GameObject.CreatePrimitive(PrimitiveType.Cube);
            _gameObject.name = "defaultBullet";
            _gameObject.layer = LayerName.iEffectLayer;
            _transform = _gameObject.transform;
            _transform.localScale = Vector3.one * 1.0f;
            _transform.localPosition = _pos;
            _transform.forward = _dir;
            _collider = _gameObject.GetComponent<BoxCollider>();
            if (ISNeedBoxCollider())
            {
                _collider.enabled = true;
                _collider.size.Set(_bulletEvt.size.x, _bulletEvt.size.y, _bulletEvt.size.z);
                _collider.center.Set(0, 0, 0);
                _collider.enabled = true;
                _collider.isTrigger = true;
                Rigidbody rigidbody = _gameObject.AddComponent<Rigidbody>();
                rigidbody.useGravity = false;
                rigidbody.angularDrag = 0.0f;
                rigidbody.drag = 0.0f;
                rigidbody.mass = 0.0000001f;
                rigidbody.isKinematic = true;
            }
            else
                _collider.isTrigger = false;
        }

        private void LoadBullet(string bulletId)
        {
            DefaultBullet();
        }

        private bool ISNeedBoxCollider()
        {
            return SKILL_BULLET_PATH_TYPE.射线 != _bulletEvt.pathType &&
                SKILL_BULLET_PATH_TYPE.直接命中 != _bulletEvt.pathType &&
                SKILL_BULLET_TYPE.普通 == _bulletEvt.bulletType &&
                _bulletEvt.ignoreCollision == false;
        }

        public void OnCollisionEnter(Collision kCol)
        {
            throw new NotImplementedException();
        }

        public void OnControllerColliderHit(ControllerColliderHit hit)
        {
            throw new NotImplementedException();
        }

        public void OnTriggerEnter(Collider kOther)
        {
            throw new NotImplementedException();
        }

        public void OnTriggerExit(Collider kOther)
        {
            throw new NotImplementedException();
        }

        public void OnTriggerStay(Collider kOther)
        {
            throw new NotImplementedException();
        }
    }
}