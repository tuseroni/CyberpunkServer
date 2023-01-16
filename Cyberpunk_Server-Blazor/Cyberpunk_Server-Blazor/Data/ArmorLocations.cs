using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ArmorLocations
{
    public int id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<PlayerArmor> PlayerArmor { get; } = new List<PlayerArmor>();
}
