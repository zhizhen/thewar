using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace UIExtend
{
	public enum UIEventType
	{
		ON_POINTER_ENTER,
		ON_POINTER_EXIT,
		ON_POINTER_DOWN,
		ON_POINTER_UP,
		ON_POINTER_CLICK,
		ON_BEGIN_DRAG,
		ON_DRAG,
		ON_END_DRAG,
		ON_SCROLL,
		ON_UPDATE_SELECTED,
		ON_DESELECT,
		ON_MOVE,
		ON_SUBMIT,
		ON_CANCEL,
		ON_END_EDIT,
		ON_VALUE_CHANGE,
		DEFAULT
	}

	public enum UIComponentType
	{
		BUTTON,
		BUTTONWRAPPER,
		SLIDER,
		SCROLLBAR,
		SCROLLRECT,
		TOGGLE,
		INPUTFIELD,
		DEFAULT
	}
}
