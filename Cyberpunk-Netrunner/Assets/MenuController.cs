using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class MenuController : MonoBehaviour
{
    private UIDocument document;
    private Button MenuButton;
    private Label RunProgramLabel;
    private GroupBox MenuBox;
    private GroupBox ProgramList;
    // Start is called before the first frame update
    private void Awake()
    {
        document = GetComponent<UIDocument>();
        MenuButton = document.rootVisualElement.Query<Button>("MenuButton");
        RunProgramLabel = document.rootVisualElement.Query<Label>("RunProgram");
        MenuBox = document.rootVisualElement.Query<GroupBox>("MenuBox");
        ProgramList = document.rootVisualElement.Query<GroupBox>("ProgramList");
        MenuButton.RegisterCallback<ClickEvent>(MenuButton_clicked);
        RunProgramLabel.RegisterCallback<ClickEvent>(RunProgramClicked);
    }

    private void MenuButton_clicked(ClickEvent ev)
    {
        toggleClass(MenuBox, "Hidden");
    }
    private void RunProgramClicked(ClickEvent ev)
    {
        toggleClass(ProgramList, "Hidden");
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

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
