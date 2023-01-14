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
    private VisualElement OverlayElem;
    private Button Glogo;
    List<string> Messages = new List<string>();
    int PlayerDamage = 0;

    public delegate void MessageAnimationEnd();
    public event MessageAnimationEnd onMessageAnimationEnd;
    public delegate void GlogoClick(bool Checked);
    public event GlogoClick onGlogoClick;
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
        //doMessageLoop();
    }
    public void PlayerEndsTurn()
    {
        
        btnEndTurn.AddToClassList("Hidden");
    }
    public bool GlogoActive
	{
        get
		{
            return Glogo.ClassListContains("Glogo_Active");
		}
        set
		{
            if(value)
			{
                Glogo.AddToClassList("Glogo_Active");
            }
            else
			{
                Glogo.RemoveFromClassList("Glogo_Active");
            }
		}
	}
    public bool Stunned
    {
        get
        {
            return OverlayElem.ClassListContains("Stunned");
        }
        set
        {
            if (value)
            {
                OverlayElem.AddToClassList("Stunned");
            }
            else
            {
                OverlayElem.RemoveFromClassList("Stunned");
            }
        }
    }
    public async Task PlayerBeginsTurn()
    {
        await ShowMessage("Your Turn");
        btnEndTurn.RemoveFromClassList("Hidden");
    }
    Task MessageTask;
    bool AnimationPlaying = false;
    public async Task ShowMessage(string Message)
    {
        while (AnimationPlaying)
        {
            await Task.Delay(250);
        }
        var newMessage = Message;
        MessageLabel.text = newMessage;
        AnimationPlaying = true;
        MessageLabel.AddToClassList("SlideIn");
        while(AnimationPlaying)
        {
            await Task.Delay(250);
        }
        //Messages.Add(Message);
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
        MenuBox.AddToClassList("SlideOut");
        ActiveProgramBox.AddToClassList("ResetSlide");
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
            if(i>(checks.Count-1))
			{
                return;
			}
            checks[i].value = true;
        }
    }
    bool _hasGlogo = false;
    public bool HasGlogo
	{
        get
		{
            return _hasGlogo;

        }
        set
		{
            _hasGlogo = value;
            if(Glogo!=null)
			{
                if(value)
				{
                    Glogo.RemoveFromClassList("Hidden");
				}
                else
				{
                    Glogo.AddToClassList("Hidden");
                }
			}
		}
	}

	public PromptController Prompt { get; set; }

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
        OverlayElem = document.Query<VisualElement>("overlay");
        Glogo = document.Query<Button>("btnGlogo");
        MenuButton.RegisterCallback<ClickEvent>(MenuButton_clicked);
        Prompt = document.Query<PromptController>("Prompt");
        Prompt.AddToClassList("Hidden");
        
        ActiveProgramButton.RegisterCallback<ClickEvent>(ActiveProgramButton_clicked);
        RunProgramLabel.RegisterCallback<ClickEvent>(RunProgramClicked);
        MessageLabel.RegisterCallback<TransitionEndEvent>(onMessageTransitionEnd);
        MenuBox.RegisterCallback<ClickEvent>(MenuClick);
        ActiveProgramBox.RegisterCallback<ClickEvent>(ActiveProgramBoxClick);
        if(!HasGlogo)
		{
            Glogo.AddToClassList("Hidden");
		}
        Glogo.clicked += Glogo_clicked;
        
        document.Query<Scroller>().ForEach(x => x.RegisterCallback<ClickEvent>(ev => ev.StopPropagation()));
        
        updateDamageGui();



        this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);
    }
    private void Glogo_clicked()
    {
        //Glogo.ToggleInClassList("Glogo_Active");
        onGlogoClick?.Invoke(!GlogoActive);
    }

    private void GlogoClickHandler(ClickEvent evt)
    {
        //onGlogoClick?.Invoke(Glogo.value);
    }

    private void ActiveProgramBoxClick(ClickEvent evt)
    {
        ActiveProgramBox.AddToClassList("ResetSlide");
    }

    private void MenuClick(ClickEvent evt)
    {
        MenuBox.AddToClassList("SlideOut");
    }

    private void onMessageTransitionEnd(TransitionEndEvent evt)
    {
        ShowNextMessage();
    }

    private void MenuButton_clicked(ClickEvent ev)
    {
        if (MenuBox.ClassListContains("SlideOut"))
        {
            ActiveProgramBox.AddToClassList("ResetSlide");
            MenuBox.RemoveFromClassList("SlideOut");
        }
        else
        {
            MenuBox.AddToClassList("SlideOut");
            
        }
        //toggleClass(MenuBox, "Hidden");
    }
    private void ActiveProgramButton_clicked(ClickEvent ev)
    {
        if(ActiveProgramBox.ClassListContains("ResetSlide"))
        {
            MenuBox.AddToClassList("SlideOut");
            ActiveProgramBox.RemoveFromClassList("ResetSlide");
        }
        else
        {
            ActiveProgramBox.AddToClassList("ResetSlide");
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
