using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProgramController : MonoBehaviour,NetItem
{
    public GameObject Object { get => gameObject; set { } }
    public bool Solid { get => false; set { } }
    public NetObjType Type { get => NetObjType.Program; set { } }
    public ProgramType ProgramType;
    public ProgramFunctions[] Functions;
    public ProgramOptions[] Options;
    public ProgramController[] Subroutines;
    public int MU = 1;



    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
