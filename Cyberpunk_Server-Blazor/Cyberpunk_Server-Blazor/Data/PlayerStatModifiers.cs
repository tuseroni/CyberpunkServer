using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerStatModifiers
{
    public int id { get; set; }

    public int PlayerStatID { get; set; }

    public string? name { get; set; }

    public double amount { get; set; }

    public virtual PlayerStat PlayerStat { get; set; } = null!;
}
