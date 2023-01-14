using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;
using System.Threading.Tasks;


public class GridController : MonoBehaviour
{
    
    public GameObject TilePrefab = null;
    public Dictionary<int, Dictionary<int, TileController>> gridTiles = new Dictionary<int, Dictionary<int, TileController>>();
    public int Height = 100;
    public int Width = 100;
    public GameObject FortressPrefab;
    public PlayerController PlayerController;
    bool offline = false;
    public GameController GameController;
    // Start is called before the first frame update
    void Start()
    {
        BuildGrid(AppData.subgrid);
        placePlayer(AppData.player);
        GameController.BeginGame();


    }
    private void Awake()
    {
        if (AppData.player == null)
        {
            var subgridJSON = System.IO.File.ReadAllText(Path.Combine(Application.persistentDataPath, "Player.json"));
            AppData.player = Newtonsoft.Json.JsonConvert.DeserializeObject<PlayerData>(subgridJSON);
            offline = true;
        }
        if (AppData.subgrid == null)
        {
            var subgridJSON = System.IO.File.ReadAllText(Path.Combine(Application.persistentDataPath, "subgrid.json"));
            AppData.subgrid = Newtonsoft.Json.JsonConvert.DeserializeObject<SubgridData>(subgridJSON);
            offline = true;
        }

    }
    
    public void placePlayer(PlayerData player)
    {
        if (!offline)
        {
            System.IO.File.WriteAllText(Path.Combine(Application.persistentDataPath, "Player.json"), Newtonsoft.Json.JsonConvert.SerializeObject(player));
        }
        var x = player.xPos;
        var y = player.yPos;
        var tileObj = gridTiles[y][x];
        PlayerController.playerData = player;
        PlayerController.MoveToTile(tileObj);
        PlayerController.path.Clear();
        GameController.addPlayer(PlayerController);
    }
    
    public void BuildGrid(CyberpunkServer.Models.DTO.SubgridData grid)
    {
        if (!offline)
        {
            System.IO.File.WriteAllText(Path.Combine(Application.persistentDataPath, "subgrid.json"), Newtonsoft.Json.JsonConvert.SerializeObject(grid));
        }
        Height = grid.height;
        Width = grid.width;
        for (var i = 0; i < Height; i++)
        {

            var newRow = new Dictionary<int, TileController>();
            gridTiles.Add(i, newRow);
            for (var j = 0; j < Width; j++)
            {
                var tile = Instantiate(TilePrefab, new Vector3(j * 60, 1, i * -60), Quaternion.identity, transform);
                newRow.Add(j, tile.GetComponent<TileController>());
                var tileController = tile.GetComponent<TileController>();
                tileController.xPos = j;
                tileController.yPos = i;
                tileController.grid = this;
            }
        }
        transform.position = new Vector3(Width * -30, 0, Height * 30);
        foreach(var fort in grid.Fortress)
        {
            var fortPrefab = GameObject.Instantiate(FortressPrefab);
            FortressController fortController = fortPrefab.GetComponent<FortressController>();
            fortController.Grid = this;
            fortController.GameController = GameController;
            fortController.addFort(fort);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
