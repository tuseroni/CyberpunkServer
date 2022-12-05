using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CPUController : MonoBehaviour,NetItem
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
    public GameObject Object { get => gameObject; set { } }

    public NetObjType Type { get => NetObjType.CPU; set { } }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
