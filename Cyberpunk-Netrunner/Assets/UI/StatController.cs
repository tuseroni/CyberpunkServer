using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;

public class StatController : VisualElement
{
    private VisualElement document;
    public GroupBox StatBox;
    private GroupBox EditBox;

    public new class UxmlFactory :UxmlFactory<StatController, UxmlTraits>{ }
    public new class UxmlTraits : VisualElement.UxmlTraits 
    { 
    }
// Start is called before the first frame update
    public StatController()
    {
        this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);
        //doMessageLoop();
    }
    
    private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        StatBox = document.Query<GroupBox>("StatBox");
        EditBox = document.Query<GroupBox>("EditBox");
        StatBox.RegisterCallback<ClickEvent>(ActiveProgramBoxClick);
        this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);
    }

    private void ActiveProgramBoxClick(ClickEvent evt)
    {
        EditBox.ToggleInClassList("Hidden");
    }

}
