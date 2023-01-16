using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class CyberdeckImprovements
{
    public int id { get; set; }

    public string? name { get; set; }

    public string? ImprovementFor { get; set; }

    public int ImprovementAmount { get; set; }

    public double CostLow { get; set; }

    public double CostHigh { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<PlayerCyberdeckImprovements> PlayerCyberdeckImprovements { get; } = new List<PlayerCyberdeckImprovements>();
}
