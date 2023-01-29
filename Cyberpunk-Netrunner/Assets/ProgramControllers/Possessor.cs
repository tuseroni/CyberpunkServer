﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Possessor: ProgramController
{
    public override async Task<int> DoAction(NetItem target = null)
    {
        if (ActionsDone >= NumActions)
        {
            return 0;
        }
        ActionsDone++;
        int damage = 0;
        if (!await GameController.RollToHit(target, this))
        {
            EndTurn(this);
            return 0;
        }
        if (target.Type == NetObjType.Program)
        {
            ((ProgramController)target).Possess(this.Owner);
        }
        EndTurn(this);
        return damage;
    }
}

