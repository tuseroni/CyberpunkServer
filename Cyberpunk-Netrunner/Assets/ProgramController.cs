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
    public async Task BeginTurn()
    {
        await Task.Run(()=> CheckedFor.Clear());
    }
    public GameObject Object { get => gameObject; set { } }
    ProgramData _Program;
    RunningProgram _FortressProgram;
    public ProgramState State = ProgramState.idle;
    public PlayerController Player;
    public FortressController Fortress;
    public TextMeshProUGUI ProgramName;
    public BoundingSphere Detector;
    
    public bool DetectInvisibility { get; set; } = false;
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
                var mr = ICON.GetComponent<MeshRenderer>();
                mr.material.mainTexture = img;
            }
            if (value != null)
            {
                foreach (var function in value.ProgramFunctions)
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
    public bool Solid { get => false; set { } }
    public NetObjType Type { get => NetObjType.Program; set { } }

    public int xPos { get; set; }
    public int yPos { get; set; }
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
    public TileController currentTile;
    public GridController grid;
    public bool canLeaveFort = false;
    public bool canMove = false;
    public int ActionsDone { get; set; } = 0;
    public virtual bool canBePlaced { get; set; } = true;
    public bool Invisible { get; set; } = false;
    
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
    public virtual async Task<int> DoAction(NetActor target=null)
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
        }
        GameController.EndTurn(this);
        return damage;
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
                MaxX = wall.xPos.Value;
            }
            if (wall.yPos > MaxY)
            {
                MaxY = wall.yPos.Value;
            }
            if (wall.xPos < MinX)
            {
                MinX = wall.xPos.Value;
            }
            if (wall.yPos < MinY)
            {
                MinY = wall.yPos.Value;
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
    }
   
    
    public List<Vector2Int> path { get; set; } = new List<Vector2Int>();
    public LayerMask targetMask;
    public LayerMask PlayerMask;
    public LayerMask ProgramMask;
    public LayerMask obstructionMask;
    float radius = 20.0f * 60.0f;
    float angle = 360;
    public VisualTreeAsset ActiveProgramAsset;
    public ActiveProgramController ActiveProgramController;

    public bool canSeeTarget;
    public NetActor Target;
    TileController lastSeenTile;
    List<NetActor> CheckedFor = new List<NetActor>();
    private async Task<NetActor> FieldOfViewCheck()
    {
        if (Functions.ContainsKey("Anti Program"))
        {
            targetMask = ProgramMask;
        }
        if (Functions.ContainsKey("Anti-Personnel"))
        {
            targetMask |= PlayerMask;
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
                                    if (!CheckedFor.Contains(foundItem))
                                    {
                                        CheckedFor.Add(foundItem);
                                        if (await GameController.DoISeeTarget(foundItem, this))
                                        {
                                            canSeeTarget = true;
                                            Target = foundItem;
                                            lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos];
                                            if (Owner is PlayerController)
                                            {
                                                ((PlayerController)Owner).AddSpottedProgram((ProgramController)foundItem);
                                            }
                                            break;
                                        }
                                    }
                                }
                            }
                            else
                            {
                                if (!CheckedFor.Contains(foundItem))
                                {
                                    CheckedFor.Add(foundItem);
                                    if (await GameController.DoISeeTarget(foundItem, this))
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
        return Target;
    }
    public virtual async Task<NetActor> Search()
    {
        return await FieldOfViewCheck();
    }
    public virtual void Attack()
    {

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
                    if (Target != null)
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
            if (Target == null)
            {
                amble();
            }
            else
            {
                await DoAction(Target);
            }

        }
        
        return WaitSeconds;



    }
    public virtual async Task<float> MoveToTile(int maxMove)
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
                    if (Target != null)
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
            Target = await Search();

            if (Target == null)
            {
                MoveToTargetTile();
            }
            else
            {
                await DoAction(Target);
            }
        }
        return WaitSeconds;



    }
    void MoveToTargetTile()
    {
        if (canMove == false)
        {
            return;
        }
        if(TargetTile==null)
        {
            return;
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
    }

    public virtual async Task Guard()
    {
        await Search();
    }
    public virtual void Follow(PlayerController player)
    {

    }
    
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
                WaitSeconds = await Patrol(5);
                break;
            case ProgramState.idle:
                await Search();
                break;
            case ProgramState.guarding:
                await Guard();
                break;
            case ProgramState.chasing:
                break;
            case ProgramState.Moving:
                await MoveToTile(5);
                break;
        }
        return WaitSeconds;
    }
    TileController TargetTile;
    public void OrderMove(TileController tile)
    {
        State = ProgramState.Moving;
        TargetTile = tile;
    }
    public virtual void amble()
    {
        TileController tile = null;
        bool validMove = true;
        var newPos = new Vector2Int();
        if (canMove == false)
        {
            return;
        }
        var tries = 20;
        do
        {
            validMove = true;
            if (State == ProgramState.idle || State == ProgramState.guarding)
            {
                break;
            }
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
            return;
        }
        MoveProgram(tile, newPos);
    }
    void MoveProgram(TileController tile, Vector2Int newPos)
    {
        currentTile.ContainedItem.Remove(this);
        tile.ContainedItem.Add(this);
        currentTile = tile;
        path.Add(newPos);
        //SignalrHandler.InvokeProgramMove(FortressProgram.id, FortressProgram.DeviceID, newPos.x, newPos.y);
    }



    // Start is called before the first frame update
    void Start()
    {

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
    public int Initiative { get; set; }
    public int doEvasionCheck()
    {
        var D10 = GameController.RollD10();
        return D10 + Strength;
    }

    public int doDetectionCheck()
    {
        var D10 = GameController.RollD10();
        return D10 + Strength;
    }

    public int RollToBeHit()
    {
        return Strength + Owner.Int + Owner.Interface + GameController.RollD10();
    }

    public int RollToHit()
    {
        return FortressProgram.Strength + Owner.Int + Owner.Interface + GameController.RollD10();
    }
}
