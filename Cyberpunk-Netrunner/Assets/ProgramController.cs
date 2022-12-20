using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;

public enum ProgramState
{
    idle,
    patrolling,
    chasing,
    guarding
}
public class ProgramController : MonoBehaviour, NetItem
{
    public GameObject Object { get => gameObject; set { } }
    ProgramData _Program;
    RunningProgram _FortressProgram;
    public ProgramState State = ProgramState.idle;
    public PlayerController Player;
    public FortressController Fortress;
    public TextMeshProUGUI ProgramName;
    public BoundingSphere Detector;
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
            Str = value.Strength;
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

    public Dictionary<string, ProgramFunctionsData> Functions = new Dictionary<string, ProgramFunctionsData>();
    public Dictionary<string, ProgramOptionsData> Options = new Dictionary<string, ProgramOptionsData>();
    public ProgramController[] Subroutines;
    public int Str = 1;
    public bool Rezzed = false;
    int MaxX = 0;
    int MaxY = 0;
    int MinX = 999;
    int MinY = 999;
    TileController currentTile;
    GridController grid;
    public bool canLeaveFort = false;
    public bool canMove = false;
    public void addProgram(GridController grid, RunningProgram program,ProgramSummoner Summoner)
    {
        MaxX = -1;
        MaxY = -1;
        MinX = -1;
        MinY = -1;
        FortressProgram = program;
        var tile = grid.gridTiles[FortressProgram.yPos][FortressProgram.xPos].GetComponent<TileController>();
        tile.ContainedItem.Add(this);
        currentTile = tile;
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
        if (program.Program != null)
        {
            ProgramName.text = program.Program.name;
        }
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
        var tile = grid.gridTiles[FortressProgram.yPos][FortressProgram.xPos].GetComponent<TileController>();
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
        if (program.Program != null)
        {
            ProgramName.text = program.Program.name;
        }
    }
    public List<Vector2Int> path = new List<Vector2Int>();
    public LayerMask targetMask;
    public LayerMask PlayerMask;
    public LayerMask ProgramMask;
    public LayerMask obstructionMask;
    float radius = 20.0f * 60.0f;
    float angle = 360;

    public bool canSeePlayer;
    TileController lastSeenTile;
    private void FieldOfViewCheck()
    {
        if (Functions.ContainsKey("Anti Program"))
        {
            targetMask = ProgramMask;
        }
        if (Functions.ContainsKey("Anti-Personnel"))
        {
            targetMask |= PlayerMask;
        }

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
                        
                        NetItem foundItem = target.gameObject.GetComponent<NetItem>();
                        if (foundItem != null)
                        {
                            if(foundItem is ProgramController)
                            {
                                if (this.Owner != foundItem.Owner)
                                {
                                    canSeePlayer = true;
                                    lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos].GetComponent<TileController>();
                                    break;
                                }
                            }
                            else
                            {
                                canSeePlayer = true;
                                lastSeenTile = grid.gridTiles[foundItem.yPos][foundItem.xPos].GetComponent<TileController>();
                                break;
                            }   
                        }
                    }
                    else
                        canSeePlayer = false;
                }
                else
                    canSeePlayer = false;
            }
        }
        else if (canSeePlayer)
            canSeePlayer = false;
    }
    public void Search()
    {
        FieldOfViewCheck();
    }
    public void Attack()
    {

    }
    public float Patrol(int maxMove)
    {
        float WaitSeconds = 0.2f;
        if (path.Count == maxMove)
        {
            if (WaitForSignal)
            {
                if (Continue)
                {

                    //maxMove = Random.Range(1, 6);
                    path.Clear();
                    amble();
                    Continue = false;
                    return 1.0f;
                }
            }
            else
            {

                path.Clear();
                amble();
                return 1.0f;
            }
        }
        else
        {
            Search();
            if (!canSeePlayer)
            {
                amble();
            }
            else
            {

            }
        }
        return WaitSeconds;



    }
    public void Guard()
    {
        Search();
    }
    public void Follow(PlayerController player)
    {

    }
    public void MoveToTile(TileController tile)
    {

    }
    public float DoAction()
    {
        float WaitSeconds = 0.2f;
        switch (State)
        {
            case ProgramState.patrolling:
                WaitSeconds = Patrol(5);
                break;
            case ProgramState.idle:
                Search();
                break;
            case ProgramState.guarding:
                Guard();
                break;
            case ProgramState.chasing:
                break;
        }
        return WaitSeconds;
    }
    public void amble()
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
                tile = grid.gridTiles[newPos.y][newPos.x].GetComponent<TileController>();
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
        StartCoroutine(HandleState());

    }
    public bool WaitForSignal = false;
    public bool Continue = true;
    IEnumerator HandleState()
    {

        while (true)
        {
            var waitTime = DoAction();
            yield return new WaitForSeconds(waitTime);
        }
    }
    // Update is called once per frame
    void Update()
    {

    }
}
