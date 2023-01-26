using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class PoisonFlatline: ProgramController
{
    public override async Task<int> DoAction(NetItem target = null)
    {
        if (ActionsDone >= NumActions)
        {
            return 0;
        }
        int damage = 0;
        if (!await GameController.RollToHit(target, this))
        {
            GameController.EndTurn(this);
            return 0;
        }
        if (target is Device)
        {
            ((Device)target).DeletePrograms(-1);
            await ((PlayerController)((NetActor)target).Owner).HangUp();
        }
        GameController.EndTurn(this);
        return damage;
    }
}

