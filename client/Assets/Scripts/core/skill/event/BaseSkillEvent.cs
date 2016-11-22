using UnityEngine;
using System.Collections.Generic;
using System.IO;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Engine
{
    public class BaseSkillEvent
    {
        public SkillInfo skillInfo;
        public BaseSkillEvent parent;
        public int layer = 0;
        public string key = "";
        public SKILL_EVENT_TYPE eventType = SKILL_EVENT_TYPE.动作;
        public float time = 0f;
        public int times = 1;
        public float interval = 0f;
        public float actionTime = 0f;
        public List<BaseSkillEvent> childrenEvents = new List<BaseSkillEvent>();

#if UNITY_EDITOR
        public static readonly int MAX_LAYER = 4;
        public static readonly float WIDTH = 300;
        public static readonly float WIDTH_LEVEL = 20;
        public static readonly float WIDTH_GROW = 17;
        public static object editorItemData;
        public static bool isEditorItem;
        public SKILL_EVENT_TYPE lastType = 0;

        public void DrawUI()
        {
            EditorGUILayout.BeginVertical(GUILayout.Width(WIDTH));
            GUILayout.Space(layer * 10);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.BeginVertical(GUILayout.Width(WIDTH));
            key = GetKey();
            GUILayout.Box(eventType + ":layer= " + layer + ",key= " + key, GUILayout.ExpandWidth(true));
            eventType = (SKILL_EVENT_TYPE)EditorGUILayout.EnumPopup("类型", eventType);
            time = EditorGUILayout.FloatField("触发时间", time);
            times = EditorGUILayout.IntField("执行次数", times);
            interval = EditorGUILayout.FloatField("执行间隔", interval);
            actionTime = EditorGUILayout.FloatField("动作时间", actionTime);
            DrawTypeUI();
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.MaxWidth(WIDTH_LEVEL));
            if (GUILayout.Button("X"))
                DeleteEvent();
            if (GUILayout.Button("+"))
                AddChildEvent();
            if (GUILayout.Button("←"))
                LayerLeftEvent();
            if (GUILayout.Button("→"))
                LayerRightEvent();
            if (GUILayout.Button("↑"))
                LayerUpEvent();
            if (GUILayout.Button("↓"))
                LayerDownEvent();
            if (GUILayout.Button("C"))
                CopyEvent();
            EditorGUILayout.EndVertical();

            for (int i = 0; i < childrenEvents.Count; ++i)
            {
                childrenEvents[i].DrawUI();
            }

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.EndVertical();

            RefreshType();
        }

        private void DeleteEvent()
        {
            GetParentChildrenEventList().Remove(this);
            childrenEvents.Clear();
            parent = null;
            skillInfo = null;
        }

        private void AddChildEvent()
        {
            if (this.layer >= MAX_LAYER) return;
            SkillUtils.InstanceEvent(SKILL_EVENT_TYPE.动作, skillInfo, this, layer + 1, 0);
        }

        private void LayerLeftEvent()
        {
            List<BaseSkillEvent> parentChildrenEventList = GetParentChildrenEventList();
            int index = parentChildrenEventList.IndexOf(this);
            if (index >0)
            {
                parentChildrenEventList.Remove(this);
                parentChildrenEventList.Insert(index - 1, this);
            }
        }

        private void LayerRightEvent()
        {
            List<BaseSkillEvent> parentChildrenEventList = GetParentChildrenEventList();
            int index = parentChildrenEventList.IndexOf(this);
            if (index < parentChildrenEventList.Count - 1)
            {
                parentChildrenEventList.Remove(this);
                parentChildrenEventList.Insert(index + 1, this);
            }
        }

        private void LayerUpEvent()
        {
            if (parent == null) return;
            List<BaseSkillEvent> ppChildrenEventList = parent.GetParentChildrenEventList();
            int index = ppChildrenEventList.IndexOf(parent);
            this.parent.childrenEvents.Remove(this);
            ppChildrenEventList.Insert(index + 1, this);
            this.parent = parent.parent;
            ChangeLayer(-1);
        }

        private void LayerDownEvent()
        {
            if (this.GetMaxLayer() >= MAX_LAYER) return;
            List<BaseSkillEvent> parentChildrenEventList = GetParentChildrenEventList();
            int index = parentChildrenEventList.IndexOf(parent);
            BaseSkillEvent be = SkillUtils.InstanceEvent(SKILL_EVENT_TYPE.动作, skillInfo, parent, layer, index);
            parentChildrenEventList.Remove(this);
            be.childrenEvents.Add(this);
            this.parent = be;
            ChangeLayer(1);
        }

        private void CopyEvent()
        {
            MemoryStream ms = new MemoryStream();
            BinaryWriter bw = new BinaryWriter(ms);
            Serialize(bw);
            bw.Close();
            ms.Close();
            byte[] bytes = ms.GetBuffer();
            bw = null;
            ms = null;

            ms = new MemoryStream(bytes);
            BinaryReader br = new BinaryReader(ms);
            List<BaseSkillEvent> parentChildrenEventList = GetParentChildrenEventList();
            int index = parentChildrenEventList.IndexOf(this);
            BaseSkillEvent bse = SkillUtils.InstSkillEvent(br, skillInfo, this.parent, layer, index + 1);
            bse.Deserialize(br);
            br.Close();
            br = null;
        }

        private void ChangeLayer(int value)
        {
            layer = layer + value;
            for (int i = 0; i < childrenEvents.Count; ++i)
            {
                BaseSkillEvent be = childrenEvents[i];
                be.ChangeLayer(value);
            }
        }

        public int GetMaxLayer()
        {
            int layer = this.layer;
            if (childrenEvents.Count > 0)
            {
                for (int i = 0; i < childrenEvents.Count; ++i)
                {
                    BaseSkillEvent be = childrenEvents[i];
                    layer = Mathf.Max(layer, be.GetMaxLayer());
                }
            }
            return layer;
        }
        
        private void RefreshType()
        {
            if (lastType != eventType)
            {
                lastType = eventType;
                int index = GetParentChildrenEventList().IndexOf(this);
                BaseSkillEvent nbe = SkillUtils.InstanceEvent(eventType, skillInfo, parent, layer, index);
                for (int i = 0; i < this.childrenEvents.Count; ++i)
                {
                    this.childrenEvents[i].parent = nbe;
                    nbe.childrenEvents.Add(this.childrenEvents[i]);
                }
                DeleteEvent();
            }
        }
#endif

        public string GetKey()
        {
            string key = string.Empty;
            int index = 0;
            if (parent != null)
            {
                index = parent.childrenEvents.IndexOf(this);
                key = string.Concat(parent.GetKey(), ",", index);
            }
            else
            {
                index = skillInfo.eventList.IndexOf(this);
                key = string.Concat(index);
            }
            return key;
        }

        public List<BaseSkillEvent> GetParentChildrenEventList()
        {
            if (parent != null)
                return parent.childrenEvents;
            return skillInfo.eventList;
        }

        public void Serialize(BinaryWriter bw)
        {
            bw.Write((int)eventType);
            bw.Write(time);
            bw.Write(times);
            bw.Write(interval);
            bw.Write(actionTime);
            SerializeType(bw);

            int count = childrenEvents.Count;
            bw.Write(count);
            for (int i = 0; i < count; ++i)
            {
                childrenEvents[i].Serialize(bw);
            }
        }

        protected virtual void SerializeType(BinaryWriter bw)
        {

        }

        public void Deserialize(BinaryReader br)
        {
            DeserializeTYpe(br);
            int count = br.ReadInt32();
            childrenEvents.Clear();
            for (int i = 0; i < count; ++i)
            {
                BaseSkillEvent bse = SkillUtils.InstSkillEvent(br, skillInfo, this, layer + 1, i);
                bse.Deserialize(br);
            }
        }

        protected virtual void DeserializeTYpe(BinaryReader br)
        {

        }

        protected virtual void DrawTypeUI()
        {

        }

    }
}