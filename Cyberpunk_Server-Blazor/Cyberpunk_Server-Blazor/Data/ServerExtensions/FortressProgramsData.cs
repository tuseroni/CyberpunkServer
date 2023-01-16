using Cyberpunk_Server_Blazor.Pages.Subgird;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData: RunningProgram
    {
        [Newtonsoft.Json.JsonIgnore]
        [JsonIgnore]
        public Tile CurrentTile { get; set; }
    }
}