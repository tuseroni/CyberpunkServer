using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Computer
{
    public int id { get; set; }

    public string? name { get; set; }

    public int Memory { get; set; }

    public int Speed { get; set; }

    public int Int { get; set; }

    public int NumCPU { get; set; }

    public bool? IsPortable { get; set; }

    public bool IsCyberAvailable { get; set; }

    public double BateryHours { get; set; }

    public int WallStrength { get; set; }

    public double PriceLow { get; set; }

    public double PriceHigh { get; set; }

    public int NumSlots { get; set; }

    public int Chipslots { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<PlayerComputer> PlayerComputer { get; } = new List<PlayerComputer>();
}
