using CyberpunkServer.Models.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEngine;
//using UnityEngine.UI;
using UnityEngine.UIElements;


public class PlayerController : MonoBehaviour,NetActor,ProgramSummoner
{
    public GameController GameController;
    public GameController Ref
    {
        get
        {
            return GameController;
        }
        set
        {
            GameController = value;
        }

    }
    public int Int 
    { 
        get
        {
            return playerData.StatLookup["INT"].Total;
        }
        set
        {
        }
    }
    public int Interface
    {
        get
        {
            return playerData.SkillLookup["Interface (Netrunner)"].Total;
        }
        set
        {
        }
    }
    public string Name
    {
        get
        {
            return playerData.Handle;
        }
    }
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
    public GroupBox ActiveProgramList;
    public GroupBox MenuBox;
    public GroupBox ActiveProgramBox;
    public Button btnEndTurn;
    VisualElement ProgramHolder;
    VisualElement ActiveProgramHolder;
    public GameObject ProgramPrefab;
    MenuController MenuController;
    public int ProgramSP { get; set; } = 0;

    List<ProgramController> ActivePrograms = new List<ProgramController>();
    List<ProgramController> SpottedPrograms = new List<ProgramController>();
    public bool WaitForSignal { get; set; } = false;
    public bool Continue { get; set; } = true;
    public bool Solid { get => false; set { } }
    public NetObjType Type { get => NetObjType.NetRunner; set { } }
    public int xPos { get => playerData.xPos; set => playerData.xPos = value; }
    public int yPos { get => playerData.yPos; set => playerData.yPos = value; }
    public ProgramSummoner Owner
    {
        get
        {
            return this;
        }
        set
        {
        }
    }
    public Bounds bounds { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
    public int NumActions 
    { 
        get
        {
            var actions = 1;
            if(playerData.EquippedComputer !=null /*&& GameController.Utilities.ContainsKey("Multitasker")*/)
            {
                actions += playerData.EquippedComputer.Computer.Int-1;
            }
            return actions;
        }
        set
        {
        }
    }
    public int ActionsDone { get; set; }
    public bool Invisible { get; set; } = false;
    public bool DetectInvisibility { get; set; } = false;
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
            ActiveProgramHolder.Clear();

            Label Header1 = new Label();
            Header1.AddToClassList("Header");
            Header1.text = "CyberDeck Programs";
            ProgramHolder.Add(Header1);
            foreach (var prog in value.EquippedCyberdeck.PlayerCyberdeckPrograms)
            {
                if (!prog.Program.ProgramFunctions.Where(x => x.name == "Utility").Any())
                {
                    Label ProgramLabel = new Label();
                    ProgramLabel.AddToClassList("Program");
                    ProgramLabel.text = prog.Program.name;
                    ProgramLabel.tooltip = prog.Program.Description;
                    ProgramLabel.RegisterCallback<ClickEvent>((ev) => CyberdeckProgramClicked(ev, prog));
                    ProgramHolder.Add(ProgramLabel);
                    prog.UIElement = ProgramLabel;
                }
                else
                {
                    GameController.addUtility(prog);
                }
            }
            Label Header2 = new Label();
            Header2.AddToClassList("Header");
            Header2.text = "Computer Programs";
            ProgramHolder.Add(Header2);
            foreach (var prog in value.EquippedComputer.PlayerComputerPrograms)
            {
                if (!prog.Program.ProgramFunctions.Where(x => x.name == "Utility").Any())
                {
                    Label ProgramLabel = new Label();
                    ProgramLabel.AddToClassList("Program");
                    ProgramLabel.text = prog.Program.name;
                    ProgramLabel.tooltip = prog.Program.Description;
                    ProgramLabel.RegisterCallback<ClickEvent>((ev) => ComputerProgramClicked(ev, prog));
                    ProgramHolder.Add(ProgramLabel);
                    prog.UIElement = ProgramLabel;
                }
                else
                {
                    GameController.addUtility(prog);
                }
            }
            MenuController.SetDamage(value.Dammage);


        }
    }
    public bool Stunned { get; set; }
    public bool UsingInterfacePlug { get; set; } = true;
    public int TakeDamage(Damage damage)
    {
        switch(damage.Type)
        {
            case DamageType.HP:
                var dmg = (damage.Value + playerData.BTM) - ProgramSP;
                if (dmg > 0 && UsingInterfacePlug)
                {
                    playerData.Dammage += dmg;
                    MenuController.SetDamage(playerData.Dammage);
                    Stunned = CheckStun();
                    GameController.SetPlayerStunned(this,Stunned);
                    return dmg;
                }
                break;
            case DamageType.Stat:
                var stat = playerData.StatLookup[damage.key];
                stat.Bonus -= damage.Value;
                return damage.Value;
            case DamageType.Skill:
                var skill = playerData.SkillLookup[damage.key];
                skill.Bonus -= damage.Value;
                return damage.Value;
            case DamageType.Strength:
                break;
        }
        return 0;
    }
    bool CheckStun()
    {
        int stunBonus = 0 + (int)Math.Floor((playerData.Dammage - 1) / 4f);
        var bt = playerData.StatLookup["BT"].Total;
        var d10 = GameController.RollD10(false);
        if (d10 > (bt - stunBonus))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public List<ProgramController> ActiveDefensivePrograms
    {
        get
        {
            return ActivePrograms.Where(x => x.Functions.ContainsKey("Protection")).ToList();
        }
    }
    public List<ProgramController> ActiveStealthPrograms
    {
        get
        {
            return ActivePrograms.Where(x => x.Functions.ContainsKey("Stealth")).ToList();
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
   
    public int Initiative { get; set; }
    public int RollInitiative()
    {
        var reflex= playerData.StatLookup["REF"].Total;
        var speed = playerData.EquippedCyberdeck.TotalSpeed;
        if (playerData.EquippedComputer != null)
        {
            speed+=(playerData.EquippedComputer.TotalSpeed -8);
        }
        var d10 = GameController.RollD10();
        Initiative= d10 + speed + reflex;
        return Initiative;
    }
    public int doEvasionCheck()
    {
        var d10 = GameController.RollD10();
        var ProgramEvasions= ActiveStealthPrograms.Select(x => x.Program.Strength).Sum();
        return ProgramEvasions + d10;
    }

    public int doDetectionCheck()
    {
        throw new NotImplementedException();
    }

    public int RollToBeHit()
    {
        playerData.SkillLookup = playerData.PlayerSkill.ToDictionary(x => x.Skill.Name, x => x);
        var Int = playerData.StatLookup["INT"].Total;
        var Interface = playerData.SkillLookup["Interface (Netrunner)"];
        var InterfaceTotal = Interface.Total + playerData.EquippedCyberdeck.PlayerCyberdeckOptions.SelectMany(x => x.CyberdeckOptions.CyberdeckOptionsSkillModifiers.Where(x => x.SkillID == Interface.id)).Sum(x => x.Modifier);
        var ProgramDefense = ActiveDefensivePrograms.Select(x => x.Program.Strength).Sum();
        var d10 = GameController.RollD10();
        return ProgramDefense + d10 + InterfaceTotal + Int;
    }

    public int RollToHit()
    {
        return RollToBeHit();
    }
    void addActiveProgram(VisualElement elem, RunningProgram program)
    {
        if (WaitForSignal && !Continue)
        {
            return;
        }
        if(Stunned)
        {
            return;
        }
        if (ActionsDone >= NumActions)
        {
            return;
        }
        
        elem.RemoveFromHierarchy();
        MenuController.toggleClass(MenuBox, "Hidden");

        var tile = getForwardTile();
        if (tile)
        {
            program.xPos = tile.xPos;
            program.yPos = tile.yPos;
        }
        var prefab = Resources.Load<GameObject>($"Programs/{program.Program.name}");
        if(prefab==null)
        {
            prefab = ProgramPrefab;
        }
        var wallObj = GameObject.Instantiate(prefab, Vector3.zero, Quaternion.identity);
        var controller = wallObj.GetComponent<ProgramController>();
        GameController.addProgram(controller, this, program);
        ActivePrograms.Add(controller);
        
        var programElem = controller.ActiveProgramAsset.CloneTree();
        ActiveProgramController Progcontroller = programElem.Query<ActiveProgramController>();
        Progcontroller.controller = controller;
        Progcontroller.GC = GameController;
        Progcontroller.onActionCalled += Progcontroller_onActionCalled;
        controller.ActiveProgramController = Progcontroller;
        controller.GameController = GameController;
        MenuController.AddActiveProgram(programElem);
        ActionsDone++;
    }

    private void Progcontroller_onActionCalled(string action,ProgramController controller)
    {
        switch(action)
        {
            case "Move":
                GameController.OrderProgramMove(controller);
                break;
        }
        
    }

    public void AddSpottedProgram(ProgramController Program)
    {
        if (!SpottedPrograms.Contains(Program))
        {
            SpottedPrograms.Add(Program);
        }
    }
    void CyberdeckProgramClicked(ClickEvent e,PlayerCyberdeckProgramsData program)
    {
        addActiveProgram((VisualElement)e.target, program);
    }
    void ComputerProgramClicked(ClickEvent e, PlayerComputerProgramsData program)
    {
        addActiveProgram((VisualElement)e.target, program);
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
        var tile = tileObj;
        if (tile.ContainedItem.Where(t => t.Solid).Any())
        {
            return null;
        }
        return tile;
    }
    // Update is called once per frame
    private void Start()
    {
        StartCoroutine(HandleState());

        Debug.Log("player start");
    }
    IEnumerator HandleState()
    {

        while (true)
        {
            FieldOfViewCheck();
            yield return new WaitForSeconds(0.5f);
        }
    }
    private void Awake()
    {
        MenuBox = Document.rootVisualElement.Query<GroupBox>("MenuBox");
        ActiveProgramBox = Document.rootVisualElement.Query<GroupBox>("ActiveProgramBox");
        ProgramList = Document.rootVisualElement.Query<GroupBox>("ProgramList");
        ActiveProgramList = Document.rootVisualElement.Query<GroupBox>("ActiveProgramList");
        ProgramHolder = Document.rootVisualElement.Query<VisualElement>("ProgramHolder");
        btnEndTurn= Document.rootVisualElement.Query<Button>("btnEndTurn");
        ActiveProgramHolder = Document.rootVisualElement.Query<VisualElement>("ActiveProgramHolder");
        MenuController= Document.rootVisualElement.Query<MenuController>("MenuController");
        ((Button)Document.rootVisualElement.Query<Button>("btnForward")).RegisterCallback<ClickEvent>(btnForwardClick);
        ((Button)Document.rootVisualElement.Query<Button>("btnRight")).RegisterCallback<ClickEvent>(btnRightClick);
        ((Button)Document.rootVisualElement.Query<Button>("btnLeft")).RegisterCallback<ClickEvent>(btnLeftClick);
        ((Button)Document.rootVisualElement.Query<Button>("btnBack")).RegisterCallback<ClickEvent>(btnBackClick);

        btnEndTurn.RegisterCallback<ClickEvent>(btnEndTurnClick);
    }

    private void btnForwardClick(ClickEvent evt)
    {
        MoveForward();
    }
    private void btnRightClick(ClickEvent evt)
    {
        MoveRight();
    }
    private void btnLeftClick(ClickEvent evt)
    {
        MoveLeft();
    }
    private void btnBackClick(ClickEvent evt)
    {
        MoveBackward();
    }

    public async Task BeginTurn()
    {
        ActionsDone = 0;
        await MenuController.PlayerBeginsTurn();
    }
    private void btnEndTurnClick(ClickEvent evt)
    {
        if (Stunned)
        {
            Stunned = CheckStun();
            GameController.SetPlayerStunned(this, Stunned);
        }
        MenuController.PlayerEndsTurn();
        GameController.EndTurn(this);
    }

    public void OnTriggerEnter(Collider other)
    {
        
    }
    public void OnTriggerExit(Collider other)
    {
        
    }
    public List<Vector2Int> path { get; set; } = new List<Vector2Int>();
    public LayerMask targetMask;
    public LayerMask PlayerMask;
    public LayerMask ProgramMask;
    public LayerMask obstructionMask;
    float radius = 20.0f * 60.0f;
    float angle = 45;
    private void FieldOfViewCheck()
    {
        targetMask = ProgramMask;
        Collider[] rangeChecks = Physics.OverlapSphere(transform.position, radius, targetMask);

        if (rangeChecks.Length != 0)
        {
            foreach (var range in rangeChecks)
            {

                Transform target = range.transform;
                if (target == transform)
                {
                    continue;
                }
                Vector3 directionToTarget = (target.position - transform.position).normalized;

                if (Vector3.Angle(transform.forward, directionToTarget) < angle / 2)
                {
                    float distanceToTarget = Vector3.Distance(transform.position, target.position);

                    if (!Physics.Raycast(transform.position, directionToTarget, distanceToTarget, obstructionMask))
                    {

                        NetActor foundItem = target.gameObject.GetComponent<NetActor>();
                        if (foundItem != null)
                        {
                            if (foundItem is ProgramController)
                            {
                                if (foundItem.Owner != Owner && !foundItem.Invisible)
                                {
                                    canSeeTarget = true;
                                    AddSpottedProgram((ProgramController)foundItem);
                                    break;
                                }
                            }
                            else
                            {
                                canSeeTarget = true;
                                break;
                            }
                        }
                    }
                    else
                        canSeeTarget = false;
                }
                else
                    canSeeTarget = false;
            }
        }
        else if (canSeeTarget)
            canSeeTarget = false;
    }

    void moveVector(Vector3 posVec)
    {
        if(path.Count>5)
        {
            return;
        }
        if(WaitForSignal && !Continue)
        {
            return;
        }
        if(Stunned)
        {
            return;
        }
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
        if(x>grid.Width-1)
        {
            x = grid.Width - 1;
        }
        if (y > grid.Height - 1)
        {
            y = grid.Height - 1;
        }

        var tileObj = grid.gridTiles[y][x];
        var tile = tileObj;
        MoveToTile(tile);
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
    public void MoveToTile(TileController tile)
    {
        if (tile.ContainedItem.Where(t => t.Solid).Any())
        {
            return;
        }
        int x = tile.xPos;
        int y = tile.yPos;
        playerData.xPos = x;
        playerData.yPos = y;
        var newPos = new Vector2Int(x, y);
        path.Add(newPos);
        transform.position = tile.transform.position + new Vector3(0, 3, 0);
        SignalrHandler.InvokePlayerMove(playerData.id, playerData.xPos, playerData.yPos);
    }

    bool LeftButtonDown = false;
    bool RightButtonDown = false;
    bool UpButtonDown = false;
    bool DownButtonDown = false;
    private bool canSeeTarget;

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
