﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Armor : ProgramController
{
    public override bool canBePlaced { get => false; set { } }
    void Start()
    {
        
    }
    public override bool Rezzed { get
        {
            return base.Rezzed;
        }
        set
        {
            base.Rezzed = value;
            if(!value)
            {
                Player.ProgramSP -= 3;
            }
            else
            {
                Player.ProgramSP += 3;
            }
        }
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
    public override void addProgram(GridController grid, RunningProgram program, ProgramSummoner Summoner, CPUController CPUSource = null)
    {
        FortressProgram = program;
        Owner = Summoner;
        this.ApparentOwner = Summoner;
        this.grid = grid;
        if (Owner is PlayerController)
        {
            Player = (PlayerController)Owner;
        }
        
        transform.parent = ((PlayerController)Summoner).Object.transform;
        transform.localPosition = new Vector3(0f, 34f, -39.8f);
        DoAction();
    }
    public override async Task<int> DoAction(NetItem target = null)
    {
        await Task.Run(() => Player.ProgramSP += 3);
        return 0;
    }
}

