using Cyberpunk_Server_Blazor.Pages.Subgird;
using CyberpunkServer.Models.DTO;
using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace CyberpunkServer.Models.DTO;

public partial class PlayerData : NetItem
{
	[Newtonsoft.Json.JsonIgnore]
	[JsonIgnore]
	public Tile CurrentTile { get; set; }
	[JsonIgnore]
	public string ConnectionID { get; set; }
}
