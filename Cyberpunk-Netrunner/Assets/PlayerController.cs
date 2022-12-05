using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum StatType
{
    ATTR,
    BODY,
    COOL,
    EMPATHY,
    INT,
    REF,
    TECH,
    MA,
    RUN,
    Leap,
    Lift
}
public class Stat
{
    public StatType Type;
    public int Max;
    public int Bonus;
    public int Total;
}
public class ArmorData
{
    public int Encumberance;
    public int SP;
    public int RefPenalty;

}
public class WeaponData
{

}
//public class PlayerData
//{
//    Stat[] Stats;
//    WeaponData[] Weapons;
//    ArmorData[] HeadArmor;
//    ArmorData[] TorsoArmor;
//    ArmorData[] RightArmArmor;
//    ArmorData[] RightLegArmor;
//    ArmorData[] LeftArmArmor;
//    ArmorData[] LeftLegArmor;
//    CyberdeckController Cyberdecks;
//}

public class PlayerController : MonoBehaviour
{
    public SkillController[] skills;
    public Dictionary<SkillType, List<SkillController>> skillLookup;
    public Stat[] Stats = new Stat[]
    {
        new Stat()
        {
            Type=StatType.ATTR,
            Max=1,
            Bonus=0,
            Total=1
        }
        /*
        ATTR,
    BODY,
    COOL,
    EMPATHY,
    INT,
    REF,
    TECH,
    MA,
    RUN,
    Leap,
    Lift
         */
    };
    // Start is called before the first frame update
    void Start()
    {
        //RUN = MA * 3;
        //Leap = RUN / 4;

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
