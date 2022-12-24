using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;


class Invisibility : ProgramController
{
    public override bool canBePlaced { get => false; set { } }
    void Start()
    {
        
    }
    public override void Search()
    {
    }
    public override float Patrol(int maxMove)
    {
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
        DoAction();
    }
    public override int DoAction(NetActor target = null)
    {
        Player.Invisible = true;
        return 0;
    }
}

