using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.UI;

namespace GAMEUI
{
    public class TextWrapper : Text, ISerializationCallbackReceiver
    {
        public static Func<string, Font> GetFont;
        public static Func<int, string> GetLanguage;

        public int langId = 0;
        public string fontKey;

        protected override void OnEnable()
        {
            if(font == null && string.IsNullOrEmpty(fontKey) == false)
            {
                if (GetFont != null) { font = GetFont(fontKey); }
            }
            base.OnEnable();
        }

        public void OnAfterDeserialize()
        {
            if (GetLanguage != null && this.langId != 0)
            {
                this.text = GetLanguage(this.langId);
            }
        }

        public void SetTextAlignment(int anchor)
        {
            alignment = (TextAnchor)anchor;
        }

        public void AdjustTextRect(bool isAutoAdjustPos = true)
        {
            var width = preferredWidth;
            var tran = gameObject.GetComponent<RectTransform>();
            if (tran != null)
            {
                var oldW = tran.sizeDelta.x;
                var height = tran.sizeDelta.y;
                tran.sizeDelta = new Vector2(width, height);
                if (isAutoAdjustPos && Math.Abs(oldW - width) > 0.0001)
                {
                    var pos = tran.localPosition;
                    pos.x = pos.x - (width - oldW) / 2;
                    tran.localPosition = pos;
                }
            }
        }

        public void OnBeforeSerialize()
        {

        }

        private bool m_Grey;
        private Color m_color;
        public bool grey
        {
            get { return m_Grey; }
            set
            {
                if (m_Grey == value) return;
                if (value)
                {
                    m_color = color;
                    color = Color.gray;
                }
                else
                {
                    color = m_color;
                }
                m_Grey = value;
            }
        }

        private static Queue<Material> m_QueueMat = new Queue<Material>();
        public static Material GetGrayMaterial()
        {
            if (m_QueueMat.Count > 0)
            {
                return m_QueueMat.Dequeue();
            }
            return new Material(Shader.Find("SY8/UIFontGray"));
        }

        public static void ReclaimGrayMaterial(Material mat)
        {
            m_QueueMat.Enqueue(mat);
        }
    }
}
