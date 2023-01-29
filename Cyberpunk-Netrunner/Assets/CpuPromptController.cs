using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class CpuPromptController : VisualElement
{
    public new class UxmlFactory : UxmlFactory<CpuPromptController, UxmlTraits> { }
    public new class UxmlTraits : VisualElement.UxmlTraits
    {
    }
    public CpuPromptController()
	{
        this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);
    }
    private VisualElement document;
    private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);
    }
}
