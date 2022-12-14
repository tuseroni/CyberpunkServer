using CyberpunkServer.Models.DTO;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class JackInPanelController : MonoBehaviour
{
    PlayerData _Player;
    public TextMeshProUGUI CharacterName;
    PlayerData Player
    {
        get
        {
            return _Player;
        }
        set
        {
            _Player = value;
            CharacterName.text = Player.Handle;
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }
    private void OnEnable()
    {
        if(ProgramData.player != null)
        {
            Player = ProgramData.player;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void JackIn()
    {
        if (ProgramData.player != null)
        {
            SignalrHandler.InvokeJackInRequest(ProgramData.player.id);
        }
    }
}
