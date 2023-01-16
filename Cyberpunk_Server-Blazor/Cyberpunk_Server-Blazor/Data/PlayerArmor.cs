using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerArmor
{
    public int id { get; set; }

    public string? Name { get; set; }

    public int? SP { get; set; }

    public int? LocationID { get; set; }

    public int? CurrentSP { get; set; }

    public int? Encumberance { get; set; }

    public int? PlayerID { get; set; }

    public string? Description { get; set; }

    public virtual ArmorLocations? Location { get; set; }

    public virtual Player? Player { get; set; }
}
