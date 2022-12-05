using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public enum SkillType
{
    Special,
    ATTR,
    BODY,
    COOL,
    EMPATHY,
    INT,
    REF,
    TECH
}
public class SkillController : MonoBehaviour
{
    public string SkillName = "";
    public SkillType Type;
    public int Ranks = 0;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
