using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using UnityEngine.UIElements;
using System.Threading.Tasks;

public enum ProgramState
{
    idle,
    patrolling,
    chasing,
    guarding,
    Moving
}
public class ProgramController : MonoBehaviour, NetActor
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
    public string Name
    {
        get
        {
            return Program.name;
        }
    }
    public virtual async Task BeginTurn()
    {
        if(ActionTurnsRemaining>0)
		{
            ActionTurnsRemaining--;
            if (ActionTurnsRemaining == 0)
            {
                await FinishAction();
            }
        }
        await Task.Run(()=> VisibilityLookup.Clear());
    }
    public GameObject Object { get => gameObject; set { } }
    ProgramData _Program;
    RunningProgram _FortressProgram;
    public ProgramState State = ProgramState.idle;
    public PlayerController Player;
    public FortressController Fortress;
    public TextMeshProUGUI ProgramName;
    public BoundingSphere Detector;
    public bool Selected { get; set; }
    public virtual bool DetectInvisibility { get; set; } = false;
    public virtual int ActionTurns { get; set; } = 1;
    public virtual int ActionTurnsRemaining { get; set; } = 0;
    public RunningProgram FortressProgram
    {
        get
        {
            return _FortressProgram;
        }
        set
        {
            _FortressProgram = value;
            Program = value.Program;
        }
    }
    public ProgramData Program
    {
        get
        {
            return _Program;
        }
        set
        {
            _Program = value;
            Functions.Clear();
            Options.Clear();
            var ICON = transform.Find("ICON")?.gameObject;
            Texture2D img = Resources.Load<Texture2D>($"Icons/{value.name}");
            if (img != null && ICON !=null)
            {
                MR = ICON.GetComponent<MeshRenderer>();
                MR.material.mainTexture = img;
                NonSelectedMaterial = MR.material;
            }
            if (value != null)
            {
                foreach (var function in value.ProgramFunction)
                {
                    Functions.Add(function.name, function);
                }
                foreach (var option in value.ProgramOptions)
                {
                    Options.Add(option.name, option);
                }
            }
        }
    }
    public ProgramSummoner Owner { get; set; }
    public virtual bool Solid { get; set; } = true;
    public NetObjType Type { get => NetObjType.Program; set { } }

    public virtual int xPos { get; set; }
    public virtual int yPos { get; set; }
    public int NumActions { get; set; } = 1;

    public Dictionary<string, ProgramFunctionsData> Functions = new Dictionary<string, ProgramFunctionsData>();
    public Dictionary<string, ProgramOptionsData> Options = new Dictionary<string, ProgramOptionsData>();
    public ProgramController[] Subroutines;
    public int Strength
    {
        get
        {
            return FortressProgram?.Strength ?? 0;
        }
        set
        {
            if(FortressProgram!=null)
            {
                FortressProgram.Strength = value;
            }
        }
    }
    public virtual bool Rezzed 
    {
        get
        {
            return ActiveProgramController?.ProgramRezzed??true;
        }
        set
        {
            if (ActiveProgramController != null)
            {
                ActiveProgramController.ProgramRezzed = value;
            }
        }
    }
    public int MaxX = 0;
    public int MaxY = 0;
    public int MinX = 999;
    public int MinY = 999;
    public TileController currentTile { get; set; }
    public GridController grid;
    public bool canLeaveFort = false;
    public bool canMove = false;
    public int ActionsDone { get; set; } = 0;
    public virtual bool canBePlaced { get; set; } = true;
    public bool Invisible { get; set; } = false;
    private void OnMouseUp()
    {
        if (grid.GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            //MR.material = SelectedMaterial;
            grid.GameController.TargetSelect(this);
            MR.material = NonSelectedMaterial;
        }
    }
    private void OnMouseEnter()
    {
        if (grid.GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            MR.material = HighlightMaterial;
        }
    }
    private void OnMouseExit()
    {
        if (grid.GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            MR.material = NonSelectedMaterial;
        }
    }
    public int RollInitiative()
    {
        Initiative = 0;
        if(Owner is PlayerController)
        {
            Initiative= ((PlayerController)Owner).RollInitiative();
        }
        else if(Owner is FortressController)
        {
            Initiative = ((FortressController)Owner).RollInitiative();
        }
        else
        {
            
        }
        return Initiative;
    }
    public virtual async Task<int> DoAction(NetItem target=null)
    {
        if(ActionsDone>=NumActions)
        {
            return 0;
        }
        int damage = 0;
        if(!await GameController.RollToHit(target, this))
        {
            GameController.EndTurn(this);
            return 0;
        }
        if(Functions.ContainsKey("Alert") && target is NetActor)
        {
            Owner.Alert(this, (NetActor)target);
        }

        if (target.Type==NetObjType.Program)
        {
            if(Functions.ContainsKey("Anti Program"))
            {
                var newDamage = new Damage { Type = DamageType.Strength, Value = damage = GameController.RollD6() };
                await GameController.DoDamage(target, newDamage);
            }
        }
        else if(target.Type==NetObjType.NetRunner)
        {
            if (Functions.ContainsKey("Anti-Personnel"))
            {
                var newDamage = new Damage { Type = DamageType.HP, Value = damage = GameController.RollD6() };
                await GameController.DoDamage(target, newDamage);
            }
            if(Options.ContainsKey("Hang Up"))
            {
                await ((PlayerController)target).HangUp();
            }
        }
        else if(target.Type==NetObjType.CodeGate && Functions.ContainsKey("Decryption"))
		{
            var newDamage = new Damage { Type = DamageType.Strength, Value = damage = GameController.RollD6() };
            await GameController.DoDamage(target, newDamage);
        }
        else if (target.Type == NetObjType.Wall && Functions.ContainsKey("Intrusion"))
        {
            var newDamage = new Damage { Type = DamageType.Strength, Value = damage = GameController.RollD6() };
            await GameController.DoDamage(target, newDamage);
        }
        GameController.EndTurn(this);
        return damage;
    }
    public void Possess(ProgramSummoner Owner)
    {
        this.Owner = Owner;
    }
    public virtual async Task FinishAction()
	{
        await Task.Yield();
	}
    public int TakeDamage(Damage damage)
    {
        if (damage.Type != DamageType.Strength)
        {
            return 0;
        }
        else
        {
            Strength -= damage.Value;
            return damage.Value;
        }
    }
    public virtual void addProgram(GridController grid, RunningProgram program, ProgramSummoner Summoner)
    {
        MaxX = -1;
        MaxY = -1;
        MinX = -1;
        MinY = -1;
        FortressProgram = program;
        if (canBePlaced)
        {
            var tile = grid.gridTiles[FortressProgram.yPos][FortressProgram.xPos];
            tile.ContainedItem.Add(this);
            currentTile = tile;
        }
        else
        {
            transform.parent = ((PlayerController)Summoner).Object.transform;
            if (!canBePlaced)
            {
                transform.localPosition = new Vector3(0f, 34f, 6f);
            }
            return;
        }
        this.grid = grid;
        this.xPos = program.xPos;
        this.yPos = program.yPos;
        this.Owner = Summoner;
        Player = (PlayerController)Summoner;
        if (Options.ContainsKey("Movement ability"))
        {
            canMove = true;
            State = ProgramState.patrolling;
            MaxMove = 5;
        }
        canLeaveFort = true;
        if (program.Program != null && ProgramName != null)
        {
            ProgramName.text = program.Program.name;
        }
        //Search();
        //if (canSeeTarget && Target != null)
        //{

        //    DoAction(Target);

        //}
    }
    public void addProgram(GridController grid, FortressData fortress, FortressProgramsData program,FortressController Summoner)
    {
        foreach (var wall in fortress.FortressWalls)
        {
            if (wall.xPos > MaxX)
            {
                MaxX = wall.xPos;
            }
            if (wall.yPos > MaxY)
            {
                MaxY = wall.yPos;
            }
            if (wall.xPos < MinX)
            {
                MinX = wall.xPos;
            }
            if (wall.yPos < MinY)
            {
                MinY = wall.yPos;
            }
        }
        this.Owner = Summoner;
        FortressProgram = program;
        var tile = grid.gridTiles[FortressProgram.yPos][FortressProgram.xPos];
        tile.ContainedItem.Add(this);
        currentTile = tile;
        this.grid = grid;
        this.xPos = program.xPos;
        this.yPos = program.yPos;
        if (Options.ContainsKey("Movement ability"))
        {
            canMove = true;
            State = ProgramState.patrolling;
            MaxMove = 5;
        }
        if (Options.ContainsKey("Trace"))
        {
            canLeaveFort = true;
        }
        if (Options.ContainsKey("Invisible"))
        {
            Invisible = true;
        }

        if (program.Program != null && ProgramName != null)
        {
            ProgramName.text = program.Program.name;
        }
        if (tile.ContainedItem.Where(x => x is MemoryController).Any())
        {
            Solid = false;
            Invisible = true;
            Hidden = true;
            if (MR != null)
            {
                MR.enabled = false;
            }
            if (ProgramName != null)
            {
                ProgramName.enabled = false;
            }
        }
        else
        {
            Solid = true;
            Invisible = false;
            Hidden = false;
            if (MR != null)
            {
                MR.enabled = true;
            }
            if (ProgramName != null)
            {
                ProgramName.enabled = true;
            }
        }
    }
   
    
    public List<Vector2Int> path { get; set; } = new List<Vector2Int>();
    public LayerMask targetMask;
    public LayerMask PlayerMask;
    public LayerMask ProgramMask;
    public LayerMask DeviceMask;
    public LayerMask obstructionMask;
    public virtual float radius { get; set; }=20.0f * 60.0f;
    float angle = 360;
    public VisualTreeAsset ActiveProgramAsset;
    public VisualElement UIElement { get; set; }
    public ActiveProgramController ActiveProgramController;

    public bool canSeeTarget;
    public NetItem Target;
    TileController lastSeenTile;
    Dictionary<NetActor,bool> VisibilityLookup = new Dictionary<NetActor,bool>();
    private async Task<NetItem> FieldOfViewCheck(NetItem _target = null)
    {
        if (Functions.ContainsKey("Anti Program") || Functions.ContainsKey("Detection"))
        {
            targetMask = ProgramMask;
        }
        if (Functions.ContainsKey("Anti-Personnel") || Functions.ContainsKey("Detection"))
        {
            targetMask |= PlayerMask;
        }
        if(Functions.ContainsKey("Anti-System"))
        {
            targetMask|= DeviceMask;
        }
        Target = null;
        canSeeTarget = false;
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
                if (_target != null && _target.Object.transform != target)
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
                                if (this.Owner != foundItem.Owner)
                                {
                                    if (!VisibilityLookup.ContainsKey(foundItem))
                                    {
                                        
                                        if (await GameController.DoISeeTarget(foundItem, this))
                                        {
                                            VisibilityLookup.Add(foundItem,true);
                                            canSeeTarget = true;
                                            Target = foundItem;
                                            lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos];
                                            if (Owner is PlayerController)
                                            {
                                                ((PlayerController)Owner).AddSpottedProgram((ProgramController)foundItem);
                                            }
                                            break;
                                        }
                                        else
                                        {
                                            VisibilityLookup.Add(foundItem, false);
                                        }
                                    }
                                    else
                                    {
                                        if(VisibilityLookup[foundItem])
                                        {
                                            canSeeTarget = true;
                                            Target = foundItem;
                                            lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos];
                                            break;
                                        }
                                    }
                                }
                            }
                            else if (foundItem is Device || foundItem is PlayerController)
                            {
                                if (foundItem != Owner && foundItem.Owner !=Owner)
                                {
                                    if (!VisibilityLookup.ContainsKey(foundItem))
                                    {

                                        if (await GameController.DoISeeTarget(foundItem, this))
                                        {
                                            VisibilityLookup.Add(foundItem, true);
                                            canSeeTarget = true;
                                            Target = foundItem;
                                            lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos];
                                            break;
                                        }
                                        else
                                        {
                                            VisibilityLookup.Add(foundItem, false);
                                        }
                                    }
                                    else
                                    {
                                        if (VisibilityLookup[foundItem])
                                        {
                                            canSeeTarget = true;
                                            Target = foundItem;
                                            lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos];
                                            break;
                                        }
                                    }
                                }
                            }

                        }
                    }
                }
            }
        }
        return Target;
    }
    public virtual async Task<NetItem> Search(NetItem _target=null)
    {
        return await FieldOfViewCheck(_target);
    }
    public virtual async void Attack(NetItem Target,TileController _lastSeenTile=null)
    {
        State = ProgramState.chasing;
        if(_lastSeenTile!=null)
        {
            lastSeenTile = _lastSeenTile;
        }
        this.Target = Target;
        await Task.Yield();
        
    }
    public virtual int Range
    {
        get; set;
    } = 1;
    public virtual bool TargetInRange
    {
        get
        {
            return (new Vector2(Target.xPos, Target.yPos) - new Vector2(xPos, yPos)).sqrMagnitude <= (Range * Range);
        }
    }
   
    public virtual async Task<float> Patrol(int maxMove)
    {
        float WaitSeconds = 0.2f;
        if (path.Count == maxMove)
        {
            if (WaitForSignal)
            {
                if (Continue)
                {

                    //maxMove = Random.Range(1, 6);
                    //path.Clear();
                    //amble();
                    //Continue = false;
                    if (Target != null && TargetInRange)
                    {
                        await DoAction(Target);
                    }
                    else
                    {
                        GameController.EndTurn(this);
                    }
                    WaitSeconds = 1.0f;
                }
            }
            else
            {

                path.Clear();
                amble();
                WaitSeconds = 1.0f;
            }
        }
        else
        {
            Target = await Search();
            var canMove = true;
            if (Target == null)
            {
                canMove = amble();
            }
            else if (TargetInRange)
            {
                await DoAction(Target);
            }
            else
            {
                canMove= amble();
            }
            if(!canMove)
            {
                GameController.EndTurn(this);
            }
        }
        
        return WaitSeconds;



    }
    public virtual async Task<float> MoveToTile(int maxMove, NetItem _target=null)
    {
        
        float WaitSeconds = 0.2f;
        if (path.Count == maxMove)
        {
            if (WaitForSignal)
            {
                if (Continue)
                {

                    //maxMove = Random.Range(1, 6);
                    //path.Clear();
                    //amble();
                    //Continue = false;
                    if (Target != null && TargetInRange)
                    {
                        await DoAction(Target);
                    }
                    else
                    {
                        GameController.EndTurn(this);
                    }
                    WaitSeconds = 1.0f;
                }
            }
            else
            {

                path.Clear();
                MoveToTargetTile();
                WaitSeconds = 1.0f;
            }
        }
        else
        {
            Target = await Search(_target);
            if (Target == null || !TargetInRange)
            {
                if (Target != null)
                {
                    TargetTile = lastSeenTile;
                }
                if(!MoveToTargetTile())
                {
                    GameController.EndTurn(this);
                }
            }
            else 
            {
                await DoAction(Target);
            }
        }
        return WaitSeconds;
    }
    bool MoveToTargetTile()
    {
        if (canMove == false)
        {
            return false;
        }
        if(TargetTile==null)
        {
            return false;
        }
        if(currentTile==TargetTile)
        {
            return false;
        }
        var neighbors = new List<TileController>
            {
                grid.gridTiles[yPos+1][xPos],
                grid.gridTiles[yPos][xPos+1],
                grid.gridTiles[(yPos-1)>=0?yPos-1:0][xPos],
                grid.gridTiles[yPos][(xPos-1)>=0?xPos-1:0]
            };
        var validNeighors = new List<TileController>();
        var vectorToTile = new Vector2Int(TargetTile.xPos, TargetTile.yPos);
        var topSqDist = 9999999;
        TileController bestTile = null;
        foreach (var neighbor in neighbors)
        {
            if (!neighbor.ContainedItem.Where(x => x.Solid).Any())
            {
                var newPos = new Vector2Int(neighbor.xPos, neighbor.yPos);
                if (path.Contains(newPos))
                {
                    continue;
                }
                if (bestTile == null)
                {
                    topSqDist = (newPos - vectorToTile).sqrMagnitude;
                    bestTile = neighbor;
                }
                else
                {
                    var sqDis = (newPos - vectorToTile).sqrMagnitude;
                    if (sqDis < topSqDist)
                    {
                        topSqDist = sqDis;
                        bestTile = neighbor;
                    }
                }
                //validNeighors.Add(neighbor);
            }
        }
        if (bestTile != null)
        {
            MoveProgram(bestTile, new Vector2Int(bestTile.xPos, bestTile.yPos));
        }
        else
        {
            return false;
        }
        return true;
    }

    public virtual async Task Guard()
    {
        await Search();
        if(Target != null && TargetInRange)
        {
            await DoAction(Target);
        }
        else
        {
            GameController.EndTurn(this);
        }
    }
    public virtual void Follow(PlayerController player)
    {

    }
    public virtual int MaxMove { get; set; } = 0;
    public async Task<float> DoStateAction()
    {
        float WaitSeconds = 0.2f;
        if(WaitForSignal && !Continue)
        {
            return 1.0f;
        }
        switch (State)
        {
            case ProgramState.patrolling:
                WaitSeconds = await Patrol(MaxMove);
                if(Target != null)
                {
                    State = ProgramState.chasing;
                    TargetTile = lastSeenTile;
                }
                break;
            case ProgramState.idle:
                await Search();
                if(Target!=null)
                {
                    State = ProgramState.chasing;
                    TargetTile = lastSeenTile;
                }
                else
                {
                    GameController.EndTurn(this);
                }
                break;
            case ProgramState.guarding:
                await Guard();
                break;
            case ProgramState.chasing:
                TargetTile = lastSeenTile;
                await MoveToTile(MaxMove, Target);
                break;
            case ProgramState.Moving:
                await MoveToTile(MaxMove);
                break;
        }
        return WaitSeconds;
    }
    TileController TargetTile;
    public Material NonSelectedMaterial;
    public Material HighlightMaterial;
    public MeshRenderer MR;

    public void OrderMove(TileController tile)
    {
        State = ProgramState.Moving;
        TargetTile = tile;
    }
    public virtual bool amble()
    {
        TileController tile = null;
        bool validMove = true;
        var newPos = new Vector2Int();
        if (canMove == false)
        {
            return false;
        }
        var tries = 20;
        do
        {
            validMove = true;
            var dir = (int)Mathf.Floor(Random.value * 4);
            newPos = new Vector2Int(xPos, yPos);
            switch (dir)
            {
                case 0:
                    newPos.y -= 1;
                    break;
                case 1:
                    newPos.x += 1;
                    break;
                case 2:
                    newPos.y += 1;
                    break;
                case 3:
                    newPos.x -= 1;
                    break;
            }
            if (grid.gridTiles.ContainsKey(newPos.x) && grid.gridTiles.ContainsKey(newPos.y))
            {
                tile = grid.gridTiles[newPos.y][newPos.x];
                if (tile.ContainedItem.Where(t => t.Solid).Any())
                {
                    validMove = false;
                }
                if (!canLeaveFort || (canLeaveFort && State != ProgramState.chasing))
                {
                    if (MaxX > -1)
                    {
                        if (newPos.x > (MaxX + 1) || newPos.y > (MaxY + 1) || newPos.x < (MinX - 1) || newPos.y < (MinY - 1))
                        {
                            validMove = false;
                        }
                    }
                    else
                    {
                        if (newPos.x > (Player.playerData.xPos + 5) || newPos.y > (Player.playerData.yPos + 5) || newPos.x < (Player.playerData.xPos - 5) || newPos.y < (Player.playerData.yPos - 5))
                        {
                            validMove = false;
                        }
                    }
                }
                if (path.Contains(newPos))
                {
                    validMove = false;
                }
            }
            else
            {
                validMove = false;
            }
            tries--;
        } while (!validMove && tries > 0);
        if (!validMove)
        {
            path.Clear();
            return false;
        }
        MoveProgram(tile, newPos);
        return true;
    }
    void MoveProgram(TileController tile, Vector2Int newPos)
    {
        currentTile.ContainedItem.Remove(this);
        tile.ContainedItem.Add(this);
        currentTile = tile;
        path.Add(newPos);
        if (Owner is FortressController)
        {
            if (tile.ContainedItem.Where(x => x is MemoryController).Any())
            {
                Solid = false;
                Invisible = true;
                Hidden = true;
                if (MR != null)
                {
                    MR.enabled = false;
                }
                ProgramName.enabled = false;
            }
            else
            {
                Solid = true;
                Invisible = false;
                Hidden = false;
                if (MR != null)
                {
                    MR.enabled = true;
                }
                ProgramName.enabled = true;
            }
        }
        if (!GameController.offline)
        {
            SignalrHandler.InvokeProgramMove(this.FortressProgram, newPos.x, newPos.y);
        }
    }



    // Start is called before the first frame update
    void Start()
    {
        //MR = GetComponent<MeshRenderer>();
        HandleState();

    }
    public bool WaitForSignal { get; set; } = true;
    public bool Continue { get; set; } = true;
    async Task HandleState()
    {

        while (true)
        {
            var waitTime = await DoStateAction();
            await Task.Delay((int)(waitTime * 1000));
        }
    }
    // Update is called once per frame
    void Update()
    {

    }
    public bool Hidden { get; set; }
    public int Initiative { get; set; }
    public int doEvasionCheck(bool SeekerIgnoresInvisibility = false)
    {
        if ((Options.ContainsKey("Invisibility") || Invisible)&& !SeekerIgnoresInvisibility)
        {
            var D10 = GameController.RollD10();
            //if (D10 == 1)
            //{
            //    GameController.HandleFumble(this);
            //    return 0;
            //}
            return D10 + Strength + (Options.ContainsKey("Invisibility") ? 2 : 0);
        }
        else
        {
            return 0;
        }
    }

    public int doDetectionCheck()
    {
        var D10 = GameController.RollD10();
        //if (D10 == 1)
        //{
        //    GameController.HandleFumble(this);
        //    return 0;
        //}
        return D10 + Strength;
    }

    public virtual async Task<int> RollToBeHit()
    {
        await Task.Yield();//todo: add diceware here.
        var d10 = GameController.RollD10();
        //if (d10 == 1)
        //{
        //    GameController.HandleFumble(this);
        //    return 0;
        //}
        return Strength + d10;
        return Strength + Owner.Int + Owner.Interface + d10;
    }

    public virtual async Task<int> RollToHit()
    {
        await Task.Yield();//todo: add diceware here.
        return GameController.RollD10() + Strength;

        //var d10 = GameController.RollD10();
        //if (d10 == 1)
        //{
        //    GameController.HandleFumble(this);
        //    return 0;
        //}
        
    }
}
