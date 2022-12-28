using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Hellhound : ProgramController
{
    public override async Task<int> DoAction(NetActor target = null)
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
        if (target.Type == NetObjType.NetRunner)
        {
            var newDamage = new Damage { Type = DamageType.HP, Value = damage = GameController.RollND10(2) };
            await GameController.DoDamage(target, newDamage);
            
        }
        GameController.EndTurn(this);
        return damage;
    }
}

