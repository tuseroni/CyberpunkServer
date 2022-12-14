using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using TMPro;

public class PlayerPanelInfo : MonoBehaviour
{
    PlayerData _Player;
    public TextMeshProUGUI CharacterName;
    public PlayerData Player
    {
        get
        {
            return _Player;
        }
        set
        {
            _Player = value;
            CharacterName.text = value.Handle;
        }
    }
    public UIManagerTech MainMenuScript;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void OnMouseUp()
    {
        MainMenuScript.CharacterSet(Player);
    }
}
