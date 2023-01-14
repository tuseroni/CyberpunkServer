using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Portal : Intrusion
{
    
    void Start()
    {
        bc=GetComponent<BoxCollider>();
        oldPosition = transform.localPosition;
    }
	private void Update()
	{
		if(inWall)
		{
            if(bc.bounds.Contains(((NetItem)Owner).Object.transform.position))
			{
                ownerInBox = true;

            }
            else
			{
                if(ownerInBox)
				{
                    
                    ((WallController)Target).wallCubes[0].SetActive(true);
                    ((WallController)Target).wallCubes[1].SetActive(true);
                    Target.Solid = true;
                    transform.parent = ((NetItem)Owner).Object.transform;
                    transform.localPosition = oldPosition;
                    inWall = false;
                }
			}


        }
	}
    bool inWall = false;
    bool ownerInBox = false;
    BoxCollider bc;
	public override int ActionTurns { get; set; } = 3;
	public override bool Solid { get => false; set { } }
	public override async void Attack(NetItem Target)
	{
        this.Target = Target;
        if(Target.Type==NetObjType.Wall && TargetInRange)
		{
            await DoAction(Target);
		}
	}
	public override async Task<int> DoAction(NetItem target = null)
    {
        Target = target;
        var tile = grid.gridTiles[target.yPos][target.xPos];
        currentTile = tile;
        tile.ContainedItem.Add(this);
        ActionTurnsRemaining = ActionTurns;
        ActiveProgramController.Enabled = false;
        //oldPosition = transform.localPosition;
        //transform.parent = Target.Object.transform;
        //transform.localPosition = new Vector3(0, 0, 0);
        //transform.localRotation = Quaternion.identity;
        inWall = true;
        //bc.enabled = true;
        return 0;
    }
	private void OnCollisionExit(Collision collision)
	{
        
	}
	public override void addProgram(GridController grid, RunningProgram program, ProgramSummoner Summoner)
	{
		base.addProgram(grid, program, Summoner);
    }
	Vector3 oldPosition;
	public override async Task FinishAction()
	{
        ((WallController)Target).wallCubes[0].SetActive(false);
        ((WallController)Target).wallCubes[1].SetActive(false);
        Target.Solid = false;
        ActiveProgramController.Enabled = true;        
        await Task.Yield();
	}
	public override async Task BeginTurn()
	{
		await base.BeginTurn();
	}
}

