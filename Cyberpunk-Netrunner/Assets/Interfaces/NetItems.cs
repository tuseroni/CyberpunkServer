using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;
using System.Threading.Tasks;
public interface ProgramSummoner : iHaveInitiative, iHaveActions
{
    Bounds bounds { get; set; }
    int Int { get; set; }
    int Interface { get; set; }
    void Alert(ProgramController Sender, NetActor Target);
    GameController Ref { get; set; }
    
    Task runQueue();
    
}
public interface iHaveInitiative
{
    int RollInitiative();
    int Initiative { get; set; }
    bool WaitForSignal { get; set; }
    bool Continue { get; set; }
    Task BeginTurn();
}
public interface iHaveActions
{
    int NumActions { get; set; }
    int ActionsDone { get; set; }
}
public interface Selectable
{
    bool Selected { get; set; }
}
public partial interface NetItem : Selectable
    {
        GameObject Object
        {
            get;
            set;
        }
        ProgramSummoner Owner { get; set; }
        ProgramSummoner ApparentOwner { get; set; }
        GameController Ref { get; set; }
        bool Solid { get; set; }
        NetObjType Type { get; set; }
        int xPos { get; set; }
        int yPos { get; set; }
        Task<int> RollToBeHit();
        Task<int> RollToHit();
        string Name { get; }
        int TakeDamage(Damage damage);
    }
    public interface NetActor : NetItem, iHaveInitiative, iHaveActions
{
        int doEvasionCheck(bool SeekerIgnoresInvisibility=false);
        int doDetectionCheck();
        bool Invisible { get; set; }
        bool DetectInvisibility { get; set; }
        List<Vector2Int> path { get; set; }
        TileController currentTile { get; set; }
        bool Hidden { get; set; }

}

