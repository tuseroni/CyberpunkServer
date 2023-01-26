﻿using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;

public class CodeGateController : MonoBehaviour,NetItem
{
    int _WallStrength = 2;
    public GameObject[] wallCubes;
    public int WallStrength
    {
        get
        {
            return _WallStrength;
        }
        set
        {
            _WallStrength = value;
            for (var i = 0; i < 10; i++)
            {
                wallCubes[i].SetActive(i <= (6 - 1));
            }
        }
    }
    public bool Selected { get; set; }
    public GameController GameController;
    public GameController Ref
    {
        get
        {
            return GameController;
        }
        set
        {
            GameController = value;
        }

    }

    bool _isSolid = true;
    public bool Solid
    {
        get
        {
            return _isSolid;
        }
        set
        {
            _isSolid = value;
            var walls = GetComponentsInChildren<BoxCollider>();
            foreach (var wall in walls)
            {
                wall.enabled = value;
            }
        }
    }
    public GameObject Object { get => gameObject; set { } }

    public NetObjType Type { get => NetObjType.CodeGate; set { } }

    public int xPos { get; set; }
    public int yPos { get; set; }
    public ProgramSummoner Owner { get => throw new System.NotImplementedException(); set => throw new System.NotImplementedException(); }

	public string Name => "Code Gate";

	// Start is called before the first frame update
	void Start()
    {
        //Solid = false;
    }

    // Update is called once per frame
    void Update()
    {

    }
    public void Open()
    {
        wallCubes[0].SetActive(false);
        wallCubes[1].SetActive(false);
        Solid = false;
    }
    private void OnMouseUp()
    {
        if (GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            //MR.material = SelectedMaterial;
            GameController.TargetSelect(this);
            //if (MR != null && NonSelectedMaterial != null)
            //{
            //    MR.material = NonSelectedMaterial;
            //}
        }
    }
    private void OnMouseEnter()
    {
        if (GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            //if (MR != null && HighlightMaterial != null)
            //{
            //    MR.material = HighlightMaterial;
            //}
        }
    }
    private void OnMouseExit()
    {
        if (GameController.PlayerState == PlayerInteractionState.Selecting)
        {
            //if (MR != null && NonSelectedMaterial != null)
            //{
            //    MR.material = NonSelectedMaterial;
            //}
        }
    }
    public async Task<int> RollToBeHit()
    {
        await Task.Yield();
        var d10 = GameController.RollD10();
  //      if(d10==1)
		//{
  //          GameController.HandleFumble(this);
  //          return 0;
  //      }
        return d10 + WallStrength;
    }

    public async Task<int> RollToHit()
    {
        await Task.Yield();
        throw new System.NotImplementedException();
    }

	public int TakeDamage(Damage damage)
	{
		if(damage.Type==DamageType.Strength)
		{
            WallStrength -= damage.Value;
		}
        if(WallStrength<=0)
		{
            Solid = false;
            wallCubes[0].SetActive(false);

        }
        return damage.Value;

    }
}
