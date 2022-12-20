using CyberpunkServer.Models.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UIElements;

public class PlayerController : MonoBehaviour,NetItem,ProgramSummoner
{
    // Start is called before the first frame update

    public CharacterController controller;
    public float speed = 12f;
    Vector3 velocity;
    public float gravity = -9.81f;
    public Transform groundCheck;
    public float groundDistance = 0.4f;
    public LayerMask groundMask;
    public float jumpHeight = 3f;
    bool isGrounded;
    public float frictionCo = 0.8f;
    public ReflectionProbe reflectProbe;
    public LayerMask layer;
    public LayerMask ignoreWall;
    public GameObject fBomb;
    public GridController grid = null;
    PlayerData _playerData;
    public UIDocument Document;
    public GroupBox ProgramList;
    public GroupBox MenuBox;
    VisualElement ProgramHolder;
    public PlayerData playerData
    {
        get
        {
            return _playerData;
        }
        set
        {
            _playerData = value;
            value.EquippedComputer = value.PlayerComputer[0];
            value.EquippedCyberdeck = value.PlayerCyberdeck[0];
            ProgramHolder.Clear();
            Label Header1 = new Label();
            Header1.AddToClassList("Header");
            Header1.text = "CyberDeck Programs";
            ProgramHolder.Add(Header1);
            foreach (var prog in value.EquippedCyberdeck.PlayerCyberdeckPrograms)
            {
                Label ProgramLabel = new Label();
                ProgramLabel.AddToClassList("Program");
                ProgramLabel.text = prog.Program.name;
                ProgramLabel.tooltip = prog.Program.Description;
                ProgramLabel.RegisterCallback<ClickEvent>((ev) => CyberdeckProgramClicked(ev, prog));
                ProgramHolder.Add(ProgramLabel);
                prog.UIElement = ProgramLabel;
            }
            Label Header2 = new Label();
            Header2.AddToClassList("Header");
            Header2.text = "Computer Programs";
            ProgramHolder.Add(Header2);
            foreach (var prog in value.EquippedComputer.PlayerComputerPrograms)
            {
                Label ProgramLabel = new Label();
                ProgramLabel.AddToClassList("Program");
                ProgramLabel.text = prog.Program.name;
                ProgramLabel.tooltip = prog.Program.Description;
                ProgramLabel.RegisterCallback<ClickEvent>((ev) => ComputerProgramClicked(ev, prog));
                ProgramHolder.Add(ProgramLabel);
                prog.UIElement = ProgramLabel;
            }
            
        }
    }

    public GameObject Object 
    {
        get
        {
            return gameObject;
        }
        set
        {
            
        }
    }
    public bool Solid { get => false; set { } }
    public NetObjType Type { get => NetObjType.NetRunner; set { } }
    public int xPos { get => playerData.xPos; set => playerData.xPos=value; }
    public int yPos { get => playerData.yPos; set => playerData.yPos = value; }
    public ProgramSummoner Owner { get; set; }
    public Bounds bounds { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

    public GameObject ProgramPrefab;
    

    void CyberdeckProgramClicked(ClickEvent e,PlayerCyberdeckProgramsData program)
    {
        MenuController.toggleClass((VisualElement)e.target, "Hidden");
        MenuController.toggleClass(MenuBox, "Hidden");
        
        var tile = getForwardTile();
        if (tile)
        {
            program.xPos = tile.xPos;
            program.yPos = tile.yPos;
        }
        var wallObj = GameObject.Instantiate(ProgramPrefab, Vector3.zero, Quaternion.identity);
        wallObj.GetComponent<ProgramController>().addProgram(grid, program,this);
    }
    void ComputerProgramClicked(ClickEvent e, PlayerComputerProgramsData program)
    {
        MenuController.toggleClass((VisualElement)e.target, "Hidden");
        MenuController.toggleClass(MenuBox, "Hidden");
        
        var tile = getForwardTile();
        if (tile)
        {
            program.xPos = tile.xPos;
            program.yPos = tile.yPos;

        }
        var wallObj = GameObject.Instantiate(ProgramPrefab, Vector3.zero, Quaternion.identity);
        wallObj.GetComponent<ProgramController>().addProgram(grid, program, this);

    }
    TileController getForwardTile()
    {
        var testVec = transform.rotation * new Vector3(0, 0, 1); ;
        var x = playerData.xPos + (int)Math.Round(testVec.x);
        var y = playerData.yPos - (int)Math.Round(testVec.z);
        //var x=posVec
        if (x < 0)
        {
            x = 0;
        }
        if (y < 0)
        {
            y = 0;
        }
        var tileObj = grid.gridTiles[y][x];
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem.Where(t => t.Solid).Any())
        {
            return null;
        }
        return tile;
    }
    // Update is called once per frame
    private void Start()
    {
        
        Debug.Log("player start");
    }
    private void Awake()
    {
        MenuBox = Document.rootVisualElement.Query<GroupBox>("MenuBox");
        ProgramList = Document.rootVisualElement.Query<GroupBox>("ProgramList");
        ProgramHolder = Document.rootVisualElement.Query<VisualElement>("ProgramHolder");
    }


    public void OnTriggerEnter(Collider other)
    {
        
    }
    public void OnTriggerExit(Collider other)
    {
        
    }
    void moveVector(Vector3 posVec)
    {
        var testVec = transform.rotation * posVec;
        var x = playerData.xPos + (int)Math.Round(testVec.x);
        var y = playerData.yPos - (int)Math.Round(testVec.z);
        //var x=posVec
        if (x < 0)
        {
            x = 0;
        }
        if (y < 0)
        {
            y = 0;
        }
        var tileObj = grid.gridTiles[y][x];
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem.Where(t=>t.Solid).Any())
        {
            return;
        }
        playerData.xPos = x;
        playerData.yPos = y;
        //posX = x;
        //posY = y;
        MoveToTile(tileObj);
    }
    public void MoveLeft()
    {
        //posX--;

        var posVec = new Vector3(-1, 0, 0);
        moveVector(posVec);
    }
    public void MoveRight()
    {
        var posVec = new Vector3(1, 0, 0);
        moveVector(posVec);
    }
    public void MoveForward()
    {
        var posVec = new Vector3(0, 0, 1);
        moveVector(posVec);
    }
    public void MoveBackward()
    {
        var posVec = new Vector3(0, 0, -1);
        moveVector(posVec);
    }
    public void MoveToTile(GameObject tileObj)
    {
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem.Where(t => t.Solid).Any())
        {
            return;
        }
        transform.position = tile.transform.position + new Vector3(0, 3, 0);
        SignalrHandler.InvokePlayerMove(playerData.id, playerData.xPos, playerData.yPos);
    }

    bool LeftButtonDown = false;
    bool RightButtonDown = false;
    bool UpButtonDown = false;
    bool DownButtonDown = false;
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.LeftArrow) | Input.GetKeyDown(KeyCode.A))
        {
            LeftButtonDown = true;
        }
        else if (LeftButtonDown)
        {
            LeftButtonDown = false;
            MoveLeft();
        }
        if (Input.GetKeyDown(KeyCode.RightArrow) | Input.GetKeyDown(KeyCode.D))
        {
            RightButtonDown = true;
        }
        else if (RightButtonDown)
        {
            RightButtonDown = false;
            MoveRight();
        }
        if (Input.GetKeyDown(KeyCode.UpArrow) | Input.GetKeyDown(KeyCode.W))
        {
            UpButtonDown = true;
        }
        else if (UpButtonDown)
        {
            UpButtonDown = false;
            MoveForward();
        }
        if (Input.GetKeyDown(KeyCode.DownArrow) | Input.GetKeyDown(KeyCode.S))
        {
            DownButtonDown = true;
        }
        else if (DownButtonDown)
        {
            DownButtonDown = false;
            MoveBackward();
        }
    }
}
