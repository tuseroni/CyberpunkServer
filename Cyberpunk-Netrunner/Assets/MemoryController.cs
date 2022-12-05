using System.Collections;
using System.Collections.Generic;
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
    public GameObject Object { get => gameObject; set { } }

    public NetObjType Type { get => NetObjType.Memory; set { } }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
