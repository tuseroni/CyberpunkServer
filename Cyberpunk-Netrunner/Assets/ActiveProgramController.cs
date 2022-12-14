using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;

public class ActiveProgramController : VisualElement
{
    private VisualElement document;
    private Label MenuButton;
    private Label AttackActionLabel;
    private Label RerezActionLabel;
    private GroupBox MenuBox;
    private GroupBox ActiveProgramBox;
    private GroupBox ProgramList;
    public delegate void ActionCalled(string action,ProgramController controller);
    public event ActionCalled onActionCalled;
    ProgramController _Controller;
    public ProgramController controller
    {
        get
        {
            return _Controller;
        }
        set
        {
            _Controller = value;
            if (!_Controller.canMove)
            {
                MoveActionLabel?.AddToClassList("Hidden");
            }
            

        }
    }

    public GameController GC;
    private Label MoveActionLabel;
    bool _programRezzed = true;
    public bool ProgramRezzed
    {
        get
        {
            return _programRezzed;
        }
        set
        {
            _programRezzed = value;
            if(value)
            {
                RerezActionLabel.AddToClassList("Hidden");
            }
            else
            {
                if (GC != null && GC.Utilities.ContainsKey("Re-Rezz"))
                {
                    RerezActionLabel.RemoveFromClassList("Hidden");
                }
            }
        }
    }

    public new class UxmlFactory :UxmlFactory<ActiveProgramController, UxmlTraits>{ }
    public new class UxmlTraits : VisualElement.UxmlTraits 
    { 
    }
// Start is called before the first frame update
    public ActiveProgramController()
    {
        this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);
        
    }
   
    private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        MenuButton = document.Query<Label>("MenuButton");
        MoveActionLabel = document.Query<Label>("MoveAction");
        AttackActionLabel = document.Query<Label>("AttackAction");
        RerezActionLabel = document.Query<Label>("RerezActionLabel");
        MenuBox = document.Query<GroupBox>("MenuBox");
        //ActiveProgramBox = document.Query<GroupBox>("ActiveProgramBox");

        //ProgramList = document.Query<GroupBox>("ProgramList");
        //MessageLabel = document.Query<Label>("MessageLabel");
        if (!(_Controller?.canMove ?? true))
        {
            MoveActionLabel.AddToClassList("Hidden");
        }
        MenuButton.text = controller?.Program?.name ?? "";
        MenuButton.RegisterCallback<ClickEvent>(MenuButton_clicked);
        MoveActionLabel.RegisterCallback<ClickEvent>(MoveActionLabel_clicked);
        AttackActionLabel.RegisterCallback<ClickEvent>(AttackActionLabel_Clicked);
        RerezActionLabel.RegisterCallback<ClickEvent>(RerezActionLabelLabel_Clicked);
        this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);
    }

    private void RerezActionLabelLabel_Clicked(ClickEvent evt)
    {
        GC.ReRezz(controller);
        onActionCalled?.Invoke("Rerez", controller);
    }

    private void MenuButton_clicked(ClickEvent ev)
    {
        if (MenuBox.ClassListContains("Hidden"))
        {
            MenuBox.RemoveFromClassList("Hidden");
        }
        else
        {
            MenuBox.AddToClassList("Hidden");
            
        }
        ev.StopPropagation();
        //toggleClass(MenuBox, "Hidden");
    }
    private void MoveActionLabel_clicked(ClickEvent ev)
    {
        
        MenuBox.AddToClassList("Hidden");
        onActionCalled?.Invoke("Move", controller);

    }
    private void AttackActionLabel_Clicked(ClickEvent ev)
    {
        onActionCalled?.Invoke("Attack", controller);
    }
}
