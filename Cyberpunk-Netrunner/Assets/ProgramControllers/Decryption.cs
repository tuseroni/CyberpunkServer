using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Decryption : ProgramController
{
    public override bool canBePlaced { get => false; set { } }
    public override int xPos
    {
        get
        {
            return ((NetItem)Owner).xPos;
        }
        set
        {

        }
    }
    public override int yPos
    {
        get
        {
            return ((NetItem)Owner).yPos;
        }
        set
        {

        }
    }
    void Start()
    {
        
    }
    public override async Task<NetItem> Search(NetItem _target = null)
    {
        await Task.Yield();
        return null;
    }
    public override async Task<float> Patrol(int maxMove)
    {
        await Task.Yield();
        return 1.0f;
    }
    public override void addProgram(GridController grid, RunningProgram program, ProgramSummoner Summoner)
    {
        FortressProgram = program;
        Owner = Summoner;
        if (Owner is PlayerController)
        {
            Player = (PlayerController)Owner;
        }
        transform.parent = ((PlayerController)Summoner).Object.transform;
        transform.localPosition = new Vector3(0f, 34f, -39.8f);
        if (program.Program != null && ProgramName != null)
        {
            ProgramName.text = program.Program.name;
        }
    }
    public override async Task<int> RollToHit()
    {
        var str = 4;
        if(Target != null && Target is CodeGateController)
        {
            str = 6;
        }
        await Task.Yield();
        return str + GameController.RollD10();
    }
    public override async void Attack(NetItem Target, TileController _lastSeenTile = null)
    {
        this.Target = Target;
        if (Target.Type==NetObjType.CodeGate && TargetInRange)
        {
            this.Target = Target;
            await DoAction(Target);
        }
        else
        {
            this.Target = null;
        }
    }
    public override async Task<int> DoAction(NetItem target = null)
    {
        if(!await GameController.RollToHit(target, this))
        {
            return 0;
        }
        ((CodeGateController)target).Open();
        return await Task.Run(()=> { return 0; });
    }
}

