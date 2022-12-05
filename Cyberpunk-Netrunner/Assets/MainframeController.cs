using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainframeController : MonoBehaviour
{
    bool CyberEnabled;
    public int Memory = 4;
    public int MU = 40;
    public int AvailMU = 40;
    public int ChipReaderMU = 10;
    public int AvailChipReaderMU = 100;
    public ProgramController[] Programs;
    public SkillChipController[] skills;
    public int speed = 10;
    public int Int = 3;
    // Start is called before the first frame update
    void Start()
    {
        MU = Memory * 3;
        AvailMU = MU;
        foreach (var prog in Programs)
        {
            AvailMU -= prog.MU;
        }
    }
    public void UseSkill(SkillChipController skill)
    {
        var bonus = skill.Ranks + Int;
        
        var roll = Mathf.RoundToInt(Random.value * 10);
        var total = 0;
        if(roll==1)
        {
            Debug.Log("Failure");
            return;
        }
        while (roll==10)
        {
            roll = Mathf.RoundToInt(Random.value * 10);
            total += roll;
        }
        Debug.Log(roll + bonus);
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
