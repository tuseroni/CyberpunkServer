using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CyberdeckController : MonoBehaviour
{
    public int Memory = 3;
    public int MU = 30;
    public int AvailMU = 30;
    public int Speed = 5;
    public MainframeController LinkedMainframe = null;
    public ProgramController[] Programs;
    public int ChipReaderMU = 10;
    public int AvailChipReaderMU = 100;
    // Start is called before the first frame update
    void Start()
    {
        MU = Memory * 3;
        AvailMU = MU;
        foreach(var prog in Programs)
        {
            //AvailMU -= prog.MU;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
