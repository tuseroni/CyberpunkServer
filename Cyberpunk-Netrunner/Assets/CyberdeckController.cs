using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Threading.Tasks;

public class CyberdeckController : MonoBehaviour,NetActor, Device
{
    PlayerCyberdeckData _CyberdeckData;
    public PlayerCyberdeckData CyberdeckData
    {
        get
        {
            return _CyberdeckData;
        }
        set
        {
            _CyberdeckData = value;
        }
    }
    public bool Hidden
    {
        get
        {
            return ((NetActor)Owner)?.Hidden ?? false;
        }
        set
        {
        }
    }
    public void DeletePrograms(int mu)
    {
        if(mu==-1)
        {
            CyberdeckData.PlayerCyberdeckPrograms.Clear();
        }
        else
        {
            List<PlayerCyberdeckProgramsData> programs = new List<PlayerCyberdeckProgramsData>();
            programs.AddRange(CyberdeckData.PlayerCyberdeckPrograms);
            while (mu>0)
            {
                var index = GameController.GetRandomRange(0, programs.Count);
                if (programs[index].MU <= mu)
                {
                    CyberdeckData.PlayerCyberdeckPrograms.Remove(programs[index]);
                    mu -= programs[index].MU;
                }
                if(programs.Count==0)
                {
                    break;
                }
                programs.RemoveAt(index);
            }
        }
    }
    public GameObject Object { get => this.gameObject; set { } }
    public ProgramSummoner Owner { get; set; }
    public ProgramSummoner ApparentOwner
    {
        get
        {
            return Owner;
        }
        set
        {
        }
    }
    public GameController Ref { get; set; }
    public bool Solid { get => false; set { } }
    public NetObjType Type { get => NetObjType.Cyberdeck; set { } }
    public int xPos { get; set; }
    public int yPos { get; set; }
    public int NumActions { get => 0; set { } }
    public int ActionsDone { get => 0; set { } }
    public int Initiative { get => ((NetActor)Owner)?.Initiative ?? 0; set { } }
    public bool WaitForSignal { get => false; set { } }
    public bool Continue { get => true; set { } }
    public bool DetectInvisibility { get => false; set { } }
    public List<Vector2Int> path { get; set; }
    public TileController currentTile { get => ((NetActor)Owner)?.currentTile; set { } }

    public async Task BeginTurn()
    {
        await Task.Yield();
    }

    public int doDetectionCheck()
    {
        return ((NetActor)Owner).doDetectionCheck();
    }

    public int doEvasionCheck(bool SeekerIgnoresInvisibility = false)
    {
        return ((NetActor)Owner).doEvasionCheck();
    }

    public int RollInitiative()
    {
        return 0;
    }

    public string Name => CyberdeckData.name;

    public bool Selected { get; set; }

    public async Task<int> RollToBeHit()
    {
        await Task.Yield();
        return CyberdeckData.Cyberdeck.WallStrength + GameController.RollD10();
    }

    public async Task<int> RollToHit()
    {
        await Task.Yield();
        return 0;
    }
    public bool Invisible
    {
        get
        {
            return ((PlayerController)Owner)?.Invisible ?? false;
        }
        set
        {
        }
    }


    public int TakeDamage(Damage damage)
    {
        if (damage.Type == DamageType.WallStrength)
        {
            CyberdeckData.Cyberdeck.WallStrength -= damage.Value;
            return damage.Value;
        }
        return 0;
    }
}
