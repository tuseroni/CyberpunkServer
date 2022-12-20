using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using UnityEngine;

public class TileController : MonoBehaviour
{
    public Material NonSelectedMaterial = null;
    public Material HighlightMaterial = null;
    public MeshRenderer MR = null;
    ObservableCollection<NetItem> _containedItem = new ObservableCollection<NetItem>();
    public ObservableCollection<NetItem> ContainedItem
    {
        get
        {
            return _containedItem;
        }
        set
        {
            var oldVal = _containedItem;
            _containedItem = value;
            //GameObject newWall = Instantiate(value.Object, pos, Quaternion.identity, transform.parent);
        }
    }
    public TileController()
    {
        _containedItem.CollectionChanged += _containedItem_CollectionChanged;
    }
    public int xPos = 0;
    public int yPos = 0;
    // Start is called before the first frame update
    void Start()
    {
        MR = GetComponent<MeshRenderer>();
        MR.material = NonSelectedMaterial;
        
    }

    private void _containedItem_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
    {
        if(e.Action==System.Collections.Specialized.NotifyCollectionChangedAction.Add)
        {
            var pos = transform.position + new Vector3(0, 30, 0);
            foreach (NetItem value in e.NewItems)
            {
                value.Object.transform.parent = transform;
                value.Object.transform.localPosition = new Vector3(0, 30, 0);
                value.xPos = xPos;
                value.yPos = yPos;
            }
        }    
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
