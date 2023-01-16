using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;
using System.Threading.Tasks;
public interface ProgramSummoner
{
    Bounds bounds { get; set; }
    int Int { get; set; }
    int Interface { get; set; }
    void Alert(ProgramController Sender, NetActor Target);
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
    public interface NetActor : NetItem
    {
        int RollInitiative();
        int doEvasionCheck();
        int doDetectionCheck();
        Task BeginTurn();
        int NumActions { get; set; }
        int ActionsDone { get; set; }
        int Initiative { get; set; }
        bool WaitForSignal { get; set; }
        bool Continue { get; set; }
        bool Invisible { get; set; }
        bool DetectInvisibility { get; set; }
        List<Vector2Int> path { get; set; }
        TileController currentTile { get; set; }

    }

