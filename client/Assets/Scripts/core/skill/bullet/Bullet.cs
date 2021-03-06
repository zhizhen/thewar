﻿using System;
using System.Collections.Generic;
using UnityEngine;

namespace Engine
{
    public class Bullet : SkillObj<Bullet>, IzCollider
    {
        private IzCommonEffect _effect;
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

		public void Active(SkillEventBullet evt, Vector3 beginPos, Vector3 dir, float speed, float deltaTime = 0)
        {
            Debug.Log("bullet active");
            _state = SKILL_OBJ_STATE.ACTIVE;
            _bulletEvt = evt;
            _beginPos = beginPos;
            _beginDir = dir;
            _speed = speed;
            ActivePath(deltaTime);
        }

        public void ActivePath(float deltaTime)
        {
            switch (_bulletEvt.pathType)
            {
                case SKILL_BULLET_PATH_TYPE.直线:
                    ActivePath_Line(deltaTime);
                    break;
                case SKILL_BULLET_PATH_TYPE.抛物线:
                    ActivePath_Parabola(deltaTime);
                    break;
            }
        }

        private void ActivePath_Line(float deltaTime)
        {
            _disMoved = 0f;
            _pos = _beginPos;
            _dir = _beginDir;
            _disTotal = _range;
            _time = deltaTime;
            LoadBullet(_bulletEvt.bulletId.ToString());
            UpdatePath_Line(deltaTime);
        }

        private void ActivePath_Parabola(float deltaTime)
        {

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
            //_transform.forward = _dir;
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
            IzCommonEffect.ON_LOAD_RES_FINISH fnLoadFinish = delegate (IzCommonEffect kEffect, bool bSucceed, object kArg)
            {
                if (bSucceed)
                {
                    if (SKILL_OBJ_STATE.DEACTIVE == _state)
                    {
                        //kEffect.Stop();
                        //kEffect.Release();
                        return;
                    }
                    if (kEffect.m_kGO != null && kEffect.m_kTRS != null)
                    {
                        SetBullet(kEffect);
                        //kEffect.Play();
                    }
                    else
                        Debug.LogError("子弹资源加载出错：" + bulletId);
                }
            };
            EffectMgr.Instance.CreateEffect(bulletId).LoadResByType(fnLoadFinish);
            DefaultBullet();
        }

        private void SetBullet(IzCommonEffect effect)
        {
            if (effect.m_kGO == null || effect.m_kTRS == null) return;
            if (_gameObject != null)
            {
                GameObjectExt.Destroy(_gameObject);
            }
            _effect = effect;
            _gameObject = _effect.m_kGO;
            _gameObject.name = "defaultBullet";
            _transform = _effect.m_kTRS;
            _transform.localPosition = _pos;
            //_transform.forward = _dir;
            //_gameObject.SetActive(false);
        }

        public override void Update(float elapseTime)
        {
            if (SKILL_OBJ_STATE.DEACTIVE == _state) return;
            if (_time == 0) _gameObject.SetActive(true);
            _time += elapseTime;
            _aoeTick += elapseTime;

            switch (_bulletEvt.pathType)
            {
                case SKILL_BULLET_PATH_TYPE.直线:
                    UpdatePath_Line(elapseTime);
                    break;
            }
            //if (SKILL_BULLET_TYPE.AOE == _bulletEvt.bulletType && _aoeTick >= _bulletEvt.aoeInterval)
            //{
            //    _aoeTick = 0;
            //    AOETrigger();
            //}
        }

        private void UpdatePath_Line(float elapseTime)
        {
            float oldSpeed = _speed;
            CalculateSpeed(ref _speed, elapseTime);
            float step = (oldSpeed + _speed) * elapseTime / 2f;
			if (step != 0f) {
				Vector3 dir = new Vector3 ();
                dir = _dir * step;
				_transform.Translate (dir);
			}
            _pos = _transform.position;
            _disMoved += step;
        }

        private void CalculateSpeed(ref float speed, float elapseTime)
        {
            for (int i = 0; i < _bulletEvt.listAccel.Count; ++i)
            {
                BulletAccelPathData data = _bulletEvt.listAccel[i];
                if (_time >= data.beginTime && _time < data.endTime)
                    speed += elapseTime * data.accel;
            }
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