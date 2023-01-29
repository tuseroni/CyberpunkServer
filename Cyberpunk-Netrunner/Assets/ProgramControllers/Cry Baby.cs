using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Crybaby: ProgramController
{
    public override async Task<NetItem> Search(NetItem _target = null)
    {
        await Task.Yield();
        return null;
    }
    public override async Task BeginTurn()
    {
        EndTurn(this);
        await Task.Yield();
    }
    public override async Task<int> DoAction(NetItem target = null)
    {
        await Task.Yield();
        return 0;
    }
}

