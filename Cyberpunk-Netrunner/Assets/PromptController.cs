using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UIElements;

public enum ButtonType
{
    YesNo,
    YesNoCancel,
    OKCancel,
    OK
}
public enum DialogResult
{
	None,
	Yes,
	No,
	Cancel
}
public class PromptController : VisualElement
{
    VisualElement document;
    Button AffirmButton;
    Button DeclineButton;
    Button CancelButton;
	Label HeaderLabel;
	ButtonType _buttonType = ButtonType.YesNo;
	public DialogResult Result = DialogResult.None;
	
	public string HeaderText
	{
		get
		{
			return HeaderLabel?.text??"";
		}
		set
		{
			if (HeaderLabel != null)
			{
				HeaderLabel.text = value;
			}
		}
	}
	public ButtonType ButtonType
	{
		get
		{
			return _buttonType;
		}
		set
		{
			_buttonType = value;
			SetButtonsText();
		}
	}
	public async Task<DialogResult> Show(string header,ButtonType type= ButtonType.OKCancel)
	{
		RemoveFromClassList("Hidden");
		HeaderText = header;
		ButtonType = type;
		
		while (Result == DialogResult.None)
		{
			await Task.Delay(100);
		}
		AddToClassList("Hidden");
		return Result;
	}
	public new class UxmlFactory : UxmlFactory<PromptController, UxmlTraits> { }
	public new class UxmlTraits : VisualElement.UxmlTraits
	{
	}
	public PromptController()
	{
		this.RegisterCallback<GeometryChangedEvent>(onGeometryChange);
		//doMessageLoop();
	}
	private void onGeometryChange(GeometryChangedEvent evt)
    {
        document = this;
        AffirmButton = document.Query<Button>("AffirmButton");
        DeclineButton = document.Query<Button>("DeclineButton");
        CancelButton = document.Query<Button>("CancelButton");
		HeaderLabel= document.Query<Label>("HeaderLabel");
		AffirmButton.clicked += AffirmButton_clicked;
		DeclineButton.clicked += DeclineButton_clicked;
		CancelButton.clicked += CancelButton_clicked;
		SetButtonsText();
		this.UnregisterCallback<GeometryChangedEvent>(onGeometryChange);


	}
	void SetButtonsText()
	{
		if(document==null)
		{
			return;
		}
		if (ButtonType == ButtonType.YesNo || ButtonType == ButtonType.YesNoCancel)
		{
			AffirmButton.text = "Yes";
			DeclineButton.text = "No";
		}
		else if (ButtonType == ButtonType.OK || ButtonType == ButtonType.OKCancel)
		{
			AffirmButton.text = "OK";
			DeclineButton.AddToClassList("Hidden");
		}
		if (ButtonType == ButtonType.YesNoCancel || ButtonType == ButtonType.OKCancel)
		{
			CancelButton.RemoveFromClassList("Hidden");
		}
		else
		{
			CancelButton.AddToClassList("Hidden");
		}
	}

	private void CancelButton_clicked()
	{
		Result = DialogResult.Cancel;
	}

	private void DeclineButton_clicked()
	{
		Result = DialogResult.No;
	}

	private void AffirmButton_clicked()
	{
		Result = DialogResult.Yes;
	}

}
