using CyberpunkServer.Models.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;
using System.Collections.ObjectModel;

public class DefensePromptController : VisualElement
{
    private VisualElement document;
    Button AffirmButton;
    Button DeclineButton;
    Label HeaderLabel;

    public VisualElement ProgramHolder { get; private set; }

    public DialogResult Result = DialogResult.None;
    public ProgramData SelectedProgram { get; set; }
    public ObservableCollection<ProgramData> ProgramList = new ObservableCollection<ProgramData>();
    public new class UxmlFactory : UxmlFactory<DefensePromptController, UxmlTraits> { }
    public new class UxmlTraits : VisualElement.UxmlTraits
    {
    }
    public DefensePromptController()
    {
        this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);

    }
    public string HeaderText
    {
        get
        {
            return HeaderLabel?.text ?? "";
        }
        set
        {
            if (HeaderLabel != null)
            {
                HeaderLabel.text = value;
            }
        }
    }
    public async Task<DialogResult> Show(string header = "")
    {
        RemoveFromClassList("Hidden");
        Result = DialogResult.None;
        SelectedProgram = null;
        if (header != "")
        {
            HeaderText = header;
        }

        while (Result == DialogResult.None)
        {
            await Task.Delay(100);
        }
        AddToClassList("Hidden");
        return Result;
    }
    private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        AffirmButton = document.Query<Button>("AffirmButton");
        DeclineButton = document.Query<Button>("DeclineButton");
        HeaderLabel = document.Query<Label>("HeaderLabel");
        ProgramHolder = document.Query<VisualElement>("DefensiveProgramHolder");
        AffirmButton.clicked += AffirmButton_clicked;
        DeclineButton.clicked += DeclineButton_clicked;
        buildList();
    }
    void buildList()
    {
        ProgramHolder.Clear();
        foreach (var program in ProgramList)
        {
            Label ProgramLabel = new Label();
            ProgramLabel.AddToClassList("Program");
            ProgramLabel.text = program.name;
            ProgramLabel.tooltip = program.Description;
            ProgramLabel.RegisterCallback<ClickEvent>((ev) =>this.SelectedProgram=program);
            ProgramHolder.Add(ProgramLabel);
        }
    }
    private void AffirmButton_clicked()
    {
        Result = DialogResult.Yes;
    }

    private void DeclineButton_clicked()
    {
        Result = DialogResult.Cancel;
    }
}
