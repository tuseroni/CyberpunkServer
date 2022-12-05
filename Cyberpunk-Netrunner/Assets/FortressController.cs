using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[System.Serializable]
public class programData
{
    public FortObj[] Walls;
    public FortObj[] CPU;
    public FortObj[] Memory;
    public CodeGate[] CodeGates;
}
[System.Serializable]
public enum NetObjType
{
    Wall,
    CPU,
    Memory,
    CodeGate,
    Program
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

public class FortressController : MonoBehaviour
{
    public int NumCPU = 1;
    public int NumMemory = 4;
    public int width = 10;
    public int height = 10;
    public int WallStrength = 3;
    public SkillController[] skills;
    public int Int = 3;
    public GameObject WallPrefab = null;
    public GameObject CPUPrefab = null;
    public GameObject MemoryPrefab = null;
    public GameObject CodeGatePrefab = null;
    List<WallController> Walls = new List<WallController>();
    List<CPUController> CPUs = new List<CPUController>();
    List<MemoryController> Memory = new List<MemoryController>();
    List<CodeGateController> CodeGate = new List<CodeGateController>();
    public GridController Grid = null;
    
    
    public void addFort(CyberpunkServer.Models.DTO.FortressData fort)
    {
        foreach(var wall in fort.FortressWalls)
        {
            var Tile = Grid.gridTiles[wall.yPos.Value][wall.xPos.Value].GetComponent<TileController>();
            Tile.ContainedItem = WallPrefab.GetComponent<WallController>();
            ((WallController)Tile.ContainedItem).WallStrength = WallStrength;
        }
        foreach (var wall in fort.FortressCPU)
        {
            var Tile = Grid.gridTiles[wall.yPos.Value][wall.xPos.Value].GetComponent<TileController>();
            Tile.ContainedItem = CPUPrefab.GetComponent<CPUController>();

            //var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            //var pos = Tile.transform.position + new Vector3(0, 30, 0);
            //GameObject newWall = Instantiate(CPUPrefab, pos, Quaternion.identity, Tile.transform.parent);
        }
        foreach (var wall in fort.FortressMemory)
        {
            var Tile = Grid.gridTiles[wall.yPos.Value][wall.xPos.Value].GetComponent<TileController>();
            Tile.ContainedItem = MemoryPrefab.GetComponent<MemoryController>( );
        }
        foreach (var wall in fort.FortressCodeGates)
        {
            var Tile = Grid.gridTiles[wall.yPos.Value][wall.xPos.Value].GetComponent<TileController>();
            Tile.ContainedItem = CodeGatePrefab.GetComponent<CodeGateController>();
            ((CodeGateController)Tile.ContainedItem).WallStrength = wall.WallStrength.Value;

            //var Tile = Grid.gridTiles[wall.yPos][wall.xPos];
            //var pos = Tile.transform.position + new Vector3(0, 30, 0);
            //GameObject newWall = Instantiate(CodeGatePrefab, pos, Quaternion.identity, Tile.transform.parent);
            //newWall.GetComponent<CodeGateController>().WallStrength = wall.WallStrength;
        }
        Int = CPUs.Count * 3;
    }
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
}
