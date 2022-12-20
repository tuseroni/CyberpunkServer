using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;

public interface NetItem
{
    GameObject Object
    {
        get;
        set;
    }
    ProgramSummoner Owner { get; set; }
    bool Solid { get; set; }
    NetObjType Type { get; set; }
    int xPos { get; set; }
    int yPos { get; set; }
}

public class GridController : MonoBehaviour
{
    
    public GameObject TilePrefab = null;
    public Dictionary<int, Dictionary<int, GameObject>> gridTiles = new Dictionary<int, Dictionary<int, GameObject>>();
    public int Height = 100;
    public int Width = 100;
    public GameObject FortressPrefab;
    public PlayerController PlayerController;
    bool offline = false;
    // Start is called before the first frame update
    void Start()
    {
        BuildGrid(AppData.subgrid);
        placePlayer(AppData.player);
        
    }
    private void Awake()
    {
        if (AppData.player == null)
        {
            var subgridJSON = System.IO.File.ReadAllText(Path.Combine(Application.streamingAssetsPath, "Player.json"));
            AppData.player = Newtonsoft.Json.JsonConvert.DeserializeObject<PlayerData>(subgridJSON);
            offline = true;
        }
        if (AppData.subgrid == null)
        {
            var subgridJSON = System.IO.File.ReadAllText(Path.Combine(Application.streamingAssetsPath, "subgrid.json"));
            AppData.subgrid = Newtonsoft.Json.JsonConvert.DeserializeObject<SubgridData>(subgridJSON);
            offline = true;
        }

    }
    
    public void placePlayer(PlayerData player)
    {
        if (!offline)
        {
            System.IO.File.WriteAllText(Path.Combine(Application.streamingAssetsPath, "player.json"), Newtonsoft.Json.JsonConvert.SerializeObject(player));
        }
        var x = player.xPos;
        var y = player.yPos;
        var tileObj = gridTiles[y][x];
        PlayerController.playerData = player;
        PlayerController.MoveToTile(tileObj);
    }
    
    public void BuildGrid(CyberpunkServer.Models.DTO.SubgridData grid)
    {
        if (!offline)
        {
            System.IO.File.WriteAllText(Path.Combine(Application.streamingAssetsPath, "subgrid.json"), Newtonsoft.Json.JsonConvert.SerializeObject(grid));
        }
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
                var tileController = tile.GetComponent<TileController>();
                tileController.xPos = j;
                tileController.yPos = i;
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
