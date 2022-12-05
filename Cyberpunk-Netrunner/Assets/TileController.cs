using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TileController : MonoBehaviour
{
    public Material NonSelectedMaterial = null;
    public Material HighlightMaterial = null;
    public MeshRenderer MR = null;
    NetItem _containedItem = null;
    public NetItem ContainedItem
    {
        get
        {
            return _containedItem;
        }
        set
        {
            var oldVal = _containedItem;
            _containedItem = value;
            var pos = transform.position + new Vector3(0, 30, 0);
            GameObject newWall = Instantiate(value.Object, pos, Quaternion.identity, transform.parent);
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        MR = GetComponent<MeshRenderer>();
        MR.material = NonSelectedMaterial;
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
