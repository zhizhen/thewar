using UnityEngine;
using UnityEngine.UI;
using System.Collections;

namespace Engine
{
    public class InputFieldScene : MonoBehaviour
    {
        [SerializeField]
        private InputField inputField;

        void Awake()
        {
            //inputField.characterValidation = InputField.CharacterValidation.Name;
            //inputField.keyboardType = TouchScreenKeyboardType.Default;
        }

        void Start()
        {
        }
    }
}
