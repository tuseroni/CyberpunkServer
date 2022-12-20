using System.Collections;
using System.Collections.Generic;
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
                wallCubes[i].SetActive(i <= (value - 1));
            }
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

    // Start is called before the first frame update
    void Start()
    {
        Solid = false;
    }

    // Update is called once per frame
    void Update()
    {

    }
}
