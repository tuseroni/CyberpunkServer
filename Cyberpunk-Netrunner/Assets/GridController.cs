using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
public interface NetItem
{
    GameObject Object
    {
        get;
        set;
    }
    bool Solid { get; set; }
    NetObjType Type { get; set; }
}

public class GridController : MonoBehaviour
{
    
    public GameObject TilePrefab = null;
    public Dictionary<int, Dictionary<int, GameObject>> gridTiles = new Dictionary<int, Dictionary<int, GameObject>>();
    public int Height = 100;
    public int Width = 100;
    public GameObject FortressPrefab;
    public PlayerController PlayerController;
    // Start is called before the first frame update
    void Start()
    {
        
    }
    private void Awake()
    {
        BuildGrid(ProgramData.subgrid);
        placePlayer(ProgramData.player);
    }
    
    public void placePlayer(PlayerData player)
    {
        var x = player.xPos;
        var y = player.yPos;
        var tileObj = gridTiles[y][x];
        PlayerController.playerData = player;
        PlayerController.MoveToTile(tileObj);
    }
    
    public void BuildGrid(CyberpunkServer.Models.DTO.SubgridData grid)
    {
        Height = grid.height;
        Width = grid.width;
        for (var i = 0; i < Height; i++)
        {

            var newRow = new Dictionary<int, GameObject>();
            gridTiles.Add(i, newRow);
            for (var j = 0; j < Width; j++)
            {
                var tile = Instantiate(TilePrefab, new Vector3(j * 60, 1, i * -60), Quaternion.identity, transform);
                newRow.Add(j, tile);
            }
        }
        transform.position = new Vector3(Width * -30, 0, Height * 30);
        foreach(var fort in grid.Fortress)
        {
            var fortPrefab = GameObject.Instantiate(FortressPrefab);
            FortressController fortController = fortPrefab.GetComponent<FortressController>();
            fortController.Grid = this;
            fortController.addFort(fort);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
