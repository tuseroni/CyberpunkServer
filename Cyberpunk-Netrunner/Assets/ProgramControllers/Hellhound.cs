using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Hellhound : ProgramController
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
        if (target.Type == NetObjType.NetRunner)
        {
            var newDamage = new Damage { Type = DamageType.HP, Value = damage = GameController.RollND10(2) };
            await GameController.DoDamage(target, newDamage);
            
        }
        EndTurn(this);
        return damage;
    }
    public async override Task<int> RollToHit()
    {
        await Task.Yield();
        return FortressProgram.Strength + Owner.Int + Owner.Interface + GameController.RollD10();
    }
    
}

