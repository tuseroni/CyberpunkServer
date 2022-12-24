using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;

public class MenuController : VisualElement
{
    private VisualElement document;
    private Button MenuButton;
    private Button btnEndTurn;
    private Label RunProgramLabel;
    private GroupBox MenuBox;
    private GroupBox ActiveProgramBox;

    public VisualElement ActiveProgramHolder;

    private GroupBox ProgramList;
    private Label MessageLabel;
    List<string> Messages = new List<string>();
    int PlayerDamage = 0;

    public delegate void MessageAnimationEnd();
    public event MessageAnimationEnd onMessageAnimationEnd;
    bool MessageAnimating = false;
    private Button ActiveProgramButton;

    public new class UxmlFactory :UxmlFactory<MenuController, UxmlTraits>{ }
    public new class UxmlTraits : VisualElement.UxmlTraits 
    { 
    }
// Start is called before the first frame update
    public MenuController()
    {
        this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);
        doMessageLoop();
    }
    public void PlayerEndsTurn()
    {
        
        btnEndTurn.AddToClassList("Hidden");
    }
    public void PlayerBeginsTurn()
    {
        ShowMessage("Your Turn");
        btnEndTurn.RemoveFromClassList("Hidden");
    }
    Task MessageTask;
    bool AnimationPlaying = false;
    public void ShowMessage(string Message)
    {
        
        Messages.Add(Message);
        //if (!MessageLabel.ClassListContains("SlideIn") && !MessageLabel.ClassListContains("SlideOut"))
        //{
        //    //if (MessageLabel.ClassListContains("ResetSlide"))
        //    //{
        //    //    MessageLabel.RemoveFromClassList("ResetSlide");
        //    //}
        //    MessageLabel.text = Message;
        //    MessageLabel.AddToClassList("SlideIn");
        //}
    }
    async void doMessageLoop()
    {
        while (true)
        {
            while (AnimationPlaying)
            {
                await Task.Delay(250);
            }
            if (Messages.Count > 0)
            {
                var newMessage = Messages[0];
                Messages.RemoveAt(0);
                MessageLabel.text = newMessage;
                AnimationPlaying = true;
                MessageLabel.AddToClassList("SlideIn");
            }
            else
            {
                await Task.Delay(250);
            }
        }
    }
    public void AddActiveProgram(VisualElement programAsset)
    {
        ActiveProgramController controller = programAsset.Query<ActiveProgramController>();
        controller.onActionCalled += Controller_onActionCalled;
        ActiveProgramHolder.Add(programAsset);
    }

    private void Controller_onActionCalled(string action,ProgramController controller)
    {
        closeAllMenus();
    }
    void closeAllMenus()
    {
        MenuBox.AddToClassList("Hidden");
        ActiveProgramBox.AddToClassList("Hidden");
    }

    void ShowNextMessage()
    {
        
        //if (MessageLabel.ClassListContains("ResetSlide"))
        //{
        //    MessageLabel.RemoveFromClassList("ResetSlide");
        //}
        if (MessageLabel.ClassListContains("SlideIn"))
        {
            MessageLabel.RemoveFromClassList("SlideIn");
            MessageLabel.AddToClassList("SlideOut");
        }
        else
        {   
            MessageLabel.RemoveFromClassList("SlideOut");
            AnimationPlaying = false;
            //if (Messages.Count > 0)
            //{
            //    var newMessage = Messages[0];
            //    Messages.RemoveAt(0);
            //    MessageLabel.text = newMessage;
            //    AnimationPlaying = false;
            //}
            
        }
    }
    public void SetDamage(int amount)
    {
        PlayerDamage = amount;
        if(document!=null)
        {
            updateDamageGui();
        }
    }
    void updateDamageGui()
    {
        var checks = document.Query<Toggle>().ToList();
        checks.ForEach(x => x.value = false);
        for (var i = 0; i < PlayerDamage; i++)
        {
            checks[i].value = true;
        }
    }
    private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        MenuButton = document.Query<Button>("MenuButton");
        ActiveProgramButton = document.Query<Button>("ActiveProgramButton");
        btnEndTurn = document.Query<Button>("btnEndTurn");
        RunProgramLabel = document.Query<Label>("RunProgram");
        MenuBox = document.Query<GroupBox>("MenuBox");
        ActiveProgramBox = document.Query<GroupBox>("ActiveProgramBox");
        ActiveProgramHolder = document.Query<VisualElement>("ActiveProgramHolder");
        ProgramList = document.Query<GroupBox>("ProgramList");
        MessageLabel = document.Query<Label>("MessageLabel");
        MenuButton.RegisterCallback<ClickEvent>(MenuButton_clicked);
        ActiveProgramButton.RegisterCallback<ClickEvent>(ActiveProgramButton_clicked);
        RunProgramLabel.RegisterCallback<ClickEvent>(RunProgramClicked);
        MessageLabel.RegisterCallback<TransitionEndEvent>(onMessageTransitionEnd);
        MenuBox.RegisterCallback<ClickEvent>(MenuClick);
        ActiveProgramBox.RegisterCallback<ClickEvent>(ActiveProgramBoxClick);
        document.Query<Scroller>().ForEach(x => x.RegisterCallback<ClickEvent>(ev => ev.StopPropagation()));
        
        updateDamageGui();



        this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);
    }

    private void ActiveProgramBoxClick(ClickEvent evt)
    {
        ActiveProgramBox.AddToClassList("Hidden");
    }

    private void MenuClick(ClickEvent evt)
    {
        MenuBox.AddToClassList("Hidden");
    }

    private void onMessageTransitionEnd(TransitionEndEvent evt)
    {
        ShowNextMessage();
    }

    private void MenuButton_clicked(ClickEvent ev)
    {
        if (MenuBox.ClassListContains("Hidden"))
        {
            ActiveProgramBox.AddToClassList("Hidden");
            MenuBox.RemoveFromClassList("Hidden");
        }
        else
        {
            MenuBox.AddToClassList("Hidden");
            
        }
        //toggleClass(MenuBox, "Hidden");
    }
    private void ActiveProgramButton_clicked(ClickEvent ev)
    {
        if(ActiveProgramBox.ClassListContains("Hidden"))
        {
            MenuBox.AddToClassList("Hidden");
            ActiveProgramBox.RemoveFromClassList("Hidden");
        }
        else
        {
            ActiveProgramBox.AddToClassList("Hidden");
        }
        
        
        
    }
    private void RunProgramClicked(ClickEvent ev)
    {

        toggleClass(ProgramList, "Hidden");
        ev.StopPropagation();
    }
    public static void toggleClass(VisualElement el,string className)
    {
        if (el.ClassListContains(className))
        {
            el.RemoveFromClassList(className);
        }
        else
        {
            el.AddToClassList(className);
        }
    }
}
