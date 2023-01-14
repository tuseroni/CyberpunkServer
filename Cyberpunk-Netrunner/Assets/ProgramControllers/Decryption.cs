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

    public override async void Attack(NetItem Target)
    {
        this.Target = Target;
        if (Target.Type==NetObjType.CodeGate && TargetInRange)
        {
            await DoAction(Target);
        }
    }
    public override async Task<int> DoAction(NetItem target = null)
    {
        return await base.DoAction(target);
    }
}

