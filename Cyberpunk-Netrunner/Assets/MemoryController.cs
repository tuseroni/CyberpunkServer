using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;

public class MemoryController : MonoBehaviour,NetItem
{
    bool _isSolid = true;
    public bool Solid
    {
        get
        {
            return false;
        }
        set
        {
        }
    }
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
    public GameObject Object { get => gameObject; set { } }

    public NetObjType Type { get => NetObjType.Memory; set { } }

    public int xPos { get; set; }
    public int yPos { get; set; }
    public ProgramSummoner Owner { get; set; }
    public ProgramSummoner ApparentOwner
    {
        get
        {
            return Owner;
        }
        set
        {
        }
    }
    public string Name => throw new System.NotImplementedException();

	public bool Selected { get => throw new System.NotImplementedException(); set => throw new System.NotImplementedException(); }

    public async Task<int> RollToBeHit()
    {
        await Task.Yield();
        throw new System.NotImplementedException();
    }

    public async Task<int> RollToHit()
    {
        await Task.Yield();
        throw new System.NotImplementedException();
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

	public int TakeDamage(Damage damage)
	{
		throw new System.NotImplementedException();
	}
}
