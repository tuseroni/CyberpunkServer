using CyberpunkServer.Models.DTO;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
//[System.Serializable]
//public class programData
//{
//    public FortObj[] Walls;
//    public FortObj[] CPU;
//    public FortObj[] Memory;
//    public CodeGate[] CodeGates;
//}
[System.Serializable]
public enum NetObjType
{
    Wall,
    CPU,
    Memory,
    CodeGate,
    Program,
    NetRunner,
    Cyberdeck,
    Computer
}
public enum ProgramType
{
    Intrustion,
    Decryption,
    Detection,
    AntiSystem,
    Evasion,
    Protection,
    AntiProgram,
    Antipersonnel,
    Multipurpos,
    Controller,
    Utility,
    Demon,
    Daemon
}
public enum ProgramFunctions
{
    Alarm,
    AntiCompiler,
    Antipersonnel,
    AntiProgram,
    AntiSystem,
    Compiler,
    Controller,
    Decryption,
    Detection,
    Disguise,
    Doppleganger,
    Evasion,
    Interactive,
    Intrusion,
    Protection,
    SoftwareEditor,
    Stealth,
    Utility
}
public enum ProgramOptions
{
    AutoRerezz,
    CodeOptimization,
    ConversationalAbility,
    Endurance,
    HangUp,
    Icon_Simple,
    Icon_Contextural,
    Icon_fractal,
    Icon_photorealistic,
    icon_superrealistic,
    Invisibility,
    Memory,
    MovementAbility,
    Noisy,
    OneUse,
    PseudoIntelect,
    Recogonition,
    Speed,
    Trace
}
[System.Serializable]
public class FortObj
{
    public int xPos = 0;
    public int yPos = 0;
    public NetObjType Type;

}
[System.Serializable]
public class CodeGate : FortObj
{
    public int WallStrength;
}
public enum AlertState
{
    unalerted,
    weary,
    alerted
}
public class FortressController : MonoBehaviour, ProgramSummoner
{
    public int NumCPU = 1;
    public int NumMemory = 4;
    public int width = 10;
    public int height = 10;
    public int WallStrength = 3;
    public SkillController[] skills;
    public int Int { get; set; } = 3;
    public int Interface { get; set; } = 10;
    public GameObject WallPrefab = null;
    public GameObject CPUPrefab = null;
    public GameObject MemoryPrefab = null;
    public GameObject CodeGatePrefab = null;
    public GameObject ProgramPrefab = null;
    List<WallController> Walls = new List<WallController>();
    List<CPUController> CPUs = new List<CPUController>();
    List<MemoryController> Memory = new List<MemoryController>();
    List<CodeGateController> CodeGate = new List<CodeGateController>();
    public BoxCollider boundingBox;
    public GridController Grid = null;
    public GameController GameController;
    TileController LastSeenTile;
    AlertState State;
    
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

    public Bounds bounds 
    {
        get
        {
            return new Bounds(new Vector3(boundingBox.bounds.center.x * 60, boundingBox.bounds.center.y * 30, boundingBox.bounds.center.z * 60)
                , new Vector3(boundingBox.bounds.size.x * 60, boundingBox.bounds.size.y * 60, boundingBox.bounds.size.z * 60));
        }
        set
        {
            boundingBox.center = new Vector3(value.center.x * 60, value.center.y * 30, value.center.z * 60);
            boundingBox.size = new Vector3(value.size.x * 60, value.size.y * 60, value.size.z * 60);
        }
    }

	public int Initiative { get; set; }
    public bool WaitForSignal { get; set; } = true;
    public bool Continue { get; set; } = false;
	public int NumActions { get; set; }
    public int ActionsDone { get; set; } = 0;

	List<ProgramController> ProgramQueue = new List<ProgramController>();
    public async Task runQueue()
    {
        foreach (var program in ProgramQueue)
        {
            if (program.ActionsDone >= program.NumActions || !program.Rezzed)
            {
                continue;
            }
            program.Continue = true;
            await program.BeginTurn();
            await Task.Run(() =>
            {
                while (program.Continue)
                {
                    Task.Delay(100);
                }
            });
        }
    }
    private void GameController_onProgramDestroyed(ProgramController program)
    {
        if (ActivePrograms.Contains(program))
        {
            ActivePrograms.Remove(program);
        }
        if (ProgramQueue.Contains(program))
        {
            ProgramQueue.Remove(program);
        }

    }
    public int RollInitiative()
    {
        var initiative= GameController.RollD10() + Int;
        this.Initiative = initiative;
        return initiative;
        //return GameController.RollD10() + Int;
    }
    public FortressData Fortress;
    public void addFort(CyberpunkServer.Models.DTO.FortressData fort)
    {
        Fortress = fort;
        int MaxX = 0;
        int MaxY = 0;
        int MinX = 999;
        int MinY = 999;
        NumActions = 1 + (int)Mathf.Floor(fort.FortressCPU.Count / 2); //"A computer may perform one extra action per turn for every two additional CPU present in the system"~pg 152
        
        foreach (var wall in fort.FortressWalls)
        {
            var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            var wallObj = GameObject.Instantiate(WallPrefab,Vector3.zero, Quaternion.identity);
            var wallController= wallObj.GetComponent<WallController>();
            wallController.WallStrength = WallStrength;
            wallController.GameController = GameController;
            wallController.Owner = this;
            Tile.ContainedItem.Add(wallController);
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
        var offset = new Vector3(MinX, WallStrength * 30, MinY);
        var size = new Vector3(MaxX - MinX, WallStrength, MaxY - MinY);
        var newBounds = new Bounds((size/2)+offset, size);
        bounds = newBounds;
        foreach (var wall in fort.FortressCPU)
        {
            var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            var wallObj = GameObject.Instantiate(CPUPrefab, Vector3.zero, Quaternion.identity);
            var controller = wallObj.GetComponent<CPUController>();
            CPUs.Add(controller);
            Tile.ContainedItem.Add(controller);
            controller.Owner = this;

            //var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            //var pos = Tile.transform.position + new Vector3(0, 30, 0);
            //GameObject newWall = Instantiate(CPUPrefab, pos, Quaternion.identity, Tile.transform.parent);
        }
        foreach (var wall in fort.FortressMemory)
        {
            var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            var wallObj = GameObject.Instantiate(MemoryPrefab, Vector3.zero, Quaternion.identity);
            var controller = wallObj.GetComponent<MemoryController>();
            Tile.ContainedItem.Add(controller);
            controller.Owner = this;
        }
        foreach (var wall in fort.FortressCodeGates)
        {
            var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            var wallObj = GameObject.Instantiate(CodeGatePrefab, Vector3.zero, Quaternion.identity);
            var codeGateController= wallObj.GetComponent<CodeGateController>();
            codeGateController.GameController = GameController;
            codeGateController.WallStrength = wall.WallStrength.Value;
            codeGateController.Owner = this;
            Tile.ContainedItem.Add(codeGateController);
            
        }
        foreach(var program in fort.FortressPrograms)
        {
            if (program.Strength > 0)
            {
                var prefab = Resources.Load<GameObject>($"Programs/{program.Program.name}");
                if (prefab == null)
                {
                    prefab = ProgramPrefab;
                }
                var wallObj = GameObject.Instantiate(prefab, Vector3.zero, Quaternion.identity);
                var controller = wallObj.GetComponent<ProgramController>();
                controller.GameController = GameController;
                controller.addProgram(GameController.grid, Fortress, program, this);
                //GameController.addProgram(controller, this, program);
                ActivePrograms.Add(controller);
                ProgramQueue.Add(controller);
                if(controller.Functions.ContainsKey("Anti-Personnel"))
                {
                    AntiPersonnel.Add(controller);
                }
                if(controller.Functions.ContainsKey("Anti-Program"))
                {
                    AntiProgram.Add(controller);
                }
                //wallObj.GetComponent<ProgramController>().addProgram(Grid, fort, program,this);
            }
        }
        Int = CPUs.Count * 3;
		GameController.onProgramDestroyed += GameController_onProgramDestroyed;
    }

	

	List<ProgramController> ActivePrograms = new List<ProgramController>();
    List<ProgramController> AntiPersonnel = new List<ProgramController>();
    List<ProgramController> AntiProgram = new List<ProgramController>();
    // Start is called before the first frame update
    void Start()
    {
        string json = @"{""Walls"":[{""xPos"":4,""yPos"":2,""type"":1},{""xPos"":3,""yPos"":3,""type"":1},{""xPos"":2,""yPos"":4,""type"":1},{""xPos"":2,""yPos"":5,""type"":1},{""xPos"":2,""yPos"":6,""type"":1},{""xPos"":3,""yPos"":7,""type"":1},{""xPos"":4,""yPos"":7,""type"":1},{""xPos"":5,""yPos"":7,""type"":1},{""xPos"":6,""yPos"":6,""type"":1},{""xPos"":7,""yPos"":6,""type"":1},{""xPos"":7,""yPos"":4,""type"":1},{""xPos"":6,""yPos"":3,""type"":1}],""CPU"":[{""xPos"":4,""yPos"":5,""type"":2}],""Memory"":[{""xPos"":3,""yPos"":5,""type"":3},{""xPos"":5,""yPos"":5,""type"":3},{""xPos"":4,""yPos"":4,""type"":3},{""xPos"":5,""yPos"":4,""type"":3}],""CodeGates"":[{""xPos"":5,""yPos"":2,""type"":4,""WallStrength"":1},{""xPos"":7,""yPos"":5,""type"":4,""WallStrength"":2}]}
";
        
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public async void Alert(ProgramController Sender, NetActor Target)
    {
        await GameController.SendUIMessage($"Fortress has been alerted and is targeting {Target.Name}");
        if (Target is PlayerController)
        {
            foreach (var prog in AntiPersonnel)
            {

                prog.Attack(Target, LastSeenTile = Target.currentTile);//the only strategy the fortress knows: SWARM.
            }
        }
        else if(Target is ProgramController)
        {
            foreach (var prog in AntiProgram)
            {

                prog.Attack(Target, LastSeenTile = Target.currentTile);//the only strategy the fortress knows: SWARM.
            }
        }
    }

	public async Task BeginTurn()
	{
        ProgramQueue.ForEach(x =>
        {
            x.ActionsDone = 0;
            x.path.Clear();
        });
        await runQueue();
        //await Task.Yield();
        GameController.EndTurn(this);
	}
}
