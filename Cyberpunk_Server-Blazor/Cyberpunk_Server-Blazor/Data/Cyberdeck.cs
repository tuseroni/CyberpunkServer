using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Cyberdeck
{
    public int id { get; set; }

    public string? name { get; set; }

    public int Memory { get; set; }

    public int Speed { get; set; }

    public int WallStrength { get; set; }

    public double PriceLow { get; set; }

    public double PriceHigh { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<PlayerCyberdeck> PlayerCyberdeck { get; } = new List<PlayerCyberdeck>();
}
